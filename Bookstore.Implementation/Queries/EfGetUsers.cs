using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Bookstore.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetUsers : IGetUsersQuery
    {
        private readonly BookstoreContext _context;

        public EfGetUsers(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 35;

        public string Name => "Get Users";
 
        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var query = _context.Users.Include(x => x.Role)
                                      .Include(x => x.Orders)
                                      .ThenInclude(x => x.OrderLines)
                                      .Include(x => x.UserUseCases)
                                      .AsQueryable();


            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.Username) || !string.IsNullOrWhiteSpace(search.Username))
            {
                query = query.Where(x => x.Username.ToLower().Contains(search.Username.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<UserDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(u => new UserDto
                             {
                                 Id = u.Id,
                                 FirstName = u.FirstName,
                                 LastName = u.LastName,
                                 Email = u.Email,
                                 Username = u.Username,
                                 Password = u.Password,
                                 Role = u.Role.Name,
                                 AllowedUseCases = u.UserUseCases.Select(uc => new UserUseCaseDto
                                 {
                                     UseCaseId = uc.UseCaseId
                                 }),
                                 Orders = u.Orders.Select(o => new OrderDto
                                 {
                                     Id = o.Id,
                                     Address = o.Address,
                                     CreatedAt = o.CreatedAt,
                                     OrderLines = o.OrderLines.Select(ol => new OrderLineDto
                                     {
                                         Id = ol.Id,
                                         Price = ol.Price,
                                         Quantity = ol.Quantity,
                                         Title = ol.Name
                                     })
                                 })
                             })
            };
            return response;
        }
    }
}

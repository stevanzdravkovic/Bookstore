using Bookstore.Application;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Exceptions;
using Bookstore.Application.Queries;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetSingleUser : IGetSingleUserQuery
    {
        private readonly BookstoreContext _context;
        private readonly IApplicationActor _actor;
       
        public EfGetSingleUser(BookstoreContext context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 10;

        public string Name => "Get single User";

        public UserDto Execute(int search)
        {
            var query = _context.Users.Include(x => x.Role)
                                      .Include(x => x.Orders)
                                      .ThenInclude(x => x.OrderLines)
                                      .Include(x => x.UserUseCases)
                                      .AsQueryable();

            var user = query.FirstOrDefault(o => o.Id == search);

            if (user == null)
            {
                throw new EntityNotFOundException(search, typeof(User));
            }
            if (user.Id != _actor.Id)
            {
                throw new UnauthorizedUseCaseException(this, this._actor);
            }

            var response = new UserDto
            {
                Id = user.Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                Username = user.Username,
                Password = user.Password,
                Role = user.Role.Name,
                AllowedUseCases = user.UserUseCases.Select(uc => new UserUseCaseDto
                {
                    UseCaseId = uc.UseCaseId
                }),
                Orders = user.Orders.Select(o => new OrderDto
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
            };
            return response;
        }
    }
}

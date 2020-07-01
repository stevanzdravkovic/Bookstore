using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Bookstore.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetRoles : IGetRolesQuery
    {
        private readonly BookstoreContext _context;

        public EfGetRoles(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 33;

        public string Name => "Get all roles";

        public PagedResponse<RoleDto> Execute(RoleSearch search)
        {
            var query = _context.Roles.AsQueryable();
            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<RoleDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(x => new RoleDto
                             {
                                 Id = x.Id,
                                 Name = x.Name
                             }).ToList()
            };
            return response;
        }
    }
}

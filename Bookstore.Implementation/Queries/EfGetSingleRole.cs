using Bookstore.Application.DataTransfer;
using Bookstore.Application.Exceptions;
using Bookstore.Application.Queries;
using Bookstore.DataAccess;
using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetSingleRole : IGetSingleRoleQuery
    {
        private readonly BookstoreContext _context;

        public EfGetSingleRole(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 34;

        public string Name => "Get single role";

        public RoleDto Execute(int search)
        {
            var role = _context.Roles.FirstOrDefault(g => g.Id == search);
            if (role == null)
            {
                throw new EntityNotFOundException(search, typeof(Role));
            }
            var response = new RoleDto
            {
                Id = role.Id,
                Name = role.Name
            };
            return response;
        }
    }
}

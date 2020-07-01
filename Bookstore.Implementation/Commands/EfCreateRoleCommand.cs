using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfCreateRoleCommand : ICreateRoleCommand
    {
        private readonly BookstoreContext _context;
        private readonly CreateRoleValidator _validator;

       public EfCreateRoleCommand(BookstoreContext context, CreateRoleValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 17;
        public string Name => "Create new role using Ef";


        public void Execute(RoleDto request)
        {
            _validator.ValidateAndThrow(request);
            var role = new Role
            {
                Name = request.Name
            };

            _context.Roles.Add(role);
            _context.SaveChanges();
        }
    }
}

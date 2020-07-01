using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfUpdateRoleCommand : IUpdateRoleCommand
    {
        private readonly BookstoreContext _context;
        private readonly UpdateRoleValidator _validator;

        public EfUpdateRoleCommand(BookstoreContext context, UpdateRoleValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 28;

        public string Name => "Update Role";

        public void Execute(RoleDto request)
        {
            _validator.ValidateAndThrow(request);

            var role = _context.Roles.Find(request.Id);
            if (role == null)
            {
                throw new EntityNotFOundException(request.Id, typeof(Role));
            }
            role.Name = request.Name;

            _context.SaveChanges();
        }
    }
}

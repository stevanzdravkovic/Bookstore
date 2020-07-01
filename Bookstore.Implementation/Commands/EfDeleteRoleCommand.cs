using Bookstore.Application.Commands;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
     public class EfDeleteRoleCommand : IDeleteRoleCommand
    {
        private readonly BookstoreContext _context;

        public EfDeleteRoleCommand(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Name => "Delete role using Ef";

        public void Execute(int request)
        {
            var role = _context.Roles.Find(request);
            if (role == null)
            {
                throw new EntityNotFOundException(request, typeof(Role));
            }
            role.DeletedAt = DateTime.Now;
            role.IsDeleted = true;
            role.IsActive = false;

            _context.SaveChanges();
        }
    }
}

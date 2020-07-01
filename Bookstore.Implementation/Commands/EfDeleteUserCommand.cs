using Bookstore.Application.Commands;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly BookstoreContext _context;
        public EfDeleteUserCommand(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 23;

        public string Name => "Delete User using ef";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFOundException(request, typeof(User));
            }

            user.IsActive = false;
            user.IsDeleted = true;
            user.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}

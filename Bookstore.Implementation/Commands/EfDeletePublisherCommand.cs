using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;

namespace Bookstore.Implementation.Commands
{
    public class EfDeletePublisherCommand : IDeletePublisherCommand
    {
        private readonly BookstoreContext _context;

        public EfDeletePublisherCommand(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 21;

        public string Name => "Delete publisher using ef";

        public void Execute(int request)
        {
            var publisher = _context.Publishers.Find(request);
            if (publisher != null)
            {
                throw new EntityNotFOundException(request, typeof(Publisher));
            }

            publisher.DeletedAt = DateTime.Now;
            publisher.IsActive = false;
            publisher.IsDeleted = true;

            _context.SaveChanges();
        }
    }
}

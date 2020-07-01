using Bookstore.Application.Commands;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfDeleteBookCommand : IDeleteBookCommand
    {
        private readonly BookstoreContext _context;

        public EfDeleteBookCommand(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 19;

        public string Name => "Delete book using ef";

        public void Execute(int request)
        {
            var book = _context.Books.Find(request);

            if (book == null)
            {
                throw new EntityNotFOundException(request, typeof(Book));
            }

            book.DeletedAt = DateTime.Now;
            book.IsDeleted = true;
            book.IsActive = false;

            _context.SaveChanges();
        }
    }
}

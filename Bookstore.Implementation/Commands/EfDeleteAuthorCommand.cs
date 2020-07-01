using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfDeleteAuthorCommand : IDeleteAuthorCommand
    {
        private readonly BookstoreContext _context;

        public EfDeleteAuthorCommand(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 18;

        public string Name => "Delete author using ef";

        public void Execute(int request)
        {
            var author = _context.Authors.Find(request);

            if(author == null)
            {
                throw new EntityNotFOundException(request, typeof(Author));
            }
            author.DeletedAt = DateTime.Now;
            author.IsActive = false;
            author.IsDeleted = true;

            _context.SaveChanges();
        }
    }
}

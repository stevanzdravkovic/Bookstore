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
    public class EfCreateAuthorCommand : ICreateAuthorCommand
    {
        private readonly BookstoreContext _context;
        private readonly CreateAuthorValidator _validator;

        public EfCreateAuthorCommand(BookstoreContext context, CreateAuthorValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 13;

        public string Name => "Create author using ef";

        public void Execute(CreateAuthorDto request)
        {
            _validator.ValidateAndThrow(request);

            var author = new Author
            {
                Id = request.Id,
                FirstName = request.FirstName,
                LastName = request.LastName,
                Birth = request.Birth,
                BirthPlace = request.BirthPlace
                
            };

            foreach(var item in request.AuthorBooks)
            {
                // var book = _context.Books.Find(item.BookId);

                author.AuthorBooks.Add(new BookAuthor
                {
                    BookId = item.BookId,
                    AuthorId = author.Id
                });
            }

            _context.Authors.Add(author);
            _context.SaveChanges();
        }
    }
}

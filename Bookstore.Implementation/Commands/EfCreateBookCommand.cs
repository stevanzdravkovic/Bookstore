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
    public class EfCreateBookCommand : ICreateBookCommand
    {
        private readonly BookstoreContext _context;
        private readonly CreateBookValidator _validator;

        public EfCreateBookCommand(BookstoreContext context, CreateBookValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 14;

        public string Name => "Create book using ef";

        public void Execute(CreateBookDto request)
        {
            _validator.ValidateAndThrow(request);

            var book = new Book
            {
                Description = request.Description,
                Price = request.Price,
                Title = request.Title,
                GenreId = request.GenreId,
                PublisherId = request.PublisherId,
                Year = request.Year
            };

            //add into AuthorBook
            foreach (var item in request.BookAuthors)
            {
                book.BookAuthors.Add(new BookAuthor
                {
                    AuthorId = item.Id,
                    BookId = book.Id

                  
                });
            }
            _context.Books.Add(book);
            _context.SaveChanges();
        }
    }
}

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
    public class EfUpdateBookCommand : IUpdateBookCommand
    {
        private readonly BookstoreContext _context;
        private readonly UpdateBookValidator _validator;

        public EfUpdateBookCommand(BookstoreContext context, UpdateBookValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 25;

        public string Name => "Update Book using ef";

        public void Execute(UpdateBookDto request)
        {

            var book = _context.Books.Find(request.Id);

            if (book == null)
            {
                throw new EntityNotFOundException(request.Id, typeof(Book));
            }

            if (request.Price == 0)
            {
                request.Price = book.Price;
            }

            if (request.Title == null)
            {
                request.Title = book.Title;
            }

            if (request.Quantity == 0)
            {
                request.Quantity = book.Quantity;
            }


            if (request.Year == 0)
            {
                request.Year = book.Year;
            }

            _validator.ValidateAndThrow(request);


            book.Year = request.Year;
            book.Price = request.Price;
            book.Description = request.Description ?? book.Description;
            book.Title = request.Title ?? book.Title;
            book.Quantity = request.Quantity;

            _context.SaveChanges();
        }
    }
}

using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class CreateOrderLineValidator : AbstractValidator<CreateOrderLineDto>
    {
        private readonly BookstoreContext _context;
        public CreateOrderLineValidator(BookstoreContext context)
        {
            _context = context;

            RuleFor(x => x.BookId)
              .Must(MovieExists)
              .WithMessage("Movie with an id of {PropertyValue} does not exists")
              .DependentRules(() =>
              {
                  RuleFor(x => x.Quantity)
                  .GreaterThan(0)
                  .WithMessage("Quantity must be greater than 0")
                  .Must(QuantityDoesntExceedDtoQuantity)
                  .WithMessage("Defined Quantity ({PropertyValue}) is unavailable.");
              });
        }

        private bool MovieExists(int bookId)
        {
            return _context.Books.Any(x => x.Id == bookId);
        }
        private bool QuantityDoesntExceedDtoQuantity(CreateOrderLineDto dto, int quantity)
        {
            //treba da dodam quantity kolonu
            return _context.Books.Find(dto.BookId).Quantity >= quantity;
        }
    }
}

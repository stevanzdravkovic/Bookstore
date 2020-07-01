using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class CreateOrderValidator : AbstractValidator<CreateOrderDto>
    {
        private readonly BookstoreContext _context;
        public CreateOrderValidator(BookstoreContext context)
        {
            this._context = context;

            RuleFor(x => x.Address)
                .NotEmpty()
                .WithMessage("Order address cannot be empty");

            RuleFor(x => x.OrderDate)
               .GreaterThan(DateTime.Now)
               .WithMessage("Order date must be in the future")
               .LessThan(DateTime.Now.AddDays(14))
               .WithMessage("Order date must be less than 14 days from today's date");

            RuleFor(x => x.UserId)
                .Must(UserExists)
                .WithMessage("User with an id of {PropertyValue} does not exists in db");

            RuleFor(x => x.Items)
              .NotEmpty()
              .WithMessage("There must be at least 1 oder line")
              .Must(i => i.Select(x => x.BookId).Distinct().Count() == i.Count())
              .WithMessage("Duplicate Movies are not allowed")
              .DependentRules(() =>
              {
                  RuleForEach(x => x.Items)
                  .SetValidator(new CreateOrderLineValidator(_context));
              });
        }
        private bool UserExists(int userId)
        {
            return _context.Users.Any(x => x.Id == userId);
        }
    }
}

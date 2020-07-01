using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class CreateAuthorValidator : AbstractValidator<CreateAuthorDto>
    {
        public CreateAuthorValidator(BookstoreContext context)
        {
           

            RuleFor(x => x.BirthPlace)
                .NotEmpty()
                .WithMessage("Birth Place cannot be empty, please enter Author's birth place");

            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("First name cannot be empty, please enter Author's first name");

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Last name cannot be empty, please enter Author's last name");

            RuleFor(x => x.Birth)
                .LessThan(DateTime.Now)
                .WithMessage("Author's birth date must be in past");
            

        

            RuleFor(x => x.AuthorBooks)
                .NotEmpty()
                .WithMessage("There must be at least 1 book which author wrote.")
                .Must(i => i.Select(x => x.BookId).Distinct().Count() == i.Count())
                .WithMessage("Duplicate books are not allowed")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.AuthorBooks)
                    .SetValidator(new CreateAuthorBookValidator(context));
                });
        }
    }
}

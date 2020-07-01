using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using Bookstore.Domain;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class UpdateAuthorValidator : AbstractValidator<UpdateAuthorDto>
    {
        public UpdateAuthorValidator(BookstoreContext context)
        {
            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("Firstname is required parameter");
            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Lastname is required parameter");
        }
    }
}

using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class CreatePublisherValidator : AbstractValidator<PublisherDto>
    {
        public CreatePublisherValidator(BookstoreContext context)
        {
           /* RuleFor(x => x.Name)
                .Must(name => !context.Publishers.Any(p => p.Name == name))
                .WithMessage("Publisher name must be unique");*/
        }
    }
}

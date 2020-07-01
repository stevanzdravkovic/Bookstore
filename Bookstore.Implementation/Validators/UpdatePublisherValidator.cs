using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class UpdatePublisherValidator : AbstractValidator<UpdatePublisherDto>
    {
        public UpdatePublisherValidator(BookstoreContext context)
        {
            RuleFor(x => x.Name)
               
               .Must((dto, name) => !context.Publishers.Any(g => g.Name == name && g.Id != dto.Id))
               .WithMessage(g => $"Publisher with name {g.Name} already exists in db.");

          
        }
    }
}

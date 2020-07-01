using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class UpdateBookValidator : AbstractValidator<UpdateBookDto>
    {
        //private readonly BookstoreContext _context;
        public UpdateBookValidator(BookstoreContext context)
        {
            RuleFor(x => x.Title)
                .Must((dto, title) => !context.Books.Any(m => m.Title == title && m.Id != dto.Id))
                .WithMessage(m => $"Book ({m.Title}) already exists in database");
        }
    }
}

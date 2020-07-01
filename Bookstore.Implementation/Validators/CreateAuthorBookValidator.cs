using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using Bookstore.Domain;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class CreateAuthorBookValidator : AbstractValidator<CreateAuthorBookDto>
    {
        private readonly BookstoreContext context;

        public CreateAuthorBookValidator(BookstoreContext context)
        {
            this.context = context;

            RuleFor(x => x.BookId)
                .Must(BookExists)
                .WithMessage("Book with an id of {PropertyValue} does not exists in db");
                
        }
        private bool BookExists(int bookId)
        {
            return context.Books.Any(x => x.Id == bookId);
        }
    }
    }


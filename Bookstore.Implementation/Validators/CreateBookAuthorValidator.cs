using FluentValidation;
using Bookstore.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;
using Bookstore.DataAccess;
using Microsoft.EntityFrameworkCore.Internal;
using System.Linq;
//using static Bookstore.Application.DataTransfer.BookDto;

namespace Bookstore.Implementation.Validators
{
    public class CreateBookAuthorValidator : AbstractValidator<CreateBookAuthorDto>
    {
        private readonly BookstoreContext _context;
        public CreateBookAuthorValidator(BookstoreContext context)
        {
            _context = context;

            RuleFor(x => x.Id)
                .Must(AuthorExist)
                .WithMessage("Actor with an id of {PropertyValue} does not exists in db");
                
        }
        private bool AuthorExist(int authorId)
        {
            return _context.Authors.Any(x => x.Id == authorId);
        }
    }
}

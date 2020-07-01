using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class UpdateUserValidator : AbstractValidator<UpdateUserDto>
    {

        public UpdateUserValidator(BookstoreContext context)
        {
            RuleFor(x => x.Username)
                .Must((dto, username) => !context.Users.Any(u => u.Username == username && u.Id != dto.Id))
                .WithMessage(u => $"User with ({u.Username}) already exists in database.");

            RuleFor(x => x.Email)
                .Must((dto, email) => !context.Users.Any(u => u.Email == email && u.Id != dto.Id))
                .WithMessage(u => $"Email ({u.Email}) is taken, try different one. ");
        }
    }
}

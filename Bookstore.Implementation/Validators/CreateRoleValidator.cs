using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class CreateRoleValidator : AbstractValidator<RoleDto>
    {
        public CreateRoleValidator(BookstoreContext context)
        {
            RuleFor(x => x.Name)
                .Must(name => !context.Roles.Any(r => r.Name == name))
                .WithMessage("Role name must be unique");

        }
    }
}

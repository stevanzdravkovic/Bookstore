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
    public class CreateGenreValidator : AbstractValidator<GenreDto>
    {
        public CreateGenreValidator(BookstoreContext context)
        {
            RuleFor(x => x.Name)
                .Must(name => !context.Genres.Any(g => g.Name == name))
                .WithMessage("Genre name must be unique");
        }
    }
}

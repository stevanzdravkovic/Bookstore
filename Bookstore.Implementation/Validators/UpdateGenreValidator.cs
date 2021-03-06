﻿using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class UpdateGenreValidator : AbstractValidator<GenreDto>
    {
        public UpdateGenreValidator(BookstoreContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .WithMessage("Name is required parameter")
               .Must((dto, name) => !context.Genres.Any(g => g.Name == name && g.Id != dto.Id))
               .WithMessage(g => $"Product with name {g.Name} already exists in db.");
        }
    }
}

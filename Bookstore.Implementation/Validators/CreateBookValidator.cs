using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class CreateBookValidator : AbstractValidator<CreateBookDto>
    {
        private readonly BookstoreContext _context;
        public CreateBookValidator(BookstoreContext context)
        {
            _context = context;

            RuleFor(x => x.Title)
                .NotEmpty()
                .WithMessage("Book title cannot be empty");

            RuleFor(x => x.GenreId)
                .Must(GenreExist)
                .WithMessage("Genre with an id of {PropertyValue} does not exists in db");

            RuleFor(x => x.PublisherId)
                .Must(PublisherExist)
                .WithMessage("Genre with an id of {PropertyValue} does not exists in db");

            RuleFor(x => x.Year)
                .LessThanOrEqualTo(DateTime.Now.Year)
                .WithMessage("Book Year can't be in future");

            RuleFor(x => x.Price)
                .NotEmpty()
                .WithMessage("Price cannot be empty")
                .GreaterThan(0)
                .WithMessage("Price must be greater than 0");



            RuleFor(x => x.Description)
                .NotEmpty()
                .WithMessage("Book description must be entered");


            RuleFor(x => x.BookAuthors)
                .NotEmpty()
                .WithMessage("There must be at least 1 movie actor")
                .Must(i => i.Select(x => x.Id).Distinct().Count() == i.Count())
                .WithMessage("Duplicate actors are not allowed")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.BookAuthors)
                    .SetValidator(new CreateBookAuthorValidator(context));
                });
        }
        private bool GenreExist(int genreId)
        {
            return _context.Genres.Any(x => x.Id == genreId);
        }

        private bool PublisherExist(int publisherId)
        {
            return _context.Publishers.Any(x => x.Id == publisherId);
        }
    }
    }

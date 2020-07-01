using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfCreateGenreCommand : ICreateGenreCommand
    {
        private readonly BookstoreContext _context;
        private readonly CreateGenreValidator _validator;

        public EfCreateGenreCommand(BookstoreContext context, CreateGenreValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 15;

        public string Name => "Create genre using ef";

        public void Execute(GenreDto request)
        {
            _validator.ValidateAndThrow(request);
            var genre = new Genre
            {
                Name = request.Name
            };

            _context.Genres.Add(genre);
            _context.SaveChanges();
        }
    }
}

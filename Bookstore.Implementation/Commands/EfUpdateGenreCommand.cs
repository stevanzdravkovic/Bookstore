using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfUpdateGenreCommand : IUpdateGenreCommand
    {
        private readonly BookstoreContext _context;
        private readonly UpdateGenreValidator _validator;

        public EfUpdateGenreCommand(BookstoreContext context, UpdateGenreValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 26;

        public string Name => "Update genre using ef";

        public void Execute(GenreDto request)
        {
            _validator.ValidateAndThrow(request);
            var genre = _context.Genres.Find(request.Id);
            if (genre == null)
            {
                throw new EntityNotFOundException(request.Id, typeof(Genre));
            }
            genre.Name = request.Name;

            _context.SaveChanges();
        }
    }
}

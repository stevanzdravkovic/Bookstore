using Bookstore.Application.Commands;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfDeleteGenreCommand : IDeleteGenreCommand
    {
        private readonly BookstoreContext _context;

        public EfDeleteGenreCommand(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 20;

        public string Name => "Delete genre using ef";

        public void Execute(int request)
        {
            var genre = _context.Genres.Find(request);
            if (genre == null)
            {
                throw new EntityNotFOundException(request, typeof(Genre));
            }
            genre.DeletedAt = DateTime.Now;
            genre.IsDeleted = true;
            genre.IsActive = false;

            _context.SaveChanges();
        }
    }
}

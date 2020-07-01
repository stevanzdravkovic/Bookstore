using Bookstore.Application.DataTransfer;
using Bookstore.Application.Exceptions;
using Bookstore.Application.Queries;
using Bookstore.DataAccess;
using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetSingleGenre : IGetSingleGenreQuery
    {
        private readonly BookstoreContext _context;

        public EfGetSingleGenre(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 7;

        public string Name => "Get single genre";

        public GenreDto Execute(int search)
        {
            var genre = _context.Genres.FirstOrDefault(g => g.Id == search);

            if (genre == null)
            {
                throw new EntityNotFOundException(search, typeof(Genre));
            }

            var response = new GenreDto
            {
                Id = genre.Id,
                Name = genre.Name
            };
            return response;
        }
    }
}

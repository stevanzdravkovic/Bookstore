using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Bookstore.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetGenres : IGetGenresQuery
    {
        private readonly BookstoreContext _context;

        public EfGetGenres(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 3;

        public string Name => "Get Genres";

        public PagedResponse<GenreDto> Execute(GenreSerach search)
        {
            var query = _context.Genres.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<GenreDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(x => new GenreDto
                             {
                                 Id = x.Id,
                                 Name = x.Name
                             }).ToList()
            };
            return response;
        }
    }
}

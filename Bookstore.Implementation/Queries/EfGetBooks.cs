using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
     public class EfGetBooks : IGetBooksQuery
    {
        private readonly BookstoreContext _context;

        public EfGetBooks(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 2;

        public string Name =>"Get books";

        public PagedResponse<BookDto> Execute(BookSearch search)
        {
            var query = _context.Books.Include(x => x.Publisher)
                                        .Include(x => x.BookAuthors)
                                        .ThenInclude(x => x.Author)

                                        .AsQueryable();

            if (!string.IsNullOrEmpty(search.Title) || !string.IsNullOrWhiteSpace(search.Title))
            {
                query = query.Where(x => x.Title.ToLower().Contains(search.Title.ToLower()));
            }

            if (search.MinPrice != 0)
            {
                query = query.Where(x => x.Price >= search.MinPrice);
            }
            if (search.MaxPrice != 0)
            {
                query = query.Where(x => x.Price <= search.MaxPrice);
            }

            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<BookDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(m => new BookDto
                             {
                                 Id = m.Id,
                                 Title = m.Title,
                                 Year = m.Year,
                                // GenreName = m.Genre.Name,
                                 Description = m.Description,
                                 Price = m.Price,
                                PublisherName = m.Publisher.Name,
                                 BookAuthors = m.BookAuthors.Select(ma => new BookAuthorDto
                                 {
                                     Id = ma.AuthorId,
                                     Year = ma.Book.Year,
                                     Name = ma.Author.FirstName,
                                     Title = ma.Book.Title,
                                     
                                     
                                 })
                                 
                             })
            };
            return response;
        }
    }
}

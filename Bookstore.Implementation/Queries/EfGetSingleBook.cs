using Bookstore.Application.DataTransfer;
using Bookstore.Application.Exceptions;
using Bookstore.Application.Queries;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetSingleBook : IGetSingleBookQuery
    {
        private readonly BookstoreContext _context;

        public EfGetSingleBook(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 6;

        public string Name => "Get Single book using ef";

        public BookDto Execute(int search)
        {
            var query = _context.Books.Include(x => x.Publisher)
                                       // .Include(x => x.Genre)
                                        .Include(x => x.BookAuthors)
                                        .ThenInclude(x => x.Author)
                                       .AsQueryable();

            var book = query.FirstOrDefault(m => m.Id == search);

            if (book == null)
            {
                throw new EntityNotFOundException(search, typeof(Book));
            }
            var response = new BookDto
            {
                Id = book.Id,
                Title = book.Title,
                Year = book.Year,
               // GenreId = book.GenreId,
               // GenreName = book.Genre.Name,
                PublisherName = book.Publisher.Name,
                   
                Description = book.Description,
                Price = book.Price,
                BookAuthors = book.BookAuthors.Select(ma => new BookAuthorDto
                {
                    Id = ma.AuthorId,
                    Year = ma.Book.Year,
                    Name = ma.Author.FirstName,
                    Title = ma.Book.Title
                })
            };
            return response;
        }
    }
}

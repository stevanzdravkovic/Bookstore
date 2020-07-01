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
    public class EfGetSingleAuthor : IGetSingleAuthorQuery
    {
        private readonly BookstoreContext _context;

        public EfGetSingleAuthor(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 5;

        public string Name => "Get signel author";

        public AuthorDto Execute(int search)
        {
            var query = _context.Authors.Include(x => x.AuthorBooks)
                                        .ThenInclude(a => a.Book)
                                        .ThenInclude(x => x.Genre)
                                        .AsQueryable();
            var author = query.FirstOrDefault(a => a.Id == search);
            if (author == null)
            {
                throw new EntityNotFOundException(search, typeof(Author));
            }

            var respones = new AuthorDto
            {
                Id = author.Id,
                FirstName = author.FirstName,
                LastName = author.LastName,
                Birth = author.Birth,
                BirthPlace = author.BirthPlace,
                AuthorBooks = author.AuthorBooks.Select(x => new AuthorBookDto
                {
                    Id = x.Id,
                    Title = x.Book.Title,
                    Description = x.Book.Description,
                    Price = x.Book.Price,
                    Year = x.Book.Year,
                    Quantity = x.Book.Quantity

                })
            };
            return respones;
        }
    }
}

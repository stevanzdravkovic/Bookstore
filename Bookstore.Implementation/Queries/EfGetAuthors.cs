using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Bookstore.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetAuthors : IGetAuthorsQuery
    {
        private readonly BookstoreContext _context;

        public EfGetAuthors(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 9;

        public string Name => "Get authors using ef";

        public PagedResponse<AuthorDto> Execute(AuthorSearch search)
        {
            var query = _context.Authors.Include(x => x.AuthorBooks)
                                        .ThenInclude(b => b.Book)
                                        //.ThenInclude(g => g.Genre)
                                        .AsQueryable();
            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));

            }




            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<AuthorDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(a => new AuthorDto
                             {
                                 Id = a.Id,
                                 FirstName = a.FirstName,
                                 LastName = a.LastName,
                                 Birth = a.Birth,
                                 BirthPlace = a.BirthPlace,
                                 
                                 AuthorBooks = a.AuthorBooks.Select(ab => new AuthorBookDto
                                 {
                                     Id = ab.BookId,
                                     Description = ab.Book.Description,
                                     Price = ab.Book.Price,
                                     Title = ab.Book.Title,
                                     Year = ab.Book.Year,
                                     Quantity = ab.Book.Quantity
                                     
                                     
                                     
                                 })

                             })
            };
            return response;
        
        }
    }
}

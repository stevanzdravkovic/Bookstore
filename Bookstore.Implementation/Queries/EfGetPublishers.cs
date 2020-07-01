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
    public class EfGetPublishers : IGetPublishersQuery
    {
        private readonly BookstoreContext _context;

        public EfGetPublishers(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 4;

        public string Name => "Get publishers";

        public PagedResponse<PublisherDto> Execute(PublisherSearch search)
        {
            var query = _context.Publishers.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<PublisherDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(x => new PublisherDto
                             {
                                 Id = x.Id,
                                 Name = x.Name,
                                 City = x.City,
                                 State = x.State
                                 
                             }).ToList()
            };
            return response;
        }
    }
}

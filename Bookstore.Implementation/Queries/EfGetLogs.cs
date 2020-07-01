using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Bookstore.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Bookstore.Implementation.Queries
{
    public class EfGetLogs : IGetLogsQuery
    {
        private readonly BookstoreContext _context;

        public EfGetLogs(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 31;

        public string Name => "Get Logs";

        public PagedResponse<LogDto> Execute(LogSearch search)
        {
            var query = _context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.Name.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.ActorName) || !string.IsNullOrWhiteSpace(search.ActorName))
            {
                query = query.Where(x => x.Actor.ToLower().Contains(search.ActorName.ToLower()));
            }
            if (search.MinDate != null)
            {
                query = query.Where(x => x.Date >= search.MinDate);
            }
            if (search.MaxDate != null)
            {
                query = query.Where(x => x.Date <= search.MaxDate);
            }
            

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<LogDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(l => new LogDto
                             {
                                 Id = l.Id,
                                 Date = l.Date,
                                 UseCaseName = l.UseCaseName,
                                 Actor = l.Actor,
                                 Data = l.Data
                             })
            };

            return response;
        }
    }
}

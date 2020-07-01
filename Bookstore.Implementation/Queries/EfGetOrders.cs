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
    public class EfGetOrders : IGetOrdersQuery
    {
        private readonly BookstoreContext _context;
        public EfGetOrders(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 32;

        public string Name => "Get Orders";

        public PagedResponse<OrderDto> Execute(OrderSearch search)
        {
            var query = _context.Orders.Include(x => x.OrderLines)
                                       .Include(x => x.User)
                                        .AsQueryable();

            if (!string.IsNullOrEmpty(search.Address) || !string.IsNullOrWhiteSpace(search.Address))
            {
                query = query.Where(x => x.Address.ToLower().Contains(search.Address.ToLower()));

            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<OrderDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(o => new OrderDto
                             {
                                 Id = o.Id,
                                 Address = o.Address,
                                 CreatedAt = o.CreatedAt,
                                 OrderLines = o.OrderLines.Select(ol => new OrderLineDto
                                 {
                                     Id = ol.Id,
                                     Price = ol.Price,
                                     Quantity = ol.Quantity,
                                     Title = ol.Name
                                 })
                             })
            };

            return response;
        }
    }
}

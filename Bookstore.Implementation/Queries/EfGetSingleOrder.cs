
using Bookstore.Application;
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
    public class EfGetSingleOrder : IGetSingleOrderQuery
    {
        private readonly BookstoreContext _context;
        private readonly IApplicationActor _actor;
        public EfGetSingleOrder(BookstoreContext context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 11;

        public string Name => "Get Single Order";

        public OrderDto Execute(int search)
        {
            var query = _context.Orders.Include(x => x.OrderLines)
                                       .Include(x => x.User)
                                       .AsQueryable();

            var order = query.FirstOrDefault(o => o.Id == search);

            if (order == null)
            {
                throw new EntityNotFOundException(search, typeof(Order));
            }
            if (order.Id != _actor.Id)
            {
                throw new UnauthorizedUseCaseException(this, this._actor);
            }
            var response = new OrderDto
            {
                Id = order.Id,
                Address = order.Address,
                CreatedAt = order.CreatedAt,
                OrderLines = order.OrderLines.Select(ol => new OrderLineDto
                {
                    Id = ol.Id,
                    Price = ol.Price,
                    Quantity = ol.Quantity,
                    Title = ol.Name
                })
            };

            return response;
        }
    }
}

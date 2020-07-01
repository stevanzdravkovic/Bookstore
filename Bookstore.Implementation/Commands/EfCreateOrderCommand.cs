using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfCreateOrderCommand : ICreateOrderCommand
    {
        private readonly BookstoreContext _context;
        private readonly CreateOrderValidator _validator;

        public EfCreateOrderCommand(BookstoreContext context, CreateOrderValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 12;

        public string Name => "Create Order";

        public void Execute(CreateOrderDto request)
        {
            _validator.ValidateAndThrow(request);

            var order = new Order
            {
                Address = request.Address,
                UserId = request.UserId,
                OrderDate = request.OrderDate
            };

            foreach (var item in request.Items)
            {
                var book = _context.Books.Find(item.BookId);
                book.Quantity -= item.Quantity;

                order.OrderLines.Add(new OrderLine
                {
                    BookId = item.BookId,
                    Quantity = item.Quantity,
                    Name = book.Title,
                    Price = book.Price,
                    OrderId = order.Id
                });
            }

            _context.Orders.Add(order);
            _context.SaveChanges();
        }
    }
}

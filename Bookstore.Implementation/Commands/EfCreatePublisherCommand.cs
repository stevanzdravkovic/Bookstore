using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.DataAccess;
using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfCreatePublisherCommand : ICreatePublisherCommand
    {
        private readonly BookstoreContext _context;

        public EfCreatePublisherCommand(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 16;

        public string Name => "Create publisher using ef";

        public void Execute(CreatePublisherDto request)
        {
            var publisher = new Publisher
            {
                Name = request.Name,
                City = request.City,
                State = request.State
            };

            _context.Publishers.Add(publisher);
            _context.SaveChanges();
        }
    }
}

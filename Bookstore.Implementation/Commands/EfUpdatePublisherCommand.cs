using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfUpdatePublisherCommand : IUpdatePublisherCommand
    {
        private readonly BookstoreContext _context;
        private readonly UpdatePublisherValidator _validator;

        public EfUpdatePublisherCommand(BookstoreContext context, UpdatePublisherValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id =>27;

        public string Name => "update publisher";

        public void Execute(UpdatePublisherDto request)
        {
            _validator.ValidateAndThrow(request);
            var publisher = _context.Publishers.Find(Id);
            if (publisher == null)
            {
                throw new EntityNotFOundException(request.Id, typeof(Publisher));

            }

            if (request.Name == null && request.City == null && request.State == null)
            {
                request.Name = publisher.Name;
                request.City = publisher.City;
                request.State = publisher.State;
            }

            if (request.Name == null && request.City != null && request.State != null)
            {
                request.Name = publisher.Name;
            }

            if (request.Name != null && request.City == null && request.State != null)
            {
                request.City = publisher.City;
            }

            if (request.Name != null && request.City != null && request.State == null)
            {
                request.State = publisher.State;
            }

            publisher.Name = request.Name;
            publisher.State = request.State;
            publisher.City = request.City;

            _context.SaveChanges();
        }
    }
}

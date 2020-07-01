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
    public class EfGetSinglePublisher : IGetSinglePublisherQuery
    {
        private readonly BookstoreContext _context;

        public EfGetSinglePublisher(BookstoreContext context)
        {
            _context = context;
        }

        public int Id => 8;

        public string Name => "Get single publisher";

        public PublisherDto Execute(int search)
        {
            var query = _context.Publishers.AsQueryable();
            var publisher =query.FirstOrDefault(g => g.Id == search);

            if (publisher == null)
            {
                throw new EntityNotFOundException(search, typeof(Publisher));
            }
            /*
             var query = _context.Actors.Include(x => x.ActorMovies)
                                       .ThenInclude(a => a.Movie)
                                       .ThenInclude(x => x.Genre)
                                       .AsQueryable();

            var actor = query.FirstOrDefault(a=> a.Id ==search);
             */

            var response = new PublisherDto
            {
                Id = publisher.Id,
                Name = publisher.Name,
                State = publisher.State,
                City = publisher.City
            };
            return response;
        }
    }
}

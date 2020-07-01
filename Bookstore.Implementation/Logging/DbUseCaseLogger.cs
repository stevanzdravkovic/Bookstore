using Bookstore.Application;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Logging
{
    public class DbUseCaseLogger : IUseCaseLogger
    {
        private readonly BookstoreContext _context;

        public DbUseCaseLogger(BookstoreContext context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            _context.UseCaseLogs.Add(new UseCaseLog
            {
                Actor = actor.Identity,
                Date = DateTime.UtcNow,
                Data = JsonConvert.SerializeObject(useCaseData),
                UseCaseName = useCase.Name
            });
           

            _context.SaveChanges();
        }
    }
}

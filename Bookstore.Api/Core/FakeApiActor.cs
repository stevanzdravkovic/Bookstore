using Bookstore.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Bookstore.Api.Core
{
    public class FakeApiActor : IApplicationActor
    {
        public int Id => 1;
        public string Identity => "Fake api user";
        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 300);

    }
}

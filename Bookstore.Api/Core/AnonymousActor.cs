using Bookstore.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Bookstore.Api.Core
{
    public class AnonymousActor : IApplicationActor
    {
        public int Id => 0;

        public string Identity => "Anonymus user"; //neautorizovani

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 9);//samo prikaz bez narucivanja do 9 treba
    }
}

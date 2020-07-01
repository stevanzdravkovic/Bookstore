using Bookstore.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Searches
{
    public class LogSearch : PagedSearch
    {
        public string Name { get; set; }
        public string ActorName { get; set; }
        public DateTime? MinDate { get; set; }
        public DateTime? MaxDate { get; set; }

    }
}

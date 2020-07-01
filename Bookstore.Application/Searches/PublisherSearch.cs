using Bookstore.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Searches
{
    public class PublisherSearch : PagedSearch
    {
        public string Name { get; set; }
    }
}

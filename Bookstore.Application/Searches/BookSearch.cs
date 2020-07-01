using Bookstore.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Searches
{
    public class BookSearch : PagedSearch
    {
        public string Title { get; set; }
        public decimal MinPrice { get; set; }
        public int MaxPrice { get; set; }
    }
}

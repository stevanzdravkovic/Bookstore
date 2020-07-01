using Bookstore.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Searches
{
    public class AuthorSearch : PagedSearch
    {
        public string FirstName { get; set; }

    }
}

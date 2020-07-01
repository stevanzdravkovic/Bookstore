using Bookstore.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
    }
}

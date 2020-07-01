using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Domain
{
    public class Author : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string BirthPlace { get; set; }
        public DateTime Birth { get; set; }


        public ICollection<BookAuthor> AuthorBooks { get; set; } = new HashSet<BookAuthor>();
    }
}

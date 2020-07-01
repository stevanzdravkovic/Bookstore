using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Domain
{
    public class BookAuthor : BaseManyToMany
    {
        public int BookId { get; set; }
        public int AuthorId { get; set; }

        public virtual Author Author { get; set; }
        public virtual Book Book { get; set; }
    }
}

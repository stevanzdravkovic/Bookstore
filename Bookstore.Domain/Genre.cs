using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Domain
{
    public class Genre : BaseEntity
    {
        public string Name { get; set; }

        public virtual ICollection<Book> Books { get; set; } //jedan genre moze imati vise knjiga
    }
}

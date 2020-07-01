using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Domain
{
    public class Publisher : BaseEntity
    {
        public string Name { get; set; }

        public string City { get; set; }

        public string State { get; set; }

        public virtual ICollection<Book> Books { get; set; } //jedan publisher moze imati vise knjiga
    }
}

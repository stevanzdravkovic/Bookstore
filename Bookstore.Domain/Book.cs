using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Domain
{
    public class Book : BaseEntity
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
        public int Quantity { get; set; }
        public int GenreId { get; set; }
        public int PublisherId { get; set; }

        public virtual Genre Genre { get; set; } 
        public virtual Publisher Publisher { get; set; } 
        public virtual ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();
        public virtual ICollection<BookAuthor> BookAuthors { get; set; } = new HashSet<BookAuthor>();
    }
}

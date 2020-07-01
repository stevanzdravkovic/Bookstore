using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Domain
{
    public class OrderLine : BaseEntity
    {
        public string Name { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public int OrderId { get; set; }
        public int? BookId { get; set; }

        public virtual Order Order { get; set; }
        public virtual Book Book { get; set; }


    }
}

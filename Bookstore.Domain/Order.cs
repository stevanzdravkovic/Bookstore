using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Domain
{
    public class Order : BaseEntity
    {
        public string Address { get; set; }
        public DateTime OrderDate { get; set; }
        public int UserId { get; set; }

        public virtual User User { get; set; } //jedan order odgovara tacno jednom useru
        public virtual ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();
    }
}

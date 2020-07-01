using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.DataTransfer
{
    public class CreateOrderDto
    {
        public DateTime OrderDate { get; set; }
        public string Address { get; set; }
        public int UserId { get; set; }
        public IEnumerable<CreateOrderLineDto> Items { get; set; } = new List<CreateOrderLineDto>();
    }
    public class CreateOrderLineDto
    {
        public int BookId { get; set; }
        public int Quantity { get; set; }
    }

}

using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.DataTransfer
{
    public class CreatePublisherDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string City { get; set; }
        public string State { get; set; }
    }
}

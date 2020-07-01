using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.DataTransfer
{
    public class UpdateAuthorDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string BirthPlace { get; set; }
        public DateTime? Birth { get; set; }
    }
}

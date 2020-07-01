using Bookstore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.DataTransfer
{
    public class CreateAuthorDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string BirthPlace { get; set; }
        public DateTime Birth { get; set; }
        public IEnumerable<CreateAuthorBookDto> AuthorBooks { get; set; } = new List<CreateAuthorBookDto>();
    }

    public class CreateAuthorBookDto
    {
        public int BookId { get; set; }
        public int AuthorId { get; set; }
    }
}

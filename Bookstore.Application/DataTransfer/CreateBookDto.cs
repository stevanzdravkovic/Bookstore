using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.DataTransfer
{
    public class CreateBookDto
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
        public int GenreId { get; set; }
        public int PublisherId { get; set; }

        public IEnumerable<CreateBookAuthorDto> BookAuthors { get; set; } = new List<CreateBookAuthorDto>();
    }
        public class CreateBookAuthorDto
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public int Year { get; set; }
        }
    
}

using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.DataTransfer
{
    public class BookDto
    {
        public int Id { get; set; }

        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
       
        public string PublisherName { get; set; }
       
        public IEnumerable<BookAuthorDto> BookAuthors { get; set; } = new List<BookAuthorDto>();
    }
        public class BookAuthorDto
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public int Year { get; set; }
            public string Title { get; set; }
            
    }
    
}

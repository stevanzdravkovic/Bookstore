﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Domain
{
    public class User : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public int RoleId { get; set; }

        public virtual Role Role { get; set; }


        public virtual ICollection<Order> Orders { get; set; } = new HashSet<Order>();

        public virtual ICollection<UserUseCase> UserUseCases { get; set; }
        
        // public virtual ICollection<Order> Orders { get; set; } = new HashSet<Order>(); //jedan user moze imati vise ordera
    }
}

using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Exceptions
{
    public class EntityNotFOundException : Exception
    {
        public EntityNotFOundException(int id, Type type)
            : base($"Entity of type {type.Name} with id {id} was not found.")
        {

        }

    }
}

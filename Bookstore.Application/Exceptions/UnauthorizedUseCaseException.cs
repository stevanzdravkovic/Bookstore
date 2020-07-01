using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Exceptions
{
    public class UnauthorizedUseCaseException : Exception
    {
        public UnauthorizedUseCaseException(IUseCase useCase, IApplicationActor actor)
            : base($"Entity of type {actor.Id} - {actor.Identity} tried to execute {useCase.Name}")
        {
        }
    }
}

using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Exceptions;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly BookstoreContext _context;
        private readonly UpdateUserValidator _validator;
        private readonly IApplicationActor _actor;

        public EfUpdateUserCommand(BookstoreContext context, UpdateUserValidator validator, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
        }

        public int Id => 29;

        public string Name => "Update User";

        public void Execute(UpdateUserDto request)
        {
            var user = _context.Users.Find(request.Id);

            if (user == null)
            {
                throw new EntityNotFOundException(request.Id, typeof(User));
            }

            if (user.Id != _actor.Id)
            {
                throw new UnauthorizedUseCaseException(this, _actor);
            }
            if (request.FirstName == null && request.LastName == null)
            {
                request.FirstName = user.FirstName;
                request.LastName = user.LastName;
            }
            if (request.FirstName == null && request.LastName != null)
            {
                request.FirstName = user.FirstName;
            }
            if (request.FirstName != null && request.LastName == null)
            {
                request.LastName = user.LastName;
            }

            if (request.Password == null)
            {
                request.Password = user.Password;
            }
            if (request.Email == null)
            {
                request.Email = user.Email;
            }

            /*if (request.Username == null)
            {
                request.Username = user.Username;
            }
            */
            _validator.ValidateAndThrow(request);

            user.FirstName = request.FirstName;
            user.LastName = request.LastName;
            user.Password = request.Password;
            user.Email = request.Email;
           // user.Username = request.Username


            _context.SaveChanges();
        }
    }
}

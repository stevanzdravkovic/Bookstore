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
    public class EfUpdateAuthorCommand : IUpdateAuthorCommand
    {
        private readonly BookstoreContext _context;
        private readonly UpdateAuthorValidator _validator;

        public EfUpdateAuthorCommand(BookstoreContext context, UpdateAuthorValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 24;

        public string Name => "Update author using ef";

        public void Execute(UpdateAuthorDto request)
        {
            _validator.ValidateAndThrow(request);
            var author = _context.Authors.Find(request.Id);

            if (author == null)
            {
                throw new EntityNotFOundException(request.Id, typeof(Author));
            }
            if (request.FirstName == null && request.LastName == null)
            {
                request.FirstName = author.FirstName;
                request.LastName = author.LastName;
            }

            if (request.FirstName == null && request.LastName != null)
            {
                request.FirstName = author.FirstName;
            }

            if (request.FirstName != null && request.LastName == null)
            {
                request.LastName = author.LastName;
            }
            var birthPlace = author.BirthPlace;
            var birth = author.Birth;

            author.FirstName = request.FirstName;
            author.LastName = request.LastName;
            author.BirthPlace = request.BirthPlace ?? birthPlace;
            author.Birth = request.Birth ?? birth;

            //var birthPlace = actor.BirthPlace;

            
           // actor.BirthPlace = request.BirthPlace ?? birthPlace;

            _context.SaveChanges();
        }
    }
}

using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Email;
using Bookstore.DataAccess;
using Bookstore.Domain;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        private readonly BookstoreContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;

        public EfRegisterUserCommand(BookstoreContext context, RegisterUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
        }

        public int Id => 1;

        public string Name => "User Registration";

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);
            var user = new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Username = request.Username,
                Password = request.Password,
                RoleId = 2,
                Email = request.Email
            };
            _context.Users.Add(user);
            
           
            var list = new List<UserUseCase>();
            var useCases = new List<int> { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };

            foreach(var useCase in useCases)
            {
                var userUseCase = new UserUseCase
                {
                    UserId = user.Id,
                    UseCaseId = useCase
                };
                list.Add(userUseCase);
            }

            user.UserUseCases = list;

            _context.SaveChanges();
            _sender.Send(new SendEmailDto
            {
                Subject = "Registration",
                Content = "<h1>Successfull registration, you can use your username and password to log in</h1>",
                SendTo = request.Email
            });

        }


    }
}

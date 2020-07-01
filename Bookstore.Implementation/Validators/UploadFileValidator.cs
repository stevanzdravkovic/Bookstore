using Bookstore.Application.DataTransfer;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Implementation.Validators
{
    public class UploadFileValidator : AbstractValidator<UploadFileDto>
    {
        public UploadFileValidator()
        {
            RuleFor(x => x.Image)
                .NotEmpty()
                .WithMessage("Please select the file, it cannot be empty");
        }
    }
}

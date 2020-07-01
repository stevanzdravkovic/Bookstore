using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Bookstore.Implementation.Commands
{
    public class EfUploadFileCommand : IUploadFileCommand
    {
        private readonly UploadFileValidator _validator;

        public EfUploadFileCommand(UploadFileValidator validator)
        {
            _validator = validator;
        }

        public int Id => 30;

        public string Name => "Upload File";

        public void Execute(UploadFileDto request)
        {
            _validator.ValidateAndThrow(request);

            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(request.Image.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                request.Image.CopyTo(fileStream);
            }

            //newFileName poslati u bazu
        }
    }
}

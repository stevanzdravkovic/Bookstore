using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Bookstore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {

        private readonly UseCaseExecutor _executor;

        public UploadController(UseCaseExecutor executor)
        {
            _executor = executor;
        }


        // POST: api/Upload
        [HttpPost]
        public void Post([FromForm] UploadFileDto dto, [FromServices] IUploadFileCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bookstore.Application;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;


namespace Bookstore.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class LogController : ControllerBase
    {

        private readonly UseCaseExecutor _executor;

        public LogController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Log
        [HttpGet]
        public IActionResult Get([FromQuery] LogSearch search, [FromServices] IGetLogsQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

    }
}

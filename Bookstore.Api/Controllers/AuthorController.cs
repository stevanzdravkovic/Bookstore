using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Bookstore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthorController : ControllerBase
    {

        private readonly UseCaseExecutor _executor;

        public AuthorController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Author
        [HttpGet]
        public IActionResult Get(
            [FromQuery] AuthorSearch search,
            [FromServices] IGetAuthorsQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

        // GET: api/Author/5
        [HttpGet("{id}", Name = "GetAuthor")]
        public IActionResult Get(int id, 
            [FromServices] IGetSingleAuthorQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Author
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateAuthorDto dto,
            [FromServices] ICreateAuthorCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Author/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateAuthorDto dto,
            [FromServices] IUpdateAuthorCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteAuthorCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}

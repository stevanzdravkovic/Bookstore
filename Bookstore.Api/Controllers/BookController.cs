using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;


namespace Bookstore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {

        private readonly UseCaseExecutor _executor;

        public BookController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Book
        [HttpGet]
        public IActionResult Get(
            [FromQuery] BookSearch search,
            [FromServices] IGetBooksQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

        // GET: api/Book/5
        [HttpGet("{id}", Name = "GetBook")]
        public IActionResult Get(int id,
            [FromServices] IGetSingleBookQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Book
        [Authorize]
        [HttpPost]
        public IActionResult Post(
            [FromBody] CreateBookDto dto,
            [FromServices] ICreateBookCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Book/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, 
            [FromBody] UpdateBookDto dto,
            [FromServices] IUpdateBookCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteBookCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);        }
    }
}

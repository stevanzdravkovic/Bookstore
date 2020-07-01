using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.DataTransfer;
using Bookstore.Application.Queries;
using Bookstore.Application.Searches;
using Bookstore.DataAccess;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;


namespace Bookstore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GenreController : ControllerBase
    {
        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;
        private readonly BookstoreContext _context;

        public GenreController(IApplicationActor actor, UseCaseExecutor executor, BookstoreContext context)
        {
            _actor = actor;
            _executor = executor;
            _context = context;
        }

        // GET: api/Genre
        [HttpGet]
        public IActionResult Get(
            [FromQuery]GenreSerach search,
            [FromServices] IGetGenresQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

        // GET: api/Genre/5
        [HttpGet("{id}", Name = "GetGenre")]
        public IActionResult Get(int id,
            [FromServices] IGetSingleGenreQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Genre
        [Authorize]
        [HttpPost]
        public IActionResult Post(
            [FromBody] GenreDto dto,
            [FromServices] ICreateGenreCommand command)
        {
             _executor.ExecuteCommand(command, dto);
             return StatusCode(StatusCodes.Status201Created);
            
        }

        // PUT: api/Genre/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id,
            [FromBody] GenreDto dto,
            [FromServices] IUpdateGenreCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteGenreCommand command)
        {
            try
            {
                _executor.ExecuteCommand(command, id);
                return StatusCode(StatusCodes.Status204NoContent);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}

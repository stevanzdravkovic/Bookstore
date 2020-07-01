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
    public class PublisherController : ControllerBase
    {

        private readonly UseCaseExecutor _executor;

        public PublisherController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Publisher
        [HttpGet]
        public IActionResult Get(
            [FromQuery] PublisherSearch search,
            [FromServices] IGetPublishersQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

        // GET: api/Publisher/5
        [HttpGet("{id}", Name = "GetPublisher")]
        public IActionResult Get(int id,
            [FromServices] IGetSinglePublisherQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Publisher
        [Authorize]
        [HttpPost]
        public IActionResult Post(
            [FromBody] CreatePublisherDto dto,
            [FromServices] ICreatePublisherCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Publisher/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, 
            [FromBody] UpdatePublisherDto dto,
            [FromServices] IUpdatePublisherCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeletePublisherCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}

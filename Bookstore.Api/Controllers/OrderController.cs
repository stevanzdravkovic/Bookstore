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
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {

        private readonly UseCaseExecutor _executor;

        public OrderController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Order
        [HttpGet]
        public IActionResult Get(
            [FromQuery] OrderSearch search, 
            [FromServices] IGetOrdersQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

        // GET: api/Order/5
        [HttpGet("{id}", Name = "GetOrder")]
        public IActionResult Get(int id, 
            [FromServices] IGetSingleOrderQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Order
        [HttpPost]
        public IActionResult Post([FromBody] CreateOrderDto dto, [FromServices] ICreateOrderCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Order/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}

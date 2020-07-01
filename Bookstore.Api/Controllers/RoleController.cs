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

namespace Bookstore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly BookstoreContext _context;
        private readonly UseCaseExecutor _executor;
        private readonly IApplicationActor _actor;

        public RoleController(BookstoreContext context, UseCaseExecutor executor, IApplicationActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }
    
        // GET: api/Role
        [HttpGet]
    public IActionResult Get(
            [FromQuery]RoleSearch search,
            [FromServices] IGetRolesQuery query)
    {
        var result = _executor.ExecuteQuery(query, search);
        return Ok(result);
    }

    // GET: api/Role/5
    [HttpGet("{id}", Name = "GetRole")]
    public IActionResult Get(int id, [FromServices] IGetSingleRoleQuery query)
    {
        var result = _executor.ExecuteQuery(query, id);
        return Ok(result);
    }

    // POST: api/Role
    [HttpPost]
    public IActionResult Post(
             [FromBody] RoleDto dto,
             [FromServices] ICreateRoleCommand command)
    {
        _executor.ExecuteCommand(command, dto);
        return StatusCode(StatusCodes.Status201Created);
    }

    // PUT: api/Role/5
    [HttpPut("{id}")]
    public IActionResult Put(int id, [FromBody] RoleDto dto, [FromServices] IUpdateRoleCommand command)
    {
        dto.Id = id;

        _executor.ExecuteCommand(command, dto);
        return StatusCode(StatusCodes.Status204NoContent);
    }

    // DELETE: api/ApiWithActions/5
    [HttpDelete("{id}")]
    public IActionResult Delete(int id, [FromServices] IDeleteRoleCommand command)
    {
        _executor.ExecuteCommand(command, id);
        return StatusCode(StatusCodes.Status204NoContent);
    }
}
}

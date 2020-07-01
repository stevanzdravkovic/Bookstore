using Bookstore.Application.Exceptions;
using FluentValidation;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Bookstore.Api.Core
{
    public class GlobalExceptionHandler
    {
        private readonly RequestDelegate _next;

        public GlobalExceptionHandler(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                httpContext.Response.ContentType = "application/json";
                object respone = null;
                var statusCode = StatusCodes.Status500InternalServerError;
                switch(ex)
                {
                    case UnauthorizedUseCaseException _:
                        statusCode = StatusCodes.Status403Forbidden;
                        respone = new
                        {
                            message = "You are not allowed to execute this operation"
                        };
                        break;

                    case EntityNotFOundException _:
                        statusCode = StatusCodes.Status404NotFound;
                        respone = new
                        {
                            message = "Resource not found."
                        };
                        break;

                    case ValidationException valexc:
                        statusCode = StatusCodes.Status422UnprocessableEntity;
                        respone = new
                        {
                            message = "You are not allowed to execute this operation",
                            errors = valexc.Errors.Select(x => new
                            {
                                x.PropertyName,
                                x.ErrorMessage
                            })
                        };
                        break;
                }

                httpContext.Response.StatusCode = statusCode;

                if (respone != null)
                {
                    await httpContext.Response.WriteAsync(JsonConvert.SerializeObject(respone));
                    return;
                }

                await Task.FromResult(httpContext.Response);
                
            }
        }
    }
}

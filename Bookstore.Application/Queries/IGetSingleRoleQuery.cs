using Bookstore.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Queries
{
    public interface IGetSingleRoleQuery : IQuery<int, RoleDto>
    {
    }
}

﻿using Bookstore.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Queries
{
    public interface IGetSingleAuthorQuery : IQuery<int, AuthorDto>
    {
    }
}

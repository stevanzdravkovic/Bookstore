﻿using Bookstore.Application.DataTransfer;
using Bookstore.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Queries
{
    public interface IGetPublishersQuery : IQuery<PublisherSearch, PagedResponse<PublisherDto>>
    {
    }
}

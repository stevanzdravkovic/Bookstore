﻿using Bookstore.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.Application.Commands
{
    public interface IRegisterUserCommand : ICommand<RegisterUserDto>
    {
    }
}

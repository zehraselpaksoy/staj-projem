﻿using Northwinds.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Northwin.Business.Abstract
{
    public interface ICategoryService
    {
        List<Category> GetAll();
    }
}

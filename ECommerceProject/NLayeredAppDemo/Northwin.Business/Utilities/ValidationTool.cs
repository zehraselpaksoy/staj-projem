
using FluentValidation;
using Northwin.Business.ValidationRules.FluentValidation;
using Northwinds.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Northwin.Business.Utilities
{
    public static class ValidationTool // Sıklıkla kullanılacağı için static yaptık
    {
        public static void Validate<T>(IValidator<T> validator, T entity)
        {
            var result = validator.Validate(entity);
            if (!result.IsValid)
            {
                throw new ValidationException(result.Errors);
            }
        }
    }
}

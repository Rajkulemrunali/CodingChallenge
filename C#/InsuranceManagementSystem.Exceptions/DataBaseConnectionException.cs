using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.Exceptions
{
    public class DataBaseConnectionException : System.Exception
    {
        public DataBaseConnectionException() : base() { }
        public DataBaseConnectionException(string message) : base() { }
        public DataBaseConnectionException(string message, System.Exception innerException) : base(message, innerException) { }

    }
}

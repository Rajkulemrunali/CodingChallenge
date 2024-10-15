using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CodingChallenge.Exceptions 
{
    public class PolicyNotFoundException : System.Exception
    {
        public PolicyNotFoundException() : base() { }
        public PolicyNotFoundException(string message) : base() { }
        public PolicyNotFoundException(string message, System.Exception innerException) : base(message, innerException) { }

    }
}

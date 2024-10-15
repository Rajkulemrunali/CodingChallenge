using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.Entity
{
    public class Payment
    {
        public int paymentId { get; set; }
        public DateTime paymentDate { get; set; }
        public decimal paymentAmount { get; set; }
        public int clientId { get; set; }
       
    }
}

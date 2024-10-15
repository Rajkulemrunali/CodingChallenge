using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.Entity
{
    public class Policy
    {
        public int policyId {  get; set; }
        public int userId { get; set; }
        public int clientId { get; set; }
        public int claimId { get; set; }
        public int paymentId { get; set; }

        public User user { get; set; }
        public Client client { get; set; }
        public Claim claim { get; set; }
        public Payment payment { get; set; }
    }
}

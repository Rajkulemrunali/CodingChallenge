using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CodingChallenge.Entity;

namespace CodingChallenge.BusinessLayer.Service
{
    public interface IPolicyService
    {
        //declaring method signature
        bool createPolicy(Policy policy);
        Policy getPolicy(int policyId);
        List<Policy> getAllPolicy();
        bool updatePolicy(Policy policy, int policyId);
        bool deletePolicy(int policyId);
    }
}

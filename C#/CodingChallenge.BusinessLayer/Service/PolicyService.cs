using CodingChallenge.BusinessLayer.Repository;
using CodingChallenge.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodingChallenge.BusinessLayer.Service
{
    public class PolicyService : IPolicyService
    {
        IPolicyRepository _policyRepository;

        public PolicyService(PolicyRepository policyRepository)
        {
            _policyRepository = policyRepository;
        }
        public bool createPolicy(Policy policy)
        {
             return _policyRepository.createPolicy(policy);
        }
        public Policy getPolicy(int policyId)
        {
            return _policyRepository.getPolicy(policyId);
        }
        public List<Policy> getAllPolicy()
        {
            return _policyRepository.getAllPolicy();
        }
        public bool updatePolicy(Policy policy, int policyId)
        {
            return _policyRepository.updatePolicy(policy,policyId);
        }
        public bool deletePolicy(int policyId)
        {
            return _policyRepository.deletePolicy(policyId);
        }
    }
}

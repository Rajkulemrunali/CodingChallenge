using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CodingChallenge.DataAccessLayer;
using CodingChallenge.BusinessLayer.Repository;
using CodingChallenge.BusinessLayer.Service;
using CodingChallenge.Entity;
using CodingChallenge.Exceptions;

namespace CodingChallenge.UI
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Testing the Connection
            /*
            try
            {
                SqlConnection conn = DBUtil.GetDBConnection();
                conn.Open();
                Console.WriteLine("Database Connected SuccessFully");
                conn.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
            */

            PolicyRepository policyRepository = new PolicyRepository();
            PolicyService policyService = new PolicyService(policyRepository);


            Console.WriteLine("      -- Insurance Mangement System --");
            Console.WriteLine("");

            bool exit = false; //  to control the loop

            while (!exit)
            {
                Console.WriteLine("Main menu");
                Console.WriteLine("1. Create New Policy");
                Console.WriteLine("2. Get Policy By Id");
                Console.WriteLine("3. Get All Policies");
                Console.WriteLine("4. Update Policy");
                Console.WriteLine("5. Delete Policy");
                Console.WriteLine("6. EXIT");

                Console.WriteLine("Enter Your Choice");
                int ch = Convert.ToInt32(Console.ReadLine());

                switch (ch)
                {
                    case 1:
                        Console.Write("Enter User Id : ");
                        int uid = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter Client Id : ");
                        int clntid = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter Claim Id : ");
                        int clmid = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter Payment Id : ");
                        int pid = Convert.ToInt32(Console.ReadLine());
                        Policy newPolicy = new Policy()
                        {
                            userId = uid,
                            claimId = clntid,
                            clientId = clmid,
                            paymentId = pid
                        };

                        bool isCreated = policyService.createPolicy(newPolicy);

                        if (isCreated)
                        {
                            Console.WriteLine("Policy created successfully.");
                        }
                        else
                        {
                            Console.WriteLine("Failed to create policy.");
                        }
                        break;

                    case 2:
                        Console.WriteLine("Enter Policy ID: ");
                        int policyId = Convert.ToInt32(Console.ReadLine());
                        Policy policy = policyService.getPolicy(policyId);

                        if (policy != null)
                        {
                            Console.WriteLine($"Policy Id : {policy.policyId}");
                            Console.WriteLine("----User Details:");
                            Console.WriteLine($"User Id : {policy.userId}");
                            // Display related User details
                            Console.WriteLine($"User Name: {policy.user.userName}");
                            Console.WriteLine($"Role: {policy.user.role}");

                            // Display related Client details
                            Console.WriteLine("----Client Details:");
                            Console.WriteLine($"Client Id : {policy.clientId}");
                            Console.WriteLine($"Client Name: {policy.client.clientName}");
                            Console.WriteLine($"Phone: {policy.client.contactInfoPhone}");

                            // Display related Claim details
                            Console.WriteLine("----Claim Details:");
                            Console.WriteLine($"Claim Id  : {policy.claimId}");
                            Console.WriteLine($"Claim Number: {policy.claim.claimNumber}");
                            Console.WriteLine($"Date Filed: {policy.claim.dateFiled}");
                            Console.WriteLine($"Claim Amount: {policy.claim.claimAmount}");
                            Console.WriteLine($"Status: {policy.claim.status}");

                            // Display related Payment details
                            Console.WriteLine("----Payment Details:");
                            Console.WriteLine($"Payment Id : {policy.paymentId}");
                            Console.WriteLine($"Payment Date: {policy.payment.paymentDate}");
                            Console.WriteLine($"Payment Amount: {policy.payment.paymentAmount}");

                        }
                        else
                        {
                            Console.WriteLine($"Policy with ID {policyId} not found.");
                        }
                        break;

                    case 3:
                        List<Policy> policies = policyService.getAllPolicy();

                        if (policies != null && policies.Count > 0)
                        {
                            foreach (Policy policie in policies)
                            {
                                Console.WriteLine("------------- Policy Details -------------");
                                Console.WriteLine($"Policy Id   : {policie.policyId}");
                                Console.WriteLine($"User Id     : {policie.userId}");
                                Console.WriteLine($"Client Id   : {policie.clientId}");
                                Console.WriteLine($"Claim Id    : {policie.claimId}");
                                Console.WriteLine($"Payment Id  : {policie.paymentId}");
                                Console.WriteLine("------------------------------------------\n");
                            }
                        }
                        else
                        {
                            Console.WriteLine("No policies found.");
                        }
                        break;

                    case 4:
                        Console.WriteLine("Enter Policy ID to update: ");
                        int policyIdToUpdate = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter New  User Id : ");
                        int n_uid = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter New Client Id : ");
                        int n_clntid = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter New Claim Id : ");
                        int n_clmid = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter New Payment Id : ");
                        int n_pid = Convert.ToInt32(Console.ReadLine());

                        Policy updatedPolicy = new Policy()
                        {
                            userId = n_uid,
                            claimId = n_clntid,
                            clientId = n_clmid,
                            paymentId = n_pid
                        };

                        bool isUpdated = policyService.updatePolicy(updatedPolicy, policyIdToUpdate);

                        if (isUpdated)
                        {
                            Console.WriteLine("Policy updated successfully.");
                        }
                        else
                        {
                            Console.WriteLine("Failed to update policy.");
                        }
                        break;

                    case 5:
                        Console.WriteLine("Enter Policy ID to delete: ");
                        int policyIdToDelete = Convert.ToInt32(Console.ReadLine());

                        bool isDeleted = policyService.deletePolicy(policyIdToDelete);

                        if (isDeleted)
                        {
                            Console.WriteLine("Policy deleted successfully.");
                        }
                        else
                        {
                            Console.WriteLine("Failed to delete policy.");
                        }
                        break;

                    case 6:
                        exit = true; // true to break out of the loop
                        Console.WriteLine("Exiting program...");
                        break;

                    default:
                        Console.WriteLine("Invalid choice, please try again.");
                        break;
                }

                // Adding a small delay for user experience
                Console.WriteLine("Press Enter to continue...");
                Console.ReadLine(); // Pause the screen  before showing the menu again
            }

            Console.ReadKey();
        }
    }
}

using InsuranceManagementSystem.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InsuranceManagementSystem.DataAccessLayer;
using System.Data.SqlClient;
using InsuranceManagementSystem.Exceptions;

namespace InsuranceManagementSystem.BusinessLayer.Repository
{
    public class PolicyRepository : IPolicyRepository
    {
        public bool createPolicy(Policy policy)
        {
            SqlConnection conn = null;
            conn = DBUtil.GetDBConnection();

            try
            {
                if (conn == null)
                {
                    throw new DataBaseConnectionException("Database Connection Failed");
                }

                conn.Open();

                // SQL command to insert a new policy
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"INSERT INTO Policy (userId, claimId, clientId, paymentId) 
                            VALUES (@userId, @claimId, @clientId, @paymentId)";

                cmd.Parameters.AddWithValue("@userId", policy.userId);
                cmd.Parameters.AddWithValue("@claimId", policy.claimId);
                cmd.Parameters.AddWithValue("@clientId", policy.clientId);
                cmd.Parameters.AddWithValue("@paymentId", policy.paymentId);

                cmd.Connection = conn;

                // Execute the command and check if any rows were affected
                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0; // Returns true if at least one row was inserted
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Error: " + Ex.Message);
                return false; // Return false if there was an error
            }
            finally
            {
                conn.Close(); // Ensure the connection is closed
            }
        }

        public Policy getPolicy(int policyId)
        {
            SqlConnection conn = null;
            conn = DBUtil.GetDBConnection();

            try
            {
                if (conn == null)
                {
                    throw new DataBaseConnectionException("Database Connection Failed ");
                }
            }
            catch (DataBaseConnectionException Ex)
            {
                Console.WriteLine("Database Connection Failed! " + Ex.Message);
                return null;
            }

            try
            {
                Policy policy = null;
                conn.Open();

                // First, get the policy data from the Policy table
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"SELECT * FROM Policy WHERE policyId=@policyId";
                cmd.Parameters.AddWithValue("@policyId", policyId);
                cmd.Connection = conn;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                if (sqlDataReader.Read())
                {
                    policy = new Policy()
                    {
                        policyId = policyId,
                        userId = Convert.ToInt32(sqlDataReader["userId"]),
                        claimId = Convert.ToInt32(sqlDataReader["claimId"]),
                        clientId = Convert.ToInt32(sqlDataReader["clientId"]),
                        paymentId = Convert.ToInt32(sqlDataReader["paymentId"])
                    };
                }
                sqlDataReader.Close();

                // Load related User, Client, Claim, Payment details based on IDs
                if (policy != null)
                {
                    // Get User details
                    cmd.CommandText = @"SELECT * FROM [User] WHERE userId=@userId";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@userId", policy.userId);
                    sqlDataReader = cmd.ExecuteReader();
                    if (sqlDataReader.Read())
                    {
                        policy.user = new User()
                        {
                            userId = Convert.ToInt32(sqlDataReader["userId"]),
                            userName = sqlDataReader["userName"].ToString(),
                            password = Convert.ToInt32(sqlDataReader["password"]),
                            role = sqlDataReader["role"].ToString()
                        };
                    }
                    sqlDataReader.Close();

                    // Get Client details
                    cmd.CommandText = @"SELECT * FROM Client WHERE clientId=@clientId";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@clientId", policy.clientId);
                    sqlDataReader = cmd.ExecuteReader();
                    if (sqlDataReader.Read())
                    {
                        policy.client = new Client()
                        {
                            clientId = Convert.ToInt32(sqlDataReader["clientId"]),
                            clientName = sqlDataReader["clientName"].ToString(),
                            contactInfoPhone = Convert.ToInt64(sqlDataReader["contactInfoPhone"]),
                            policyId = Convert.ToInt32(sqlDataReader["policyId"])
                        };
                    }
                    sqlDataReader.Close();

                    // Get Claim details
                    cmd.CommandText = @"SELECT * FROM Claim WHERE claimId=@claimId";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@claimId", policy.claimId);
                    sqlDataReader = cmd.ExecuteReader();
                    if (sqlDataReader.Read())
                    {
                        policy.claim = new Claim()
                        {
                            claimId = Convert.ToInt32(sqlDataReader["claimId"]),
                            claimNumber = Convert.ToInt64(sqlDataReader["claimNumber"]),
                            dateFiled = Convert.ToDateTime(sqlDataReader["dateFiled"]),
                            claimAmount = Convert.ToDecimal(sqlDataReader["claimAmount"]),
                            status = sqlDataReader["status"].ToString(),
                            policyId = Convert.ToInt32(sqlDataReader["policyId"]),
                            clientId = Convert.ToInt32(sqlDataReader["clientId"])
                        };
                    }
                    sqlDataReader.Close();

                    // Get Payment details
                    cmd.CommandText = @"SELECT * FROM Payment WHERE paymentId=@paymentId";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@paymentId", policy.paymentId);
                    sqlDataReader = cmd.ExecuteReader();
                    if (sqlDataReader.Read())
                    {
                        policy.payment = new Payment()
                        {
                            paymentId = Convert.ToInt32(sqlDataReader["paymentId"]),
                            paymentDate = Convert.ToDateTime(sqlDataReader["paymentDate"]),
                            paymentAmount = Convert.ToDecimal(sqlDataReader["paymentAmount"]),
                            clientId = Convert.ToInt32(sqlDataReader["clientId"])
                        };
                    }
                    sqlDataReader.Close();
                }

                return policy;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }

            return null;
        }



        /*public Policy getPolicy(int policyId)
        {
            SqlConnection conn=null;
            conn=DBUtil.GetDBConnection();

            try
            {
                if (conn == null)
                {
                    throw new DataBaseConnectionException("DataBase Connection Failed ");
                }
            }
            catch(DataBaseConnectionException Ex)
            {
                Console.WriteLine("Database Connection Failed! "+Ex.Message);
                return null;
            }

            try
            {
                Policy policy = null;
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"Select * From Policy Where policyId=@policyId";
                cmd.Parameters.AddWithValue("@policyId", policyId);

                cmd.Connection = conn;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                if (sqlDataReader.Read())
                {
                    policy = new Policy()
                    {
                        policyId = policyId,
                        userId = Convert.ToInt32(sqlDataReader["userId"]),
                        claimId = Convert.ToInt32(sqlDataReader["claimId"]),
                        clientId = Convert.ToInt32(sqlDataReader["clientId"]),
                        paymentId = Convert.ToInt32(sqlDataReader["paymentId"]),
                    };

                    return policy;
                }
                else
                {
                    throw new PolicyNotFoundException($"Policy with ID {policyId} was not found.");
                }
            }
            catch (PolicyNotFoundException Ex)
            {
                Console.WriteLine(Ex.Message);
            }
            finally
            {
                conn.Close();
            }

            return null;
        }
        */

        public List<Policy> getAllPolicy()
        {
            SqlConnection conn = null;
            conn = DBUtil.GetDBConnection();

            try
            {
                if (conn == null)
                {
                    throw new DataBaseConnectionException("Database Connection Failed");
                }
            }
            catch (DataBaseConnectionException Ex)
            {
                Console.WriteLine("Database Connection Failed! " + Ex.Message);
                return null;
            }

            List<Policy> policies = new List<Policy>();

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT * FROM Policy";
                cmd.Connection = conn;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    Policy policy = new Policy()
                    {
                        policyId = Convert.ToInt32(sqlDataReader["policyId"]),
                        userId = Convert.ToInt32(sqlDataReader["userId"]),
                        claimId = Convert.ToInt32(sqlDataReader["claimId"]),
                        clientId = Convert.ToInt32(sqlDataReader["clientId"]),
                        paymentId = Convert.ToInt32(sqlDataReader["paymentId"])
                    };

                    policies.Add(policy);
                }
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Error: " + Ex.Message);
            }
            finally
            {
                conn.Close();
            }

            return policies;
        }

        public bool updatePolicy(Policy policy, int policyId)
        {
            SqlConnection conn = null;
            conn = DBUtil.GetDBConnection();

            try
            {
                if (conn == null)
                {
                    throw new DataBaseConnectionException("Database Connection Failed");
                }

                conn.Open();

                // SQL command to update the policy
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"UPDATE Policy 
                            SET userId = @userId, 
                                claimId = @claimId, 
                                clientId = @clientId, 
                                paymentId = @paymentId 
                            WHERE policyId = @policyId";

                // Adding parameters
                cmd.Parameters.AddWithValue("@userId", policy.userId);
                cmd.Parameters.AddWithValue("@claimId", policy.claimId);
                cmd.Parameters.AddWithValue("@clientId", policy.clientId);
                cmd.Parameters.AddWithValue("@paymentId", policy.paymentId);
                cmd.Parameters.AddWithValue("@policyId", policyId);

                cmd.Connection = conn;

                // Execute the command and check if any rows were affected
                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0; // Returns true if at least one row was updated
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Error: " + Ex.Message);
                return false; // Return false if there was an error
            }
            finally
            {
                conn.Close(); // Ensure the connection is closed
            }
        }

        public bool deletePolicy(int policyId)
        {
            SqlConnection conn = null;
            conn = DBUtil.GetDBConnection();

            try
            {
                if (conn == null)
                {
                    throw new DataBaseConnectionException("Database Connection Failed");
                }

                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "DELETE FROM Policy WHERE policyId = @policyId";

                cmd.Parameters.AddWithValue("@policyId", policyId);
                cmd.Connection = conn;

                // Execute the command and check if any rows were affected
                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0; // Returns true if at least one row was deleted
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Error: " + Ex.Message);
                return false; // Return false if there was an error
            }
            finally
            {
                conn.Close(); 
            }
        }

    }
}

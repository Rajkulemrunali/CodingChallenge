using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace InsuranceManagementSystem.DataAccessLayer
{
    public class DBUtil
    {
        public static SqlConnection GetDBConnection()
        {
            try
            {
                SqlConnection conn;
                conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["CodingChallengeConnection"].ConnectionString;
                return conn;
            }
            catch(SqlException ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }
    }
}

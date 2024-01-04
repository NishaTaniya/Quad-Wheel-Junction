using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;


namespace Data_Layer
{
    public class DataClass
    {
        string conn = ConfigurationManager.ConnectionStrings["QuadDatabase"].ConnectionString;

        //Registration
        public void registerCustomer(String user,String name,String email,String phone,String location,String password)
        {
            IUDQuery("INSERT INTO Customer VALUES('" + user + "','" + name + "','" + email + "','" + phone + "','" + location + "','"+ password +"')");
        }

        public int registerDriver(String user,String name,String email,String phone,String location,String exp,String lc,String password)
        {
            IUDQuery("INSERT INTO Driver VALUES('" + user + "','" + name + "','" + email + "','" + phone + "','" + location + "','" + exp + "','" + lc + "','" + password + "',0,0)");
            SqlConnection objConn = new SqlConnection(conn);
            String sqlQuery = "select driverId from Driver where username='" + user + "'";
            SqlCommand objComm = new SqlCommand(sqlQuery, objConn);
            objConn.Open();
            int id = (Int32)objComm.ExecuteScalar();
            objComm.Dispose();
            objConn.Close();
            return id;
        }

        public void addCar(String name,String model,String seats,String rates,int driverId) 
        {
            float rate = float.Parse(rates);
            IUDQuery("INSERT INTO Car VALUES('" + name + "','" + model + "','" + seats + "'," + rates + "," + driverId+")");
        }

        public void IUDQuery(string sqlString)
        {
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            SqlCommand objComm = new SqlCommand(sqlString, objConn);
            objComm.ExecuteNonQuery();
            //Console.WriteLine("\n New User added Successfully...");
            objComm.Dispose();
            objConn.Close();
        }


        public bool validate(String type,String category,String str)
        {
            bool flag = true;
            SqlConnection objConn = new SqlConnection(conn);

            if(type.Equals("Email"))
            {
                objConn.Open();
                SqlCommand objComm = new SqlCommand("SELECT emailId from " + category, objConn);
                SqlDataReader data = objComm.ExecuteReader();

                while (data.Read())
                {
                    if (str.Equals(data.GetValue(0)))
                    {
                        flag = false;
                    }
                }

                data.Close();
                objComm.Dispose();
                objConn.Close();
            }

            else if(type.Equals("Username"))
            {
                objConn.Open();
                SqlCommand objComm = new SqlCommand("SELECT username from " + category,objConn);
                SqlDataReader data = objComm.ExecuteReader();

                while (data.Read())
                {
                    if (str.Equals(data.GetValue(0)))
                    {
                        flag = false;
                    }
                }

                data.Close();
                objComm.Dispose();
                objConn.Close();
            }

            return flag;
        }
        
        //Login
        public int getUserId(String category,String username)
        {
            int id = 0;
            SqlConnection objConn = new SqlConnection(conn);
            String sqlQuery="";
            if (category.Equals("Driver"))
                sqlQuery = "select driverId from Driver where username='" + username + "'";
            else if (category.Equals("Customer"))
                sqlQuery = "select CustomerId from Customer where username='" + username + "'";
            SqlCommand objComm = new SqlCommand(sqlQuery, objConn);
            objConn.Open();
            id = (Int32)objComm.ExecuteScalar();
            objComm.Dispose();
            objConn.Close();

            return id;
        }

        public bool authenticateUser(String user,String password,String category)
        {
            bool valid = false;
            SqlConnection objConn = new SqlConnection(conn);

            if(!category.Equals("Admin"))
            {
                SqlCommand objComm = new SqlCommand("SELECT username,password from " + category, objConn);
                objConn.Open();
                SqlDataReader data = objComm.ExecuteReader();

                while (data.Read())
                {
                    if (user.Equals(data.GetValue(0)) && password.Equals(data.GetValue(1)))
                    {
                        valid = true;
                    }
                }

                data.Close();
                objComm.Dispose();
                objConn.Close();
            }

            else
            {
                SqlCommand objComm = new SqlCommand("SELECT username,password from Customer where CustomerId=1", objConn);
                objConn.Open();
                SqlDataReader data = objComm.ExecuteReader();

                data.Read();
                if (user.Equals(data.GetValue(0)) && password.Equals(data.GetValue(1)))
                {
                    valid = true;
                }

                data.Close();
                objComm.Dispose();
                objConn.Close();
            }
            
            return valid;
        }
        
        //Forgot password
        public bool sendData(String category,String emailId)
        {
            SqlConnection objConn = new SqlConnection(conn);
            string queryStr="";
            if (category.Equals("Customer"))
                queryStr = "SELECT username,password FROM Customer WHERE emailId = '" + emailId + "'";
            else  if (category.Equals("Driver"))
                queryStr = "SELECT username,password FROM Driver WHERE emailId = '" + emailId + "'";
            SqlCommand objComm = new SqlCommand();
            objComm.Connection = objConn;
            objComm.CommandType = CommandType.Text;
            objComm.CommandText = queryStr;


            DataSet result = new DataSet();
            objConn.Open();
            SqlDataAdapter rsAdap = new SqlDataAdapter(objComm);
            rsAdap.Fill(result);
            objConn.Close();

            if (result.Tables[0].Rows.Count > 0)
            {
                MailMessage loginInfo = new MailMessage();
                loginInfo.To.Add(emailId);
                loginInfo.From = new MailAddress("interiorDesign2105@gmail.com");
                loginInfo.Subject = "Forgot Password Information";
                loginInfo.Body = "Username: " + result.Tables[0].Rows[0]["Username"] + "<br><br>Password: " + result.Tables[0].Rows[0]["Password"] + "<br><br>";
                loginInfo.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Credentials = new System.Net.NetworkCredential("interiorDesign2105@gmail.com", "int@0701");
                smtp.Send(loginInfo);

                return true;
            }
            else
            {
                return false;
            }

        }

        // Show Driver Profile

        public void showDriverProfile(int id,DataList driverList,GridView carList)
        {
            SqlConnection objConn = new SqlConnection(conn);
            SqlCommand objComm = new SqlCommand("SELECT name,emailId,phoneNo,location,experience,licenceNo,status,rating from Driver where driverId=" + id, objConn);
            objConn.Open();
            objComm.ExecuteNonQuery();
            DataSet dt = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(objComm);
            sda.Fill(dt);
            driverList.DataSource = dt;
            driverList.DataBind();
            sda.Dispose();

            objComm = new SqlCommand("Select name,model,seats,rates from Car where driverId=" + id,objConn);
            objComm.ExecuteNonQuery();
            DataSet dtcar = new DataSet();
            SqlDataAdapter sd = new SqlDataAdapter(objComm);
            sd.Fill(dtcar);
            carList.DataSource = dtcar;
            carList.DataBind();

            sd.Dispose();
            objComm.Dispose();
            objConn.Close();
        }
        
        //My Profile
        public List<String> getCustomer(int id)
        {
            SqlConnection objConn = new SqlConnection(conn);
            SqlCommand objComm = new SqlCommand("SELECT name,emailId,phoneNo,location from Customer where CustomerId=" + id, objConn);
            objConn.Open();
            SqlDataReader sdr = objComm.ExecuteReader();
            sdr.Read();

            List<String> result = new List<String>();
            result.Add(sdr.GetString(0));
            result.Add(sdr.GetString(1));
            result.Add(sdr.GetString(2));
            result.Add(sdr.GetString(3));

            objComm.Dispose();
            objConn.Close();
            return result;
        }

        public List<String> getDriver(int id,GridView Car)
        {
            SqlConnection objConn = new SqlConnection(conn);
            SqlCommand objComm = new SqlCommand("SELECT name,emailId,phoneNo,location,experience,licenceNo,rating,Status from Driver where driverId=" + id, objConn);
            objConn.Open();
            SqlDataReader sdr = objComm.ExecuteReader();
            sdr.Read();

            List<String> result = new List<String>();
            result.Add(sdr.GetString(0));
            result.Add(sdr.GetString(1));
            result.Add(sdr.GetString(2));
            result.Add(sdr.GetString(3));
            result.Add(sdr.GetString(4));
            result.Add(sdr.GetString(5));

            String rate = Convert.ToString(sdr.GetValue(6));
            result.Add(rate);
            result.Add(sdr.GetBoolean(7).ToString());

            sdr.Close();
            objComm = new SqlCommand("SELECT carId,name,model,seats,rates from Car where driverId=" + id, objConn);
            SqlDataAdapter sda = new SqlDataAdapter(objComm);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            Car.DataSource = ds;
            Car.DataBind();

            objComm.Dispose();
            objConn.Close();
            return result;
        }
        

        //Driver Filter 
        public void filter(String category,String value,DataList dl)
        {
            value = value.ToLower();
            SqlConnection objConn = new SqlConnection(conn);
            SqlCommand objComm = objConn.CreateCommand();
            objComm.CommandType = CommandType.Text;
            objConn.Open();

            if (category.Equals("Location"))
            {
                objComm.CommandText = "Select driverId,username,phoneNo,emailId,status,rating from Driver where lower(location) LIKE '%" + value + "%'";    
            }

            else if (category.Equals("Rate"))
            {
                
                 objComm.CommandText = "Select DISTINCT d.driverId,d.username,d.phoneNo,d.emailId,d.status,d.rating from Driver d,Car c where d.driverId=c.driverId and c.rates<=" + float.Parse(value);   
            }

            else if (category.Equals("Car"))
            { 
               objComm.CommandText = "Select DISTINCT d.driverId,d.username,d.phoneNo,d.emailId,d.status,d.rating from Driver d,Car c where d.driverId=c.driverId and c.name='" + value +"'";      
            }

            else if (category.Equals("Driver"))
            {
                objComm.CommandText = "Select driverId,username,phoneNo,emailId,status,rating from Driver where lower(name) LIKE '%" + value + "%' or lower(username) LIKE '%" + value + "%'";
                
            }

            objComm.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(objComm);
            sda.Fill(dt);
            
            dl.DataSource = dt;
            dl.DataBind();
            objComm.Dispose();
            objConn.Close();
        }

        // Update Profile
        public void updateCustomerProfile(int id,String name,String email,String phone,String location)
        {
            IUDQuery("update Customer set name='"+ name + "',emailId='" + email + "',phoneNo='" + phone + "',location='" + location + "' where CustomerId=" + id);
        }

        public void updateDriverProfile(int id,String name,String email , String phone, String location, String expr, Boolean status)
        {
            if(status==false)
            IUDQuery("update Driver set name='"+ name +"',emailId='"+ email +"',phoneNo='" + phone + "',location='" + location + "',experience='"+ expr +"',status=0  where driverId=" + id);
            else
            IUDQuery("update Driver set name='" + name + "',emailId='" + email + "',phoneNo='" + phone + "',location='" + location + "',experience='" + expr + "',status=1  where driverId=" + id);
        }

        public void updateCarRate(int id,string value)
        {
            float rate = float.Parse(value);
            IUDQuery("update Car set rates=" + rate+" where carId="+id);
        }

        public void deleteCar(int id)
        {
            IUDQuery("delete from Car where carId=" + id);
        }

        public bool isExistEmail(String category, String str,int id)
        {
            bool flag = true;
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            SqlCommand objComm=null;

            if (category.Equals("Customer"))
                objComm = new SqlCommand("SELECT emailId from Customer where CustomerId="+id, objConn);
            else if(category.Equals("Driver"))
                objComm = new SqlCommand("SELECT emailId from Driver where driverId="+id, objConn);

            String userEmail = objComm.ExecuteScalar().ToString();

            objComm = new SqlCommand("SELECT emailId from " + category, objConn);
                SqlDataReader data = objComm.ExecuteReader();

                while (data.Read())
                {
                    if (!str.Equals(userEmail) && str.Equals(data.GetValue(0)))
                    {
                        flag = false;
                    }
                }

                data.Close();
                objComm.Dispose();
                objConn.Close();

            return flag;
        }

        // Admin section
        public void getCustomerDetails(GridView g1)
        {
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            String querystr = "";
            querystr = "SELECT CustomerId,username,name,emailId,phoneNo,location FROM Customer where CustomerId!=1";
            SqlCommand cmd = objConn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = querystr;
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Action", typeof(string)) });
            g1.DataSource = dt;
            g1.DataBind();
            cmd.Dispose();
            objConn.Close();

        }
        public void getCarDetails(GridView g1)
        {
            IUDQuery("delete from Car where driverId is NULL");
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            String querystr = "";
            querystr = "SELECT c.*,d.name FROM Car c,Driver d where d.driverId=c.driverId";
            SqlCommand cmd = objConn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = querystr;
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            g1.DataSource = dt;
            g1.DataBind();
            cmd.Dispose();
            objConn.Close();
        }

        public void getDriverDetails(GridView g1)
        {
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            String querystr = "";
            querystr = "SELECT driverId,username,name,emailId,phoneNo,location,experience,licenceNo,status FROM Driver";
            SqlCommand cmd = objConn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = querystr;
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Action", typeof(string)) });
            g1.DataSource = dt;
            g1.DataBind();
            cmd.Dispose();
            objConn.Close();

        }

        public void deleteRecord(int id)
        {
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            String querystr = "";
            querystr = "DELETE from Driver where driverId=" + id;
            SqlCommand cmd = objConn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = querystr;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            objConn.Close();

            IUDQuery("delete from Comment where userType=1 and userId="+id);
        }

        public void deleteCustomerRecord(int id)
        {
            
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            String querystr = "";
            querystr = "DELETE from Customer where CustomerId=" + id;
            SqlCommand cmd = objConn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = querystr;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            objConn.Close();

            IUDQuery("delete from Post where CustomerId is NULL");
            IUDQuery("delete from Comment where postId is NULL");
        }

        // Post
        public void createPost(int id, String source, String destination, int member, float budget, String car, String description)
        {
            IUDQuery("insert into Post values(" + id + "," + member + ",'" + car + "','" + source + "','" + destination + "'," + budget + ",'" + description + "',NULL)");
        }

        public void showCustomerPost(int id,DataList dl)
        {
            SqlConnection objConn = new SqlConnection(conn);
            SqlCommand objComm = new SqlCommand("SELECT p.postId,c.name,p.source,p.destination,p.member,p.budget,p.car,p.description,p.finalizeDriver from Customer c,Post p where c.CustomerId=p.CustomerId and p.CustomerId=" + id, objConn);
            objConn.Open();
            objComm.ExecuteNonQuery();
            DataSet dt = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(objComm);
            sda.Fill(dt);
            dl.DataSource = dt;
            dl.DataBind();

            sda.Dispose();
            objComm.Dispose();
            objConn.Close();
        }

        public void showAllCustomerPost(DataList dl)
        {
            SqlConnection objConn = new SqlConnection(conn);
            SqlCommand objComm = new SqlCommand("SELECT p.postId,c.name,p.source,p.destination,p.member,p.budget,p.car,p.description,p.finalizeDriver from Customer c,Post p where c.CustomerId=p.CustomerId", objConn);
            objConn.Open();
            objComm.ExecuteNonQuery();
            DataSet dt = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(objComm);
            sda.Fill(dt);
            dl.DataSource = dt;
            dl.DataBind();

            sda.Dispose();
            objComm.Dispose();
            objConn.Close();
        }

        public void deletePost(int id)
        {
            IUDQuery("delete from Comment where postId=" + id);
            IUDQuery("delete from Post where postId=" + id);
        }

       
        // Comment Section

        public void createComment(int postId,int userId,String category,String cmtdata)
        {
            if(category.Equals("Customer"))
            {
                String name = "";
                SqlConnection objConn = new SqlConnection(conn);
                SqlCommand objComm = new SqlCommand("select username from Customer where CustomerId="+userId, objConn);
                objConn.Open();
                name = objComm.ExecuteScalar().ToString();
                objComm.Dispose();
                objConn.Close();
                IUDQuery("insert into Comment values(" + postId + "," + userId + ",'" + cmtdata + "','"+name+"',0)");
            }

            else if(category.Equals("Driver"))
            {
                String name = "";
                SqlConnection objConn = new SqlConnection(conn);
                SqlCommand objComm = new SqlCommand("select username from Driver where driverId=" + userId, objConn);
                objConn.Open();
                name = objComm.ExecuteScalar().ToString();
                objComm.Dispose();
                objConn.Close();
                IUDQuery("insert into Comment values(" + postId + "," + userId + ",'" + cmtdata + "','" + name + "',1)");
            }
        }

        public void showComments(int postId,DataList dl)
        {
            SqlConnection objConn = new SqlConnection(conn);
            SqlCommand objComm = new SqlCommand("SELECT userId,username,commentData,userType from Comment where postId="+postId+" order by commentId", objConn);
            objConn.Open();
            objComm.ExecuteNonQuery();
            DataSet dt = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(objComm);
            sda.Fill(dt);
            dl.DataSource = dt;
            dl.DataBind();

            sda.Dispose();
            objComm.Dispose();
            objConn.Close();
        }

        public void finalizeDeal(int postId,String driverUsername)
        {
            IUDQuery("delete from Comment where postId=" + postId);
            IUDQuery("update Post set finalizeDriver='" + driverUsername + "' where postId=" + postId);

            int customerId = 0;
            SqlConnection objConn = new SqlConnection(conn);
            SqlCommand objComm = new SqlCommand("select CustomerId from Post where postId="+postId, objConn);
            objConn.Open();
            customerId = (Int32)objComm.ExecuteScalar();
            objComm.Dispose();
            objConn.Close();

            int driverId = getUserId("Driver", driverUsername);

            IUDQuery("insert into FinalizeDriver values("+customerId+","+driverId+")");
        }


        //Tracking location 
        public void changeLocation(int id,String Category,String location)
        {
            if (Category.Equals("Customer"))
                IUDQuery("update Customer set location='" + location + "' where CustomerId=" + id);
            else if (Category.Equals("Driver"))
                IUDQuery("update Driver set location='" + location + "' where driverId=" + id);
        }

        // Review

        public void getDetailsForReview(GridView reviewGridView)
        {
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            String querystr = "";
            querystr = "SELECT driverId,username,name FROM Driver";
            SqlCommand cmd = objConn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = querystr;
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);

            reviewGridView.DataSource = dt;
            reviewGridView.DataBind();
            cmd.Dispose();
            objConn.Close();
        }

        public void updateRate(int driverId,float rating)
        {
            SqlConnection objConn = new SqlConnection(conn);
            String sqlQuery = "select rating from Driver where driverId="+driverId; ;
            
            SqlCommand objComm = new SqlCommand(sqlQuery, objConn);
            objConn.Open();
            float rate = float.Parse(objComm.ExecuteScalar().ToString());
            objComm.Dispose();
            objConn.Close();

            if(rate!=0)
            {
                rating = (rating + rate) / 2;
                rating = (float)Math.Round(rating, 1);
                IUDQuery("update Driver set rating=" + rating+" where driverId="+driverId);
            }

            else
            {
                IUDQuery("update Driver set rating=" + rating+" where driverId="+driverId);
            }
        }


        // Report 

        public void reportData(GridView rate,GridView finalize)
        {
            IUDQuery("delete from FinalizeDriver where CustomerId is NULL or driverId is NULL");
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            SqlCommand cmd = objConn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select TOP 10 driverId,username,Name,rating from Driver ORDER BY rating desc;";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Visit", typeof(string)) });
            rate.DataSource = dt;
            rate.DataBind();

            cmd.CommandText = "select TOP 10 c.username,d.username,d.name from Customer c,Driver d,FinalizeDriver f where c.CustomerId=f.CustomerId and d.driverId=f.driverId ORDER BY f.Id desc;";
            cmd.ExecuteNonQuery();
            dt = new DataTable();
            sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Visit", typeof(string)) });
            finalize.DataSource = dt;
            finalize.DataBind();

            cmd.Dispose();
            objConn.Close();
        }
    }
}

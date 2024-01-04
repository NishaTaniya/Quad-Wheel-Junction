using Data_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Bussiness_Layer
{
    public class BussinessClass
    {
        private DataClass dc = new DataClass();

        //Register Customer
        public void bussRegisterCustomer(String user, String name, String email, String phone, String location, String password)
        {
            dc.registerCustomer(user, name, email, phone, location, password);
            //MessageBox.Show("Your Account is created successfully :) \n Happy Browsing...");  
        }

        //Register Driver

        public int bussRegisterDriver(String user, String name, String email, String phone, String location, String exp, String lc, String password)
        {
            int id = dc.registerDriver(user, name, email, phone, location, exp, lc, password);
            
            return id;
        }

        // Register car
        public void bussAddCar(String name, String model, String seats, String rates, int driverId)
        {
            dc.addCar(name, model, seats, rates, driverId);
            //MessageBox.Show("Your Car Details are added successfully :) \n Try adding more Cars or Try to Login...\n\n Happy Earning :)");
        }

        //validation
        public bool bussValidate(String type, String category, String str)
        {
            return dc.validate(type, category, str);
        }

        //Login
        public int bussGetUserId(String category, String username)
        {
            return dc.getUserId(category, username);
        }

        public bool bussAuthenticate(String user, String password, String category)
        {
            bool valid = dc.authenticateUser(user, password, category);

            //if (!valid)
            //  MessageBox.Show("Invalid username or password!!! :(");

            return valid;
        }

        public bool bussSendData(String category, String emailId)
        {
            if (dc.sendData(category, emailId))
                return true;
            else
                return false;
        }

        // My Profile
        public void bussShowDriverProfile(int id, DataList driver, GridView car)
        {
            dc.showDriverProfile(id, driver, car);
        }

        /*public void getDriverData(int id, DataList basic, DataList basicDriver, GridView car)
        {
            dc.getDriver(id, basic, basicDriver, car);
        }

        public void getCustomerData(int id, DataList basic) 
        {
            dc.getCustomer(id, basic);
        }*/
        public List<String> getCustomerData(int id)
        {
                return dc.getCustomer(id);  
        }

        public List<String> getDriverData(int id,GridView car)
        {
           return dc.getDriver(id,car);
        }


        //Filter
        public void bussFilter(String category,String value,DataList dl)
        {
            dc.filter(category, value, dl);
            if (dl.Items.Count == 0)
            {
                dl.DataSource = null;
                dl.DataBind();
            }
            
        }

        // Update Profile
        public void bussUpdateCustomerProfile(int id,String name,String email,String phone,String location)
        {
            dc.updateCustomerProfile(id, name,email, phone, location);
        }

        public void bussUpdateDriverProfile(int id, String name,String email, String phone, String location,String expr,Boolean status)
        {
            dc.updateDriverProfile(id, name, email, phone, location,expr,status);
        }

        public void bussUpdateCarRate(String id,String newRate)
        {
            dc.updateCarRate(Int32.Parse(id),newRate);
        }

        public void bussDeleteCar(String id)
        {
            dc.deleteCar(Int32.Parse(id));
        }

        public bool bussIsEmailExist(String category,String email,int id)
        {
            return dc.isExistEmail(category, email,id);
        }

        // Admin Section

        public void getCustomerDetail(GridView customerGridView)
        {
            dc.getCustomerDetails(customerGridView);
        }

        public void customerDeleteRecord(int id)
        {
            dc.deleteCustomerRecord(id);
        }

        public void getDriverDetail(GridView driverGridView)
        {
            dc.getDriverDetails(driverGridView);
        }

        public void bussdeleteRecord(int id)
        {
            dc.deleteRecord(id);
        }

        public void getCarDetail(GridView carGridView)
        {
            dc.getCarDetails(carGridView);
        }

        // post

        public void bussCreatePost(int id, String source, String destination, String member, String budget, String car, String description)
        {
            dc.createPost(id, source, destination, Int32.Parse(member), float.Parse(budget), car, description);
        }

        public void bussShowCustomerPost(int id,DataList dl)
        {
            if (id != 0)
                dc.showCustomerPost(id, dl);
            else
                dc.showAllCustomerPost(dl);
        }

        public void bussDeletePost(int id)
        {
            dc.deletePost(id);
        }

        //Comment Section 

        public void bussCreateComment(int postId,int userId,String category,String cmtData)
        {
            dc.createComment(postId, userId, category, cmtData);
        }

        public void bussShowComments(int postId,DataList dl)
        {
            dc.showComments(postId, dl);
        }

        public void bussFinalizeDriver(int postId,String driverUsername)
        {
            dc.finalizeDeal(postId, driverUsername);
        }

        // Tracking Location
        public void bussChangeLocation(int id,String category,String location) 
        {
            dc.changeLocation(id, category, location);
        }

        // Review Section

        public void bussGetDetailsForReview(GridView reviewGridview)
        {
            dc.getDetailsForReview(reviewGridview);
        }

        public void bussUpdateRate(int id,String rate)
        {
            dc.updateRate(id, float.Parse(rate));
        }


        // Report

        public void bussReportData(GridView rate,GridView finalize)
        {
            dc.reportData(rate, finalize);
        }
    }
}

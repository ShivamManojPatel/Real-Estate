using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace SelfCreationASP
{
    public partial class sell : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
            HttpContext.Current.Response.AddHeader("Expires", "0");

            if (Session["UserId"] == null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void hbtn_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=root;database=realestate");
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select Registration_Id from Registration_master where Email='" + Session["UserId"].ToString() + "'", con);
            MySqlDataReader dr = cmd.ExecuteReader();
            String uid = "";
            if (dr.Read())
            {
                uid = dr.GetValue(0).ToString();
            }

            dr.Close();
            string iname = "";
            string iadd = "";
            string ikitchen = "";
            string iparking = "";
            string iliving = "";
            string ibed = "";
            string ibath = "";
            string iprice = "";
            iname = hname.Text;
            iadd = haddress.Text;
            ikitchen = hkitchen.Text;
            iparking = hparking.Text;
            iliving = hliving.Text;
            ibed = hbed.Text;
            ibath = hbath.Text;
            iprice = hprice.Text;

            if (!iname.Equals("") && !iadd.Equals("") && !ikitchen.Equals("") && !iparking.Equals("") && !iliving.Equals("") && !ibed.Equals("") && !ibath.Equals("") && !iprice.Equals(""))
            {
                if ((file.PostedFile != null) && (file.PostedFile.ContentLength > 0))
                {
                    string FileName = System.IO.Path.GetFileName(file.FileName);
                    string location = @"C:\Users\Administrator\source\repos\SelfCreationASP\SelfCreationASP\Uploads\" + FileName;
                    //string location = @"Uploads\" + FileName;
                    file.PostedFile.SaveAs(location);
                    string slocation = "Uploads/"+FileName;
                    String query = "insert into house_details (House_Name, Customer_id, House_Address, Kitchen, Parking, Living_Room, Bed_Room, Wash_Room, Price, Photo, Status) values ('" + iname + "', '" + uid + "', '" + iadd + "', '" + ikitchen + "', '" + iparking + "', '" + iliving + "', '" + ibed + "', '" + ibath + "', '" + iprice + "', '"+slocation+"' , 'On Sell')";
                    cmd = new MySqlCommand(query, con);
                    int count = cmd.ExecuteNonQuery();

                    if(count > 0)
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Somethings wrong! please try again later')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('File upload failed')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Enter all the fields')</script>");
            }
        }
    }
}
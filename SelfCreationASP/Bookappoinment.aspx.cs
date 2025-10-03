using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace SelfCreationASP
{
    public partial class Bookappoinment : System.Web.UI.Page
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

        protected void Abtn_Click1(object sender, EventArgs e)
        {
            string hid = Request.QueryString["id"];
            string date = bdate.Text;
            string time = btime.Text;
            string add = baddress.Text;
            string cid = null;
            string oid = null;
            string query = "select Registration_Id from registration_master where Email='"+Session["UserId"].ToString()+"'";
            MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=root;database=realestate");
            con.Open();
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader dr = cmd.ExecuteReader();

            if(dr.Read())
            {
                cid = dr.GetValue(0).ToString();
            }

            dr.Close();

            string query2 = "select Customer_id from house_details where house_details.HouseId = '"+hid+"'";
            cmd = new MySqlCommand(query2, con);
            dr = cmd.ExecuteReader();

            if(dr.Read())
            {
                oid = dr.GetValue(0).ToString();
            }

            dr.Close();

            if(date != null && time != null && add != null && hid != null && cid != null && oid != null)
            {
                string query3 = "insert into meetings (Meeting_from, Meeting_with, HouseId, Meeting_date, Meeting_time, Meeting_Venue, Status) values ('"+cid+"', '"+oid+"', '"+hid+"', '"+date+"', '"+time+"', '"+add+"', 'upcoming')";
                cmd = new MySqlCommand(query3, con);
                int count = cmd.ExecuteNonQuery();

                if(count > 0)
                {
                    Response.Redirect("meeting.aspx");
                }
                else
                {
                    Response.Write("<script>alert('somethings wrong! please try again later')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Enter all the fields properly')</script>");
            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace SelfCreationASP
{
    public partial class editappoinment : System.Web.UI.Page
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

        protected void xbtn_Click(object sender, EventArgs e)
        {
            string date = "";
            string time = "";
            string add = "";

            date = xdate.Text;
            time = xtime.Text;
            add = xaddress.Text;
            string id = Request.QueryString["id"];
            MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=root;database=realestate");
            con.Open();
            string query = "update meetings set Meeting_date='" + date + "', Meeting_time='" + time + "', Meeting_venue='" + add + "' where Meeting_id='" + id + "'";
            MySqlCommand cmd = new MySqlCommand(query, con);
            int count = cmd.ExecuteNonQuery();

            if(count > 0)
            {
                Response.Redirect("meeting.aspx");
            }
        }
    }
}
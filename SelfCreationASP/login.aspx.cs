using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;
using System.Text;

namespace SelfCreationASP
{
    public partial class login : Page
    {

        MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=root;database=realestate");
        MySqlCommand cmd;
        MySqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            Lpass.Attributes["type"] = "password";
        }

        protected void Lbtn_Click(object sender, EventArgs e)
        {
            string id = "";
            string pass = "";
            id = Lid.Text.ToString();
            pass = Lpass.Text.ToString();
            //Response.Write(id);
            if (!id.Equals("") && !pass.Equals(""))
            {
                if (Valid(id))
                {
                    string qid = null;
                    string qpass = null;
                    con.Open();
                    String query = "select Email, Password from registration_master where Email='"+id+"'";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();

                    if(dr.Read())
                    {
                        qid = dr.GetValue(0).ToString();
                        qpass = dr.GetValue(1).ToString();
                    }

                    if(id.Equals(qid) && encryption(pass).Equals(qpass))
                    {
                        if(chbox.Checked)
                        {
                            HttpCookie myCookie = new HttpCookie("remme");
                            myCookie.Values["Username"] = id;
                            myCookie.Values["Password"] = pass;
                            myCookie.Expires = DateTime.Now.AddDays(30);
                            Response.Cookies.Add(myCookie);

                        }

                        Session["UserId"] = id;
                        Response.Redirect("Dashboard.aspx");
                        //Response.Write(id);
                    }
                    else
                    {
                        Response.Write("<script>alert('Incorrect Id or Password')</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Enter valid Email')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Id and Password')</script>");
            }
        }

        public bool Valid(String Id)
        {
            var valid = true;

            try
            {
                var email = new MailAddress(Id);
            }
            catch(Exception e)
            {
                valid = false;
            }

            return valid;
        }

        public string encryption(string password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            //We converted the data as a parameter to a byte array.
            byte[] array = Encoding.UTF8.GetBytes(password);
            //We have calculated the hash of the array.
            array = md5.ComputeHash(array);
            //We created a StringBuilder object to store hashed data.
            StringBuilder sb = new StringBuilder();
            //We have converted each byte from string into string type.

            foreach (byte ba in array)
            {
                sb.Append(ba.ToString("x2").ToLower());
            }

            //We returned the hexadecimal string.
            return sb.ToString();
        }
    }
}
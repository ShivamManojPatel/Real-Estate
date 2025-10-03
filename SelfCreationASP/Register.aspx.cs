using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace SelfCreationASP
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Rbtn_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=root;database=realestate");
            con.Open();
            string ifname = "";
            string ilname = "";
            string iemail = "";
            string icno = "";
            string igender = "";
            string ipass = "";
            string irpass = "";

            ifname = fname.Text;
            ilname = lname.Text;
            iemail = remail.Text;
            icno = cno.Text;
            igender = Gender.SelectedItem.Text;
            ipass = pass.Text;
            irpass = cpass.Text;

            if(!ifname.Equals("") && !ilname.Equals("") && !iemail.Equals("") && !icno.Equals("") && !igender.Equals("") && !ipass.Equals("") && !irpass.Equals(""))
            {
                if(ipass.Length >= 8)
                {
                    if(String.Equals(ipass, irpass))
                    {
                        //Response.Write("<script>alert('Enter valid contact no')</script>");
                        if(Valid(iemail))
                        {
                            if (icno.Length == 10)
                            {
                                string regex = "(0/91)?[0-9][0-9]{9}";
                                if (Regex.IsMatch(icno, regex))
                                {
                                    if(icno.Substring(0,1).Equals("6") || icno.Substring(0, 1).Equals("7") || icno.Substring(0, 1).Equals("8") || icno.Substring(0, 1).Equals("9"))  
                                    {
                                        String query = "select Email from registration_master where Email='" + iemail + "'";
                                        MySqlCommand cmd = new MySqlCommand(query, con);
                                        MySqlDataReader rd = cmd.ExecuteReader();
                                        if(rd.Read())
                                        {
                                            Response.Write("<script>alert('This Email Id already exist')</script>");
                                            rd.Close();
                                        }
                                        else
                                        {
                                            rd.Close();
                                            String insertquery = "insert into registration_master (First_Name, Last_Name, Contact_No, Email, Gender, Password, Status) values ('" + ifname + "', '" + ilname + "', '" + icno + "', '" + iemail + "', '" + igender + "', '" + encryption(ipass) + "', 'Active')";
                                            cmd = new MySqlCommand(insertquery, con);
                                            int count = cmd.ExecuteNonQuery();

                                            if(count > 0)
                                            {
                                                Session["UserId"] = iemail;
                                                Response.Redirect("Dashboard.aspx");
                                            }
                                            else
                                            {
                                                Response.Write("<script>alert('somethings wrong!please try again later')</script>");
                                            }
                                        }
                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('Enter valid contact no')</script>");
                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert('Enter valid contact no')</script>");
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Enter valid contact no')</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Enter valid Email Id')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('password dosen't match')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('password should be greater than 8 character')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Enter all the details properly')</script>");
            }
        }

        public bool Valid(String Id)
        {
            var valid = true;

            try
            {
                var email = new MailAddress(Id);
            }
            catch (Exception e)
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
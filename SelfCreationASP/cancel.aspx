<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancel.aspx.cs" Inherits="SelfCreationASP.cancel" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %> 
<%@ Import Namespace="System.Configuration" %>
<%
    string id = Request.QueryString["id"];
    MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=root;database=realestate");
    con.Open();
    String query = "update meetings set Status='Cancel' where Meeting_id='"+id+"'";
    MySqlCommand cmd = new MySqlCommand(query, con);
    int count = cmd.ExecuteNonQuery();

    if(count > 0)
    {
        Response.Redirect("meeting.aspx");
    }
%>
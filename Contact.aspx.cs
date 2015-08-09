using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Contact : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(JAY.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sub"] != null)
        {
            sub.Visible = true;
        }
        else
        {
            sub.Visible = false;
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO HEY VALUES (@Message, @DateAdded)";
        com.Parameters.AddWithValue("@Message", txtMessage.Text);
        com.Parameters.AddWithValue("@DateAdded", DateTime.Now);
        com.ExecuteNonQuery();
        con.Close();
        Session["sub"] = "yes";
        Response.Redirect("Contact.aspx");
    }
}
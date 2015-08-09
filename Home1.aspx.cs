using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Home1 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(JAY.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT UserID, TypeID FROM Users " +
            "WHERE Email=@Email AND Password=@Password";
        com.Parameters.AddWithValue("@Email", txtE.Text);
        com.Parameters.AddWithValue("@Password", txtP.Text);
        SqlDataReader dr = com.ExecuteReader();

        if (dr.HasRows) // email and pass match
        {
            while (dr.Read())
            {
                Session["userid"] = dr["UserID"].ToString();
                Session["typeid"] = dr["TypeID"].ToString();
            }
            con.Close();
            Response.Redirect("Home.aspx");
        }

        else // email and pass don't match
        {
            con.Close();
            error.Visible = true;
        }
    }
}
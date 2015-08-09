using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Site : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(JAY.GetCon()); //instanciate
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            if (!IsPostBack)
            {
                GetInfo();
            }
        }
    }

    void GetInfo() //get user name
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT FirstName + ' ' + LastName FROM Users WHERE UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
        ltUser.Text = (string)com.ExecuteScalar(); // typecasting
        con.Close();
    }
}

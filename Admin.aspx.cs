using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(JAY.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUsers();
        }
    }
    void GetUsers()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT PlaceID, Name, ExactLocation, Country, Image, Description, DateAdded, Status FROM Places";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Users");

        lvUsers.DataSource = ds;
        lvUsers.DataBind();

        con.Close();


    }
}
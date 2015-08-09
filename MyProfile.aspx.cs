using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MyProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(JAY.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["ID"] == null)
        //{
        //    Response.Redirect("Home.aspx");
        //}
        //else
        //{
        //    int UserID = 0;
        //    bool validID = int.TryParse(Request.QueryString["ID"].ToString(), out UserID);

        //    if (validID)
        //    {
                if (!IsPostBack)
                {
                    GetInfo();
                }

            //}
            //else
            //{
            //    Response.Redirect("Home.aspx");
            //}
        //}
    }

    void GetInfo()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT FirstName, LastName, Street, Municipality, City, Country, ZipCode WHERE UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", 3);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Users");
        lvUsers.DataSource = ds;
        lvUsers.DataBind();

        con.Close();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Edit : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(JAY.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null) //ID is not present 
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            int PlaceID = 0;
            bool validID = int.TryParse(Request.QueryString["ID"].ToString(), out PlaceID);

            if (validID) //accept
            {
                if (!IsPostBack)
                {
                    GetInfo(PlaceID);
                }
            }
            else //ID is not valid 
            {
                Response.Redirect("Default.aspx");
            }
        }

    }

    void GetInfo(int PlaceID)
    { 

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Places SET Status='Status' WHERE PlaceID=@PlaceID";

        com.Parameters.AddWithValue("@PlaceID", PlaceID);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Default.aspx");
    }
}
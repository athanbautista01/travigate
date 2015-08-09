using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(JAY.GetCon()); //instanciate
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            if (!IsPostBack)
            {
                GetInfo();
                GetPlaces();
                GetCategories();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    void GetInfo() //get user name
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT FirstName + ' ' + LastName FROM Users WHERE UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
        ltName.Text = (string)com.ExecuteScalar(); // typecasting
        con.Close();
    }
    void GetPlaces()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Places.Image, Places.Name, Places.Dateadded, Categories.Category, Places.ExactLocation, Places.Country, Places.Description " +
            "FROM Places INNER JOIN Categories ON Places.CatID = Categories.CatID WHERE Status='Post' ORDER BY DateAdded DESC";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Places");
        lvPlaces.DataSource = ds;
        lvPlaces.DataBind();
        con.Close();
    }

    void GetCategories()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT CatID, Category FROM Categories";
        SqlDataReader dr = com.ExecuteReader(); //shortcut
        ddlCategories.DataSource = dr;
        ddlCategories.DataTextField = "Category";
        ddlCategories.DataValueField = "CatID";
        ddlCategories.DataBind();
        con.Close();

        ddlCategories.Items.Insert(0, new ListItem("Select a category...", ""));
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO Places VALUES (@UserID, @CatID, @Name, @ExactLocation, @Country, @Image, @Description, @DateAdded, @Status)";
        com.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
        com.Parameters.AddWithValue("@CatID", ddlCategories.SelectedValue);
        com.Parameters.AddWithValue("@Name", txtName.Text);
        com.Parameters.AddWithValue("@ExactLocation", txtEL.Text);
        com.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);

        string fileExt = Path.GetExtension(fuImage.FileName);
        string id = Guid.NewGuid().ToString();
        com.Parameters.AddWithValue("@Image", id + fileExt);
        fuImage.SaveAs(Server.MapPath("~/img/places/" + id + fileExt));

        com.Parameters.AddWithValue("Description", txtDesc.Text);
        com.Parameters.AddWithValue("@DateAdded", DateTime.Now);
        com.Parameters.AddWithValue("@Status", "Post");
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Home.aspx");
    }
}
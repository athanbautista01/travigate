using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; //namespace
using System.Data.SqlClient; //namespace

public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(JAY.GetCon()); //instanciate
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    bool IsExisting(string email)
    {
        bool existing = true; //initial value
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Email FROM Users WHERE Email = @E";
        com.Parameters.AddWithValue("@E", email);
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows) //email is existing
            existing = true;
        else // email is not existing
            existing = false;

        con.Close();
        return existing;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        bool existingEmail = IsExisting(txtE.Text);

        if (existingEmail)
        {
            error.Visible = true;
        }

        else
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "INSERT INTO Users VALUES (@TypeID, @Email, @Password, @FirstName, @LastName, @Street, " +
                "@Municipality, @City, @Country, @ZipCode)"; //parametarized SQL statement
            com.Parameters.AddWithValue("@TypeID", 2);
            com.Parameters.AddWithValue("@Email", txtE.Text);
            com.Parameters.AddWithValue("@Password", txtP.Text);
            com.Parameters.AddWithValue("@FirstName", txtFN.Text);
            com.Parameters.AddWithValue("@LastName", txtLN.Text);
            com.Parameters.AddWithValue("@Street", DBNull.Value);
            com.Parameters.AddWithValue("@Municipality", DBNull.Value);
            com.Parameters.AddWithValue("@City", DBNull.Value);
            com.Parameters.AddWithValue("@Country", DBNull.Value);
            com.Parameters.AddWithValue("@ZipCode", DBNull.Value);
            com.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Home1.aspx");
        }
    }
}
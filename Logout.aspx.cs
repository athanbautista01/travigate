﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("UserID");
        Session.Remove("TypeID");
        Session.RemoveAll();
        Response.Redirect("Home1.aspx");
    }
}
﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_LoggedOut_Default : System.Web.UI.Page
{
    public int like1;
    public int like2;
    public int like3;
    public int like4;
    public int like5;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "SELECT * FROM Likes WHERE Id = 21";
        DataTable dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like1 = dt.Rows[0].Field<int>("likes");

        sql = "SELECT * FROM Likes WHERE Id = 22";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like2 = dt.Rows[0].Field<int>("likes");

        sql = "SELECT * FROM Likes WHERE Id = 23";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like3 = dt.Rows[0].Field<int>("likes");

        sql = "SELECT * FROM Likes WHERE Id = 24";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like4 = dt.Rows[0].Field<int>("likes");

        sql = "SELECT * FROM Likes WHERE Id = 25";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like5 = dt.Rows[0].Field<int>("likes");
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_LoggedOut_Default : System.Web.UI.Page
{
    // Variables to store the like counts for different items
    public int like1;
    public int like2;
    public int like3;
    public int like4;
    public int like5;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Retrieve the like counts for different items from the database
        string sql;
        DataTable dt;

        // Get the like count for item 1
        sql = "SELECT * FROM Likes WHERE Id = 1";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like1 = dt.Rows[0].Field<int>("likes");

        // Get the like count for item 2
        sql = "SELECT * FROM Likes WHERE Id = 2";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like2 = dt.Rows[0].Field<int>("likes");

        // Get the like count for item 3
        sql = "SELECT * FROM Likes WHERE Id = 3";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like3 = dt.Rows[0].Field<int>("likes");

        // Get the like count for item 4
        sql = "SELECT * FROM Likes WHERE Id = 4";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like4 = dt.Rows[0].Field<int>("likes");

        // Get the like count for item 5
        sql = "SELECT * FROM Likes WHERE Id = 5";
        dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
        like5 = dt.Rows[0].Field<int>("likes");
    }
}
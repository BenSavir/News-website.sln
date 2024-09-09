using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Default2 : System.Web.UI.Page
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

        // Check if the like button had been pressed for each item
        // If pressed, increment the respective like count and update the database

        if (Request.QueryString["1"] != null)
        {
            like1 = like1 + 1;
            sql = "UPDATE Likes SET likes=" + like1 + " WHERE id = '1'"; ;
            MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
        }

        if (Request.QueryString["2"] != null)
        {
            like2 = like2 + 1;
            sql = "UPDATE Likes SET likes=" + like2 + " WHERE id = '2'"; ;
            MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
        }

        if (Request.QueryString["3"] != null)
        {
            like3 = like3 + 1;
            sql = "UPDATE Likes SET likes=" + like3 + " WHERE id = '3'"; ;
            MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
        }

        if (Request.QueryString["4"] != null)
        {
            like4 = like4 + 1;
            sql = "UPDATE Likes SET likes=" + like4 + " WHERE id = '4'"; ;
            MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
        }

        if (Request.QueryString["5"] != null)
        {
            like5 = like5 + 1;
            sql = "UPDATE Likes SET likes=" + like5 + " WHERE id = '5'"; ;
            MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
        }
    }
}
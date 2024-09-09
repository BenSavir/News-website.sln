using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Manager_Default : System.Web.UI.Page
{
        public int like1;
        public int like2;
        public int like3;
        public int like4;
        public int like5;

        protected void Page_Load(object sender, EventArgs e)
        {
            string sql;
            DataTable dt;
            sql = "SELECT * FROM Likes WHERE Id = 16";
            dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
            like1 = dt.Rows[0].Field<int>("likes");

            sql = "SELECT * FROM Likes WHERE Id = 17";
            dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
            like2 = dt.Rows[0].Field<int>("likes");

            sql = "SELECT * FROM Likes WHERE Id = 18";
            dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
            like3 = dt.Rows[0].Field<int>("likes");

            sql = "SELECT * FROM Likes WHERE Id = 19";
            dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
            like4 = dt.Rows[0].Field<int>("likes");

            sql = "SELECT * FROM Likes WHERE Id = 20";
            dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
            like5 = dt.Rows[0].Field<int>("likes");



            if (Request.QueryString["1"] != null)
            {
                like1 = like1 + 1;
                sql = "UPDATE Likes SET likes=" + like1 + " WHERE id = '16'"; ;
                MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
            }
            if (Request.QueryString["2"] != null)
            {
                like2 = like2 + 1;
                sql = "UPDATE Likes SET likes=" + like2 + " WHERE id = '17'"; ;
                MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
            }
            if (Request.QueryString["3"] != null)
            {
                like3 = like3 + 1;
                sql = "UPDATE Likes SET likes=" + like3 + " WHERE id = '18'"; ;
                MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
            }
            if (Request.QueryString["4"] != null)
            {
                like4 = like4 + 1;
                sql = "UPDATE Likes SET likes=" + like4 + " WHERE id = '19'"; ;
                MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
            }
            if (Request.QueryString["5"] != null)
            {
                like5 = like5 + 1;
                sql = "UPDATE Likes SET likes=" + like5 + " WHERE id = '20'"; ;
                MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
            }
        }
    }
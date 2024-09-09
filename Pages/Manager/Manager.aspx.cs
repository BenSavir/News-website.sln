using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Pages_Default : System.Web.UI.Page
{
    public String formResponse = ""; // Holds the response message to be displayed on the form
    public String email = ""; // Holds the email of the user
    public String NewfName = ""; // Holds the new first name of the user
    public String NewlName = ""; // Holds the new last name of the user
    public String NewTel = ""; // Holds the new telephone number of the user
    public String NewPassword = ""; // Holds the new password of the user
    public String NewSex = ""; // Holds the new gender of the user
    public Boolean manager; // Indicates if the user is a manager
    public Boolean isexist; // Indicates if a record exists in the database
    public String msg; // Holds the HTML content for displaying the table

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["userAccessCookie"] != null)
        {
            // Edit details of a logged-in user

            String sql;
            // Retrieve ID and fetch user details for editing
            if (Request.Form["EMAIL"] != null)
            {
                email = Request.Form["email1"];
                sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                bool isexist = MyAdoHelper.IsExist("Database1.mdf", sql);
                if (isexist == true)
                {
                    email = Request.Form["email1"];
                    sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                    DataTable dtt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
                    NewfName = dtt.Rows[0].Field<String>("fname");

                    sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                    dtt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
                    NewlName = dtt.Rows[0].Field<String>("lName");

                    sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                    dtt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
                    NewTel = dtt.Rows[0].Field<String>("phone");

                    sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                    dtt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
                    NewPassword = dtt.Rows[0].Field<String>("password");
                }
                else
                {
                    formResponse = "Email doesn't exist.";
                }
            }

            if (Request.Form["submit"] != null)
            {
                Boolean isexist;
                string fName = Request.Form["fName"];
                string lName = Request.Form["lName"];
                string tel = Request.Form["tel"];
                Boolean manager = true;
                string password = Request.Form["password"];

                // Update user details in the database
                sql = "UPDATE Users SET fname = N'" + fName + "', lname = N'" + lName + "', phone = '" + tel + "', email = '" + email + "', manager = '" + manager + "', password = '" + password + "' WHERE email = '" + email + "'";

                try
                {
                    MyAdoHelper.DoQuery("Database1.mdf", sql);
                }
                catch
                {
                    formResponse = "Please check the information you inputted into the form and try again. The database has not been updated.";
                }

                // Check if the user exists in the database and create a session and user cookie for authentication
                sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                isexist = MyAdoHelper.IsExist("Database1.mdf", sql);

                if (isexist == true)
                {
                    Session["EMAIL"] = email;

                    // Create a user cookie for the user's session
                    HttpCookie userCookie = new HttpCookie("userAccessCookie");
                    userCookie.Value = Session["EMAIL"].ToString();
                    userCookie.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(userCookie);
                }
            }

            // Delete a user
            if (Request.Form["delete"] != null)
            {
                email = Request.Form["email1"];
                sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                bool isexist = MyAdoHelper.IsExist("Database1.mdf", sql);

                if (isexist == true)
                {
                    sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                    DataTable dtt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
                    Boolean manager = dtt.Rows[0].Field<Boolean>("manager");

                    if (manager)
                    {
                        formResponse = "You cannot delete a manager.";
                    }
                    else
                    {
                        // Delete the user from the database
                        sql = "DELETE FROM Users WHERE email='" + email + "'";
                        MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
                    }
                }
                else
                {
                    formResponse = "ID number does not exist.";
                }
            }

            // Convert a user to a manager
            if (Request.Form["managerB"] != null)
            {
                email = Request.Form["email1"];
                sql = "SELECT * FROM Users WHERE email = '" + email + "'";
                bool isexist = MyAdoHelper.IsExist("Database1.mdf", sql);

                if (isexist == true)
                {
                    // Update the manager field to true
                    sql = "UPDATE Users SET manager = 'true' WHERE email = '" + email + "'";
                    MyAdoHelper.ExecuteNonQuery("Database1.mdf", sql);
                }
                else
                {
                    formResponse = "Email doesn't exist.";
                }
            }

            // Retrieve the table from the database
            string mysql = "SELECT * FROM Users";
            DataTable table = MyAdoHelper.ExecuteDataTable("Database1.mdf", mysql);
            int length = table.Rows.Count;

            // Create the table header
            msg += "<tr>";
            msg += "<th>Email</th>";
            msg += "</tr>";

            // Populate the table rows
            for (int i = 0; i < length; i++)
            {
                msg += "<tr>";
                msg += "<td>" + table.Rows[i]["email"] + "</td>";
                msg += "</tr>";
            }
        }
        else
        {
            Response.Redirect("../LoggedOut/Login1.aspx"); // Redirect to the login page
        }
    }
}

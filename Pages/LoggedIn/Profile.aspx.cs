using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Pages_Default2 : System.Web.UI.Page
{
    public String applicationHits; // Holds the number of hits to the application
    public String fName; // Holds the first name of the user
    public String lName; // Holds the last name of the user
    public String email1; // Holds the email of the user
    public String password; // Holds the password of the user
    public String tel; // Holds the telephone number of the user
    public String sex; // Holds the gender of the user
    public String formResponse; // Holds the response message to be displayed on the form
    public String userName; // Holds the username of the user
    public String email3; // Holds the email of the user

    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if there is a userAccessCookie
        if (Request.Cookies["userAccessCookie"] != null)
        {
            // Retrieve the email from the userAccessCookie
            email1 = Request.Cookies["userAccessCookie"].Value.ToString();

            // Construct a SQL query to retrieve user information based on the email
            String mysql = "SELECT * FROM Users WHERE email = '" + email1 + "'";
            DataTable dttt = MyAdoHelper.ExecuteDataTable("Database1.mdf", mysql);

            // Retrieve the "manager" field from the DataTable
            Boolean manager = dttt.Rows[0].Field<Boolean>("manager");

            if (manager)
            {
                Response.Redirect("../Manager/ManagerProfile.aspx"); // Redirect to a secure page for managers
            }
        }

        // Check if the LogOut parameter is present in the query string
        if (Request.QueryString["LogOut"] != null)
        {
            // User has requested to log out - delete the userAccessCookie, clear session state, and redirect to login page
            Response.Cookies["userAccessCookie"].Expires = DateTime.Now.AddDays(-1);
            Session.Clear();
            Response.Redirect("../LoggedOut/Login1.aspx"); // Redirect to the login page
        }

        // Increment the application hits counter
        Application.Lock();
        if (Application["hits"] != null)
        {
            Application["hits"] = (int)Application["hits"] + 1;
            applicationHits = Application["hits"].ToString();
        }
        Application.UnLock();

        // Retrieve user information based on the userAccessCookie
        email3 = Request.Cookies["userAccessCookie"].Value.ToString();
        String sql = "SELECT * FROM Users WHERE email = '" + email3 + "'";
        DataTable dtt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);

        if (Request.Form["submit"] != null)
        {
            // Update user data in the database based on the submitted form

            bool isexist;

            fName = Request.Form["fName"];
            lName = Request.Form["lName"];
            tel = Request.Form["tel"];
            sex = Request.Form["sex"];
            Boolean manager = false;
            password = Request.Form["password"];

            // Construct an SQL query to update the user's data in the database
            sql = "UPDATE Users SET fname = N'" + fName + "', lname = N'" + lName + "', email = '" + email3 + "', password = '" + password + "', phone = '" + tel + "', manager = '" + manager + "' WHERE email = '" + email3 + "'";

            try
            {
                MyAdoHelper.DoQuery("Database1.mdf", sql); // Execute the SQL query to update the user's data
            }
            catch
            {
                formResponse = "Please check the information you inputted into the form and try again. The database has not been updated.";
            }

            // Retrieve the updated user data from the database
            sql = "SELECT * FROM Users WHERE email = '" + email3 + "'";
            isexist = MyAdoHelper.IsExist("Database1.mdf", sql);
            if (isexist == true)
            {
                // Update the session and userAccessCookie with the new user data
                Session["email"] = email3;
                HttpCookie userCookie = new HttpCookie("userAccessCookie");
                userCookie.Value = Session["email"].ToString();
                userCookie.Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(userCookie);
            }
        }

        // Check if the userAccessCookie is present
        if (Request.Cookies["userAccessCookie"] != null)
        {
            // Retrieve user data from the database based on the userAccessCookie
            email3 = Request.Cookies["userAccessCookie"].Value.ToString();
            sql = "SELECT * FROM Users WHERE email = '" + email3 + "'";
            dtt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);

            // Retrieve user information from the DataTable
            fName = dtt.Rows[0].Field<String>("fname");
            lName = dtt.Rows[0].Field<String>("lname");
            userName = email3;
            tel = dtt.Rows[0].Field<String>("phone");
            password = dtt.Rows[0].Field<String>("password");
        }
        else
        {
            Response.Redirect("../LoggedOut/Login1.aspx"); // Redirect to the login page
        }
    }
}

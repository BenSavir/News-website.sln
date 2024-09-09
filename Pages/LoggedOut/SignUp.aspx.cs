using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SignUp : System.Web.UI.Page
{
    public String formResponse; // Holds the response message to be displayed on the form
    public String userCount; // Holds the current user count

    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the "userCount" application variable exists and initialize it if it doesn't
        if (Application["userCount"] == null)
        {
            Application["userCount"] = 0;
        }

        userCount = Application["userCount"].ToString(); // Retrieve and store the current user count

        string email = Request.QueryString["email"]; // Get the email from the query string

        // Check if the user with the provided email already exists in the database
        string sql = "SELECT * FROM Users WHERE email = '" + email + "'";
        bool isexist = MyAdoHelper.IsExist("Database1.mdf", sql);

        if (isexist == true)
        {
            formResponse = "email already exists. Registration not complete."; // User exists, display error message
        }
        else
        {
            // Retrieve other query string parameters
            string fname = Request.QueryString["fname"];
            string lname = Request.QueryString["lname"];
            string phone = Request.QueryString["phone"];
            string password = Request.QueryString["password"];
            string sex = Request.QueryString["sex"];

            // Insert the new user into the database
            sql = "INSERT INTO Users Values(N'" + fname + "', N'" + lname + "', N'" + email + "', N'" + password + "', N'" + phone + "', N'" + sex + "', '0')";
            try
            {
                MyAdoHelper.DoQuery("Database1.mdf", sql);
            }
            catch
            {
                formResponse = "Please check the information you inputted into the form and try again. The database has not been updated.";
            }

            // Check if the user was successfully inserted into the database
            sql = "SELECT * FROM Users WHERE email = '" + email + "'";
            isexist = MyAdoHelper.IsExist("Database1.mdf", sql);

            if (isexist == true)
            {
                // User registration completed successfully

                Session["EMAIL"] = email; // Store user's email in the session state

                // Create a cookie to store the user's email for future access
                HttpCookie userCookie = new HttpCookie("userAccessCookie");
                userCookie.Value = Session["EMAIL"].ToString();
                userCookie.Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(userCookie);

                formResponse = "Registration completed. Signing in now..."; // Display success message

                // Update user count and redirect to the main signed-in page
                Application.UnLock();
                if (Application["userCount"] != null)
                {
                    Application["userCount"] = (int)Application["userCount"] + 1;
                }
                Response.Redirect("../LoggedIn/SignedInMain1.aspx");
                Application.Lock();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Default : System.Web.UI.Page
{
    public String formResponse; // Holds the response message to be displayed on the form

    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the user is already logged in based on the presence of a userAccessCookie
        if (Request.Cookies["userAccessCookie"] != null)
        {
            // If the user is logged in, retrieve the email from the cookie and store it in the session state
            String usernameFromCookie = Request.Cookies["userAccessCookie"].Value;
            Session["email"] = usernameFromCookie;

            // Construct a SQL query to retrieve user information based on the email
            string sql = "SELECT * FROM Users WHERE email = '" + usernameFromCookie + "'";

            // Execute the query and store the result in a DataTable
            DataTable dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);

            // Retrieve the "manager" field from the first row of the DataTable
            Boolean manager = dt.Rows[0].Field<Boolean>("manager");

            // Redirect the user to the appropriate page based on their role (manager or regular user)
            if (manager == true)
            {
                Response.Redirect("../Manager/ManagerMain.aspx");
            }
            else
            {
                Response.Redirect("../LoggedIn/SignedInMain1.aspx");
            }
        }

        // Check if the submit button was clicked and the user is not already logged in
        if (Request.QueryString["submit"] != null && Request.Cookies["userAccessCookie"] == null)
        {
            // Retrieve the email and password from the query string
            string email = Request.QueryString["email"];
            string password = Request.QueryString["password"];

            // Construct a SQL query to check if the user with the provided email exists in the database
            string sql = "SELECT * FROM Users WHERE email = '" + email + "'";

            // Check if the user exists in the database
            bool isexist = MyAdoHelper.IsExist("Database1.mdf", sql);

            if (isexist == true)
            {
                // User exists, check if the provided password matches the one in the database

                // Retrieve the password from the database
                DataTable dt = MyAdoHelper.ExecuteDataTable("Database1.mdf", sql);
                string tablePassword = dt.Rows[0].Field<String>("password");

                if (tablePassword == password)
                {
                    // Password is correct, retrieve the "manager" field from the database
                    Boolean manager = dt.Rows[0].Field<Boolean>("manager");

                    // Store the user's email in the session state
                    Session["EMAIL"] = email;

                    // Create a cookie to store the user's email for future access
                    HttpCookie userCookie = new HttpCookie("userAccessCookie");
                    userCookie.Value = Session["EMAIL"].ToString();
                    userCookie.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(userCookie);

                    formResponse = "Login completed. logging in now..."; // Display success message

                    // Redirect the user to the appropriate page based on their role (manager or regular user)
                    if (manager == true)
                    {
                        Response.Redirect("../Manager/ManagerMain.aspx");
                    }
                    else
                    {
                        Response.Redirect("../LoggedIn/SignedInMain1.aspx");
                    }
                }
                else
                {
                    formResponse = "Password incorrect. Please try again."; // Password is incorrect, display error message
                }
            }
            else
            {
                formResponse = "email not found. Please try again."; // User does not exist, display error message
            }
        }
    }
}

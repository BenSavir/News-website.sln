<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="Pages_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         //defines forbidden characters
         var badCharacters = /['*#%@ ]/;
         //checks if there are forbidden characters
         function validateInput() {
             var inputs = ["fname", "lname", "phone", "password"];
             var name = "";
             var i;
             for (i = 0; i < inputs.length; i++) {
                 if (document.getElementById("register")[inputs[i]].value.match(badCharacters)) {
                     if (inputs[i] == "fName") {
                         name = "first name";
                     }
                     if (inputs[i] == "lName") {
                         name = "last name";
                     }
                     if (inputs[i] == "phone") {
                         name = "telphon number";
                     }
                     if (inputs[i] == "password") {
                         name = "password";
                     }
                     document.getElementById("formStatus").innerHTML = "Status: Input contained illegal characters ('*%@) in " + name;
                     return;
                 }
             }



             //checks the validity of the email
             var email = document.getElementById("register")["email"].value;
             if (!email.includes("@") || !email.includes(".") || email.startsWith("@") || email.endsWith("@") || email.startsWith(".") || email.endsWith(".")) {
                 document.getElementById("formStatus").innerHTML = "Status: email is invalid.";
                 return;
             }
             if (email.match(/['*#%]/)) {
                 document.getElementById("formStatus").innerHTML = "Status: email contained illegal characters ('*% ).";
                 return;
             }

             var tel = document.getElementById("register")["phone"].value;
             if (/[a-zA-Zא-ת]/.test(tel)) {
                 document.getElementById("formStatus").innerHTML = "Status: tel is invalid.";
                 return;
             }

             document.getElementById("register").submit();


         }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="signup-container">
        <h1> <%=userCount%> users have already signed up recently, what about you?</h1>
        <form id="register">
            <div class="form-group">
                <label for="first-name">First Name:</label>
                <input type="text" id="fname" name="fname" required>
            </div>
            <div class="form-group">
                <label for="last-name">Last Name:</label>
                <input type="text" id="lname" name="lname" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="sex">Sex:</label>
                <select id="sex" name="sex" required>
                    <option value="">Please select</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <button type="submit" id="submit" name="submit" onclick="validateInput();return false;">Submit</button>
        </form>
        <p id="formStatus">Status: <%=formResponse%></p>
        <p>Already have an account? <a href="Login.aspx">Log in</a></p>
    </div>
</asp:Content>


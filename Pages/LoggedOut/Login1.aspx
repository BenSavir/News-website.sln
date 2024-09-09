<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Login1.aspx.cs" Inherits="Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        //מגדיר מהם תווים לא טובים
        var badCharacters = /['*#%@ ]/;
        //בודק איפה יש תווים לא טובים ומודיע למשתמש
        function validateInput() {
            var inputs = ["password"];
            var name = "";
            var i;
            for (i = 0; i < inputs.length; i++) {
                if (document.getElementById("register")[inputs[i]].value.match(badCharacters)) {
                    if (inputs[i] == "password") {
                        name = "password";
                    }
                    document.getElementById("formStatus").innerHTML = "Status: Input contained illegal characters ('*%@) in " + name;
                    return;
                }
            }



            //פעולה נפרדת למייל מכייון שהוא מכיל @
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
    <div class="login-container">
        <h1>Login</h1>
        <form id="register">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" id="submit" name="submit" onclick="validateInput();return false;">Submit</button>
        </form>
        <p id="formStatus">Status: <%=formResponse%></p>
        <p>Don't have an account? <a href="SignUp.aspx">Sign up</a></p>
    </div>
</asp:Content>


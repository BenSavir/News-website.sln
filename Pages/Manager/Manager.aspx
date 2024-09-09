<%@ Page Title="" Language="C#" MasterPageFile="~/ManagerMaster.master" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
        }
        
        h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        form {
            margin-bottom: 20px;
        }
        
        label {
            font-weight: bold;
        }
        
        input[type="text"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        
        button[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
        
        #formStatus {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        var badCharacters = /['*#%@ ]/;

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
                        name = "telephone number";
                    }
                    if (inputs[i] == "password") {
                        name = "password";
                    }
                    document.getElementById("formStatus").innerHTML = "Status: Input contained illegal characters ('*%@) in " + name;
                    return;
                }
            }

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
                document.getElementById("formStatus").innerHTML = "Status: telephone number is invalid.";
                return;
            }

            document.getElementById("register").submit();
        }
    </script>
    
    <h1>Users</h1>
    <table>
        <%= msg %>
    </table>
    
    <form id="register1" action="Manager.aspx" method="post">
        <table>
            <tr>
                <td>
                    <label for="email1">Email:</label>
                </td>
                <td>
                    <input type="text" id="email1" value="<%= email %>" name="email1" required/>
                </td>
            </tr> 
            <tr>
                <td colspan="2">
                    <button type="submit" id="EMAIL" name="EMAIL" onclick="validateInput();return false;">View</button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" id="delete" name="delete" onclick="validateInput();return false;">Delete</button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" id="managerB" name="managerB" onclick="validateInput();return false;">Make a User a Manager</button>
                </td>
            </tr>
        </table>
    </form>

    <form id="register" action="Manager.aspx" method="post">
        <table>
            <tr>
                <td>
                    <label for="email">Email:</label>
                </td>
                <td>
                    <input type="text" id="email" name="email" value="<%= email %>" required readonly/>
                </td>
            </tr> 
            <tr>
                <td>
                    <label for="fName">First Name:</label>
                </td>
                <td>
                    <input type="text" id="fName" name="fName" value="<%= NewfName %>" required/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="lName">Last Name:</label>
                </td>
                <td>
                    <input type="text" id="lName" name="lName" value="<%= NewlName %>" required/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="tel">Telephone Number:</label>
                </td>
                <td>
                    <input type="tel" id="tel" name="tel" value="<%= NewTel %>" maxlength="10" required/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="password">Password:</label>
                </td>
                <td>
                    <input type="text" id="password" name="password" value="<%= NewPassword %>" required/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" id="submit" name="submit" onclick="validateInput();return false;">Submit</button>
                </td>
            </tr>
        </table>
    </form>
    <p id="formStatus">Status: <%= formResponse %></p>
</asp:Content>

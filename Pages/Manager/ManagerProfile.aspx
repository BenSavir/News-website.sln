<%@ Page Title="" Language="C#" MasterPageFile="~/ManagerMaster.master" AutoEventWireup="true" CodeFile="ManagerProfile.aspx.cs" Inherits="Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
        }
        
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        
        form {
            margin-bottom: 20px;
        }
        
        table {
            width: 100%;
        }
        
        table td {
            padding: 10px;
        }
        
        label {
            font-weight: bold;
        }
        
        input[type="text"],
        input[type="tel"],
        input[type="email"] {
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
            background-color: #333;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        #formStatus {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1 class="SecureH">Welcome <%=fName%></h1>
        
        <form id="register" action="Profile.aspx" method="post">
            <table>
                <tr>
                    <td>
                        <label for="fName">First name:</label>
                    </td>
                    <td>
                        <input type="text" id="fName" value="<%=fName%>" name="fName" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="lName">Last name:</label>
                    </td>
                    <td>
                        <input type="text" id="lName" value="<%=lName%>" name="lName" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="tel">Telephone Number:</label>
                    </td>
                    <td>
                        <input type="tel" id="tel" value="<%=tel%>" name="tel" maxlength="10" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="email">Email:</label>
                    </td>
                    <td>
                        <input type="email" id="email" name="email" value="<%=email1%>" required/>
                    </td>
                </tr>
            </table>
            <button type="submit">Submit</button>

        </form>
        <form>
            <button type="submit" name="LogOut">Log out</button>
        </form>
        <p id="formStatus"></p>
    </div>
</asp:Content>


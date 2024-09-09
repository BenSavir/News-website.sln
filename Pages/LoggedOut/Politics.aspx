<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Politics.aspx.cs" Inherits="Pages_LoggedOut_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-articles-container">
    <div class="main-article">
        <img src="../../images/Politics1.jpg" alt="Article Image">
        <h1>2024 GOP field widens as Pence and Christie join race</h1>
        <p>  </p>
        <div class="article-like">
            <button class="like-button" onclick="likeArticle(this)"></button>
            <span class="like-counter"><%=like1%></span>
        </div>
    </div>

    <div class="main-article">
        <img src="../../images/Politics2.jpg" alt="Article Image">
        <h1>Hear why this former Trump campaign adviser believes Trump is ‘worried’ about classified doc case</h1>
        <p>  </p>
        <div class="article-like">
            <button class="like-button" onclick="likeArticle(this)">  </button>
            <span class="like-counter"> <%=like2%> </span>
        </div>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Politics3.jpg" alt="Article Image">
    <h2>How one DeSantis speech captured the dynamic that could decide 2024</h2>
    <p>  </p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like3%></span>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Politics4.jpg" alt="Article Image">
    <h2>Breaking with Trump and DeSantis, Haley made case for Ukraine in CNN town hall</h2>
    <p>Smaller article summary goes here...</p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like4%></span>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Politics5.jpg" alt="Article Image">
    <h2>Gathering outside Colorado Capitol</h2>
    <p>Hundreds of White women gather at Colorado Capitol after plea from women of color to use their ‘privilege’ to demand action on gun violence</p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like5%></span>
    </div>
</div>

<script>
    function likeArticle(button) {
        // Display error message
        var errorMessage = "You must be logged in to like the article.";
        alert(errorMessage);
    }
</script>
</asp:Content>


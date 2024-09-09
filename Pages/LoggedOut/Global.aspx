<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Global.aspx.cs" Inherits="Pages_LoggedOut_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-articles-container">
    <div class="main-article">
        <img src="../../images/Global1.jpg" alt="Article Image">
        <h1>Former New Zealand leader Jacinda Ardern honored as a dame</h1>
        <p></p>
        <div class="article-like">
            <button class="like-button" onclick="likeArticle(this)"></button>
            <span class="like-counter"><%=like1%></span>
        </div>
    </div>

    <div class="main-article">
        <img src="../../images/Global2.jpeg" alt="Article Image">
        <h1>Four-lane concrete bridge dramatically crashes over River Ganges for the second time</h1>
        <p></p>
        <div class="article-like">
            <button class="like-button" onclick="likeArticle(this)">  </button>
            <span class="like-counter"> <%=like2%> </span>
        </div>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Global3.jpg" alt="Article Image">
    <h2>Britain’s Princess Eugenie announces birth of second child</h2>
    <p></p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like3%></span>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Global4.jpg" alt="Article Image">
    <h2>Why did ethnic Serbs attack NATO peacekeepers in Kosovo? Here’s what we know</h2>
    <p></p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like4%></span>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Global5.jpg" alt="Article Image">
    <h2>Bodies of 54 Uganda soldiers killed by al Shabaab discovered</h2>
    <p></p>
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


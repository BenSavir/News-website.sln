<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="Pages_LoggedOut_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-articles-container">
    <div class="main-article">
        <img src="../../images/Main1.jpg" alt="Article Image">
        <h1>Pilot of unresponsive private jet that crashed and killed 4 was seen slumped over, source says</h1>
        <p></p>
        <div class="article-like">
            <button class="like-button" onclick="likeArticle(this)"></button>
            <span class="like-counter"><%=like1%></span>
        </div>
    </div>

    <div class="main-article">
        <img src="../../images/Main2.jpg" alt="Article Image">
        <h1>Ukrainian soccer star Oleksandr Zinchenko confronted by realities of war in first visit home since invasion</h1>
        <p></p>
        <div class="article-like">
            <button class="like-button" onclick="likeArticle(this)">  </button>
            <span class="like-counter"> <%=like2%> </span>
        </div>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Main3.jpg" alt="Article Image">
    <h2>We’re easing out of the pandemic. But that’s not what has this infectious disease expert worried</h2>
    <p></p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like3%></span>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Main4.jpg" alt="Article Image">
    <h2>Alien-like message sent to Earth in a test to prepare for the real thing</h2>
    <p></p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like4%></span>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Main5.jpg" alt="Article Image">
    <h2>She got a job on a superyacht. Here’s what happened next</h2>
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


<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Crime.aspx.cs" Inherits="Pages_LoggedOut_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-articles-container">
    <div class="main-article">
        <img src="../../images/Crime1.jpg" alt="Article Image">
        <h1>A West Virginia state trooper is killed in a shooting, and a suspect is under arrest, authorities say</h1>
        <p></p>
        <div class="article-like">
            <button class="like-button" onclick="likeArticle(this)"></button>
            <span class="like-counter"><%=like1%></span>
        </div>
    </div>

    <div class="main-article">
        <img src="../../images/Crime2.jpg" alt="Article Image">
        <h1>Cheerleader recalls being shot after friend opened the wrong car door</h1>
        <p></p>
        <div class="article-like">
            <button class="like-button" onclick="likeArticle(this)">  </button>
            <span class="like-counter"> <%=like2%> </span>
        </div>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Crime3.png" alt="Article Image">
    <h2>New Mexico judge approves settlement in ‘Rust’ wrongful death lawsuit</h2>
    <p></p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like3%></span>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Crime4.jpg" alt="Article Image">
    <h2>2nd plane carrying more than a dozen migrants lands in California capital</h2>
    <p></p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like4%></span>
    </div>
</div>

<div class="smaller-article">
    <img src="../../images/Crime5.jpg" alt="Article Image">
    <h2>Prison documents reveal Jeffrey Epstein tried to reach out to Larry Nassar, gymnastics coach convicted of sexual abuse</h2>
    <p></p>
    <div class="article-like">
        <button class="like-button" onclick="likeArticle(this)"></button>
        <span class="like-counter"><%=like5%></span>
    </div>
</div>

<script>
    function likeArticle(button) {
        var errorMessage = "You must be logged in to like the article.";
        alert(errorMessage);
    }
</script>
</asp:Content>


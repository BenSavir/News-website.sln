<%@ Page Title="" Language="C#" MasterPageFile="~/ManagerMaster.master" AutoEventWireup="true" CodeFile="ManagerEconomics.aspx.cs" Inherits="Pages_Manager_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><div class="main-articles-container">
        <div class="main-article">
            <img src="../../images/Economics1.jpg" alt="Article Image">
        <h1>The double-decker airplane seat is back. Here’s what it looks like now</h1>
        <p></p>
            <div class="article-like">                
                <form>
                    <button class="article-like" type="submit" name="1"></button>
                </form>
                <span class="like-counter"><%=like1%></span>
            </div>
        </div>

        <div class="main-article">
            <img src="../../images/Economics2.jpg" alt="Article Image">
        <h1>Case for 2023 US recession is crumbling</h1>
        <p> </p>
            <div class="article-like">
                <form>
                    <button class="article-like" type="submit" name="2"></button>
                </form>
                <span class="like-counter"><%=like2%></span>
            </div>
        </div>
    </div>

    <div class="smaller-article">
       <img src="../../images/Economics3.jpg" alt="Article Image">
    <h2>US regulator accuses Binance of running an illegal exchange</h2>
    <p></p>
          <div class="article-like">
            <form>
                    <button class="article-like" type="submit" name="3"></button>
                </form>
            <span class="like-counter"><%=like3%></span>
        </div>
    </div>

    <div class="smaller-article">
       <img src="../../images/Economics4.jpg" alt="Article Image">
    <h2>Airbnb sues New York City over its short-term rental restrictions</h2>
    <p></p>
          <div class="article-like">
            <form>
                    <button class="article-like" type="submit" name="4"></button>
                </form>
            <span class="like-counter"><%=like4%></span>
        </div>
    </div>

    <div class="smaller-article">
        
        <img src="../../images/Economics5.jpg" alt="Article Image">
    <h2>Binance hit by outflows of $790 million in last 24 hours, data shows</h2>
    <p></p>
          <div class="article-like">
            <form>
                    <button class="article-like" type="submit" name="5"></button>
                </form>
            <span class="like-counter"><%=like5%></span>
        </div>
    </div>
</asp:Content>


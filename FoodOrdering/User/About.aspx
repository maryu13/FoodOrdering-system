<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FoodOrdering.User.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- about section -->

  <section class="about_section layout_padding" >
    <div class="container  " >

      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="../TemplateFiles/images/bg1.png" alt="" height="450px">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
               Food Express
              </h2>
            </div>
            <p>
             Cooking and eating is always fun, especially homemade food. Food is one of the primary necessities of humans and also plays a vital role in maintaining good health. People work hard to eat; it does not matter if it is healthy or not, but healthy eating prevents a variety of health problems. For some people eating is an option, but for others they live to eat. People enjoy cooking their own meals; it gives us peace of mind, satisfaction, and a guarantee of cleanliness. 
            </p>
            <a href="">
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->
</asp:Content>

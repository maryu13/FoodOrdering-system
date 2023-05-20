<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="BlogView.aspx.cs" Inherits="FoodOrdering.User.BlogView" %>

<%@ Import Namespace="FoodOrdering" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .custom_nav-container {
            padding: 0;
        }

        .navbar-brand {
            font-family: 'Dancing Script', cursive;
        }

        .custom_nav-container .navbar-nav .nav-item .nav-link {
            padding: 5px 20px;
            color: black;
            text-align: center;
            text-transform: uppercase;
            border-radius: 5px;
            -webkit-transition: all 0.3s;
            transition: all 0.3s;
        }

        .navbar-brand span {
            font-weight: bold;
            font-size: 32px;
            color: black;
        }

        .custom_nav-container .nav_search-btn {
            width: auto;
            height: auto;
            padding: 0;
            border: none;
            color: white;
            margin: 0 10px;
        }

        .user_option .user_link {
            color: white;
        }

        .user_option .cart_link svg {
            width: 17px;
            height: auto;
            fill: white;
            margin-bottom: 2px;
        }

        .user_option .order_online {
            display: inline-block;
            padding: 8px 30px;
            background-color: #ffbe33;
            color: white;
            border-radius: 45px;
            -webkit-transition: all 0.3s;
            transition: all 0.3s;
            border: none;
        }
    </style>
    <link href="../blogfiles/css/style.css" rel="stylesheet" />
    <link href="../blogfiles/css/responsive.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mission_section layout_padding">
        <div class="container_main1 pl-5 ml-5 mt-5 mt-5 ">
            <div class="row">
                <br />
                <br />
                <asp:Repeater ID="rBlog" runat="server">
                    <ItemTemplate>
                        <div></div>
                        <div class=" col-sm-5 col-md-4">
                            <img src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="items" width="300px" height="300px">
                            <div class="overlay ">
                                <div class="detail-box ">
                                    <h3 class="text-center align-content-center"><%# Eval("Topic")%> </h3>
                                    <p class="text-center align-content-center"><%# Eval("BlogMssg")%></p>
                                    <div class="options ml-3 mr-3">
                                        <h7><%# Eval("Username")%></h7>
                                        <h8 class="float-right"><%# Eval("Date")%></h8>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

</asp:Content>

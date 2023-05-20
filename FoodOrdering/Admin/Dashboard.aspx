<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FoodOrdering.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Deal Overview -->
    <div class="card mb-4">

        <!-- End Card Header -->

    </div>
    <!-- End Deal Overview -->

    <!-- highlight-area start -->
    <div class="row ml-4 mr-4">
        <div class="col-lg-3 col-md-6">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600">Category</span>
                    <h2 class="text-black mt-4"><%Response.Write(Session["category"]);%><small class="d-block "></small></h2>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600">Users</span>
                    <h2 class="text-black "><%Response.Write(Session["Usercount"]);%><small class="d-block"></small></h2>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
           <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600">Products</span>
                    <h2 class="text-black"><%Response.Write(Session["ProductCount"]);%><small class="d-block"></small></h2>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600">Blogs</span>
                    <h2 class="text-black mt-3"><%Response.Write(Session["BlogCount"]);%><small class="d-block "></small></h2>
                </div>
            </div>
        </div>
    </div>
    <!-- highlight-area End -->
</asp:Content>

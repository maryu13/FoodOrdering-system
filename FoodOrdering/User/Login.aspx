<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodOrdering.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        /* For disappearing alert message*/
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%= lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container ">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMessage" runat="server" Visible="true">
                    <h2>Login</h2>
                </asp:Label>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <img id="userLogin" src="../Images/login1.png" alt="" height="400px" width="600px"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rvfUsername" ErrorMessage="User Name is required" ControlToValidate="txtUserName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" placeholder="Enter User Name" ToolTip="User Name"></asp:TextBox>

                        </div>


                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rvfPassword" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox>

                        </div>
                    </div>
                    <div class="btn_box">
                    <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-dark rounded-pill pl-4 pr-4 text-white" onClick="loginbtn"/>
                        <span class="pl-3 text-dark ">New User ? <a href="Registration.aspx" class="badge badge-info ">Register Here...</a></span>

                </div>
                </div>
                
            </div>

        </div>


        </div>

    </section>
</asp:Content>

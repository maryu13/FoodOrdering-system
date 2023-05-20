<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FoodOrdering.User.Registration" %>

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
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .widget(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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
                    <h2>Register</h2>
                </asp:Label>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rvfName" ErrorMessage="Name is required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage=" Name must be in characters only" Font-Size="Small" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Enter Full Name" ToolTip="Full Name"></asp:TextBox>

                        </div>

                        <div>
                            <div>
                                <asp:RequiredFieldValidator runat="server" ID="rvfUsername" ErrorMessage="User Name is required" ControlToValidate="txtUserName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" placeholder="Enter User Name" ToolTip="User Name"></asp:TextBox>

                            </div>
                        </div>

                        <div>
                            <div>
                                <asp:RequiredFieldValidator runat="server" ID="rvfEmail" ErrorMessage="Email is required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="form-control" placeholder="Enter Email" ToolTip="Email"></asp:TextBox>

                            </div>

                        </div>

                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rvfMobile" ErrorMessage="Mobile No is required" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Mobile must have 10 digit no only" Font-Size="Small" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control" placeholder="Enter Mobile No" ToolTip="Mobile No" TextMode="Number"></asp:TextBox>

                        </div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rvfAddress" ErrorMessage="Address is required" ControlToValidate="txtAddress" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" placeholder="Enter Address" ToolTip="Address" TextMode="MultiLine"></asp:TextBox>

                        </div>

                        <div>

                            <asp:RequiredFieldValidator runat="server" ID="rvfPostCode" ErrorMessage="PostCode is required" ControlToValidate="txtPostCode" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPostCode" runat="server" ErrorMessage="Zip Code must have 6 digit no only" Font-Size="Small" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPostCode" ValidationExpression="^[0-9]{6}$"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server"  ID="txtPostCode" CssClass="form-control" placeholder="Enter Post/Zip code" ToolTip="Post Code" TextMode="Number"></asp:TextBox>

                        </div>

                        <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onChange="ImagePreview(this);"></asp:FileUpload>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rvfPassword" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="row pl-4">
                    <div class="btn_box">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" onclick="btnRegister_Click"/>
                        <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100" Text="Already Registered? <a href='Login.aspx' class='badge badge-info'>Login here..</a>"></asp:Label>

                    </div>
                </div>
                <div class="row p-5">
                    <div style="align-items: center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>

            </div>


        </div>

    </section>
</asp:Content>

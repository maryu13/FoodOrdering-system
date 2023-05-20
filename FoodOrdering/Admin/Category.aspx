<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="FoodOrdering.Admin.Category" %>
<%@ Import Namespace="FoodOrdering" %>
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
                    $('#<%=imgCategory.ClientID%>').prop('src', e.target.result)
                        .widget(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pcoded-inner-content pt-0">
        <div class="align align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">

                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Category</h4>
                                        

                                        <div class="form-group">
                                            <label>Category Name</label>
                                            <div>
                                                <asp:TextBox runat="server" ID="txtname" CssClass="form-control" placeholder="Enter Category Name " required></asp:TextBox>
                                                <asp:HiddenField runat="server" ID="hdnId" Value="0"></asp:HiddenField>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>Category Image</label>
                                            <div>
                                                <asp:FileUpload runat="server" ID="fuCategoryImage" CssClass="form-control" onChange="ImagePreview(this)" required></asp:FileUpload>
                                            </div>
                                        </div>

                                        <div class="form-group  pl-4">
                                            <div>
                                                <asp:CheckBox runat="server" ID="cbIsActive" Text="&nbsp; IsActive" CssClass="form-check-input"></asp:CheckBox>
                                            </div>
                                        </div>

                                        <div class="pb-5">
                                            <div>
                                                <asp:Button runat="server" ID="btnAddOrUpdate" Text="Add" CssClass="btn btn-primary" OnClick="btnAddorUpdate" />
                                                &nbsp;
                                                <asp:Button runat="server" ID="btnClears" Text="Clear" CssClass="btn btn-primary" CausesValidation="false" OnClick="btnClear" />
                                            </div>
                                        </div>

                                        <div>
                                            <asp:Image runat="server" CssClass="img-thumbnail" ID="imgCategory"></asp:Image>
                                        </div>

                                        </div>
                                        
                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category Lists</h4>
                                            <div class="card-block table table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rCategory" runat="server" OnItemCommand="rCategory_ItemCommand" OnItemDataBound="rCategory_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                <tr>
                                                                    <th class="table-plus">Name</th>
                                                                    <th >Image</th>
                                                                    <th>IsActive</th>
                                                                    <th>CreatedDate</th>
                                                                    <th class="datatable-nosort">Action</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("Name") %></td>
                                                                <td>
                                                                    <img alt="" width="40" src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lblIsActive" Text='<%# Eval("IsActive") %>'></asp:Label>

                                                                </td>
                                                                <td><%# Eval("CreatedDate") %></td>
                                                                <td>
                                                                    <asp:LinkButton runat="server" ID="lnkEdit" Text="Edit" CssClass="badge badge-primary" CommandArgument='<%# Eval("CategoryId")%>' CommandName="edit" >
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>

                                                                    <asp:LinkButton runat="server" ID="lnkDelete" Text="Delete" CssClass="badge bg-danger" CommandArgument='<%# Eval("CategoryId")%>'  CommandName="delete"  OnClientClick="return confirm('Do you want to delete this category?');"> 
                                                                        <i class="ti-trash"></i>
                                                                    </asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

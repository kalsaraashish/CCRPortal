<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admintemplate.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="CCRPortal.admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container mt-4" style="padding-top:2rem">
            <h3 class="mb-4">Company Details</h3>

            <table class="table table-striped table-bordered table-responsive">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Company Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Website</th>
                        <th>Profile Info</th>
                        <th>Is Approved</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptCompanies" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("CompanyId") %></td>
                                <td><%# Eval("company_name").ToString().Trim() %></td>
                                <td><%# Eval("email").ToString().Trim() %></td>
                                <td><%# Eval("password").ToString().Trim() %></td>
                                <td><a href='<%# Eval("website").ToString().Trim() %>' target="_blank"><%# Eval("website").ToString().Trim() %></a></td>
                                <td><%# Eval("profile_info").ToString().Trim() %></td>
                                <td>
                                    <%# Convert.ToBoolean(Eval("IsApproved")) ? "Approved" : "Pending" %>
                                </td>
                                <td>
                                    <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-success btn-sm"
                                        CommandName="Approve" CommandArgument='<%# Eval("CompanyId") %>'
                                        OnClick="btnApprove_Click"
                                        Enabled='<%# !Convert.ToBoolean(Eval("IsApproved")) %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>



</asp:Content>

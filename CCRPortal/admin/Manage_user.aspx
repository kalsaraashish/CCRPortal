<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admintemplate.Master" AutoEventWireup="true" CodeBehind="Manage_user.aspx.cs" Inherits="CCRPortal.admin.Manage_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container mt-4" style="padding-top: 2rem">
    <h3 class="mb-4">User Data :</h3>

    <table class="table table-striped table-bordered table-responsive">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email ID</th>
                <th>Password</th>
                <th>Branch</th>
                <th style="width:25rem">Skills</th>
                <th>Resume</th>
                <th>Register Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptuser" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("id") %></td>
                        <td><%# Eval("username").ToString().Trim() %></td>
                        <td><%# Eval("Email").ToString().Trim() %></td>
                        <td><%# Eval("Password").ToString().Trim() %></td>
                        <td><%# Eval("Branch").ToString().Trim() %></td>
                         <td> <%# Eval("Skills").ToString().Trim() %></td>
                        <td>
                            <asp:HyperLink
                                ID="hlResume"
                                runat="server"
                                NavigateUrl='<%# Eval("Resume", "../{0}") %>'
                                Target="_blank"
                                Text='<%# Eval("username").ToString().Trim() %>' />
                        </td>
                        <td><%# Convert.ToDateTime(Eval("RegDate")).ToString("dd MMM yyyy") %></td>
                        
                        <td>
                            <%--<a href="edit_job.aspx?userid=<%# Eval("id") %>" CssClass="btn btn-success btn-sm" >Edit</a><br />--%>
                             <a href="Delete_User.aspx?userid=<%# Eval("id") %>" CssClass="btn btn-success btn-sm" >Delete</a>
                        </td>
                       
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
        <asp:Button ID="btnExportJobs" runat="server" Text="Export User Data to Excel"
CssClass="btn btn-success mb-3" OnClick="btnExportJobs_Click" />
</div>

</asp:Content>

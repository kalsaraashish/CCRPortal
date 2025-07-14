<%@ Page Title="" Language="C#" MasterPageFile="~/company/companytemplate.Master" AutoEventWireup="true" CodeBehind="ViewApplicants.aspx.cs" Inherits="CCRPortal.company.ViewApplicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4" style="padding-top: 2rem">
        <h3 class="mb-4">Student Applications</h3>

        <table class="table table-striped table-bordered table-responsive">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Email</th>
                    <th>Resume</th>
                    <th>Applied Date</th>
                    <th>Location</th>
                    <th>Application Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptCompanies" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("ApplicationID") %></td>
                            <td><%# Eval("Username").ToString().Trim() %></td>
                            <td><%# Eval("email").ToString().Trim() %></td>

                            <td>
                                <%--<a href='../<%# Eval("Resume") %>' download target="_blank">Download Resume
                                </a>--%>
                                <asp:HyperLink
                                    ID="hlResume"
                                    runat="server"
                                    NavigateUrl='<%# Eval("Resume", "../{0}") %>'
                                    Target="_blank"
                                    Text="Download Resume" />


                            </td>
                            <td><%# Convert.ToDateTime(Eval("AppliedDate")).ToString("dd MMM yyyy") %></td>
                            <td>
                                <%# Eval("city").ToString().Trim() %>
                            </td>
                            <td>
                                <%# Eval("Status").ToString().Trim() %>
                            </td>
                            <td>
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-success btn-sm"
                                    CommandArgument='<%# Eval("ApplicationID") %>' OnClick="btnApprove_Click"
                                    Enabled='<%# Eval("Status").ToString().Trim() == "Applied" %>' />

                                <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-danger btn-sm"
                                    CommandArgument='<%# Eval("ApplicationID") %>' OnClick="btnReject_Click"
                                    Enabled='<%# Eval("Status").ToString().Trim() == "Applied" %>' />

                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admintemplate.Master" AutoEventWireup="true" CodeBehind="Manage_company.aspx.cs" Inherits="CCRPortal.admin.Manage_company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- CCRP card + table styling -->
    <style>
        .ccrp-section {
            margin-top: 5rem;
            margin-bottom: 3rem;
        }

        .ccrp-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #222831;
            margin-bottom: 1.5rem;
            position: relative;
        }

        .ccrp-title::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -8px;
            width: 70px;
            height: 3px;
            background: #00c0ef;
            border-radius: 999px;
        }

        .ccrp-card {
            background: #ffffff;
            border-radius: 1rem;
            padding: 1.5rem 1.75rem;
            border: 1px solid #e5e7eb;
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.08);
        }

        .ccrp-table thead th {
            background: #f8fafc;
            border-bottom-width: 1px !important;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #475569;
        }

        .ccrp-table tbody td {
            vertical-align: middle;
            font-size: 0.875rem;
            color: #111827;
        }

        .ccrp-table tbody tr:hover {
            background: #f9fafb;
        }

        .ccrp-action-btn {
            border-radius: 999px;
            padding: 0.25rem 0.75rem;
            font-size: 0.8rem;
            text-decoration: none;
        }
    </style>

    <!-- show/hide password script -->
    <script>
        function toggleCompanyPassword(id) {
            const pwdSpan = document.getElementById("cpwd_" + id);
            if (!pwdSpan) return;

            const realPwd = pwdSpan.getAttribute("data-real");

            if (pwdSpan.innerText === "*******") {
                pwdSpan.innerText = realPwd;
                pwdSpan.style.color = "#0d6efd";
            } else {
                pwdSpan.innerText = "*******";
                pwdSpan.style.color = "#111827";
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container ccrp-section">

        <div class="ccrp-card">

            <h3 class="ccrp-title">Company Details</h3>

            <div class="table-responsive">
                <table class="table table-borderless ccrp-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Company Name</th>
                            <th >Email</th>
                            <th>Password</th>
                            <th>Website</th>
                            <th style="width:50rem">Profile Info</th>
                            <th>Is Approved</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptCompanies" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("CompanyId") %></td>
                                    <td><%# Eval("company_name").ToString().Trim() %></td>
                                    <td><%# Eval("email").ToString().Trim() %></td>

                                    <!-- Click-to-show/hide password -->
                                    <td>
                                        <span id='cpwd_<%# Eval("CompanyId") %>'
                                              data-real='<%# Eval("password").ToString().Trim() %>'
                                              onclick="toggleCompanyPassword(<%# Eval("CompanyId") %>)"
                                              style="cursor:pointer; font-weight:500;">
                                            *******
                                        </span>
                                    </td>

                                    <td>
                                        <a href='<%# Eval("website").ToString().Trim() %>' target="_blank">
                                            <%# Eval("website").ToString().Trim() %>
                                        </a>
                                    </td>

                                    <td><%# Eval("profile_info").ToString().Trim() %></td>

                                    <td>
                                        <%# Convert.ToBoolean(Eval("IsApproved")) ? "Approved" : "Pending" %>
                                    </td>

                                    <td class="text-end" style="width: 110px">
                                        <a href="Delete_Company.aspx?cid=<%# Eval("CompanyId") %>"
                                           class="btn btn-danger btn-sm ccrp-action-btn">
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <asp:Button ID="btnExportJobs" runat="server"
                Text="Export User Data to Excel"
                CssClass="btn btn-success mt-3"
                OnClick="btnExportJobs_Click" />

        </div>

    </div>

</asp:Content>

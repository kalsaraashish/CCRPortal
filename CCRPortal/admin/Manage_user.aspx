<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admintemplate.Master" AutoEventWireup="true" CodeBehind="Manage_user.aspx.cs" Inherits="CCRPortal.admin.Manage_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- CCRP theme table styling -->
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
    <script>
        function togglePassword(id) {
            const pwdSpan = document.getElementById("pwd_" + id);
            const real = pwdSpan.getAttribute("data-real");

            if (pwdSpan.innerText === "*******") {
                pwdSpan.innerText = real;
                pwdSpan.style.color = "#0d6efd"; // blue highlight
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

            <h3 class="ccrp-title">User Data</h3>

            <div class="table-responsive">

                <table class="table table-borderless ccrp-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Email ID</th>
                            <th>Password</th>
                            <th>Branch</th>
                            <th style="width: 25rem">Skills</th>
                            <th>Resume</th>
                            <th>Register Date</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <asp:Repeater ID="rptuser" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("id") %></td>
                                    <td><%# Eval("username").ToString().Trim() %></td>
                                    <td><%# Eval("Email").ToString().Trim() %></td>
                                    <%--<td><%# Eval("Password").ToString().Trim() %></td>--%>
                                    <td>
                                        <span id='pwd_<%# Eval("id") %>'
                                            data-real='<%# Eval("Password").ToString().Trim() %>'
                                            onclick="togglePassword(<%# Eval("id") %>)"
                                            style="cursor: pointer; font-weight: 500;">*******
                                        </span>
                                    </td>

                                    <td><%# Eval("Branch").ToString().Trim() %></td>
                                    <td><%# Eval("Skills").ToString().Trim() %></td>

                                    <td>
                                        <asp:HyperLink ID="hlResume" runat="server"
                                            NavigateUrl='<%# Eval("Resume", "../{0}") %>'
                                            Target="_blank"
                                            Text='<%# Eval("username").ToString().Trim() %>' />
                                    </td>

                                    <td><%# Convert.ToDateTime(Eval("RegDate")).ToString("dd MMM yyyy") %></td>

                                    <td class="text-end">
                                        <a href="Delete_User.aspx?userid=<%# Eval("id") %>"
                                            class="btn btn-danger btn-sm ccrp-action-btn">Delete
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

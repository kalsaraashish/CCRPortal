<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admintemplate.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="CCRPortal.admin.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function cop_successful() {
            Swal.fire({
                title: "successfully!",
                text: "Company approved",
                icon: "success"
            });
        }
        function user_successful() {
            Swal.fire({
                title: "successfully!",
                text: "User approved",
                icon: "success"
            });
        }

        function errormessage() {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Your account is not approved By Admin. Please contact support."
            });
        }
    </script>

    <!-- extra styling only for these sections, matching CCRP theme -->
    <style>
        .ccrp-section {
            margin-top: 3rem;
            margin-bottom: 3rem;
        }

        .ccrp-section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #222831;
            margin-bottom: 1.5rem;
            position: relative;
        }

        .ccrp-section-title::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -8px;
            width: 70px;
            height: 3px;
            border-radius: 999px;
            background: #00c0ef; /* teal / brand accent */
        }

        .ccrp-card {
            background: #ffffff;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.08);
            padding: 1.5rem 1.75rem;
            border: 1px solid #e5e7eb;
        }

        .ccrp-table thead th {
            border-bottom-width: 1px !important;
            background: #f8fafc;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            color: #6b7280;
            vertical-align: middle;
        }

        .ccrp-table tbody td {
            vertical-align: middle;
            font-size: 0.875rem;
            color: #111827;
        }

        .ccrp-table tbody tr:hover {
            background: #f9fafb;
        }

        .ccrp-pill-status {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 999px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .ccrp-pill-status.approved {
            background: #dcfce7;
            color: #15803d;
        }

        .ccrp-pill-status.pending {
            background: #fef3c7;
            color: #92400e;
        }

        .ccrp-approve-btn {
            border-radius: 999px;
            padding: 0.25rem 0.9rem;
            font-size: 0.8rem;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .ccrp-card {
                padding: 1rem;
            }
            .ccrp-section-title {
                font-size: 1.25rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main class="app-main" style="padding-top: 2.5rem">
        <!--begin::App Content Header-->
        <div class="app-content-header">
            <!--begin::Container-->
            <div class="container-fluid">
            </div>
            <!--end::Container-->
        </div>
        <!--end::App Content Header-->
        <!--begin::App Content-->
        <div class="app-content">
            <!--begin::Container-->
            <div class="container-fluid">
                <!--begin::Row-->
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <!--begin::Small Box Widget 3-->
                        <div class="small-box text-bg-warning">
                            <div class="inner">
                                <h3 runat="server" id="tuser"></h3>
                                <p style="color: black">Total User</p>
                            </div>
                            <svg
                                class="small-box-icon"
                                fill="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg"
                                aria-hidden="true">
                                <path
                                    d="M6.25 6.375a4.125 4.125 0 118.25 0 4.125 4.125 0 01-8.25 0zM3.25 19.125a7.125 7.125 0 0114.25 0v.003l-.001.119a.75.75 0 01-.363.63 13.067 13.067 0 01-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 01-.364-.63l-.001-.122zM19.75 7.5a.75.75 0 00-1.5 0v2.25H16a.75.75 0 000 1.5h2.25v2.25a.75.75 0 001.5 0v-2.25H22a.75.75 0 000-1.5h-2.25V7.5z">
                                </path>
                            </svg>
                            <a
                                href="Manage_user.aspx"
                                class="small-box-footer link-dark link-underline-opacity-0 link-underline-opacity-50-hover">More info <i class="bi bi-link-45deg"></i>
                            </a>
                        </div>
                        <!--end::Small Box Widget 3-->
                    </div>
                    <!--end::Col-->
                    <!--begin::Col-->
                    <div class="col-lg-3 col-6">
                        <!--begin::Small Box Widget 1-->
                        <div class="small-box text-bg-primary">
                            <div class="inner">
                                <h3 runat="server" id="countcom"></h3>
                                <p style="color: black">Total Company</p>
                            </div>
                            <svg
                                class="small-box-icon"
                                fill="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg"
                                aria-hidden="true">
                                <path
                                    clip-rule="evenodd"
                                    fill-rule="evenodd"
                                    d="M2.25 13.5a8.25 8.25 0 018.25-8.25.75.75 0 01.75.75v6.75H18a.75.75 0 01.75.75 8.25 8.25 0 01-16.5 0z">
                                </path>
                                <path
                                    clip-rule="evenodd"
                                    fill-rule="evenodd"
                                    d="M12.75 3a.75.75 0 01.75-.75 8.25 8.25 0 018.25 8.25.75.75 0 01-.75.75h-7.5a.75.75 0 01-.75-.75V3z">
                                </path>
                            </svg>
                            <a
                                href="Manage_company.aspx"
                                class="small-box-footer link-light link-underline-opacity-0 link-underline-opacity-50-hover">More info <i class="bi bi-link-45deg"></i>
                            </a>
                        </div>
                        <!--end::Small Box Widget 1-->
                    </div>
                    <!--end::Col-->
                    <div class="col-lg-3 col-6">
                        <!--begin::Small Box Widget 4-->
                        <div class="small-box text-bg-danger">
                            <div class="inner">
                                <h3 runat="server" id="tjob"></h3>
                                <p style="color: black">Total Jobs</p>
                            </div>
                            <svg
                                class="small-box-icon"
                                fill="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg"
                                aria-hidden="true">
                                <path
                                    clip-rule="evenodd"
                                    fill-rule="evenodd"
                                    d="M2.25 13.5a8.25 8.25 0 018.25-8.25.75.75 0 01.75.75v6.75H18a.75.75 0 01.75.75 8.25 8.25 0 01-16.5 0z">
                                </path>
                                <path
                                    clip-rule="evenodd"
                                    fill-rule="evenodd"
                                    d="M12.75 3a.75.75 0 01.75-.75 8.25 8.25 0 018.25 8.25.75.75 0 01-.75.75h-7.5a.75.75 0 01-.75-.75V3z">
                                </path>
                            </svg>
                            <a
                                href="#"
                                class="small-box-footer link-light link-underline-opacity-0 link-underline-opacity-50-hover">More info <i class="bi bi-link-45deg"></i>
                            </a>
                        </div>
                        <!--end::Small Box Widget 4-->
                    </div>
                    <!--end::Col-->
                    <div class="col-lg-3 col-6">
                        <!--begin::Small Box Widget 2-->
                        <div class="small-box text-bg-success">
                            <div class="inner">
                                <h3 runat="server" id="totalapplication"></h3>
                                <p style="color: black">Total Applications</p>
                            </div>
                            <svg
                                class="small-box-icon"
                                fill="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg"
                                aria-hidden="true">
                                <path
                                    d="M18.375 2.25c-1.035 0-1.875.84-1.875 1.875v15.75c0 1.035.84 1.875 1.875 1.875h.75c1.035 0 1.875-.84 1.875-1.875V4.125c0-1.036-.84-1.875-1.875-1.875h-.75zM9.75 8.625c0-1.036.84-1.875 1.875-1.875h.75c1.036 0 1.875.84 1.875 1.875v11.25c0 1.035-.84 1.875-1.875 1.875h-.75a1.875 1.875 0 01-1.875-1.875V8.625zM3 13.125c0-1.036.84-1.875 1.875-1.875h.75c1.036 0 1.875.84 1.875 1.875v6.75c0 1.035-.84 1.875-1.875 1.875h-.75A1.875 1.875 0 013 19.875v-6.75z">
                                </path>
                            </svg>
                            <a
                                href="#"
                                class="small-box-footer link-light link-underline-opacity-0 link-underline-opacity-50-hover">More info <i class="bi bi-link-45deg"></i>
                            </a>
                        </div>
                        <!--end::Small Box Widget 2-->
                    </div>
                    <!--end::Col-->
                </div>
                <!--end::Row-->
            </div>
            <!--end::Container-->
        </div>
        <!--end::App Content-->
    </main>

    <!-- Approve Student Section -->
    <section class="container ccrp-section">
        <div class="ccrp-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h3 class="ccrp-section-title mb-0">Approve Student</h3>
            </div>

            <div class="table-responsive">
                <table class="table table-borderless ccrp-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Email ID</th>
                            <th>Branch</th>
                            <th style="width: 25rem">Skills</th>
                            <th>Resume</th>
                            <th style="width: 10rem">Register Date</th>
                            <th style="width: 8rem">Status</th>
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
                                    <td><%# Eval("Branch").ToString().Trim() %></td>
                                    <td><%# Eval("Skills").ToString().Trim() %></td>
                                    <td>
                                        <asp:HyperLink
                                            ID="hlResume"
                                            runat="server"
                                            NavigateUrl='<%# Eval("Resume", "../{0}") %>'
                                            Target="_blank"
                                            Text='<%# Eval("username").ToString().Trim() %>' />
                                    </td>
                                    <td>
                                        <%# Convert.ToDateTime(Eval("RegDate")).ToString("dd MMM yyyy") %>
                                    </td>

                                    <td>
                                        <span class='ccrp-pill-status <%# Convert.ToBoolean(Eval("IsApproved")) ? "approved" : "pending" %>'>
                                            <%# Convert.ToBoolean(Eval("IsApproved")) ? "Approved" : "Pending" %>
                                        </span>
                                    </td>
                                    <td class="text-end">
                                        <asp:Button ID="btnApproveStudent" runat="server" Text="Approve"
                                            CssClass="btn btn-success btn-sm ccrp-approve-btn"
                                            CommandName="Approve"
                                            CommandArgument='<%# Eval("id") %>'
                                            OnClick="btnApprove_Click1"
                                            Enabled='<%# !Convert.ToBoolean(Eval("IsApproved")) %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Approve Company Section -->
    <section class="container ccrp-section">
        <div class="ccrp-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h3 class="ccrp-section-title mb-0">Approve Company</h3>
            </div>

            <div class="table-responsive">
                <table class="table table-borderless ccrp-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Company Name</th>
                            <th>Email</th>
                            
                            <th>Website</th>
                            <th style="width: 30rem">Profile Info</th>
                            <th>Status</th>
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
                                   
                                    <td>
                                        <a href='<%# Eval("website").ToString().Trim() %>' target="_blank">
                                            <%# Eval("website").ToString().Trim() %>
                                        </a>
                                    </td>
                                    <td><%# Eval("profile_info").ToString().Trim() %></td>
                                    <td>
                                        <span class='ccrp-pill-status <%# Convert.ToBoolean(Eval("IsApproved")) ? "approved" : "pending" %>'>
                                            <%# Convert.ToBoolean(Eval("IsApproved")) ? "Approved" : "Pending" %>
                                        </span>
                                    </td>
                                    <td class="text-end">
                                        <asp:Button ID="btnApproveCompany" runat="server" Text="Approve"
                                            CssClass="btn btn-success btn-sm ccrp-approve-btn"
                                            CommandName="Approve"
                                            CommandArgument='<%# Eval("CompanyId") %>'
                                            OnClick="btnApprove_Click"
                                            Enabled='<%# !Convert.ToBoolean(Eval("IsApproved")) %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</asp:Content>

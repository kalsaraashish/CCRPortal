<%@ Page Title="" Language="C#" MasterPageFile="~/company/companytemplate.Master" AutoEventWireup="true" CodeBehind="ViewApplicants.aspx.cs" Inherits="CCRPortal.company.ViewApplicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function approved_success() {
            Swal.fire({
                title: "Approved successfully.",
                text: "",
                icon: "success"
            });
        }

        function reject_success() {
            Swal.fire({
                title: "Rejected successfully.",
                text: "",
                icon: "success"
            });
        }
    </script>

    <!-- CCRP table styling -->
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
            padding: 1.4rem 1.75rem;
            border: 1px solid #e5e7eb;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        }

        .ccrp-table thead th {
            background: #f8fafc !important;
            border-bottom-width: 1px !important;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            color: #475569;
        }

        .ccrp-table tbody td {
            font-size: 0.875rem;
            vertical-align: middle;
            color: #111827;
        }

        .ccrp-table tbody tr:hover {
            background: #f9fafb !important;
        }

        .pill {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 99px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .pill-applied { background: #e0f2fe; color: #0369a1; }
        .pill-approved { background: #dcfce7; color: #15803d; }
        .pill-rejected { background: #fee2e2; color: #b91c1c; }

        .ccrp-action-btn {
            padding: 0.25rem 0.8rem;
            border-radius: 999px;
            font-size: 0.8rem;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container ccrp-section">
        <div class="ccrp-card">

            <h3 class="ccrp-title">Student Applications</h3>

            <div class="table-responsive">
                <table class="table table-borderless ccrp-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student Name</th>
                            <th>Email</th>
                            <th>Resume</th>
                            <th>Job Name</th>
                            <th>Applied Date</th>
                            <th>Location</th>
                            <th>Status</th>
                            <th class="text-end" style="width:20rem">Action</th>
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
                                        <asp:HyperLink
                                            ID="hlResume"
                                            runat="server"
                                            NavigateUrl='<%# Eval("Resume", "../{0}") %>'
                                            Target="_blank"
                                            Text="Download Resume" />
                                    </td>


                                    <td><%# Eval("Title") %></td>
                                    <td><%# Convert.ToDateTime(Eval("AppliedDate")).ToString("dd MMM yyyy") %></td>

                                    <td><%# Eval("city").ToString().Trim() %></td>

                                    <!-- Fixed Status Column -->
                                    <td>
                                        <span class='pill 
                                            <%# Eval("Status").ToString() == "Applied" ? "pill-applied" : 
                                                Eval("Status").ToString() == "Approved" ?  "pill-approved" : "pill-rejected" %>'>
                                            <%# Eval("Status") %>
                                        </span>
                                    </td>

                                    <td class="text-end">

                                        <asp:Button ID="btnApprove" runat="server"
                                            Text="Approve"
                                            CssClass="btn btn-success btn-sm ccrp-action-btn"
                                            CommandArgument='<%# Eval("ApplicationID") %>'
                                            OnClick="btnApprove_Click"
                                            Enabled='<%# Eval("Status").ToString() == "Applied" %>' />

                                        <asp:Button ID="btnReject" runat="server"
                                            Text="Reject"
                                            CssClass="btn btn-danger btn-sm ccrp-action-btn"
                                            CommandArgument='<%# Eval("ApplicationID") %>'
                                            OnClick="btnReject_Click"
                                            Enabled='<%# Eval("Status").ToString() == "Applied" %>' />

                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

</asp:Content>

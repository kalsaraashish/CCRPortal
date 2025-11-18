<%@ Page Title="" Language="C#" MasterPageFile="~/company/companytemplate.Master" AutoEventWireup="true" CodeBehind="manage-jobs.aspx.cs" Inherits="CCRPortal.company.manage_jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- CCRP table styling -->
    <style>
        .ccrp-section {
            margin-top: 3rem;
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

        .ccrp-action-btn {
            padding: 3px 10px;
            border-radius: 999px;
            font-size: 0.8rem;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Available Jobs -->
    <div class="container ccrp-section">
        <div class="ccrp-card">

            <h3 class="ccrp-title">Available Jobs</h3>

            <div class="table-responsive">
                <table class="table table-borderless ccrp-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Eligibility</th>
                            <th>Deadline</th>
                            <th>Type</th>
                            <th>Location</th>
                            <th>Expected Salary</th>
                            <th>Experience</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <asp:Repeater ID="rptCompanies" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("JobID") %></td>
                                    <td><%# Eval("Title").ToString().Trim() %></td>
                                    <td><%# Eval("Description").ToString().Trim() %></td>
                                    <td><%# Eval("Eligibility").ToString().Trim() %></td>
                                    <td><%# Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %></td>
                                    <td><%# Eval("job_type").ToString().Trim() %></td>
                                    <td><%# Eval("job_city").ToString().Trim() %></td>
                                    <td><%# Eval("ex_salary","{0:C}") %></td>
                                    <td><%# Eval("experience").ToString().Trim() %></td>

                                    <td class="text-end">
                                        <a href="edit_job.aspx?jobid=<%# Eval("JobID") %>" class="btn btn-primary btn-sm ccrp-action-btn">
                                            Edit
                                        </a>
                                        <br />
                                        <a href="Delete_job.aspx?jobid=<%# Eval("JobID") %>" class="btn btn-danger btn-sm ccrp-action-btn mt-1">
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
                Text="Export Available Jobs to Excel"
                CssClass="btn btn-success mt-3"
                OnClick="btnExportJobs_Click" />

        </div>
    </div>




    <!-- Not Available Jobs -->
    <div class="container ccrp-section">
        <div class="ccrp-card">

            <h3 class="ccrp-title">Not Available Jobs</h3>

            <div class="table-responsive">
                <table class="table table-borderless ccrp-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Eligibility</th>
                            <th>Deadline</th>
                            <th>Type</th>
                            <th>Location</th>
                            <th>Expected Salary</th>
                            <th>Experience</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("JobID") %></td>
                                    <td><%# Eval("Title").ToString().Trim() %></td>
                                    <td><%# Eval("Description").ToString().Trim() %></td>
                                    <td><%# Eval("Eligibility").ToString().Trim() %></td>
                                    <td><%# Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %></td>
                                    <td><%# Eval("job_type").ToString().Trim() %></td>
                                    <td><%# Eval("job_city").ToString().Trim() %></td>
                                    <td><%# Eval("ex_salary","{0:C}") %></td>
                                    <td><%# Eval("experience").ToString().Trim() %></td>

                                    <td class="text-end">
                                        <a href="Delete_job.aspx?jobid=<%# Eval("JobID") %>"
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
        </div>
    </div>

</asp:Content>

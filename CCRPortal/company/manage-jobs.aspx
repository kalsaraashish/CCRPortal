<%@ Page Title="" Language="C#" MasterPageFile="~/company/companytemplate.Master" AutoEventWireup="true" CodeBehind="manage-jobs.aspx.cs" Inherits="CCRPortal.company.manage_jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4" style="padding-top: 2rem">
    <h3 class="mb-4">Available Jobs</h3>

    <table class="table table-striped table-bordered table-responsive">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Company Name</th>
                <th>Title</th>
                <th>Description</th>
                <th>Eligibility</th>
                <th>Deadline</th>
                <th>Type</th>
                <th>Location</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptCompanies" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("JobID") %></td>
                        <td><%# Eval("Company_name").ToString().Trim() %></td>
                        <td><%# Eval("Title").ToString().Trim() %></td>
                        <td><%# Eval("Description").ToString().Trim() %></td>
                        <td><%# Eval("Eligibility").ToString().Trim() %></td>

                        <td><%# Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %></td>
                        <td>
                            <%# Eval("job_type").ToString().Trim() %>
                        </td>
                        <td>
                            <%# Eval("job_city").ToString().Trim() %>
                        </td>
                        <td>
                            <a href="edit_job.aspx?jobid=<%# Eval("JobID") %>" CssClass="btn btn-success btn-sm" >Edit</a><br />
                             <a href="Delete_job.aspx?jobid=<%# Eval("JobID") %>" CssClass="btn btn-success btn-sm" >Delete</a>
                        </td>
                       
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</div>



        <div class="container mt-4" style="padding-top: 2rem">
    <h3 class="mb-4">Not Available Jobs</h3>

    <table class="table table-striped table-bordered table-responsive">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Company Name</th>
                <th>Title</th>
                <th>Description</th>
                <th>Eligibility</th>
                <th>Deadline</th>
                <th>Type</th>
                <th>Location</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("JobID") %></td>
                        <td><%# Eval("Company_name").ToString().Trim() %></td>
                        <td><%# Eval("Title").ToString().Trim() %></td>
                        <td><%# Eval("Description").ToString().Trim() %></td>
                        <td><%# Eval("Eligibility").ToString().Trim() %></td>

                        <td><%# Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %></td>
                        <td>
                            <%# Eval("job_type").ToString().Trim() %>
                        </td>
                        <td>
                            <%# Eval("job_city").ToString().Trim() %>
                        </td>
                        <td>
                           
                             <a href="Delete_job.aspx?jobid=<%# Eval("JobID") %>" CssClass="btn btn-success btn-sm" >Delete</a>
                        </td>
                       
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</div>
</asp:Content>

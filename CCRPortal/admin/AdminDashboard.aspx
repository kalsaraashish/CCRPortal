﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admintemplate.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="CCRPortal.admin.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                <h3 runat="server" id="totalapplication">53</h3>
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






    <div class="container ">
        <h3 class="mb-4">Waiting For Approve :</h3>

        <table class="table table-striped table-bordered table-responsive">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Company Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Website</th>
                    <th style="width:20rem">Profile Info</th>
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

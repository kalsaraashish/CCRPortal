<%@ Page Title="" Language="C#" MasterPageFile="~/usertemplate.Master" AutoEventWireup="true" CodeBehind="MyApplications.aspx.cs" Inherits="CCRPortal.MyApplications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="text-center">My Job Applications</h2>

    <asp:GridView ID="gvApplications" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" EmptyDataText="You have not applied to any jobs yet.">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Job Title" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
            <asp:BoundField DataField="Location" HeaderText="Location" />
            <asp:BoundField DataField="AppliedDate" HeaderText="Applied On" DataFormatString="{0:dd MMM yyyy}" />
            <asp:BoundField DataField="Status" HeaderText="Application Status" />
        </Columns>
    </asp:GridView>

</asp:Content>

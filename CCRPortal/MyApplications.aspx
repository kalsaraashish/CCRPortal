<%@ Page Title="" Language="C#" MasterPageFile="~/usertemplate.Master" AutoEventWireup="true" CodeBehind="MyApplications.aspx.cs" Inherits="CCRPortal.MyApplications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <!-- CCRP table & card styling -->
    <style>
        .ccrp-card {
            background: #ffffff;
            border-radius: 1rem;
            padding: 1.5rem 2rem;
            margin: 4rem auto;
            margin-top:5rem;
            border: 1px solid #e5e7eb;
            max-width: 1100px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .ccrp-title {
            text-align: center;
            font-size: 1.6rem;
            font-weight: 600;
            color: #222831;
            margin-bottom: 1.5rem;
            position: relative;
        }

        .ccrp-title::after {
            content: "";
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: -8px;
            width: 80px;
            height: 3px;
            background: #00c0ef;
            border-radius: 999px;
        }

        .ccrp-table th {
            background: #f8fafc !important;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.06em;
            color: #475569;
        }

        .ccrp-table td {
            font-size: 0.9rem;
            color: #111827;
            vertical-align: middle !important;
        }

        .ccrp-table tr:hover {
            background: #f9fafb !important;
        }

        /* status pills */
        .pill {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 999px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .pill-applied { background: #e0f2fe; color: #0369a1; }
        .pill-approved { background: #dcfce7; color: #15803d; }
        .pill-rejected { background: #fee2e2; color: #b91c1c; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ccrp-card">

        <h3 class="ccrp-title">My Applications</h3>

     <asp:GridView ID="gvApplications" runat="server"
            AutoGenerateColumns="False"
            CssClass="table table-borderless table-hover ccrp-table"
            EmptyDataText="You have not applied to any jobs yet."
            GridLines="None"
            HeaderStyle-HorizontalAlign="Left">
         <Columns>

                <asp:BoundField DataField="Title" HeaderText="Job Title" />

                <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />

                <asp:BoundField DataField="Location" HeaderText="Location" />

                <asp:BoundField DataField="AppliedDate"
                    HeaderText="Applied On"
                    DataFormatString="{0:dd MMM yyyy}" />
            <%--<!-- Status with pills -->--%>
                <asp:TemplateField HeaderText="Application Status">
                    <ItemTemplate>
                        <span class='pill
                            <%# Eval("Status").ToString() == "Applied" ? " pill-applied" :
                                Eval("Status").ToString() == "Approved" ? " pill-approved" :
                                " pill-rejected" %>'>
                            <%# Eval("Status") %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>

</asp:Content>

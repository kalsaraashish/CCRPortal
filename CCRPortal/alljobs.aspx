<%@ Page Title="" Language="C#" MasterPageFile="~/usertemplate.Master" AutoEventWireup="true" CodeBehind="alljobs.aspx.cs" Inherits="CCRPortal.alljobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="latest-jobs" class="section bg-gray">
    <div class="container">
        
        <div class="row">
            <asp:Repeater ID="rp1" runat="server">
                <ItemTemplate>
                    <div class="col-lg-6 col-md-12 col-xs-12">
                        <div class="jobs-latest">
                            <div class="img-thumb">
                                <img src="<%# Eval("jobimage") %>" alt="" style="height: 100px; width: 100px" />

                            </div>
                            <div class="content">
                                <h3><a href="job-details.aspx?jobId=<%# Eval("JobID") %>"><%# Eval("Title") %></a></h3>
                                <p class="brand"><%# Eval("Title") %></p>
                                <div class="tags">
                                    <span><i class="lni-map-marker"></i><%# Eval("job_city") %></span>
                                    <%--<span><i class="lni-user"></i>John Smith</span>--%>
                                </div>
                                <div class="tag mb-3"><i class="lni-tag"></i><%# Eval("Eligibility") %></div>
                                <a href="job-details.aspx?jobId=<%# Eval("JobID") %>"><span class="full-time"><%# Eval("job_type") %></span></a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            
        </div>
    </div>
</section>
</asp:Content>

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/usertemplate.Master" AutoEventWireup="true" CodeBehind="job-details.aspx.cs" Inherits="CCRPortal.job_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Page Header Start -->
    <asp:Repeater ID="rp1" runat="server">
        <ItemTemplate>
            <div class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-6 col-xs-12">
                            <div class="breadcrumb-wrapper">
                                <div class="img-wrapper">
                                    <img src="<%# Eval("jobimage") %>" alt="" style="width: 100px">
                                </div>
                                <div class="content">
                                    <h3 class="product-title">Hiring <%# Eval("Title") %></h3>
                                    <p class="brand"><%# Eval("Company_name") %></p>
                                    <div class="tags">
                                        <span><i class="lni-map-marker"></i><%# Eval("job_city") %></span>
                                        <span><i class="lni-calendar"></i>Posted <%# Eval("PostedDate", "{0:dd MMM yyyy}") %></span>
                                        <span><i class="lni-calendar"></i>Deadline <%# Eval("Deadline", "{0:dd MMM yyyy}") %></span><span class="full-time"><%# Eval("job_type") %></span>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12">
                            <div class="month-price">
                                <span class="year">Yearly</span>
                                <div class="price">$65,000</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Page Header End -->

            <!-- Job Detail Section Start -->
            <section class="job-detail section">
                <div class="container">
                    <div class="row justify-content-between">
                        <div class="col-lg-8 col-md-12 col-xs-12">
                            <div class="content-area">
                                <h4>Job Description</h4>
                                <p><%# Eval("Description") %></p>
                             <div>
                                 <asp:Label runat="server" ID="mofapplay" ></asp:Label>
                             </div>
                                <asp:Button class="btn btn-common" runat="server" ID="applyjob" OnClick="applyjob_Click" Text="Apply job" />


                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-xs-12">
                            <div class="sideber">
                                <div class="widghet">
                                    <h3>Job Location</h3>
                                    <div class="maps">
                                        <div id="map" class="map-full">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d405691.57240383344!2d-122.3212843181106!3d37.40247298383319!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb68ad0cfc739%3A0x7eb356b66bd4b50e!2sSilicon+Valley%2C+CA%2C+USA!5e0!3m2!1sen!2sbd!4v1538319316724" allowfullscreen=""></iframe>
                                        </div>
                                    </div>
                                </div>
                                <div class="widghet">
                                    <h3>Share This Job</h3>
                                    <div class="share-job">
                                        <div method="post" class="subscribe-form">
                                            <div class="form-group">
                                               <%-- <input type="email" name="Email" class="form-control" placeholder="https://ccrportal.com" >
                                                <button type="submit" name="subscribe" class="btn btn-common sub-btn"><i class="lni-files"></i></button>--%>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <ul class="mt-4 footer-social">
                                            <li><a class="facebook" href="#"><i class="lni-facebook-filled"></i></a></li>
                                            <li><a class="twitter" href="#"><i class="lni-twitter-filled"></i></a></li>
                                            <li><a class="linkedin" href="#"><i class="lni-linkedin-fill"></i></a></li>
                                            <li><a class="google-plus" href="#"><i class="lni-google-plus"></i></a></li>
                                        </ul>
                                        <div class="meta-tag">
                                            <span class="meta-part"><a href="#"><i class="lni-star"></i>Write a Review</a></span>
                                            <span class="meta-part"><a href="#"><i class="lni-warning"></i>Reports</a></span>
                                            <span class="meta-part"><a href="#"><i class="lni-share"></i>Share</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </ItemTemplate>
    </asp:Repeater>
    <!-- Job Detail Section End -->

</asp:Content>

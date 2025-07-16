<%@ Page Title="" Language="C#" MasterPageFile="~/usertemplate.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="CCRPortal.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header id="home" class="hero-area">
        <div class="container">
            <div class="row space-100 justify-content-center">
                <div class="col-lg-10 col-md-12 col-xs-12">
                    <div class="contents">
                        <h2 class="head-title">Find the job that fits your life</h2>
                        <p>
                            At Career Connect Recruitment Portal (CCRP), your career journey begins with purpose.
                            <br>
                            We guide you every step of the way—toward growth, clarity, and lasting success.
                        </p>
                       
                    </div>
                </div>
            </div>
        </div>
    </header>


    <!-- Latest Section Start -->
    <section id="latest-jobs" class="section bg-gray">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Latest Jobs</h2>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit ellentesque dignissim quam et
                    <br>
                    metus effici turac fringilla lorem facilisis.
                </p>
            </div>
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

                <div class="col-12 text-center mt-4">
                    <a href="job-page.html" class="btn btn-common">Browse All Jobs</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Section End -->

 

    <!-- Browse jobs Section Start -->
    <div id="browse-jobs" class="section bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="text-wrapper">
                        <div>
                            <h3>7,000+ Browse Jobs</h3>
                            <p>Search all the open positions on the web. Get your own personalized salary estimate. Read reviews on over 600,000 companies worldwide. The right job is out there.</p>
                            <a class="btn btn-common" href="#">Search jobs</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="img-thumb">
                        <img class="img-fluid" src="assets/img/search.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Browse jobs Section End -->

    <!-- How It Work Section Start -->
    <section class="how-it-works section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">How It Works?</h2>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit ellentesque dignissim quam et
                    <br>
                    metus effici turac fringilla lorem facilisis.
                </p>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="work-process">
                        <span class="process-icon">
                            <i class="lni-user"></i>
                        </span>
                        <h4>Create an Account</h4>
                        <p>Post a job to tell us about your project. We'll quickly match you with the right freelancers find place best.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="work-process step-2">
                        <span class="process-icon">
                            <i class="lni-search"></i>
                        </span>
                        <h4>Search Jobs</h4>
                        <p>Post a job to tell us about your project. We'll quickly match you with the right freelancers find place best.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="work-process step-3">
                        <span class="process-icon">
                            <i class="lni-cup"></i>
                        </span>
                        <h4>Apply</h4>
                        <p>Post a job to tell us about your project. We'll quickly match you with the right freelancers find place best.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- How It Work Section End -->

</asp:Content>

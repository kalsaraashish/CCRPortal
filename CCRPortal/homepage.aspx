<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="CCRPortal.homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="UIdeck">
    <title>CCRP - Job Portal</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/line-icons.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/owl.theme.default.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section Start -->
        <header id="home" class="hero-area">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand-lg fixed-top scrolling-navbar">
                <div class="container">
                    <div class="theme-header clearfix">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                                <span class="lni-menu"></span>
                                <span class="lni-menu"></span>
                                <span class="lni-menu"></span>
                            </button>
                            <a href="homepage.aspx" class="navbar-brand">
                                <img src="assets/img/logo.png" alt="" /></a>
                        </div>
                        <div class="collapse navbar-collapse" id="main-navbar">
                            <ul class="navbar-nav mr-auto w-100 justify-content-end">
                                <li class="nav-item active">
                                    <a class="nav-link" href="homepage.aspx">Home
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="aboutus.aspx">About
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contactus.aspx">Contact
                                    </a>
                                </li>
                                <%--<li class="nav-item">
                  <a class="nav-link" href="login.aspx">Sign In</a>
                </li>--%>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sign In
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="login.aspx">Sign In for User</a></li>
                                        <li><a class="dropdown-item" href="/company/company_login.aspx">Company Sign In</a></li>
                                    </ul>
                                </li>
                                <li class="button-group">
                                    <a href="company/company_login.aspx" class="button btn btn-common">Post a Job</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="mobile-menu" data-logo="assets/img/logo-mobile.png"></div>
            </nav>
            <!-- Navbar End -->

            <div class="container">
                <div class="row space-100 justify-content-center">
                    <div class="col-lg-10 col-md-12 col-xs-12">
                        <div class="contents">
                            <h2 class="head-title">Find the job that fits your life</h2>
                            <p>
                                At Career Connect Recruitment Portal (CCRP), your career journey begins with purpose.
                                <br />
                                We guide you every step of the way—toward growth, clarity, and lasting success.
                            </p>

                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->
        <!-- Latest Section Start -->
        <section id="latest-jobs" class="section bg-gray">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Latest Jobs</h2>
                    <p>
                        Discover opportunities tailored to your skills — start your career journey today.
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
                        <a href="alljobs.aspx" class="btn btn-common">Browse All Jobs</a>
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
                                <a class="btn btn-common" href="alljobs.aspx">View jobs</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="img-thumb">
                            <img class="img-fluid" src="assets/img/search.png" alt="" />
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
        <!-- Testimonial Section Start -->
        <section id="testimonial" class="section">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Clients Review</h2>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit ellentesque dignissim quam et
                        <br>
                        metus effici turac fringilla lorem facilisis.
                    </p>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                        <div id="testimonials" class="touch-slider owl-carousel">
                            <div class="item">
                                <div class="testimonial-item">
                                    <div class="author">
                                        <div class="img-thumb">
                                            <img src="assets/img/a.jpg" alt="" style="width: 110px" />
                                        </div>
                                    </div>
                                    <div class="content-inner">
                                        <p class="description">Finding a good project management role was challenging, but CCR Portal streamlined the process. It matched me with the right company, and the communication was clear throughout. Within weeks, I landed a job that aligns with my skills and goals.</p>
                                        <div class="author-info">
                                            <h2><a href="#">Ashish kalsara</a></h2>
                                            <span>Project Manager</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimonial-item">
                                    <div class="author">
                                        <div class="img-thumb">
                                            <img src="assets/img/kunj.jpeg" style="width: 110px" />
                                        </div>

                                    </div>
                                    <div class="content-inner">
                                        <p class="description">I was struggling to find stable opportunities until I registered on CCR Portal. It connected me directly with companies looking for experienced accountants, and the interview tips were genuinely useful. Highly recommend it to anyone serious about their career.</p>
                                        <div class="author-info">
                                            <h2><a href="#">Kunj Ramdevputra</a></h2>
                                            <span>Senior Accountant</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimonial-item">
                                    <div class="author">
                                        <div class="img-thumb">

                                            <img src="assets/img/sh.jpeg" alt="" style="width: 110px" />
                                        </div>
                                    </div>
                                    <div class="content-inner">
                                        <p class="description">CCR Portal helped me secure a core engineering job within a month after registering. The job alerts were accurate, and the guidance provided for preparing my resume made a big difference. Thanks to this project, I’m now working in a reputed company.</p>
                                        <div class="author-info">
                                            <h2><a href="#">Shalish Makwana</a></h2>
                                            <span>Engineer</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial Section End -->

        <!-- Footer Section Start -->
        <footer>
            <!-- Footer Area Start -->
            <section class="footer-Content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-xs-12">
                            <div class="widget">
                                <div class="footer-logo">
                                    <img src="assets/img/logo-footer.png" alt="" />
                                </div>
                                <div class="textwidget">
                                    <p>your career journey begins with purpose.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 col-xs-12">
                            <div class="widget">
                                <h3 class="block-title">Quick Links</h3>
                                <ul class="menu">
                                    <li><a href="aboutus.aspx">About Us</a></li>
                                    <li><a href="#">Support</a></li>
                                    <li><a href="contactus.aspx">Contact</a></li>
                                </ul>
                                <ul class="menu">
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="#">Privacy</a></li>
                                    <li><a href="#">Refferal Terms</a></li>
                                    <li><a href="#">Product License</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-12">
                            <div class="widget">
                                <h3 class="block-title">Subscribe Now</h3>
                                <p>Sed consequat sapien faus quam bibendum convallis.</p>
                                <div method="post" id="subscribe-form" name="subscribe-form" class="validate">
                                    <div class="form-group is-empty">
                                        <input type="email" value="" name="Email" class="form-control" id="EMAIL" placeholder="Enter Email..." required="">
                                        <button type="submit" name="subscribe" id="subscribes" class="btn btn-common sub-btn"><i class="lni-envelope"></i></button>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <ul class="mt-3 footer-social">
                                    <li><a class="facebook" href="#"><i class="lni-facebook-filled"></i></a></li>
                                    <li><a class="twitter" href="#"><i class="lni-twitter-filled"></i></a></li>
                                    <li><a class="linkedin" href="#"><i class="lni-linkedin-fill"></i></a></li>
                                    <li><a class="google-plus" href="#"><i class="lni-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Footer area End -->

            <!-- Copyright Start  -->
            <div id="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="site-info text-center">
                                <p>Designed and Developed by <a href="https://uideck.com" rel="nofollow">UIdeck</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Copyright End -->
        </footer>
        <!-- Footer Section End -->

        
        


    </form>
    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="assets/js/jquery-min.js"></script>
    <script src="assets/js/popper.min.js"></script>

    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/jquery.slicknav.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/form-validator.min.js"></script>
    <script src="assets/js/contact-form-script.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>

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
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="aboutus.aspx">About</a></li>
                                        <li><a class="dropdown-item" href="contactus.aspx">Contact</a></li>
                                        <li><a class="dropdown-item" href="job-page.html">Job Page</a></li>
                                        <li><a class="dropdown-item" href="job-details.html">Job Details</a></li>
                                        <li><a class="dropdown-item" href="resume.html">Resume Page</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Candidates
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="browse-jobs.html">Browse Jobs</a></li>
                                        <li><a class="dropdown-item" href="browse-categories.html">Browse Categories</a></li>
                                        <li><a class="dropdown-item" href="add-resume.html">Add Resume</a></li>
                                        <li><a class="dropdown-item" href="manage-resumes.html">Manage Resumes</a></li>
                                        <li><a class="dropdown-item" href="job-alerts.html">Job Alerts</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Employers
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="post-job.html">Add Job</a></li>
                                        <li><a class="dropdown-item" href="manage-jobs.html">Manage Jobs</a></li>
                                        <li><a class="dropdown-item" href="manage-applications.html">Manage Applications</a></li>
                                        <li><a class="dropdown-item" href="browse-resumes.html">Browse Resumes</a></li>
                                    </ul>
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
                                    <a href="company/company_register.aspx" class="button btn btn-common">Post a Job</a>
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
                                Aliquam vestibulum cursus felis. In iaculis iaculis sapien ac condimentum. Vestibulum congue posuere lacus,
                                <br>
                                id tincidunt nisi porta sit amet. Suspendisse et sapien varius, pellentesque dui non.
                            </p>
                            <div class="job-search-form">
                                <form>
                                    <div class="row">
                                        <div class="col-lg-5 col-md-6 col-xs-12">
                                            <div class="form-group">
                                                <input class="form-control" type="text" placeholder="Job Title or Company Name">
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-xs-12">
                                            <div class="form-group">
                                                <div class="search-category-container">
                                                    <label class="styled-select">
                                                        <select>
                                                            <option value="none">Locations</option>
                                                            <option value="none">New York</option>
                                                            <option value="none">California</option>
                                                            <option value="none">Washington</option>
                                                            <option value="none">Birmingham</option>
                                                            <option value="none">Chicago</option>
                                                            <option value="none">Phoenix</option>
                                                        </select>
                                                    </label>
                                                </div>
                                                <i class="lni-map-marker"></i>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-xs-12">
                                            <div class="form-group">
                                                <div class="search-category-container">
                                                    <label class="styled-select">
                                                        <select>
                                                            <option>All Categories</option>
                                                            <option>Finance</option>
                                                            <option>IT & Engineering</option>
                                                            <option>Education/Training</option>
                                                            <option>Art/Design</option>
                                                            <option>Sale/Markting</option>
                                                            <option>Healthcare</option>
                                                            <option>Science</option>
                                                            <option>Food Services</option>
                                                        </select>
                                                    </label>
                                                </div>
                                                <i class="lni-layers"></i>
                                            </div>
                                        </div>
                                        <div class="col-lg-1 col-md-6 col-xs-12">
                                            <button type="submit" class="button"><i class="lni-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit ellentesque dignissim quam et
                 <br />
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
                                        <h3><a href="job-details.aspx?id=<%# Eval("JobID") %>"><%# Eval("Title") %></a></h3>
                                        <p class="brand"><%# Eval("Title") %></p>
                                        <div class="tags">
                                            <span><i class="lni-map-marker"></i>New York</span>
                                            <span><i class="lni-user"></i>John Smith</span>
                                        </div>
                                        <div class="tag mb-3"><i class="lni-tag"></i><%# Eval("Eligibility") %></div>
                                        <span class="full-time">Full Time</span>
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
                                            <img src="assets/img/testimonial/img1.png" alt="">
                                        </div>
                                    </div>
                                    <div class="content-inner">
                                        <p class="description">Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui.</p>
                                        <div class="author-info">
                                            <h2><a href="#">Jessica</a></h2>
                                            <span>Senior Accountant</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimonial-item">
                                    <div class="author">
                                        <div class="img-thumb">
                                            <img src="assets/img/testimonial/img2.png" alt="">
                                        </div>
                                    </div>
                                    <div class="content-inner">
                                        <p class="description">Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui.</p>
                                        <div class="author-info">
                                            <h2><a href="#">John Doe</a></h2>
                                            <span>Project Menager</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimonial-item">
                                    <div class="author">
                                        <div class="img-thumb">
                                            <img src="assets/img/testimonial/img3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="content-inner">
                                        <p class="description">Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui Morbi quam enim, cursus non erat pretium veh icula finibus ex stibulum venenatis viverra dui.</p>
                                        <div class="author-info">
                                            <h2><a href="#">Helen</a></h2>
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
                                    <img src="assets/img/logo-footer.png" alt="">
                                </div>
                                <div class="textwidget">
                                    <p>Sed consequat sapien faus quam bibendum convallis quis in nulla. Pellentesque volutpat odio eget diam cursus semper.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 col-xs-12">
                            <div class="widget">
                                <h3 class="block-title">Quick Links</h3>
                                <ul class="menu">
                                    <li><a href="aboutus.aspx">About Us</a></li>
                                    <li><a href="#">Support</a></li>
                                    <li><a href="#">License</a></li>
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
                                <form method="post" id="subscribe-form" name="subscribe-form" class="validate">
                                    <div class="form-group is-empty">
                                        <input type="email" value="" name="Email" class="form-control" id="EMAIL" placeholder="Enter Email..." required="">
                                        <button type="submit" name="subscribe" id="subscribes" class="btn btn-common sub-btn"><i class="lni-envelope"></i></button>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
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

        <!-- Go To Top Link -->
        <a href="#" class="back-to-top">
            <i class="lni-arrow-up"></i>
        </a>

        <!-- Preloader -->
        <div id="preloader">
            <div class="loader" id="loader-1"></div>
        </div>
        <!-- End Preloader -->


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

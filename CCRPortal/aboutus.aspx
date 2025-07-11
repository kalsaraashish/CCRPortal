﻿<%@ Page  Language="C#" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="CCRPortal.aboutus" %>



<!DOCTYPE html>
<html>
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
                              <img src="assets/img/logo.png" alt=""></a>
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
     <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sign In
         </a>
         <ul class="dropdown-menu">
             <li><a class="dropdown-item" href="login.aspx">Sign In for User</a></li>
             <li><a class="dropdown-item" href="/company/company_login.aspx">Company Sign In</a></li>
         </ul>
     </li>

 </ul>
                      </div>
                  </div>
              </div>
              <div class="mobile-menu" data-logo="assets/img/logo-mobile.png"></div>
          </nav>
          <!-- Navbar End -->

      </header>
      <!-- Header Section End -->

    <!-- Page Header Start -->
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-header">
                        <h3>About</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Main container Start -->
    <div class="about section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-xs-12">
                    <div class="about-content">
                        <h3>About Job Career</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est modi, saepe hic esse maxime quasi, sapiente ex debitis quis dolorum unde, neque quibusdam eveniet nobis enim porro repudiandae nesciunt quidem.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni delectus soluta adipisci beatae ullam quisquam, quia recusandae rem assumenda, praesentium porro sequi eaque doloremque tenetur incidunt officiis explicabo optio perferendis.</p>
                        <a href="#" class="btn btn-common">Learn More</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-xs-12">
                    <img class="img-fluid float-right" src="assets/img/about/img1.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Main container End -->

    <!-- Counter Section Start -->
    <section id="counter" class="section bg-gray">
        <div class="container">
            <div class="row">
                <!-- Start counter -->
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="counter-box">
                        <div class="icon"><i class="lni-home"></i></div>
                        <div class="fact-count">
                            <h3><span class="counter">800</span></h3>
                            <p>Jobs Posted</p>
                        </div>
                    </div>
                </div>
                <!-- End counter -->
                <!-- Start counter -->
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="counter-box">
                        <div class="icon"><i class="lni-briefcase"></i></div>
                        <div class="fact-count">
                            <h3><span class="counter">80</span></h3>
                            <p>All Companies</p>
                        </div>
                    </div>
                </div>
                <!-- End counter -->
                <!-- Start counter -->
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="counter-box">
                        <div class="icon"><i class="lni-pencil-alt"></i></div>
                        <div class="fact-count">
                            <h3><span class="counter">900</span></h3>
                            <p>Resumes</p>
                        </div>
                    </div>
                </div>
                <!-- End counter -->
                <!-- Start counter -->
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="counter-box">
                        <div class="icon"><i class="lni-save"></i></div>
                        <div class="fact-count">
                            <h3><span class="counter">1200</span></h3>
                            <p>Applications</p>
                        </div>
                    </div>
                </div>
                <!-- End counter -->
            </div>
        </div>
    </section>
    <!-- Counter Section End -->

    <!-- How It Work Section Start -->
    <section class="how-it-works section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">How It Works?</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit ellentesque dignissim quam et
                    <br>
                    metus effici turac fringilla lorem facilisis.</p>
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
    <section id="testimonial" class="section bg-gray">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Clients Review</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit ellentesque dignissim quam et
                    <br>
                    metus effici turac fringilla lorem facilisis.</p>
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

</form>
        <!-- Footer Section Start -->
    <footer>
    <!-- Footer Area Start -->
    <section class="footer-Content">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-xs-12">
                    <div class="widget">
                        <div class="footer-logo">
                            <img src="assets/img/logo-footer.png" alt=""></div>
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
                        <div method="post" id="subscribe-form" name="subscribe-form" class="validate">
                            <div class="form-group is-empty">
                                <input type="email" value="" name="Email" class="form-control" id="EMAIL" placeholder="Enter Email...">
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
                        <p>Designed and Developed by UIdeck</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->
</footer>
<!-- Footer Section End -->
</body>
</html>

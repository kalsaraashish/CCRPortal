<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CCRPortal.register" %>

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
    <link href="dist/sweetalert2.min.css" rel="stylesheet" />
    <link href="assets/css/loader.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/line-icons.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/owl.theme.default.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <script src="dist/sweetalert2.min.js"></script>
    <script type="text/javascript">
        function Successapply() {
            Swal.fire({
                title: "Registration successful.",
                text: "",
                icon: "success"
            });
        }
        function errormessage() {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Registration failed.",
                //footer: '<a href="#">Why do I have this issue?</a>'
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Loader Section -->
        <div id="loader">
            <div class="loader"></div>
            <div class="loading-text">Loading...</div>
        </div>
        <!-- Loader End -->

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
                            <h3>Register</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Content section Start -->
<section id="content" class="section-padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6 col-xs-12">
                <div class="page-login-form box">
                    <h3>Register</h3>

                    <!-- Show all errors here -->
                    <asp:ValidationSummary 
                        ID="vsRegister" 
                        runat="server" 
                        CssClass="text-danger mb-3"
                        HeaderText="Please fix the following errors:" 
                        ValidationGroup="reg" />

                    <div class="login-form">
                        <!-- Username -->
                        <div class="form-group">
                            User Name :
                            <div class="input-icon">
                                <i class="lni-user"></i>
                                <asp:TextBox runat="server" placeholder="Username" ID="username" class="form-control"></asp:TextBox>

                                <asp:RequiredFieldValidator 
                                    ID="rfvUsername" 
                                    runat="server" 
                                    ControlToValidate="username"
                                    ErrorMessage="Username is required"
                                    CssClass="text-danger"
                                    Display="Dynamic"
                                    ValidationGroup="reg" />
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="form-group">
                            Email :
                            <div class="input-icon">
                                <i class="lni-envelope"></i>
                                <asp:TextBox runat="server" ID="email" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>

                                <asp:RequiredFieldValidator 
                                    ID="rfvEmail" 
                                    runat="server" 
                                    ControlToValidate="email"
                                    ErrorMessage="Email is required"
                                    CssClass="text-danger"
                                    Display="Dynamic"
                                    ValidationGroup="reg" />

                                <asp:RegularExpressionValidator
                                    ID="revEmail"
                                    runat="server"
                                    ControlToValidate="email"
                                    ErrorMessage="Enter a valid email address"
                                    CssClass="text-danger"
                                    Display="Dynamic"
                                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                                    ValidationGroup="reg" />
                            </div>
                        </div>

                        <!-- Password -->
                        <div class="form-group">
                            Password :
                            <div class="input-icon">
                                <i class="lni-lock"></i>
                                <asp:TextBox runat="server" ID="pass" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>

                                <asp:RequiredFieldValidator 
                                    ID="rfvPassword" 
                                    runat="server" 
                                    ControlToValidate="pass"
                                    ErrorMessage="Password is required"
                                    CssClass="text-danger"
                                    Display="Dynamic"
                                    ValidationGroup="reg" />

                                <!-- Optional: min 6 characters -->
                                <asp:RegularExpressionValidator
                                    ID="revPassword"
                                    runat="server"
                                    ControlToValidate="pass"
                                    ErrorMessage="Password must be at least 6 characters"
                                    CssClass="text-danger"
                                    Display="Dynamic"
                                    ValidationExpression="^.{6,}$"
                                    ValidationGroup="reg" />
                            </div>
                        </div>

                        <!-- Branch -->
                        <div class="form-group">
                            Branch :
                            <div class="input-icon">
                                <i class="lni-graduation"></i>
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                    <asp:ListItem Text="-- Select Branch --" Value="" />
                                    <asp:ListItem Text="Computer Science (CSE)" Value="CSE" />
                                    <asp:ListItem Text="Information Technology" Value="IT" />
                                    <asp:ListItem Text="Electronics & Communication" Value="ECE" />
                                    <asp:ListItem Text="Electrical Engineering" Value="EE" />
                                    <asp:ListItem Text="Mechanical Engineering" Value="ME" />
                                    <asp:ListItem Text="Civil Engineering" Value="CE" />
                                    <asp:ListItem Text="MCA" Value="MCA" />
                                    <asp:ListItem Text="BCA" Value="BCA" />
                                    <asp:ListItem Text="Other" Value="Other" />
                                </asp:DropDownList>

                                <asp:RequiredFieldValidator
                                    ID="rfvBranch"
                                    runat="server"
                                    ControlToValidate="DropDownList1"
                                    InitialValue=""
                                    ErrorMessage="Please select a branch"
                                    CssClass="text-danger"
                                    Display="Dynamic"
                                    ValidationGroup="reg" />
                            </div>
                        </div>

                        <!-- Skills -->
                        <div class="form-group">
                            Skills :
                            <div class="input-icon">
                                <i class="lni-bolt"></i>
                                <asp:TextBox runat="server" ID="skills" class="form-control" placeholder="Skills" TextMode="MultiLine"></asp:TextBox>

                                <asp:RequiredFieldValidator
                                    ID="rfvSkills"
                                    runat="server"
                                    ControlToValidate="skills"
                                    ErrorMessage="Please enter your skills"
                                    CssClass="text-danger"
                                    Display="Dynamic"
                                    ValidationGroup="reg" />
                            </div>
                        </div>

                        <!-- Resume -->
                        <div class="form-group">
                            Upload Resume:
                            <div class="input-icon">
                                <i class="lni-cloud-upload"></i>
                                <asp:FileUpload ID="resume" runat="server" class="form-control" Style="cursor: pointer" />

                                <asp:RequiredFieldValidator
                                    ID="rfvResume"
                                    runat="server"
                                    ControlToValidate="resume"
                                    ErrorMessage="Please upload your resume"
                                    CssClass="text-danger"
                                    Display="Dynamic"
                                    ValidationGroup="reg" />
                            </div>
                        </div>

                        <!-- Submit -->
                        <asp:Button 
                            runat="server" 
                            class="btn btn-common log-btn" 
                            ID="sub" 
                            Text="Submit" 
                            OnClick="sub_Click"
                            ValidationGroup="reg" />
                    </div>

                    <ul class="form-links">
                        <li class="text-center"><a href="login.aspx">Already have an account?</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Content section End -->



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
    <!-- JS Files -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#loader").show();
        });

        $(window).on("load", function () {
            $("#loader").fadeOut(600);
        });
    </script>
</body>
</html>

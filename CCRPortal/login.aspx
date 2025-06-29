<%@ Page Title="" Language="C#" MasterPageFile="~/usertemplate.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CCRPortal.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-header">
                        <h3>Login</h3>
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
                        <h3>Login
                        </h3>
                        <div class="login-form">
                            <div class="form-group">
                                <div class="input-icon">
                                    <i class="lni-user"></i>
                                    <asp:TextBox runat="server" ID="username" placeholder="Username" class="form-control"></asp:TextBox>
                                    <%--<input type="text" id="sender-email"  name="email" >--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-icon">
                                    <i class="lni-lock"></i>
                                    <asp:TextBox runat="server" ID="pass" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <%--<input type="password" class="form-control" >--%>
                                </div>
                            </div>
                            <div class="form-group form-check">
                                 <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" />
                                <%--<input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
                                <label class="form-check-label" for="exampleCheck1">Keep Me Signed In</label>

                            </div>

                            <asp:Button runat="server" ID="btn" class="btn btn-common log-btn" Text="Submit" OnClick="Unnamed_Click" />
                        </div>
                        <ul class="form-links">
                            <li class="text-center"><a href="register.aspx">Don't have an account?</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Content section End -->

</asp:Content>

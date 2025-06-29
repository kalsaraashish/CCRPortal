<%@ Page Title="" Language="C#" MasterPageFile="~/usertemplate.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CCRPortal.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                        <div class="login-form">
                            <div class="form-group">User Name :
                                <div class="input-icon">
                                    <i class="lni-user"></i>
                                    <asp:TextBox runat="server" placeholder="Username" ID="username" class="form-control"></asp:TextBox>
                                    <%--<input type="text" id="sender-email"  name="email" >--%>
                                </div>
                            </div>
                            <div class="form-group">Email :
                                <div class="input-icon">
                                    <i class="lni-envelope"></i>
                                    <asp:TextBox runat="server" ID="email" class="form-control" placeholder="Email" TextMode="email"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="form-group">Password :
                                <div class="input-icon">
                                    <i class="lni-lock"></i>
                                    <asp:TextBox runat="server" ID="pass" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                   
                                </div>
                            </div>
                            <div class="form-group">Branch :
                                <div class="input-icon">
                                    <i class="lni-graduation"></i>
                                    <%--<asp:TextBox runat="server"  TextMode="Password"></asp:TextBox>--%>
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" >
                                        <asp:ListItem>mca</asp:ListItem>
                                        <asp:ListItem>bca</asp:ListItem>
                                        <asp:ListItem>mscit</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </div>
                            </div>
                            <div class="form-group">Skills :
                                <div class="input-icon">
                                    <i class="lni-bolt"></i>
                                    <asp:TextBox runat="server" ID="skills" class="form-control" placeholder="Skills" TextMode="MultiLine"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="form-group">Upload Resume:
                                <div class="input-icon">
                                    <i class="lni-cloud-upload"></i>
                                    <%--<asp:TextBox runat="server"  placeholder="Upload Resume"></asp:TextBox>--%>
                                    <asp:FileUpload ID="resume" runat="server" class="form-control" style="cursor:pointer" />
                                </div>
                            </div>
                            

                            <asp:Button runat="server" class="btn btn-common log-btn" ID="sub" Text="Submit" OnClick="sub_Click" />
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
    
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/company/companytemplate.Master" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="CCRPortal.company.PostJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Post_success() {
            Swal.fire({
                title: "Job posted successfully",
                text: "",
                icon: "success"
            });
        }
        function Post_error() {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Error posting job.ob with this title already exists for your company.",
                //footer: '<a href="#">Why do I have this issue?</a>'
            });
        }
        function error_exists() {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Job with this title already exists for your company.",
                //footer: '<a href="#">Why do I have this issue?</a>'
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-header">
                        <h3>Add Job</h3>
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
                        <h3>Add Job</h3>
                        <div class="login-form">
                            <div class="form-group">
                                Job Title :
                          <div class="input-icon">
                              <i class="lni-user"></i>
                              <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Job Title" />
                              <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                                  ErrorMessage="Job title is required" CssClass="text-danger" Display="Dynamic" />

                          </div>
                            </div>
                            <div class="form-group">
                                Discription :
                          <div class="input-icon">
                              <i class="lni-envelope"></i>
                              <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Discription" />
                              <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="txtDescription"
                                  ErrorMessage="Description is required" CssClass="text-danger" Display="Dynamic" />

                          </div>
                            </div>
                            <div class="form-group">
                                Eligibility :
                          <div class="input-icon">
                              <i class="lni-lock"></i>
                              <asp:TextBox ID="txtEligibility" runat="server" CssClass="form-control" placeholder="Eligibility" />
                              <asp:RequiredFieldValidator ID="rfvElig" runat="server" ControlToValidate="txtEligibility"
                                  ErrorMessage="Eligibility is required" CssClass="text-danger" Display="Dynamic" />
                          </div>
                            </div>

                            <div deadline="form-group">
                                Deadline :
                          <div class="input-icon">
                              <i class="lni-bolt"></i>
                              <asp:TextBox ID="txtDeadline" runat="server" CssClass="form-control" TextMode="Date" />
                              <asp:RequiredFieldValidator ID="rfvDeadline" runat="server" ControlToValidate="txtDeadline"
                                  ErrorMessage="Deadline is required" CssClass="text-danger" Display="Dynamic" />

                          </div>
                            </div>
                            <div class="form-group">
                                City :
                                <div class="input-icon">
                                    <i class="lni-lock"></i>
                                    <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" placeholder="City" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcity"
                                        ErrorMessage="City is required" CssClass="text-danger" Display="Dynamic" />
                                </div>
                            </div>
                            <div class="form-group">
                                Type Of Job :
                                <div class="input-icon">
                                    <i class="lni-graduation"></i>

                                    <asp:DropDownList ID="job_time_drp" runat="server" class="form-control">
                                        <asp:ListItem Text="-- Select Branch --" Value="" />
                                        <asp:ListItem Text="FULL-TIME" Value="FULL-TIME" />
                                        <asp:ListItem Text="PART-TIME" Value="PART-TIME" />
                                        <asp:ListItem Text="REMOTE" Value="REMOTE" />
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="form-group">
                                Expeted Salary :
                                <div class="input-icon">
                                    <i class="lni-graduation"></i>
                                    <asp:TextBox ID="ex_salary" runat="server" CssClass="form-control" placeholder="Expeted Salary" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ex_salary"
                                        ErrorMessage="Salary is required" CssClass="text-danger" Display="Dynamic" />
                                </div>
                            </div>

                            <div class="form-group">
                                Experience :
                                <div class="input-icon">
                                    <i class="lni-graduation"></i>
                                    <asp:TextBox ID="ex" runat="server" CssClass="form-control" placeholder="Experience" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ex"
                                        ErrorMessage="Experience is required" CssClass="text-danger" Display="Dynamic" />
                                </div>
                            </div>

                            <div class="form-group">
                                Upload Image:
                        <div class="input-icon">

                            <i class="lni-cloud-upload"></i>
                            <%--<asp:TextBox runat="server"  placeholder="Upload Resume"></asp:TextBox>--%>
                            <asp:FileUpload ID="jobimg" runat="server" class="form-control" Style="cursor: pointer" />
                        </div>
                            </div>


                            <asp:Button runat="server" class="btn btn-common log-btn" ID="sub" Text="Submit" OnClick="sub_Click" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Content section End -->

</asp:Content>

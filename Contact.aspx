<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mar"><!-- Map & Contact Details Row -->
        <div class="col-md-8 mar"><!-- Map Column -->
            <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2884.956248767017!2d-79.67192288429752!3d43.69067295802436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882b3ebc32e484f9%3A0x1e41ea2eec082561!2sData+Direct+Group+Inc.!5e0!3m2!1sen!2sca!4v1510770575792"></iframe>
        </div><!-- /Map Column -->
        <div class="col-md-4 mar"><!-- Contact Details Column -->
            <div class="greyp bgp">Contact Details</div>
            <div class="mar">
                <div class="mar"><strong>Address:<br></strong>Data Direct Group Inc.<br>1-2001 Drew Road<br>Mississauga, ON L5S 1S4</div>
                <div class="mar"><strong>Phone:<br></strong>(905) 564-0150</div>
                <div class="mar"><strong>Fax:<br></strong>(905) 564-7246</div>
                <div class="mar"><strong>E-mail:<br></strong><a href="mailto:info@datadirect.ca">info@datadirect.ca</a></div>
                <div class="mar"><strong>Shipping Time:<br></strong>Mon-Fri: 8:30 AM - 5:30 PM</div>
            </div>
        </div><!-- /Contact Details Column -->
    </div><!-- /Map & Contact Details Row -->
    <div class="row mar"><!-- Contact message Row -->
        <div class="col-md-4"><!-- Media Column -->
            <div class="greyp bgp">Media</div>
            <div id="albump" runat="server" class="mar">
                <a href="https://www.facebook.com/pg/Data-Direct-Group-191418960916721/photos/?tab=album&album_id=1666584286733507" target="_blank">Company Festivities December 2017</a>
                <br /><br /><br />            
            </div>
            <video width="100%" controls>
              <source src="videos/IMG_2992.MOV" type="video/mp4">
            </video>        
        </div><!-- /Media Column -->
        <div class="col-lg-8" >
            <div class="bluep bgp" >Send us a Message</div>
            <a id="message"></a>
                <p class="mar">Data Direct’s service goal is to ensure that you can reach someone the moment you need them.</p>
                <p id="messageSucess" runat="server" class="hidden"><span class="glyphicon glyphicon-check"></span> Thank you for messaging Data Direct Group Inc., We will get back to you as soon as possible.</p>
                <div id="contactForm" runat="server"><!-- Contact Us Form -->
                    <div class="control-group form-group"><!-- Full name -->
                        <label for="txtname" class="sr-only">Full Name</label>
                        <input id="txtname" runat="server" type="text" class="form-control cfocus" placeholder="Full Name" clientIdMode="static">
                        <p id="errname" class="alert alert-danger hidden myalert">Please enter your <b>name</b></p>
                    </div><!-- /Full name -->
                    <div class="control-group form-group"><!-- Company name -->
                        <label for="txtcompany" class="sr-only">Company Name</label>
                        <input id="txtcompany" runat="server" type="text" class="form-control cfocus" placeholder="Company Name (Optional)"  >
                    </div><!-- /Company name -->
                    <div class="control-group form-group"><!-- Email -->
                        <label for="txtemail" class="sr-only">Email</label>
                        <input id="txtemail" runat="server" type="text" class="form-control cfocus" placeholder="Email" clientIdMode="static" >
                        <p id="erremail" class="alert alert-danger hidden myalert">Please enter a <b>valid email</b></p>
                    </div><!-- /Email -->
                    <div class="control-group form-group"><!-- Subject -->
                        <label for="txtsubject" class="sr-only">Subject</label>
                        <input id="txtsubject" runat="server" type="text" class="form-control cfocus" placeholder="Subject (Optional)" >
                    </div><!-- /Subject -->
                    <div class="control-group form-group"><!-- Message -->
                        <label for="txtmessage" class="sr-only">Message</label>
                        <textarea id="txtmessage" runat="server" class="form-control cfocus" placeholder="Message" clientIdMode="static" rows="10" cols="100" maxlength="999" style="resize:none;"></textarea>
                        <p id="errmessage" class="alert alert-danger hidden myalert">Please enter a <b>message</b></p>
                    </div><!-- Message -->
                    <div class="control-group form-group"><!-- Captcha -->
                        <p id="errcaptcha" runat="server" class="alert alert-danger hidden myalert">You must check the captcha to be able to submit your message</p>
                        <div class="g-recaptcha" data-sitekey="6Lesz1YUAAAAAN9m3FE2dBnhidRzZvjrvlgcxJaL" data-theme="light"	></div>
<!--                        <div class="g-recaptcha" data-sitekey="6LfKvTgUAAAAAPtgM82Ix39DROQy8OAj5IHWUti4" data-theme="light"	></div> -->
                        <input type="hidden" runat="server" id="captcha_response" name="captcha_response" />
                    </div><!-- /Captcha -->
                    <asp:Button ID="btnSubmit" runat="server" OnClientClick="return myfun();" OnClick="btnSubmit_Click" Text="Send Message" class="btn btn-primary btn-block bluebtn bgbtn"/><br />
                </div><!-- /Contact Us Form -->
        </div><!-- /Message Column -->

    </div><!-- /Contact message Row -->
    <script >// script to validate the contact form
        function myfun() {
            //set error messages to hidden at the beginning
            document.getElementById("errname").classList.add('hidden');
            document.getElementById("erremail").classList.add('hidden');
            document.getElementById("errmessage").classList.add('hidden');
            document.getElementById("MainContent_errcaptcha").classList.add('hidden');

            //check if name is empty
            if (!document.getElementById("txtname").value) {
                document.getElementById("txtname").focus();
                document.getElementById("errname").classList.remove('hidden');
                grecaptcha.reset();
                return false;
            }

            //check if email is empty or invalid
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            if ((!document.getElementById("txtemail").value)||(reg.test(document.getElementById("txtemail").value)) == false) {
                document.getElementById("txtemail").focus();
                document.getElementById("erremail").classList.remove('hidden');
                grecaptcha.reset();
                return false;
            }

            //check if message is empty
            if (!document.getElementById("txtmessage").value) {
                document.getElementById("txtmessage").focus();
                document.getElementById("errmessage").classList.remove('hidden');
                grecaptcha.reset();
                return false;
            }

            //check if CAPTCHA is empty or invalid
            var res = grecaptcha.getResponse();
            if (res == "" || res == undefined || res.length == 0){
                document.getElementById("MainContent_errcaptcha").classList.remove('hidden');
                grecaptcha.reset();
                return false;
            }
            document.getElementById("MainContent_captcha_response").value = res;
        }
    </script><!-- /script to validate the contact form -->
</asp:Content>

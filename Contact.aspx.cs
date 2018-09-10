using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.IO;
using Facebook;
using Newtonsoft.Json.Linq;
using System.Windows;

public partial class Contact : Page
{
    ////facebook app data
    //string app_id = "199285407285493";
    //string app_secret = "d6c61757dcc6f18e5ae6efe7a16811b2";
    //string scope = "publish_actions,manage_pages,user_photos";
    //string access_token;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
//        string url = string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}","6LfKvTgUAAAAAL5N1HfwP0wR2UwHmatQ3vfQHzez",captcha_response.Value.ToString());
        string url = string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", "6Lesz1YUAAAAAEvOhV_5oLrsJ9AjrBa8fBEbbuVN", captcha_response.Value.ToString());
        HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
        bool success;
        using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
        {
            StreamReader reader = new StreamReader(response.GetResponseStream());
            string vals = reader.ReadToEnd();
            var obj = JObject.Parse(vals);
            success = (bool)obj["success"];
        }

        if (success)
        {
            //prepare the message
            var emailmsg = new MailMessage();
            if (txtemail.Value != "") emailmsg.From = new MailAddress(txtemail.Value.ToString());
            emailmsg.To.Add("info@datadirect.ca");
            emailmsg.To.Add(txtemail.Value.ToString());
            emailmsg.Subject = "Message From Website - " + txtsubject.Value.ToString();
            emailmsg.Body = "Name :" + txtname.Value.ToString();
            emailmsg.Body += "\r\n\r\nCompany :" + txtcompany.Value.ToString();
            emailmsg.Body += "\r\n\r\nEmail :" + txtemail.Value.ToString();
            emailmsg.Body += "\r\n\r\nMessage :" + txtmessage.Value.ToString();
            emailmsg.Body += "\r\n\r\nMessage was sent on " + DateTime.Now.ToString("dddd MMMM dd, yyyy") + " at " + DateTime.Now.ToString("hh:mm tt");

            //send the message
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "mail.datadirect.ca";
            smtp.Port = 25;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("info@datadirect.ca", "direct75ES1!");
            smtp.EnableSsl = false;
            smtp.Send(emailmsg);

            //show succes message and hide contact form
            messageSucess.Attributes["class"] = "alert alert-success";
            contactForm.Attributes["class"] = "hidden";
        }
        else
        {
            errcaptcha.Attributes["class"] = "alert alert-danger myalert";
        }
    }
}
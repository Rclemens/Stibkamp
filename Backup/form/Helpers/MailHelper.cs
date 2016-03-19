using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Configuration;
using System.Collections;

namespace form.Helpers
{
    public class MailHelper
    {
        /// <summary>
        /// Console App to send mails via Smtp
        /// </summary>
        public bool Send(String body,List<String> emails, String subject)
        {
            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress("Stibkamp@gmail.com");

                

                foreach (String email in emails)
                {
                    message.To.Add(email);
                }

                message.Subject = subject;
                message.Body = body;
                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.EnableSsl = true;

                client.Send(message);

                return true;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }

        }

        public List<String> GetStibMailFromConfig(bool IsOudsteKamp)
        {
            Hashtable dsh = new Hashtable();
            List<String> email = new List<String>();
            
            if (IsOudsteKamp)
            {
                dsh = (Hashtable)ConfigurationSettings.GetConfig("StibOudsteMails");
            }
            else
            {
                dsh = (Hashtable)ConfigurationSettings.GetConfig("StibJongsteMails");
            }

            foreach (String key in dsh.Keys)
            {
                email.Add(dsh[key].ToString());
            }

            return email;
        }
    }
}

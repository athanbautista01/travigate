using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Security.Cryptography;
using System.Net.Mail;

/// <summary>
/// Summary description for JAY
/// </summary>
public class JAY
{
	public JAY()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string GetCon()
    {
        return ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    }

    public static string CreateSHAHash(string Phrase)
    {
        SHA512Managed HashTool = new SHA512Managed();
        Byte[] PhraseAsByte = System.Text.Encoding.UTF8.GetBytes(string.Concat(Phrase));
        Byte[] EncryptedBytes = HashTool.ComputeHash(PhraseAsByte);
        HashTool.Clear();
        return Convert.ToBase64String(EncryptedBytes);
    }

    public static void SendEmail(string email, string subject, string message)
    {
        MailMessage emailMessage = new MailMessage();
        emailMessage.From = new MailAddress("jonathan.bautista@benilde.edu.ph", "Administrator");
        emailMessage.To.Add(new MailAddress(email));
        emailMessage.Subject = subject;
        emailMessage.Body = message;
        emailMessage.IsBodyHtml = true;
        emailMessage.Priority = MailPriority.Normal;
        SmtpClient MailClient = new SmtpClient("smtp.gmail.com", 587);
        MailClient.EnableSsl = true;
        MailClient.Credentials = new System.Net.NetworkCredential("jonathan.bautista@benilde.edu.ph", "athannahta01");
    }
}
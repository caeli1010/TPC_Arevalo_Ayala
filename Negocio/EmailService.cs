using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using System.Globalization;

namespace Negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;
        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("turnos@eugenio.com.ar", "frgp.maxiprograma");
            server.EnableSsl = true;
            //server.Port = 465;
            //server.Host = "a2plcpnl0294.prod.iad2.secureserver.net";
            server.Port = 587;
            server.Host = "mail.eugenio.com.ar";

        }
        public void armarCorreo( string emalDest, string asunto, string mensaje, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("no_reply@gmail.com");
            //email.From = new MailAddress("no_reply@webonear.com.ar");
            email.To.Add(emalDest);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = mensaje;
        }
        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}

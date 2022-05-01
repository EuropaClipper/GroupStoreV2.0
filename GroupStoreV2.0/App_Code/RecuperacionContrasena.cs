using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using Newtonsoft.Json;

public class RecuperacionContrasena
{
    public ETokenRecuperacion enviarTokenRecuperacion(string correo)
    {
        ETokenRecuperacion tokenRecuperacion = new ETokenRecuperacion();
        //si llega un true es porque no hay usuarios con ese correo
        //si llega false el correo si corresponde a una persona
        bool checkCorreo = new UsuarioDAO().correoDisponible(correo);
        if (!checkCorreo)
        {
            EUsuario usuario = new UsuarioDAO().ObtenerUsuarios().Where(x=> x.Correo.Equals(correo)).First();
            tokenRecuperacion = new TokenRecuperacionDAO().obtenerTokenUsuario(usuario);
            if(tokenRecuperacion == null)
            {
                tokenRecuperacion = new ETokenRecuperacion();
                tokenRecuperacion.CedulaUsuario = usuario.Cedula;
                tokenRecuperacion.FechaInicio = DateTime.Now;
                tokenRecuperacion.FechaCaducidad = tokenRecuperacion.FechaInicio.AddMinutes(30);
                tokenRecuperacion.TokenGenerado = encriptar(JsonConvert.SerializeObject(tokenRecuperacion));
                new TokenRecuperacionDAO().InsetarToken(tokenRecuperacion);
                string linkAcceso = "http://localhost:53226/View/VRecuperarContrasena.aspx?t=" +tokenRecuperacion.TokenGenerado;
                JsonConvert.DeserializeObject(JsonConvert.SerializeObject(tokenRecuperacion));
                enviarCorreoRecuperacion(usuario.Correo, linkAcceso);
                tokenRecuperacion.Msj_error = "Dirijase a su correo para continuar con la recuperación de contraseña";
            }
            else
            {
                tokenRecuperacion.Msj_error = "Ya se cuenta con una recuperación de contraseña activa. Espere a que se pueda realizar una nueva.";
            }
        }
        else
        {
            tokenRecuperacion.Msj_error = "Verifique que el correo sea el mismo con que se registró.";
        }
        return tokenRecuperacion;
    }
    private string encriptar(string input)
    {
        SHA256CryptoServiceProvider provider = new SHA256CryptoServiceProvider();
        byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        byte[] hashedBytes = provider.ComputeHash(inputBytes);
        StringBuilder output = new StringBuilder();
        for (int i = 0; i < hashedBytes.Length; i++)
            output.Append(hashedBytes[i].ToString("x2").ToLower());
        return output.ToString();
    }
    private void enviarCorreoRecuperacion(string correoDestino, string linkAcceso)
    {
        //informacion del correo que usará el aplicativo web
        string servidor = ConfigurationManager.AppSettings["ServidorCorreo"];
        int puerto = int.Parse(ConfigurationManager.AppSettings["PuertoCorreo"]);
        string correoOrigen = ConfigurationManager.AppSettings["CorreoOrigen"]; ;
        string contrasena = ConfigurationManager.AppSettings["ContrasenaCorreo"];
        //generación del correo y envío del mismo
        using (MailMessage mensaje = new MailMessage())
        {
            mensaje.To.Add(correoDestino);//destino del correo
            mensaje.From = new MailAddress(correoOrigen, "GroupStore");//correo de origen y nombre que se visualizará
            mensaje.Subject = "Recuperación de contraseña";//asunto del correo
            mensaje.Body = linkAcceso;
            mensaje.IsBodyHtml = true;
            using (SmtpClient smtp = new SmtpClient(servidor, puerto))
            {
                smtp.Credentials = new NetworkCredential(correoOrigen, contrasena);//credenciales de la cuenta de origen
                smtp.EnableSsl = true;
                smtp.Send(mensaje);//enviar correo
            }
        }
    }
}
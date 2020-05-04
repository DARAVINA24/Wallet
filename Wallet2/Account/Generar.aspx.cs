using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Wallet2.Models;
using System.IO;
using System.Security.Cryptography;
using System.Text;


namespace Wallet2.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }



        protected void Generar(object sender, EventArgs e)
        {
           
            TextReader leer = new StreamReader("C:\\winnt\\Wallet.txt");

            txthash.Visible = true;
            string hash = leer.ReadToEnd();
           
            string cadenaEncriptada = Encrypt.GetMD5(hash);

            txthash.Text = cadenaEncriptada;

            leer.Close();


           
        }



        public class Encrypt
        {
            public static string GetMD5(string str)
            {
                MD5 md5 = MD5CryptoServiceProvider.Create();
                ASCIIEncoding encoding = new ASCIIEncoding();
                byte[] stream = null;
                StringBuilder sb = new StringBuilder();
                stream = md5.ComputeHash(encoding.GetBytes(str));
                for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
                return sb.ToString();
            }
        }




    }


}
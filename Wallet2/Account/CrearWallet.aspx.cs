using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Wallet2.Models;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.IO;

namespace Wallet2.Account
{
    public partial class Register : Page
    {



        protected void Crear_Click(object sender, EventArgs e)
        {

            String palabra = palabras.Text;
            String correo = email.Text;
            DateTime fecha = DateTime.Now;
            String nombreArchivo = "Wallet";

            String tempRuta = "C:\\winnt\\" +nombreArchivo+".txt";

           if (File.Exists(tempRuta))
           {

               // ya tiene wallet este pendejo
               ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "El usuario ya posee una Wallet" + "');", true);
               return;
           }
           else
           {
               File.WriteAllText(tempRuta, palabra+"\r\n"+correo + "\r\n"+fecha);

               mtd_Limpia_AllInfo();

               ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Wallet Registrada con exito." + "');", true);


           }


        }


        protected void mtd_Limpia_AllInfo()
        {
            palabras.Text = "";
            email.Text = "";
           
        }

    }
}
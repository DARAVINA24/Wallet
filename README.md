Wallet .NET ASPX


Una billetera digital también conocida como " billetera electrónica " se refiere a un dispositivo electrónico , servicio en línea o programa de software que permite a una de las partes realizar transacciones electrónicas con otra parte que intercambia unidades de moneda digital por bienes y servicios . 

La Wallet fue desarrollada en .NET Framework 4.5, cuyo objetivo es realizar transacciones y consultar saldos mediante consumos a servicios Web que están   conectados en distintos servidores.


Para la construcción de la Wallet utilizamos diferentes librerías de .NET. que nos permiten la construcción de nuestra Wallet.
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
using Wallet2.Models.Request;
using System.Web.Script.Serialization;
using System.Net;
using System.Security.Cryptography;



Utilizamos 3 Métodos de consumo para poder realizar transacciones, creación de la Wallet y consultar los saldos del usuario.



Para poder realizar transacciones y validar la Wallet del usuario utilizamos el siguiente método.

  JavaScriptSerializer js = new JavaScriptSerializer();

                //serializamos el objeto
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                string json = Newtonsoft.Json.JsonConvert.SerializeObject(objectRequest);

                //peticion
                WebRequest request = WebRequest.Create(url);
                //headers
                request.Method = method;
                request.PreAuthenticate = true;
                request.ContentType = "application/json;charset=utf-8'";
                request.Timeout = 10000; //esto es opcional

                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    streamWriter.Write(json);
                    streamWriter.Flush();
                }

                var httpResponse = (HttpWebResponse)request.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    result = streamReader.ReadToEnd();

                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Respuesta del Api" + result + " Transaccion exitosa" + "');", true);
                    mtd_Limpia_AllInfo();
                    
                    
                    

Para poder consultar el saldo de la Wallet utilizamos una función de Query para poder consumir el servicio mediante un método GET.



        function ConsultarSaldo(Id_Wallet) {
            var url = "http://localhost:34003/api/consulta/" + Id_Wallet;
            $.getJSON(url).done(function (data) {

                $("input#MainContent_saldo").val(data.saldo);
            }).fail(function (error) {
                $("input#MainContent_saldo").val("");

            });
        };

        $("input#MainContent_consulta").on("click", function () {
            ConsultarSaldo($("input#MainContent_dir1").val());

        });
        
        
La estructura del JSON para el envió de información hacia los servicios Web es el siguiente.
Realizar Transacción.



{
  "dir1": "sample string 1",
  "dir2": "sample string 2",
  "dinero": "sample string 3"
}


Valida Wallet.
{
  "Origen": "sample string 1",
  "Palabras": "sample string 2",
  "email": "sample string 3",
  "hora_actual": "sample string 4",
  "hash_origen": "sample string 5"
}


Las URL para el consumo de los servicios son las siguientes.

http://localhost:34003/api/consulta

http://localhost:34003/api/transaccion

http://localhost:34003/api/persona

La URL donde estará montada nuestra Wallet es la siguiente.

https://wallet220200504202955.azurewebsites.net/



Para verificar las transacciones, nuestra Wallet consume el servicio del Coordinator y posteriormente este le retorna una respuesta información si la transacción fue exitosa o no.


    





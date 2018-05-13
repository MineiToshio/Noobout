using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SPE.Api.Proxys;
using System.Net;

namespace SPE.Api
{
    public class PagoEfectivo
    {
        public static string PublicPathContraparte;
        public static string PrivatePath;
        
        #region Metodos Nueva Modalidad1
        public static BEWSGenCIPResponseMod1 GenerarCIPMod1(BEWSGenCIPRequestMod1 request)
        {
            BEWSGenCIPResponseMod1 response = new BEWSGenCIPResponseMod1();
            using (var proxy = new WSCrypto())
            {
                proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                proxy.Proxy = WebProxy.GetDefaultProxy();
                proxy.Proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                request.Xml = request.Xml.Trim();
                request.Firma = proxy.Signer(request.Xml, ByteUtil.FileToByteArray(PrivatePath));
                request.Xml = proxy.EncryptText(request.Xml, ByteUtil.FileToByteArray(PublicPathContraparte));
                using (var proxyCIP = new Service())
                {
                    response = proxyCIP.GenerarCIPMod1(request);
                    if (response != null)
                        if (!String.IsNullOrEmpty(response.Xml))
                            response.Xml = proxy.DecryptText(response.Xml, ByteUtil.FileToByteArray(PrivatePath));
                }
            }
            return response;
        }
        public static BEWSConsultarCIPResponseMod1 ConsultarCIPsMod1(BEWSConsultarCIPRequestMod1 request)
        {
            BEWSConsultarCIPResponseMod1 response = new BEWSConsultarCIPResponseMod1();
            using (var proxy = new WSCrypto())
            {
                proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                proxy.Proxy = WebProxy.GetDefaultProxy();
                proxy.Proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                request.CIPS = request.CIPS.Trim();
                request.Firma = proxy.Signer(request.CIPS, ByteUtil.FileToByteArray(PrivatePath));
                request.CIPS = proxy.EncryptText(request.CIPS, ByteUtil.FileToByteArray(PublicPathContraparte));
                using (var proxyCIP = new Service())
                {
                    response = proxyCIP.ConsultarCIPMod1(request);
                    if (response != null)
                        if (!String.IsNullOrEmpty(response.XML))
                            response.XML = proxy.DecryptText(response.XML, ByteUtil.FileToByteArray(PrivatePath));
                }
            }
            return response;
        }
        public static BEWSElimCIPResponseMod1 EliminarCIPMod1(BEWSElimCIPRequestMod1 request)
        {
            BEWSElimCIPResponseMod1 response = new BEWSElimCIPResponseMod1();
            using (var proxy = new WSCrypto())
            {
                proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                proxy.Proxy = WebProxy.GetDefaultProxy();
                proxy.Proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                request.CIP = request.CIP.Trim();
                request.Firma = proxy.Signer(request.CIP, ByteUtil.FileToByteArray(PrivatePath));
                request.CIP = proxy.EncryptText(request.CIP, ByteUtil.FileToByteArray(PublicPathContraparte));
                using (var proxyCIP = new Service())
                {
                    response = proxyCIP.EliminarCIPMod1(request);
                }
            }
            return response;
        }
        public static BEWSActualizaCIPResponseMod1 ActualizarCIPMod1(BEWSActualizaCIPRequestMod1 request)
        {
            BEWSActualizaCIPResponseMod1 response = new BEWSActualizaCIPResponseMod1();
            using (var proxy = new WSCrypto())
            {
                proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                proxy.Proxy = WebProxy.GetDefaultProxy();
                proxy.Proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                request.CIP = request.CIP.Trim();
                request.Firma = proxy.Signer(request.CIP, ByteUtil.FileToByteArray(PrivatePath));
                request.CIP = proxy.EncryptText(request.CIP, ByteUtil.FileToByteArray(PublicPathContraparte));
                using (var proxyCIP = new Service())
                {
                    response = proxyCIP.ActualizarCIPMod1(request);
                    //if (response != null)
                    //    if (!String.IsNullOrEmpty(response.XML))
                    //        response.XML = proxy.DecryptText(response.XML, ByteUtil.FileToByteArray(PrivatePath));
                }
            }
            return response;
        }
        #endregion

        public static String DesenciptarTexto(String TextoEncriptado)
        {
            String response;
            using (var proxy = new WSCrypto())
            {
                proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                proxy.Proxy = WebProxy.GetDefaultProxy();
                proxy.Proxy.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                proxy.Url = System.Configuration.ConfigurationManager.AppSettings["SPE_WebServiceTest_WSCrypto"];
                response = proxy.DecryptText(TextoEncriptado, ByteUtil.FileToByteArray(PrivatePath));
            }
            return response;
        }
    }
}

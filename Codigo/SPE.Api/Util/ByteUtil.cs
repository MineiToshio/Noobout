using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace SPE.Api
{
    public class ByteUtil
    {
        public static string ByteArrayToStringHex(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString().ToUpper();
        }

        public static byte[] StringHexToByteArray(string hex)
        {
            int NumberChars = hex.Length;
            byte[] bytes = new byte[NumberChars / 2];
            for (int i = 0; i < NumberChars; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }

        public static byte[] StringToBytes(string hex)
        {
            return Encoding.GetEncoding("iso-8859-1").GetBytes(hex);
        }

        public static string BytesToString(byte[] ba)
        {
            return Encoding.GetEncoding("iso-8859-1").GetString(ba);
        }

        public static byte[] ObjectToArrayByte(object obj)
        {
            MemoryStream oMemoryStream = new MemoryStream();
            BinaryFormatter oBinaryFormatter = new BinaryFormatter();
            oBinaryFormatter.Serialize(oMemoryStream, obj);
            return oMemoryStream.ToArray();
        }
        public static Object ByteArrayToObject(byte[] arrBytes)
        {
            MemoryStream memStream = new MemoryStream();
            BinaryFormatter binForm = new BinaryFormatter();
            memStream.Write(arrBytes, 0, arrBytes.Length);
            memStream.Seek(0, SeekOrigin.Begin);
            Object obj = (Object)binForm.Deserialize(memStream);
            return obj;
        }
        public static bool ByteArrayToFile(string _FileName, byte[] _ByteArray)
        {
            try
            {
                System.IO.FileStream _FileStream = new System.IO.FileStream(_FileName, System.IO.FileMode.Create, System.IO.FileAccess.Write);
                _FileStream.Write(_ByteArray, 0, _ByteArray.Length);
                _FileStream.Close();

                return true;
            }
            catch (Exception _Exception)
            {
                Console.WriteLine("Exception caught in process: {0}", _Exception.ToString());
            }
            return false;
        }
        public static byte[] FileToByteArray(string _FileName)
        {
            byte[] _Buffer = null;

            try
            {
                System.IO.FileStream _FileStream = new System.IO.FileStream(_FileName, System.IO.FileMode.Open, System.IO.FileAccess.Read);
                System.IO.BinaryReader _BinaryReader = new System.IO.BinaryReader(_FileStream);
                long _TotalBytes = new System.IO.FileInfo(_FileName).Length;
                _Buffer = _BinaryReader.ReadBytes((Int32)_TotalBytes);
                _FileStream.Close();
                _FileStream.Dispose();
                _BinaryReader.Close();
            }
            catch (Exception _Exception)
            {
                Console.WriteLine("Exception caught in process: {0}", _Exception.ToString());
            }
            return _Buffer;
        }
    }
}

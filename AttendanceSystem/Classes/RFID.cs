using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace AttendanceSystem.Classes
{
    class RFID
    {
        short icdev = 0x0000;
        public String m_cardNo = String.Empty;

        #region

        [DllImport("kernel32.dll")]
        static extern void Sleep(int dwMilliseconds);

        [DllImport("MasterRD.dll")]
        static extern int lib_ver(ref uint pVer);

        [DllImport("MasterRD.dll")]
        static extern int rf_init_com(int port, int baud);

        [DllImport("MasterRD.dll")]
        static extern int rf_ClosePort();

        [DllImport("MasterRD.dll")]
        static extern int rf_beep(short icdev, byte delay);

        [DllImport("MasterRD.dll")]
        static extern int rf_light(short icdev, byte Ledcolor);

        [DllImport("MasterRD.dll")]
        static extern int rf_antenna_sta(short icdev, byte mode);

        [DllImport("MasterRD.dll")]
        static extern int rf_init_type(short icdev, byte type);

        [DllImport("MasterRD.dll")]
        static extern int rf_request(short icdev, byte mode, ref ushort pTagType);

        [DllImport("MasterRD.dll")]
        static extern int rf_anticoll(short icdev, byte bcnt, IntPtr pSnr, ref byte pRLength);

        [DllImport("MasterRD.dll")]
        static extern int rf_select(short icdev, IntPtr pSnr, byte srcLen, ref sbyte Size);

        [DllImport("MasterRD.dll")]
        static extern int rf_halt(short icdev);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_authentication2(short icdev, byte mode, byte secnr, IntPtr key);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_initval(short icdev, byte adr, Int32 value);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_increment(short icdev, byte adr, Int32 value);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_decrement(short icdev, byte adr, Int32 value);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_readval(short icdev, byte adr, ref Int32 pValue);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_read(short icdev, byte adr, IntPtr pData, ref byte pLen);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_write(short icdev, byte adr, IntPtr pData);

        [DllImport("MasterRD.dll")]
        static extern int rf_ul_select(short icdev, IntPtr pSnr, ref byte pRLength);

        [DllImport("MasterRD.dll")]
        static extern int rf_ul_write(short icdev, byte page, IntPtr pData);


        #endregion

        #region ByteHex
        public static String byteHEX(Byte ib)
        {
            String _str = String.Empty;
            try
            {
                char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
                'B', 'C', 'D', 'E', 'F' };
                char[] ob = new char[2];
                ob[0] = Digit[(ib >> 4) & 0X0F];
                ob[1] = Digit[ib & 0X0F];
                _str = new String(ob);
            }
            catch (Exception er)
            {
                //new Exception("对不起有错。");
                new Exception(er.Message);
            }
            return _str;

        }
        #endregion

        #region ToHexString

        public static string ToHexString(byte[] bytes)
        {
            String hexString = String.Empty;
            for (int i = 0; i < bytes.Length; i++)
                hexString += byteHEX(bytes[i]);

            return hexString;
        }

        #endregion

        #region getHexBitsValue

        public static byte GetHexBitsValue(byte ch)
        {
            byte sz = 0;
            if (ch <= '9' && ch >= '0')
                sz = (byte)(ch - 0x30);
            if (ch <= 'F' && ch >= 'A')
                sz = (byte)(ch - 0x37);
            if (ch <= 'f' && ch >= 'a')
                sz = (byte)(ch - 0x57);

            return sz;
        }

        #endregion


        #region ToDigitsBytes

        public static byte[] ToDigitsBytes(string theHex)
        {
            byte[] bytes = new byte[theHex.Length / 2 + (((theHex.Length % 2) > 0) ? 1 : 0)];
            for (int i = 0; i < bytes.Length; i++)
            {
                char lowbits = theHex[i * 2];
                char highbits;

                if ((i * 2 + 1) < theHex.Length)
                    highbits = theHex[i * 2 + 1];
                else
                    highbits = '0';

                int a = (int)GetHexBitsValue((byte)lowbits);
                int b = (int)GetHexBitsValue((byte)highbits);
                bytes[i] = (byte)((a << 4) + b);
            }

            return bytes;
        }

        #endregion

        public void ReadCard()
        {
            int status;
            // byte type = (byte)'A';//mifare one type is A 卡询卡方式为A
            byte mode = 0x26;  // Request the card which is not halted.
            ushort TagType = 0;
            byte bcnt = 0x04;//mifare 卡都用4, hold on 4
            IntPtr pSnr;
            byte len = 255;
            sbyte size = 0;

            pSnr = Marshal.AllocHGlobal(1024);

            //  byte[] szBytes = new byte[len];


            // for (int i = 0; i < 100; i++)

            // while (loopBreak)
            for (int i = 0; i < 2; i++)
            {
                //Application.DoEvents();
                // status = rf_antenna_sta(icdev, 0);//关闭天线 close antenna  
                // if (status != 0)                
                //     continue;

                //  Sleep(20);
                //  status = rf_init_type(icdev, type);
                //  if (status != 0)
                //      continue;

                //  Sleep(20);
                //  status = rf_antenna_sta(icdev, 1);//启动天线 Open antenna
                //  if (status != 0)
                //      continue;

                Sleep(200);     // After open the antenna, it needs about 50ms delay before request.
                status = rf_request(icdev, mode, ref TagType);//搜寻没有休眠的卡，request card  
                if (status != 0)
                    continue;

                status = rf_anticoll(icdev, bcnt, pSnr, ref len);//防冲突得到返回卡的序列号, anticol--get the card sn
                if (status != 0)
                    continue;

                status = rf_select(icdev, pSnr, len, ref size);//锁定一张ISO14443-3 TYPE_A 卡, select one card
                if (status != 0)
                    continue;

                byte[] szBytes = new byte[len];

                rf_light(icdev, 2);
                rf_beep(icdev, 10);


                for (int j = 0; j < len; j++)
                {
                    szBytes[j] = Marshal.ReadByte(pSnr, j);
                }

                m_cardNo = "";
                for (int q = 0; q < len; q++)
                {
                    m_cardNo += byteHEX(szBytes[q]);
                }

            
                Sleep(200);
                rf_light(icdev, 1);
   

                //txttest.Text = m_cardNo;

                break;
            }

            Marshal.FreeHGlobal(pSnr);
        }


        public int method_rf_init_com(string comport, int baud)
        {
            int port = Convert.ToInt32(comport.Replace("COM", ""));
            
           int status = rf_init_com(port, baud);
            return status;
        }


        
        

        public int method_rf_beep(byte delay)
        {
            return rf_beep(icdev, delay);
        }

        public int method_rf_light(byte ledcolor)
        {
            return rf_light(icdev, ledcolor);
        }

        public int method_close_port()
        {
            return rf_ClosePort();
        }

    }

}

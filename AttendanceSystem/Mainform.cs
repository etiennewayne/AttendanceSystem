using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SMSLibX;
using MySql.Data.MySqlClient;

using System.Runtime.InteropServices;
using AttendanceSystem.Classes;

namespace AttendanceSystem
{
    public partial class Mainform : Form
    {

        bool loopBreak = true;

        short icdev = 0x0000;
        String m_cardNo = String.Empty;

        bool isConnected;

        bool isModemOK;

        int id;

        string desc = "";

        ClassStudent student = new ClassStudent();
      
        DataTable dtStd = new DataTable();


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

        Login _frm;
        public Mainform(Login _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }

        private void Mainform_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (isConnected)
            {
                rf_ClosePort();
               // backgroundWorker1.CancelAsync();
               // threadSMS.CancelAsync();

                backgroundWorker1.Dispose();
                //threadSMS.Dispose();
            }
           
            _frm.Show();
        }

        private void Mainform_Load(object sender, EventArgs e)
        {
            //default baud = 115200
            con = Connection.con();
            con.Open();
            lblStripAYCode.Text = new ClassAcademicYear().getCurrentAYActive(con);
            con.Close();
            con.Dispose();


            cmbRemarks.SelectedIndex = 0;
            try
            {
                int port = Convert.ToInt16(Properties.Settings.Default.rfidPort.Replace("COM", "")), baud = 115200;
                int status = rf_init_com(port, baud);
                if (status == 0)
                {
                    // Box.infoBox("Device connected successfully.");
                    lblRFID.Text = "RFID : CONNECTED";
                    rf_beep(icdev, 10);
                    rf_light(icdev, 1);
                    isConnected = true;

                    //  Sleep(100);
                    button1_Click(sender, e);
                    lblStatus.Text = "READY TO SCAN.";
                }
                else
                {
                    lblRFID.Text = "RFID : NOT CONENCTED";
                    lblStatus.Text = "RFID ERROR";
                    lblStatus.ForeColor = Color.Red;
                    isConnected = false;
                    // rf_beep(icdev, 50);
                    //rf_beep(icdev, 10);
                }

                //threadSMS.RunWorkerAsync();

            }
            catch (Exception er) 
            {
                Box.errBox(er.Message);
                //throw;
            }
            
          
        }

        private void button1_Click(object sender, EventArgs e)
        {
            loopBreak = true;
            
            if (loopBreak)
                button1.Enabled = false;
            try
            {
                backgroundWorker1.RunWorkerAsync();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                // throw;
            }
          //  ReadCard();
            

        }

        void ReadCard()
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

            while (loopBreak)
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

                for (int q = 0; q < len; q++)
                {
                    m_cardNo += byteHEX(szBytes[q]);
                }

                if (lblStatus.InvokeRequired)
                {
                    lblStatus.Invoke(new MethodInvoker(delegate { lblStatus.Text = "SCANNING. PLEASE WAIT..."; }));
                }

                Sleep(200);
                rf_light(icdev, 1);

                if (txttest.InvokeRequired)
                {
                    txttest.Invoke(new MethodInvoker(delegate { txttest.Text = m_cardNo;
                       // txtDesc.Text = "test";
                        getData(m_cardNo, lblStripAYCode.Text);
                    }));
                    m_cardNo = String.Empty;
                    
                }
                
                if (lblStatus.InvokeRequired)
                {
                    lblStatus.Invoke(new MethodInvoker(delegate { lblStatus.Text = "READY TO SCAN."; }));
                }

                //txttest.Text = m_cardNo;

                // break;
            }

            Marshal.FreeHGlobal(pSnr);
        }
 
        private void button2_Click(object sender, EventArgs e)
        {
            // short icdev = 0x0000;

            //int status = rf_antenna_sta(icdev, 1);
            //if (status == 0)s
            //    Box.infoBox("Antenna OFF.");
            loopBreak = false;
            if (!loopBreak)
                button1.Enabled = true;
        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            ReadCard();
        }

        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            //if(!backgroundWorker1.IsBusy)
            //    txttest.Text = m_cardNo;
            Box.warnBox("RFID READER TURNED OFF!");
        }


        void getData(string rfid, string aycode)
        {
            pictureBox1.Image = null;
            dtStd.Clear();
            dtStd = student.dtStudent(rfid, aycode);
            if(dtStd.Rows.Count > 0)
            {
                id = (int)dtStd.Rows[0]["id"];
                txtStudentID.Text = Convert.ToString(dtStd.Rows[0]["studentID"]);
                txtLname.Text = Convert.ToString(dtStd.Rows[0]["lname"]);
                txtFname.Text = Convert.ToString(dtStd.Rows[0]["fname"]);
                txtMname.Text = Convert.ToString(dtStd.Rows[0]["mname"]);
                txtSex.Text = Convert.ToString(dtStd.Rows[0]["sex"]);
                txtGrade.Text =Convert.ToString(dtStd.Rows[0]["grade"]) + " - " + Convert.ToString(dtStd.Rows[0]["section"]);
               // txtProgram.Text = (string)dtStd.Rows[0]["progCode"];
               // txtDesc.Text = (string)dtStd.Rows[0]["progDesc"];
               // txtYearlvl.Text = Convert.ToString(dtStd.Rows[0]["yearlvl"]);
                student.studentImage(pictureBox1, dtStd, "img");

                //insert student logs for SMS
                //queue
                insertForSMS();
                id = 0;
            }
            else
            {
                clearFields();
               
            }
           
        }


        void clearFields()
        {
            txtStudentID.Text = "";
            txtLname.Text = "";
            txtFname.Text = "";
            txtMname.Text = "";
            txtSex.Text = "";
            txtGrade.Text = "";
            pictureBox1.Image = null;
           // txtProgram.Text = "";
          ////  txtDesc.Text = "";
            //txtYearlvl.Text = "";
            id = 0;
        }

        ClassSMS sms = new ClassSMS();

        private void threadSMS_DoWork(object sender, DoWorkEventArgs e)
        {
            try
            {
                sms.InitModem();
                sms.OpenModemCommunication();

                if (lblSMS.GetCurrentParent().InvokeRequired)
                {
                    lblSMS.GetCurrentParent().Invoke(new MethodInvoker(delegate
                    {
                        lblSMS.Text = "SMS : CONNECTED";
                        isModemOK = true;
                    }));
                }

                if (isModemOK)
                {
                    DataTable dt = new DataTable();
                    string mobileno, timelog, status, name, bodyMsg="";
                    int attlogid;

                    while (true)
                    {
                        dt.Clear();
                        using(MySqlConnection conn = new MySqlConnection())
                        {
                            MySqlCommand threadCmd;
                            conn.Open();
                            string threadQuery = "select * from vw_attlog where dateDay=?dDay and isSent=0 and ayCode=?aycode";
                            threadCmd = new MySqlCommand(threadQuery, conn);
                            threadCmd.Parameters.AddWithValue("?dDay", DateTime.Now.ToString("yyyy-MM-dd"));
                            MySqlDataAdapter aa = new MySqlDataAdapter(threadCmd);
                            aa.Fill(dt);
                            aa.Dispose();
                            threadCmd.Dispose();
                            conn.Close();
                        }


                        if (dt.Rows.Count > 0)
                        {
                            for (int row = 0; row < dt.Rows.Count; row++)
                            {
                                attlogid = Convert.ToInt32(dt.Rows[row]["attlogID"]);
                                mobileno = Convert.ToString(dt.Rows[row]["mobileNo"]);
                                timelog = Convert.ToString(dt.Rows[row]["datetimeLog"]);
                                status = Convert.ToString(dt.Rows[row]["remarks"]);
                                name = Convert.ToString(dt.Rows[row]["lname"]) + ", " + Convert.ToString(dt.Rows[row]["fname"]);

                                if (status == "IN")
                                {
                                    bodyMsg = "Your son/daughter ("+ name + ") has entered school premise @ " + timelog;
                                }
                                else if(status == "OUT"){
                                    bodyMsg = "As of " + timelog + ", " + name + " has left the school premise. PLEASE DO NOT REPLY.";
                                }

                                
                                sms.SendMessage(mobileno, bodyMsg, false);
                                updateIsSent(attlogid);
                                Sleep(5000);
                            }
                        }

                        Sleep(5000);
                    }
                }
            }
            catch (Exception er)
            {
                if (lblSMS.GetCurrentParent().InvokeRequired)
                {
                    lblSMS.GetCurrentParent().Invoke(new MethodInvoker(delegate 
                    {
                        isModemOK = false;
                        lblSMS.Text = "SMS : ERROR";
                        Box.errBox(er.Message);
                    }));
                }
                //throw;
            }
        }


        #region INSERTForSMS
        MySqlConnection con;
        MySqlCommand cmd;
        string query;
        void insertForSMS()
        {
            con = Connection.con();
            con.Open();
            query = "insert into attlog (id, remarks, academicYearID) values (?id, ?rmarks, (select academicyearID from academicyear where active=1))";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.Parameters.AddWithValue("?rmarks", cmbRemarks.Text.ToUpper().Trim());
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }
        #endregion


        void updateIsSent(int attlogid)
        {
            con = Connection.con();
            con.Open();
            query = "update attlog set isSent=1 where attlogID=?attid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?attid", attlogid);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }
        private void btnClear_Click(object sender, EventArgs e)
        {
            clearFields();
        }
    }
}

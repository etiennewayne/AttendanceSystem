using AttendanceSystem.Classes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using MySql.Data.MySqlClient;
using System.IO.Ports;
using System.Threading;
using System.Net;
using System.IO;

namespace AttendanceSystem
{
    public partial class SMSMainform : Form
    {
        // delegate Function();

        MySqlCommand cmd;
        MySqlConnection con;
        string query;

       ClassSMS sms;

        short portNo;
        //ClassCategory cat;


        List<string> listMobile = new List<string>();


        //AdministratorForm _frm;

        bool isSMSModemConnected;

        bool isLoop;


        List<string> listMobileNo = new List<string>();

        public SMSMainform()
        {
            InitializeComponent();
             sms = new ClassSMS(this);
            //this._frm = _frm;

           // cat = new ClassCategory();
            //listMobileNo.
        }


        //void getMobileNo(string category)
        //{
        //    con = Connection.con();
        //    con.Open();
        //    query = "select mobileNo from vw_phonebook where category = ?cat";
        //    cmd = new MySqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("?cat", category);
        //    MySqlDataReader dr = cmd.ExecuteReader();
        //    listMobile.Clear();
        //    while (dr.Read())
        //    {
        //        listMobile.Add(Convert.ToString(dr["mobileNo"]));
        //    }
        //    dr.Close();
        //    cmd.Dispose();
        //    con.Close();
        //    con.Dispose();
        //}


        //void queSMS()
        //{
        //    con = Connection.con();
        //    con.Open();
        //    query = "insert into msgs set msg=?msg, mobile=?mobile";
        //}

        private void btnSend_Click(object sender, EventArgs e)
        {
            //ClassSMS.s

            if (!isSMSModemConnected)
            {
                Box.warnBox("Please connect modem first.");
                return;
            }

            threadSendSMS.RunWorkerAsync();
           
        }


        void sendingFailed()
        {

        }

        private void SMSMainform_FormClosing(object sender, FormClosingEventArgs e)
        {
            isLoop = false;

            if (isSMSModemConnected)
            {
               
                sms.CloseModemCommunication();
                timerLate.Stop();
                timerTime.Stop();
            }

            Application.DoEvents();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            SMSBrowsePhonebook frm = new SMSBrowsePhonebook(this);
            frm.ShowDialog();
        }

        

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            PhoneBookMainform frm = new PhoneBookMainform();
            frm.ShowDialog();
        }

        private void SMSMainform_Load(object sender, EventArgs e)
        {
            timerTime.Start();
            timerLate.Start();
            txtModemLogs.AppendText("SYSTEM LOGS : ");
            try
            {
                getComPorts();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
               // throw;
            }


        }

        private void btnConnect_Click(object sender, EventArgs e)
        {

            //timerLate.Start();
            try
            {

                if(btnConnect.Text == "Connect")
                {
                    portNo = Convert.ToInt16(cmbSMSPort.Text.Replace("COM", ""));
                    btnConnect.Enabled = false;
                    btnConnect.Text = "Connecting...";
                    threadSMS.RunWorkerAsync();

                   
                }
                else if(btnConnect.Text == "Disconnect")
                {
                    btnConnect.Text = "Connect";
                    sms.CloseModemCommunication();
                    isSMSModemConnected = false;
                    txtModemLogs.AppendText(Environment.NewLine + "System : Modem Disconnected.");
                    isLoop = false;
                    threadSMS.Dispose(); ;
                   // timerLate.Stop();
                }
               
            }
            catch (Exception er)
            {
                isSMSModemConnected = false;
                btnConnect.Text = "Connect";
                btnConnect.Enabled = true;
                txtModemLogs.AppendText(Environment.NewLine + "System : ERROR : " + er.Message);
   
            }

        }

        void getComPorts()
        {
            string[] ports = SerialPort.GetPortNames();
            foreach (string port in ports)
            {
             
                cmbSMSPort.Items.Add(port);
            }
        }

        private void threadSMS_DoWork(object sender, DoWorkEventArgs e)
        {
            try
            {
                sms.s_port = portNo;
                sms.InitModem();
                sms.OpenModemCommunication();
              

                if (btnConnect.InvokeRequired)
                {
                    btnConnect.Invoke(new MethodInvoker(delegate
                    {
                        btnConnect.Text = "Disconnect";
                        btnConnect.Enabled = true;
                        isSMSModemConnected = true;
                        isLoop = true;
                        txtModemLogs.AppendText(Environment.NewLine + "System : Modem Connected Successfully.");

                    }));
                }


                if (isSMSModemConnected)
                {
                    DataTable dt = new DataTable();
                    string mobileno, timelog, status, name, bodyMsg = "";
                    int attlogid;


                       //////////
                       ////.////
                       /////////////
                       ///Dara ang LOOP SIGA KAG MATA!!!
                    while (isLoop)
                    {
                        dt.Clear();
                        using (MySqlConnection conn = new MySqlConnection(Connection.getConnectionString()))
                        {
                            MySqlCommand threadCmd;

                            //conn = Connection.con();
                            conn.Open();
                            string threadQuery = "select * from vw_attlog where dateDay=?dDay and isSent=0 and isExempted = 0";
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
                                mobileno = Convert.ToString(dt.Rows[row]["pMobileNo"]);
                                timelog = Convert.ToString(dt.Rows[row]["datetimeLog"]);
                                status = Convert.ToString(dt.Rows[row]["remarks"]);
                                name = Convert.ToString(dt.Rows[row]["lname"]) + ", " + Convert.ToString(dt.Rows[row]["fname"]);

                                if (status == "IN")
                                {
                                    bodyMsg = "Your son/daughter (" + name + ") has entered school premise @ " + timelog;
                                }
                                else if (status == "OUT")
                                {
                                    bodyMsg = "As of " + timelog + ", " + name + " megawas sa gate!. PLEASE DO NOT REPLY.";
                                }else if (status == "ABSENT")
                                {
                                    bodyMsg = "As of " + timelog + ", " + name + " recorded as absent as this day.";
                                }

                                txtModemLogs.Invoke(new MethodInvoker(delegate
                                {

                                    txtModemLogs.AppendText(Environment.NewLine + "System : Sending to " + mobileno + " ("+name+")");

                                }));

                                sms.SendMessage(mobileno, bodyMsg, false);
                                updateIsSent(attlogid);

                                txtModemLogs.Invoke(new MethodInvoker(delegate
                                {
                                    txtModemLogs.AppendText(Environment.NewLine + "System : Message sending sent.");
                                }));

                                Thread.Sleep(5000);
                            }
                        }

                        Thread.Sleep(5000);
                    }
                }
            }
            catch (Exception er)
            {
                txtModemLogs.Invoke(new MethodInvoker(delegate
                {

                    txtModemLogs.AppendText(Environment.NewLine + "System : ERROR : " + er.Message);
                    btnConnect.Enabled = true;
                    btnConnect.Text = "Connect";

                }));
               
            }
        } // threadSMS Do_Work method

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

        //private void btnSendHttp_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string html = string.Empty;
        //        string url = @"http://192.168.15.164:8090/SendSMS?username=et&password=et&phone=" + txtMobileNo.Text + "&message=" + txtMsg.Text;

        //        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        //        request.AutomaticDecompression = DecompressionMethods.GZip;

        //        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        //        using (Stream stream = response.GetResponseStream())
        //        using (StreamReader reader = new StreamReader(stream))
        //        {
        //            html = reader.ReadToEnd();
        //        }

        //        //Console.WriteLine(html);

        //        Box.infoBox(html);
        //    }
        //    catch (Exception er)
        //    {
        //        Box.errBox(er.Message);
        //        //throw;
        //    }
          
        //}

        private void threadSendSMS_DoWork(object sender, DoWorkEventArgs e)
        {
            try
            {
                txtModemLogs.Invoke(new MethodInvoker(delegate
                {
                    txtModemLogs.AppendText(Environment.NewLine + "System : Sending to " + txtMobileNo.Text);
                }));
                   
                int flag = sms.SendMessage(txtMobileNo.Text, txtMsg.Text, false);

                txtModemLogs.Invoke(new MethodInvoker(delegate
                {
                    txtModemLogs.AppendText(Environment.NewLine + "System : Message sending sent.");
                }));
              

            }
            catch (Exception er)
            {
                txtModemLogs.AppendText(Environment.NewLine + "System : ERROR :" + er.Message);
               // Box.errBox(er.Message//);

            }
        }

        public void MessageReceived(string msg, string mobileNo, string nTime)
        {
            //receive sms
            //Box.infoBox("Mobile No : " + mobileNo +"\nTime : " +nTime+ "\nMessage : " + msg);

            try
            {

                txtModemLogs.Invoke(new MethodInvoker(delegate
                {
                    txtModemLogs.AppendText(Environment.NewLine + "System : Message Received from : " +mobileNo + ". Message -> " + msg +".");
                }));


                string[] nMsg = msg.Split(' ');
                string pin = "";
                string totalMsg = "";

                pin = nMsg[0];

                for (int i = 0; i < nMsg.Length - 1; i++)
                {
                    totalMsg += nMsg[i + 1] + " ";
                }

                if(counterWrongPIN(mobileNo) > 2)
                {
                    txtModemLogs.Invoke(new MethodInvoker(delegate
                    {
                        txtModemLogs.AppendText(Environment.NewLine + "System : Counter of wrong PIN -> " + counterWrongPIN(mobileNo).ToString());
                    }));
                    return;
                }

                if (String.IsNullOrEmpty(pin) || isValidPIN(pin, mobileNo) == false)
                {
                    txtModemLogs.Invoke(new MethodInvoker(delegate
                    {
                        txtModemLogs.AppendText(Environment.NewLine + "System : Received PIN is : " + pin + " and it is invalid. System sending response to " + mobileNo);
                    }));

                    sms.SendMessage(mobileNo, "Sorry, Invalid PIN.", false);

                    txtModemLogs.Invoke(new MethodInvoker(delegate
                    {
                        txtModemLogs.AppendText(Environment.NewLine + "System : Message sending sent.");
                    }));

                }
                else
                {
                    //if valid process the message.
                    //Box.infoBox("PIN : " + pin + "\n" + totalMsg.Trim());
                    foreach(string mobile in listNo(pin))
                    {
                        txtModemLogs.Invoke(new MethodInvoker(delegate
                        {
                            txtModemLogs.AppendText(Environment.NewLine + "System : Sending message to : " + mobile + ". Your message is : " + totalMsg.Trim());
                        }));
                        sms.SendMessage(mobile, totalMsg.Trim(), false);

                        txtModemLogs.Invoke(new MethodInvoker(delegate
                        {
                            txtModemLogs.AppendText(Environment.NewLine + "System : Message sending sent. Thread Sleep 3 sec.");
                        }));
                        Thread.Sleep(3000);
                    }

                }

               
            }
            catch (Exception er)
            {
                txtModemLogs.Invoke(new MethodInvoker(delegate
                {
                    txtModemLogs.AppendText(Environment.NewLine + "System : ERROR :" + er.Message);
                }));
                    
                // throw;
            }
           
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtModemLogs.Text = "";
            txtModemLogs.AppendText("SYSTEM LOGS : ");
        }


        bool isValidPIN(string pin, string no)
        {
            bool flag = true;
            con = Connection.con();
            con.Open();
            query = "select * from users where pin = ?pin";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?pin", pin);
            MySqlDataReader dr = cmd.ExecuteReader();
            flag = dr.Read();
            dr.Close();
            cmd.Dispose();

            if (!flag)
            {
                query = "insert into wrongpin set mobileNo=?no, nDate = curdate()";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?no", no);
                cmd.ExecuteNonQuery();
            }

            con.Close();
            con.Dispose();
            return flag;
        }

        int counterWrongPIN(string no)
        {
            bool flag = true;
            con = Connection.con();
            con.Open();
            query = "select count(*) from wrongpin where mobileNo = ?no and nDate = curdate()";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?no", no);
            int ctr = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return ctr;
        }

        //int teacherID(string pin)
        //{
        //    int tid = 0;

        //    con = Connection.con();
        //    con.Open();
        //    query = "select * from users where pin = ?pin";
        //    cmd = new MySqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("?pin", pin);
        //    MySqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        tid = Convert.ToInt32(dr["userID"]);
        //    }
        //    dr.Close();
        //    cmd.Dispose();
        //    con.Close();
        //    con.Dispose();

        //    return tid;

        //}

        

        List<string> listNo(string pin)
        {

            List<string> list = new List<string>();
            string pos = "";
            MySqlDataReader dr;

            con = Connection.con();
            con.Open();
            query = "select * from vw_users where pin = ?pin";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?pin", pin);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
               pos = Convert.ToString(dr["position"]);
               
               // list.Add(Convert.ToString(dr["mobileNo"]));
            }
            dr.Close();
            cmd.Dispose();

            if (pos.ToLower() == "principal")
            {
                query = "select * from vw_users where position='TEACHER'";
                cmd = new MySqlCommand(query, con);
               // cmd.Parameters.AddWithValue("?pin", pin);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                     list.Add(Convert.ToString(dr["mobileNo"]));
                }
                dr.Close();
                cmd.Dispose();
            }

            if (pos.ToLower() == "teacher")
            {
                query = "select * from vw_studentlists where pin = ?pin";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?pin", pin);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                     list.Add(Convert.ToString(dr["mobileNo"]));
                }
                dr.Close();
                cmd.Dispose();
            }


            con.Close();
            con.Dispose();

            return list;

        }

        private void timerLate_Tick(object sender, EventArgs e)
        {

            List<int> absentStudentID = new List<int>();

            TimeSpan now = DateTime.Now.TimeOfDay;
            TimeSpan lateTime = new TimeSpan(8, 0, 0); //9 o'clock
            TimeSpan lateTimeMax = new TimeSpan(8, 1, 0);

            if (now >= lateTime && now < lateTimeMax)
            {
                txtModemLogs.AppendText(Environment.NewLine + "System : Collecting absent students, Attempting to send them now...");
                con = Connection.con();
                con.Open();
                query = @"proc_absentstudents";
                cmd = new MySqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
               
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    absentStudentID.Add(Convert.ToInt32(dr["id"]));
                }

                cmd.Dispose();
                con.Close();
                con.Dispose();

                if (absentStudentID.Count > 0)
                {
                    con = Connection.con();
                    con.Open();
                    query = "insert into attlog set id=?id, remarks='ABSENT', isSent=0, academicyearID=(select academicyearID from academicyear where active=1)";
                    cmd = new MySqlCommand(query, con);
                    foreach (int IDAbsent in absentStudentID)
                    {
                        txtModemLogs.AppendText(Environment.NewLine + "System : Absent student : " + Convert.ToString(IDAbsent));
                        cmd.Parameters.AddWithValue("?id", IDAbsent);
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                    }

                    cmd.Dispose();
                    con.Close();
                    con.Dispose();
                }
                else
                {
                    txtModemLogs.AppendText(Environment.NewLine + "System : No absent students collected.");
                }//end count list 
            }

            //FOR PM
            //
            absentStudentID.Clear();
           
            TimeSpan pmnow = DateTime.Now.TimeOfDay;
            TimeSpan pmlateTime = new TimeSpan(13, 30, 0); //9 o'clock
            TimeSpan pmlateTimeMax = new TimeSpan(13, 31, 0);

            if (pmnow >= pmlateTime && now < pmlateTimeMax)
            {
                txtModemLogs.AppendText(Environment.NewLine + "System : Collecting absent students, Attempting to send them now...");
                con = Connection.con();
                con.Open();
                query = @"proc_absentstudents";
                cmd = new MySqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                absentStudentID = new List<int>();
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    absentStudentID.Add(Convert.ToInt32(dr["id"]));
                }

                cmd.Dispose();
                con.Close();
                con.Dispose();

                if (absentStudentID.Count > 0)
                {
                    con = Connection.con();
                    con.Open();
                    query = "insert into attlog set id=?id, remarks='ABSENT', isSent=0, academicyearID=(select academicyearID from academicyear where active=1)";
                    cmd = new MySqlCommand(query, con);
                    foreach (int IDAbsent in absentStudentID)
                    {
                        txtModemLogs.AppendText(Environment.NewLine + "System : Absent student : " + Convert.ToString(IDAbsent));
                        cmd.Parameters.AddWithValue("?id", IDAbsent);
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                    }

                    cmd.Dispose();
                    con.Close();
                    con.Dispose();
                }
                else
                {
                    txtModemLogs.AppendText(Environment.NewLine + "System : No absent students collected.");
                }//end count list

            }//time comparison


        } // end timer tick

        private void timerTime_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString("HH:mm:ss tt");
        }
    }
}


// .
//.
// .
//  .
//   .
//
//
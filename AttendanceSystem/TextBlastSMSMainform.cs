using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using AttendanceSystem.Classes;
using MySql.Data.MySqlClient;



namespace AttendanceSystem
{
    public partial class TextBlastSMSMainform : Form
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        ClassSMS sms;
        ClassPosition cat;

        List<string> listMobileNo;

        //bool isSMSModemConnected;

        bool sendingProcess = false;

        int last_id = 0;

        DataTable dataToSend = new DataTable();

        public TextBlastSMSMainform()
        {
            InitializeComponent();

            sms = new ClassSMS();
            listMobileNo = new List<string>();
            cat = new ClassPosition();
        }


        void getMobileNo(string category)
        {

            string ayCode = Helper.getActiveAYCode();

            con = Connection.con();
            con.Open();
            if (rdoPhonebook.Checked)
            {
                query = "select mobileNo from vw_phonebook where category = ?cat";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?cat", category);
            }
            else
            {
                query = "select mobileNo from vw_aystudents where ayCode = ?code";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?code", ayCode);
            }
           
            
            MySqlDataReader dr = cmd.ExecuteReader();
            listMobileNo.Clear();
            while (dr.Read())
            {
                listMobileNo.Add(Convert.ToString(dr["mobileNo"]));
                //Box.infoBox(Convert.ToString(dr["mobileNo"]));
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }



        private void TextBlastSMSMainform_Load(object sender, EventArgs e)
        {

            cat.allInComboBox(cmbCategory);

            lblSMSNo.Text = "0";
            lblSMSSent.Text = "0";

            rdoPhonebook.Checked = true;


        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            PhoneBookMainform frm = new PhoneBookMainform();
            
            if (rdoStudent.Checked)
            {
                frm.isStudentActive = true;
            }
          
            frm.ShowDialog();
        }

        private void TextBlastSMSMainform_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (sendingProcess)
            {
                Box.warnBox("Sending SMS is on process.");
                e.Cancel = true;
            }

            //if (isSMSModemConnected)
            //{
            //    sms.CloseModemCommunication();
            //}

            //Application.DoEvents();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {

            if (String.IsNullOrEmpty(txtSubject.Text))
            {
                Box.warnBox("Please input subject.");
                return;
            }

            if (String.IsNullOrEmpty(txtMsg.Text))
            {
                Box.warnBox("Please input message.");
                return;
            }

            if(rdoPhonebook.Checked == true)
            {
                if(cmbCategory.Text == "")
                {
                    Box.warnBox("Please select category.");
                    cmbCategory.Focus();
                    return;
                }
            }



            dataToSend.Clear();

            
            getMobileNo(cmbCategory.Text);
            processSave();
            
            Box.infoBox("Message will be send later.");
            sendMessages();


        }

        void sendMessages()
        {
            try
            {
                threadSendSMS.RunWorkerAsync();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
               // throw;
            }
           
        }

        void processSave()
        {
            MySqlTransaction trans = null;
            con = Connection.con();
            con.Open();

            trans = con.BeginTransaction();

            try
            {
                query = "insert into msgs_parent (subject, subjectDesc) values (?subj, ?subjdesc)";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?subj", txtSubject.Text);
                cmd.Parameters.AddWithValue("?subjdesc", txtSubjectDesc.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                last_id = Helper.returnLastInsertID(con);
                cmd.Dispose();

                query = "insert into msgs (msg, mobile, msgparentID) values (?msgs, ?mobile, ?msgid)";
                cmd = new MySqlCommand(query, con);
                foreach (string mobileNo in listMobileNo)
                {
                    cmd.Parameters.AddWithValue("?msgs", txtMsg.Text);
                    cmd.Parameters.AddWithValue("?mobile", mobileNo);
                    cmd.Parameters.AddWithValue("?msgid", last_id);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }

                trans.Commit();
                cmd.Dispose();
            }
            catch (Exception er)
            {
                Box.errBox("An error occured. Saving data will now rollback." + er.Message);
                try
                {
                    trans.Rollback();
                }
                catch (MySqlException ex)
                {
                    Box.errBox("An exception of type " + ex.GetType() +" was encountered while attempting to roll back the transaction.");
                    //throw;
                }
            }

           
           
            con.Close();
            con.Dispose();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            //try
            //{

            //    if (btnConnect.Text == "Connect")
            //    {
            //        sms.InitModem();
            //        sms.OpenModemCommunication();
            //        Box.infoBox("Modem Connected!");
            //        btnConnect.Text = "Disconnect";
                  
            //        isSMSModemConnected = true;
            //    }
            //    else if (btnConnect.Text == "Disconnect")
            //    {
            //        btnConnect.Text = "Connect";
            //        sms.CloseModemCommunication();
            //        isSMSModemConnected = false;
            //        Box.infoBox("Modem Disconnected!");
            //    }

            //}
            //catch (Exception er)
            //{
            //    Box.errBox(er.Message);
            //    isSMSModemConnected = false;
            //    btnConnect.Text = "Connect";
                // throw;
           // }
        }


        int tobeSent()
        {
            try
            {
                
                con = Connection.con();
                con.Open();
                query = "select * from msgs where msgparentID=?id";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?id", last_id);
                //i = Convert.ToInt32(cmd.ExecuteScalar());
                MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
                adptr.Fill(dataToSend);
                adptr.Dispose();
                cmd.Dispose();
                con.Close();
                con.Dispose();
                return dataToSend.Rows.Count;

            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
                return 0;
            }
        }

        int sentMsg()
        {
            try
            {
                int i = 0;
                con = Connection.con();
                con.Open();
                query = "select count(*) from msgs where msgparentID=?id and isSent=1";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?id", last_id);
                i = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.Dispose();
                con.Close();
                con.Dispose();
                return i;

            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
                return 0;
            }
        }

        void markSent(int msgid)
        {
            try
            {
                
                con = Connection.con();
                con.Open();
                query = "update msgs set isSent = 1 where msgsID=?id";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?id", msgid);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                con.Dispose();
                

            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
               
            }
        }

        private void threadSendSMS_DoWork(object sender, DoWorkEventArgs e)
        {
            sms.InitModem();
            sms.OpenModemCommunication();
            Box.infoBox("Message Start sending...!");
            sendingProcess = true;

            lblSMSNo.Invoke(new MethodInvoker(delegate
            {
                lblSMSNo.Text = Convert.ToString(tobeSent());
                lblSMSSent.Text = Convert.ToString(sentMsg());
            }));

           


            for(int i=0; i < dataToSend.Rows.Count; i++)
            {
                string mobileno = Convert.ToString(dataToSend.Rows[i]["mobile"]);
                string msg = Convert.ToString(dataToSend.Rows[i]["msg"]);
                int msgsID = Convert.ToInt32(dataToSend.Rows[i]["msgsID"]);
                sms.SendMessage(mobileno, msg, true);
                markSent(msgsID);
                lblSMSSent.Invoke(new MethodInvoker(delegate
                {
                    lblSMSSent.Text = Convert.ToString(sentMsg());
                }));

                Thread.Sleep(2000);
                
            }

            sendingProcess = false;
            sms.CloseModemCommunication();
        }

        private void rdoStudent_CheckedChanged(object sender, EventArgs e)
        {
            if(rdoStudent.Checked == true)
            {
                cmbCategory.Enabled = false;
            }
        }

        private void rdoPhonebook_CheckedChanged(object sender, EventArgs e)
        {
            if(rdoPhonebook.Checked == true)
            {
                cmbCategory.Enabled = true;
            }
        }
    }
}

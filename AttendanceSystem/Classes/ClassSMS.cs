using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SMSLibX;
//using SMSLibXImp;
using MySql.Data.MySqlClient;

namespace AttendanceSystem.Classes
{
    class ClassSMS
    {
        //MySqlConnection con;
        //MySqlCommand cmd;
        //string query;

        /*
 * Represents the GSM modem
 */
        private  SMSModem s_modem = null;

        public string modemStatus = "";

        private GSMModemTypeConstants s_type = GSMModemTypeConstants.gsmModemCustom; // modem type (see SMSLibX Help)
                                                                                     //private short s_port;
                                                                                     //private short s_port = Convert.ToInt16(Properties.Settings.Default.smsPort.Replace("COM", ""));                    // serial COM port number

        private string s_dest = "";                  // phone number for sent message (ex.+393481234567)
        private string s_body = "Hello World!";      // text for sent message





        // private short s_port;

        SMSMainform _frm;


        public ClassSMS()
        {
            //this._frm = _frm;
        }

        public ClassSMS(SMSMainform _frm)
        {
            this._frm = _frm;
        }


        public short s_port { set; get; }
      
       
        public void InitModem()
        {
            // create modem instance
            s_modem = new SMSModem();

            // add event handlers to the modem instance
            __SMSModem_NewStatusEventHandler newStatusEventHndr = new __SMSModem_NewStatusEventHandler(onNewStatus);
            __SMSModem_StatusReportEventHandler statusReportEventHndr = new __SMSModem_StatusReportEventHandler(onStatusReport);
            __SMSModem_MessageReceivedEventHandler msgReceivedEventHndr = new __SMSModem_MessageReceivedEventHandler(onMessageReceived);
            s_modem.NewStatus += newStatusEventHndr;
            s_modem.StatusReport += statusReportEventHndr;
            s_modem.MessageReceived += msgReceivedEventHndr;

            // start logging
            s_modem.LogTrace = true;

            s_modem.AutoDelete = true;
        }




        public void onNewStatus(SMSModemStatusConstants status)
        {
            // Console.WriteLine("<async> MODEM STATUS {0}", status);
            modemStatus = status.ToString();
        }

        /*
         * Handler for StatusReport Event
         * (raised when a new SMS-SR status report is received by the modem)
         */
        public void onStatusReport(ref SMSStatusReport statusReport)
        {
            //Console.WriteLine("<async> Status report for msg({0}): {1}", statusReport.MessageRef, statusReport.MessageStatusName);
        }

        /*
         * Handler for MessageReceived Event
         * (raised when a new SMS-MO message is received by the modem)
         */
        public void onMessageReceived(ref SMSDeliver deliver)
        {
            GSMAddress orig = deliver.Originator;
            //Box.infoBox(deliver.Body);
            if(_frm != null)
                _frm.MessageReceived(deliver.Body, orig.ToString, deliver.Timestamp.ToString());

            
            //deliver.de
            //Console.WriteLine("<async> Received msg from {0} at {1}: '{2}'", orig.ToString, deliver.Timestamp, deliver.Body);
        }


        /*
   * Open modem communication
   */
        public void OpenModemCommunication()
        {
            string smsc = "";
            short timeout = 60;
            bool unregMode = false;
            SMSModemNotificationConstants notifyMode = SMSModemNotificationConstants.smsNotifyAll;
            // received messages and other events MUST BE NOTIFIED by the modem to this application

            //Console.WriteLine("Opening modem communication...");

            s_modem.OpenComm(s_type, s_port, smsc, notifyMode, timeout, unregMode);

           // Console.WriteLine("...OK");
        }

        public int SendMessage(string dest, string body, bool statusReportReq)
        {
            //Console.WriteLine("Sending msg to {0}...", dest);

            int refID = s_modem.SendTextMessage(dest, body, statusReportReq);
            return refID;
            //Console.WriteLine("...sent msg({0}) to {1}: '{2}'...", refID, dest, body);
        }


        public void CloseModemCommunication()
        {
           // Console.WriteLine("Closing modem communication...");

            s_modem.CloseComm();

           // Console.WriteLine("...OK");
        }




    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using AttendanceSystem.Classes;

namespace AttendanceSystem
{
    public partial class AdministratorForm : Form
    {
        bool isSMSModemConnected;
        //ClassSMS sms;


        Login _frm;
        public AdministratorForm(Login _frm)
        {
            InitializeComponent();
            this._frm = _frm;
            //sms = new ClassSMS();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            

        }

        private void AdministratorForm_FormClosing(object sender, FormClosingEventArgs e)
        {

            //if (isSMSModemConnected)
            //{
            //    sms.CloseModemCommunication();
            //}

            //Application.DoEvents();


            _frm.Show();
        }

        private void toolStripAccount_Click(object sender, EventArgs e)
        {
            UserMainform frm = new UserMainform();
            frm.ShowDialog();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            ProgramsMainform frm = new ProgramsMainform();
            frm.ShowDialog();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            GradeMainform frm = new GradeMainform();
            frm.ShowDialog();
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            SectionMainform frm = new SectionMainform();
            frm.ShowDialog();
        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {


           
        }


        private bool CheckOpened(string name)
        {
            FormCollection fc = Application.OpenForms;

            foreach (Form frm in fc)
            {
                if (frm.Name == name)
                {
                    return true;
                }
            }
            return false;
        }


        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            ManagePortMainform frm = new ManagePortMainform();
            frm.ShowDialog();
        }

        private void toolStripAcademicYear_Click(object sender, EventArgs e)
        {
            AcademicYear frm = new AcademicYear();
            frm.ShowDialog();

        }

        private void toolStripValidateStudent_Click(object sender, EventArgs e)
        {
            
        }

        private void toolStripButton7_Click(object sender, EventArgs e)
        {
            PhoneBookMainform frm = new PhoneBookMainform();
            frm.ShowDialog();
        }

        private void AdministratorForm_Load(object sender, EventArgs e)
        {
            timer1.Start();//try
            //{
            //    sms.InitModem();
            //    sms.OpenModemCommunication();
            //    Box.infoBox("Modem Connected!!");
            //    isSMSModemConnected = true;
            //}
            //catch (Exception er)
            //{
            //    Box.errBox(er.Message);
            //    isSMSModemConnected = false;
            //    // throw;
            //}
            lblUser.Text = Properties.Settings.Default.username.ToUpper();

        }

        private void sendMessageToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (CheckOpened("SMSMainform"))
            {
                Application.OpenForms["SMSMainform"].BringToFront();
            }
            else
            {
                //SMSMainform frm = new SMSMainform(this);
                SMSMainform frm = new SMSMainform();
                frm.Show();
            }
        }

        private void textBlastToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (CheckOpened("TextBlastSMSMainform"))
            {
                Application.OpenForms["TextBlastSMSMainform"].BringToFront();
            }
            else
            {
                TextBlastSMSMainform frm = new TextBlastSMSMainform();
                frm.Show();
            }
        }


        //private void toolStripSplitButton2_ButtonClick(object sender, EventArgs e)
        //{
        //    if (CheckOpened("RoomsMainform"))
        //    {
        //        Application.OpenForms["RoomsMainform"].BringToFront();
        //    }
        //    else
        //    {
        //        RoomsMainform frm = new RoomsMainform();
        //        frm.Show();
        //    }
        //}

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (CheckOpened("RoomsMainform"))
            {
                Application.OpenForms["RoomsMainform"].BringToFront();
            }
            else
            {
                RoomsMainform frm = new RoomsMainform();
                frm.Show();
            }
        }

        private void btnMenuStudent_Click(object sender, EventArgs e)
        {

            if (CheckOpened("StudentMainform"))
            {
                Application.OpenForms["StudentMainform"].BringToFront();
            }
            else
            {
                StudentMainform frm = new StudentMainform();
                frm.Show();
            }

        }

        private void btnMenuValidateStudent_Click(object sender, EventArgs e)
        {
   
            if (CheckOpened("VerificationStudents"))
            {
                Application.OpenForms["VerificationStudents"].BringToFront();
            }
            else
            {
                //SMSMainform frm = new SMSMainform(this);
                VerificationStudents frm = new VerificationStudents();
                frm.Show();
            }
        }

        private void toolStripButton1_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString("hh:mm:ss tt");

            //label1.Text = DateTime.Now.ToString("HH:mm:ss");

           

        }

        private void toolStripReport_Click(object sender, EventArgs e)
        {
           
         
            if (CheckOpened("ReportsMonitoring"))
            {
                Application.OpenForms["ReportsMonitoring"].BringToFront();
            }
            else
            {
                //SMSMainform frm = new SMSMainform(this);
                Reports.ReportsMonitoring frm = new Reports.ReportsMonitoring();
                frm.Show();
            }
        }


        //public void sendMessage(string mobile, string msg)
        //{
        //    try
        //    {
        //        int flag = sms.SendMessage(mobile, msg,false);
        //    }
        //    catch (Exception er)
        //    {
        //        Box.errBox(er.Message);
        //        //throw;
        //    }
        //}


    }
}

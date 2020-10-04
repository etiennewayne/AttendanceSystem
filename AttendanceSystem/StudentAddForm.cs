using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using AttendanceSystem.Classes;
using MySql.Data.MySqlClient;
using AttendanceSystem.Teacher;

namespace AttendanceSystem
{
    public partial class StudentAddForm : Form
    {

        MySqlConnection con;
       // MySqlCommand cmd;
       // string query;

        ClassStudent std;
        ClassGrade cGrade;
        ClassSection cSection;
        Programs cProgram;
        RFID rfid = new RFID();

        OpenFileDialog open;

        public int id;

        bool isRFIDConnect = false;

        StudentMainform _frm;

        string tempMobile, tempParentMobile, tempRFID;
       

        //public StudentAddForm()
        //{
        //    InitializeComponent();
        //}

        public StudentAddForm(StudentMainform _frm)
        {
            InitializeComponent();
            std = new ClassStudent();
            cGrade = new ClassGrade();
            cSection = new ClassSection();
            cProgram = new Programs();
            open = new OpenFileDialog();

            this._frm = _frm;

       
        }

        public virtual void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtRFID.Text))
            {
                if(!Box.questionBox("No RFID inputted. Do you want to continue?", "NO RFID!"))
                {
                    txtRFID.Focus();
                    return;
                }
              
            }

            if (String.IsNullOrEmpty(txtStudentID.Text))
            {
                Box.warnBox("Please input Student ID.");
                txtStudentID.Focus();
                return;
            }


            if (String.IsNullOrEmpty(txtlname.Text))
            {
                Box.warnBox("Please input Lastname.");
                txtlname.Focus();
                return;
            }

            if (String.IsNullOrEmpty(txtfname.Text))
            {
                Box.warnBox("Please input Firstname.");
                txtfname.Focus();
                return;
            }


            //if (String.IsNullOrEmpty(cmbGrade.Text) && String.IsNullOrEmpty(cmbProgram.Text))
            //{
            //    Box.warnBox("Please input Grade or Program.");
            //   // cmbGrade.Focus();
            //    return;
            //}

            if (!txtContact.MaskFull)
            {
                Box.warnBox("Please input contact no.");
                return;
            }

            if (!txtParentsContact.MaskFull)
            {
                Box.warnBox("Please input parent contact no.");
                return;
            }


            if (txtContact.Text == txtParentsContact.Text)
            {
                Box.warnBox("Student mobile number cannot be the same with parents mobile no.");
                return;
            }

            if (id == 0)
            {
                if (Helper.isExist("student", "rfid", txtRFID.Text.Trim()))
                {
                    Box.warnBox("RFID already in used.");
                    return;
                }

                if (Helper.isExist("student", "mobileNo", txtContact.Text.Trim()) || Helper.isExist("users", "mobileNo", txtContact.Text.Trim()))
                {
                    Box.warnBox("Mobile Number already in used.");
                    return;
                }
            }

            if (id > 0)
            {
                if(tempRFID != txtRFID.Text)
                {
                    if (Helper.isExist("student", "rfid", txtRFID.Text.Trim()))
                    {
                        Box.warnBox("RFID already in used.");
                        return;
                    }
                }

                if(tempMobile != txtContact.Text)
                {
                    if (Helper.isExist("student", "mobileNo", txtContact.Text.Trim()) || Helper.isExist("users", "mobileNo", txtContact.Text.Trim()))
                    {
                        Box.warnBox("Mobile Number already in used.");
                        return;
                    }
                }

                if (tempParentMobile != txtParentsContact.Text)
                {
                    if (Helper.isExist("student", "pMobileNo", txtContact.Text.Trim()) || Helper.isExist("users", "mobileNo", txtContact.Text.Trim()))
                    {
                        Box.warnBox("Mobile Number already in used.");
                        return;
                    }
                }

            }
        

            try
            {
                processSave();

                if(_frm.GetType() == typeof(StudentMainform))
                    _frm.loaddata();


                //if (_frm.GetType() == typeof(StudentList))
                //    stdListForm.LoadData();
            }
            catch (Exception er)
            {

                // throw;
                Box.errBox(er.Message);
            }
        }


        public void processSave()
        {
            if (id > 0)
            {
                con = Connection.con();
                con.Open();
                passDataAllFields();
                std.update(con, id);
                con.Close();
                con.Dispose();
                Box.infoBox("Data successfully updated.");
            }
            else
            {
                con = Connection.con();
                con.Open();
                passDataAllFields();
                if (std.insert(con) > 0)
                {
                    id = Helper.returnLastInsertID(con);
                    Box.infoBox("Data successfully saved.");
                }

                con.Close();
                con.Dispose();
            }
        }


        void passDataAllFields()
        {
            //PASS DATA TO ALL FIELDS
            std.rfid = txtRFID.Text.Trim();
            std.studentID = txtStudentID.Text.Trim();
            std.lrn = txtLRN.Text.Trim();
            std.lname = txtlname.Text.Trim();
            std.fname = txtfname.Text.Trim();
            std.mname = txtmname.Text.Trim();
            std.sex = cmbSex.Text.Trim();
            std.grade = cmbGrade.Text.Trim();
            std.section = cmbSection.Text.Trim();
           //std.program = cmbProgram.Text.Trim();
            //std.yearlvl = Convert.ToInt32(txtyrlvl.Text.Trim());
            std.mobileNo = txtContact.Text.Trim();
            std.pmobileNo = txtParentsContact.Text.Trim();
            std.guardian = txtguardian.Text;
            std.picBox = picStudent;

            if (checkExempted.Checked)
            {
                std.exempted = 1;
            }
            else
            {
                std.exempted = 0;
            }
        }

        //void getComPorts()
        //{
        //    string[] ports = SerialPort.GetPortNames();
        //    foreach (string port in ports)
        //    {
        //        ///Console.WriteLine(port);
        //        cmbPort.Items.Add(port);
        //    }
        //}

        private void StudentAddForm_Load(object sender, EventArgs e)
        {
            try
            {
                //getComPorts();

              //  lblStatus.Text = "NOT READY";
              //  lblStatus.ForeColor = Color.Red;

                con = Connection.con();
                con.Open();
                cGrade.populateComboGrade(con, cmbGrade);
               
               // cProgram.populateCombo(con, cmbProgram);
                con.Close();
                con.Close();


                if (id > 0)
                {
                    getData();
                }
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
               // throw;
            }
        }


        public void getData()
        {
            DataTable dt = new DataTable();
            dt = std.dtStudent(id);
            if (dt.Rows.Count>0)
            {
                tempRFID = txtRFID.Text = Convert.ToString(dt.Rows[0]["rfid"]);
                txtStudentID.Text = Convert.ToString(dt.Rows[0]["studentID"]);
                txtLRN.Text = Convert.ToString(dt.Rows[0]["lrn"]);
                txtlname.Text = Convert.ToString(dt.Rows[0]["lname"]);
                txtfname.Text = Convert.ToString(dt.Rows[0]["fname"]);
                txtmname.Text = Convert.ToString(dt.Rows[0]["mname"]);
                cmbSex.Text = Convert.ToString(dt.Rows[0]["sex"]);
                cmbGrade.Text = Convert.ToString(dt.Rows[0]["grade"]);
                cmbSection.Text = Convert.ToString(dt.Rows[0]["section"]);
             //  cmbProgram.Text = Convert.ToString(dt.Rows[0]["progCode"]);
              //  txtyrlvl.Text = Convert.ToString(dt.Rows[0]["yearlvl"]);
               tempMobile = txtContact.Text = Convert.ToString(dt.Rows[0]["mobileNo"]);
               tempParentMobile = txtParentsContact.Text = Convert.ToString(dt.Rows[0]["pMobileNo"]);
                txtguardian.Text = Convert.ToString(dt.Rows[0]["guardian"]);
                std.studentImage(picStudent, dt, "img");
            }

        }
        private void cmbGrade_SelectedIndexChanged(object sender, EventArgs e)
        {
            con = Connection.con();
            con.Open();
            cSection.populateCombo(con, cmbSection, cmbGrade.Text);
            con.Close();
            con.Dispose();
        }

        private void cmbProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            con = Connection.con();
            con.Open();
            //txtProgramDesc.Text=cProgram.getProgramDesc(con, cmbProgram.Text);
            con.Close();
            con.Dispose();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label6_Click(object sender, EventArgs e)
        {
            cmbGrade.SelectedIndex = -1;
        }

       
       
        private void btnScan_Click(object sender, EventArgs e)
        {

            try
            {
                //int rfidport = Convert.ToInt32(Properties.Settings.Default.rfidPort.Replace("COM",""));
                if (rfid.method_rf_init_com(Properties.Settings.Default.rfidPort, 115200) == 0)
                {
                    // rfid.method_rf_beep(10);
                    // rfid.method_rf_light(1);
                    isRFIDConnect = true;
                }

                if (isRFIDConnect)
                {
                    rfid.ReadCard();
                    // rfid.method_rf_beep(10);
                    txtRFID.Text = rfid.m_cardNo;
                    rfid.method_close_port();


                }
                else
                {
                    Box.warnBox("No RFID Connected.");
                }
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);

                //throw;
            }
            
           
        }

        //private void toolStripButton1_Click(object sender, EventArgs e)
        //{
        //    //if(cmbPort.Text == "")
        //    //{
        //    //    Box.warnBox("Please select COM PORT");
        //    //    cmbPort.Focus();
        //    //    return;
        //    //}

        //    try
        //    {
        //        if (toolStripButton1.Text == "CONNECT")
        //        {
        //            string comport = Properties.Settings.Default.rfidPort;
        //            Box.infoBox(comport);
        //            if (rfid.method_rf_init_com(comport, 115200) == 0)
        //            {
        //                rfid.method_rf_beep(10);
        //                rfid.method_rf_light(1);
        //                lblStatus.ForeColor = Color.Green;
        //                lblStatus.Text = "RFID CONNECTED";
        //                toolStripButton1.Text = "DISCONNECT";
        //                isRFIDConnect = true;
        //            }
        //        }
        //        else
        //        {
        //            rfid.method_close_port();
        //            lblStatus.ForeColor = Color.Red;
        //            lblStatus.Text = "NOT READY";
        //            toolStripButton1.Text = "CONNECT";
        //            isRFIDConnect = false;
        //        }
        //    }
        //    catch (Exception er)
        //    {
        //        Box.errBox(er.Message);
        //       // throw;
        //    }

            
           
        //}

        private void StudentAddForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (isRFIDConnect)
            {
                rfid.method_close_port();
            }
          
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            clear();
        }

        void clear()
        {
            id = 0;
            txtRFID.Text = "";
            
            txtStudentID.Text = "";
            txtLRN.Text = "";
            txtlname.Text = "";
            txtfname.Text = "";
            txtmname.Text = "";
            txtmname.Text = "";
            cmbSex.SelectedIndex = -1;
            cmbSection.SelectedIndex = -1;
            cmbGrade.SelectedIndex = -1;
            //  cmbProgram.SelectedIndex = -1;
            //  txtProgramDesc.Text = "";
            //  txtyrlvl.Text = "";
            txtguardian.Text = "";
            txtContact.Text = "";
            picStudent.Image = null;
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {

            try
            {
                open.InitialDirectory = "C:\\Users\\...\\Pictures";
                open.Filter = "JPG Files (*.jpg)|*.jpg";
                open.Title = "Select Picture";
                open.FilterIndex = 1;
                //open.ShowDialog();

                if (open.ShowDialog() == DialogResult.OK)
                {
                    //  imgpath = open.FileName.ToString();
                    //  pictureBox1.ImageLocation = imgpath;
                    // Box.infoBox(open.SafeFileName.ToString());
                    picStudent.ImageLocation = open.FileName.ToString();
                }
                else
                {
                    // Box.warnBox("User cancel upload");
                }
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


        }

      
    }
}

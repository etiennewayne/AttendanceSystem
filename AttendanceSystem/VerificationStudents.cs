using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using AttendanceSystem.Classes;
using MySql.Data.MySqlClient;



namespace AttendanceSystem
{
    public partial class VerificationStudents : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        int id;

        RFID rfid = new RFID();
        ClassStudent std = new ClassStudent();

        bool isRFIDConnect = false;

        public VerificationStudents()
        {
            InitializeComponent();
        }

        private void VerificationStudents_Load(object sender, EventArgs e)
        {
            Helper.LoadCmb("select distinct(ayCode) from academicyear order by ayCode asc", cmbAY);
            cmbAY.Text =  Helper.getActiveAYCode();


        }

        void getData()
        {
            DataTable dt = new DataTable();
            dt = std.dtStudent(txtRFID.Text);
            if (dt.Rows.Count > 0)
            {
                //txtRFID.Text = Convert.ToString(dt.Rows[0]["rfid"]);
                id = Convert.ToInt32(dt.Rows[0]["id"]);
                txtStudentID.Text = Convert.ToString(dt.Rows[0]["studentID"]);
                //txtLRN.Text = Convert.ToString(dt.Rows[0]["lrn"]);
                txtLname.Text = Convert.ToString(dt.Rows[0]["lname"]);
                txtFname.Text = Convert.ToString(dt.Rows[0]["fname"]);
                txtMname.Text = Convert.ToString(dt.Rows[0]["mname"]);
                txtSex.Text = Convert.ToString(dt.Rows[0]["sex"]);
                txtGrade.Text = Convert.ToString(dt.Rows[0]["grade"]);
                txtSection.Text = Convert.ToString(dt.Rows[0]["section"]);
            //    txtProgram.Text = Convert.ToString(dt.Rows[0]["progCode"]);
           //     txtDesc.Text = Convert.ToString(dt.Rows[0]["progDesc"]);
               // txtYearlvl.Text = Convert.ToString(dt.Rows[0]["yearlvl"]);
                txtguardian.Text = Convert.ToString(dt.Rows[0]["guardian"]);
                // txtc.Text = Convert.ToString(dt.Rows[0]["mobileNo"]);
                std.studentImage(picStudent, dt, "img");
            }
            else
            {
                clear();
                
            }

        }

        void clear()
        {
            id = 0;
            txtStudentID.Text = "";
            txtLname.Text = "";
            txtRFID.Text = "";
            txtFname.Text = "";
            txtMname.Text = "";
            txtSex.Text = "";
            txtGrade.Text = "";
            txtSection.Text = "";
         //   txtProgram.Text = "";
        //    txtDesc.Text = "";
            //txtYearlvl.Text = "";
            txtguardian.Text = "";
            picStudent.Image = null;
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

                    getData();
                }
                else
                {
                    Box.warnBox("No RFID Connected.");
                }
            }
            catch (Exception duerme)
            {
                Box.errBox(duerme.Message);
                //throw;
            }
           
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtRFID.Text))
            {
                Box.warnBox("Please scan a card.");
                return;
            }

            if (String.IsNullOrEmpty(txtStudentID.Text))
            {
                Box.warnBox("No student found.");
                return;
            }

            if (isAlreadyValidated())
            {
                Box.warnBox("Already validated.");
                return;
            }
            processSave();
        }

        void processSave()
        {
            con = Connection.con();
            con.Open();

            int ayid = new ClassAcademicYear().getID(con, cmbAY.Text);

            query = "insert into ay_students set id=?id, academicyearID=?ayid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.Parameters.AddWithValue("?ayid", ayid);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            Box.infoBox("Student validated successfully.");
            clear();
        }


        bool isAlreadyValidated()
        {
            con = Connection.con();
            con.Open();

            int ayid = new ClassAcademicYear().getID(con, cmbAY.Text);

            query = "select * from ay_students where id=?id and academicyearID=?ayid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.Parameters.AddWithValue("?ayid", ayid);
            MySqlDataReader dr = cmd.ExecuteReader();
            bool flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return flag;
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AYStudentsList frm = new AYStudentsList();
            frm.ShowDialog();
        }

        private void txtRFID_KeyDown(object sender, KeyEventArgs e)
        {

            //for testing purpose only
            if(e.KeyCode == Keys.Enter)
            {
                getData();
            }
        }

 

        //string get


    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using AttendanceSystem.Classes;



namespace AttendanceSystem.Teacher
{
    public partial class StudentList : Form
    {
        MySqlCommand cmd;
        MySqlConnection con;
        string query;


        ClassStudentList student;
        ClassAcademicYear ac = new ClassAcademicYear();

        public StudentList()
        {
            InitializeComponent();
            student = new ClassStudentList();
        }

        public void LoadData()
        {
            flx.AutoGenerateColumns = false;
            flx.DataSource = student.StudentList(Properties.Settings.Default.userID, cmbAcademicYear.Text.Trim(), txtlname.Text, txtfname.Text);
        }

        private void StudentList_Load(object sender, EventArgs e)
        {
            try
            {
                ac.comboAcademicYear(cmbAcademicYear);

                con = Connection.con();
                con.Open();
                cmbAcademicYear.Text =  ac.getCurrentAYActive(con);
                con.Close();
                con.Dispose();

                LoadData();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
               // throw;
            }
            //Box.infoBox(Properties.Settings.Default.userID.ToString());
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                LoadData();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                // throw;
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                int id = Convert.ToInt32(flx[flx.RowSel,"id"]);
                StudentUpdate frm = new StudentUpdate(this, id);
              //  frm.myid = id;
                frm.ShowDialog();
            }
            else
            {
                Box.warnBox("No data found.");
            }
        }
    }
}

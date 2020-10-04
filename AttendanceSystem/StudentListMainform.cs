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
    public partial class StudentListMainform : Form
    {

        MySqlCommand cmd;
        MySqlConnection con;
        string query;

        public int roomid;
        public int teacherid;



        ClassAcademicYear ac = new ClassAcademicYear();
        ClassPhonebookTeacher teacher = new ClassPhonebookTeacher();
        ClassStudentList studentList = new ClassStudentList();

        public StudentListMainform()
        {
            InitializeComponent();
        }

        private void StudentListMainform_Load(object sender, EventArgs e)
        {

            try
            {
                ac.comboAcademicYear(cmbAcademicYear);
                teacher.getTeacher(teacherid);


                con = Connection.con();
                con.Open();
                cmbAcademicYear.Text = ac.getCurrentAYActive(con);
                con.Dispose();
                con.Dispose();

                txtTeacher.Text = teacher.Fullname;

                LoadData();

            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        public void LoadData()
        {
            flx.AutoGenerateColumns = false;
            flx.DataSource = studentList.StudentList(teacherid, cmbAcademicYear.Text.Trim());
        }

        private void studentListToolStripMenuItem_Click(object sender, EventArgs e)
        {
            btnAdd_Click(sender, e);
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            StudentListAdd frm = new StudentListAdd(this);
            frm.roomid = roomid;
            frm.ShowDialog();
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
                //throw;
            }
        }
    }
}

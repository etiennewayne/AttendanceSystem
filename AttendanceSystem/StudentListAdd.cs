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
    public partial class StudentListAdd : Form
    {

        MySqlCommand cmd;
        MySqlConnection con;
        string query;


        ClassAcademicYear ac = new ClassAcademicYear();


        StudentListMainform _frm;


       // StudentList_OfTeacher _frm2;


        public int roomid;


        public StudentListAdd(StudentListMainform _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }

        //public StudentListAdd(StudentList_OfTeacher _frm2)
        //{
        //    InitializeComponent();
        //    this._frm2 = _frm2;
        //}

        private void StudentListAdd_Load(object sender, EventArgs e)
        {
            try
            {
                ac.comboAcademicYear(cmbAcademicYear);

                con = Connection.con();
                con.Open();
                cmbAcademicYear.Text = ac.getCurrentAYActive(con);
                con.Dispose();
                con.Dispose();

            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
           
        }

        private void btnBrowseStudent_Click(object sender, EventArgs e)
        {
            StudentListBrowseStudent frm = new StudentListBrowseStudent(this);
            frm.aycode = cmbAcademicYear.Text.Trim();
            frm.ShowDialog();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {

            if (String.IsNullOrEmpty(txtStudentID.Text))
            {
                Box.warnBox("Please select a student.");
                return;
            }

            if(roomid < 1)
            {
                Box.warnBox("No room selected. Please contact system administrator.");
                return;
            }

            try
            {


                

                con = Connection.con();
                con.Open();
                int ayid = ac.getID(con, cmbAcademicYear.Text.Trim());

                query = "insert into studentlists set academicYearID = ?ayid, id = ?id, roomID=?rid";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?ayid", ayid);
                cmd.Parameters.AddWithValue("?id", txtStudentID.Text.Trim());
                cmd.Parameters.AddWithValue("?rid", roomid);
                cmd.ExecuteNonQuery();
                con.Close();
                con.Dispose();

                Box.infoBox("Student successfully added.");
                _frm.LoadData();
                this.Close();

            }
            catch (Exception er)
            {
                Box.warnBox(er.Message);
               // throw;
            }
         
        }



    }
}

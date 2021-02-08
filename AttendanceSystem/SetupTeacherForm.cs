using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using AttendanceSystem.Classes;



namespace AttendanceSystem
{
    public partial class SetupTeacherForm : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        ClassAcademicYear ay;

        public SetupTeacherForm()
        {
            InitializeComponent();

            ay = new ClassAcademicYear();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            SetupTeacherAddModify frm = new SetupTeacherAddModify(this);
            frm.id = 0;
            frm.ShowDialog();
        }

        private void SetupTeacherForm_Load(object sender, EventArgs e)
        {
            try
            {
                ay.comboAcademicYear(cmbAY);
                cmbAY.Text = new ClassAcademicYear().getCurrentAYActive();

                LoadData();
            }
            catch (Exception er)
            {

                //throw;
            }        
        }

        public void LoadData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_rooms_teacher where ayCode like ?aycode and tlname like ?tlname";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?aycode", cmbAY.Text + "%");
            cmd.Parameters.AddWithValue("?tlname", txtTeacher.Text + "%");
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            flx.AutoGenerateColumns = false;
            flx.DataSource = dt;
        }

        private void btnModify_Click(object sender, EventArgs e)
        {
            if(this.flx.Rows.Count > 1)
            {
                SetupTeacherAddModify frm = new SetupTeacherAddModify(this);
                frm.id = Convert.ToInt32(flx[flx.RowSel,"room_teacher_id"]);
                frm.ShowDialog();
            }
            else
            {
                Box.warnBox("No data selected.");
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                LoadData();
            }
            catch (Exception er)
            {

                //throw;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (flx.Rows.Count < 2)
            {
                Box.warnBox("Please select a row.");
                return;
            }
            if (Box.questionBox("Are you sure you want to delete this row?", "DELETE?"))
            {
                con = Connection.con();
                int del_id = Convert.ToInt32(flx[flx.RowSel, "room_teacher_id"]);
                con.Open();
                query = "delete from rooms_teacher where room_teacher_id = ?id";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?id", del_id);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                con.Dispose();
                Box.infoBox("Successfully deleted.");
                LoadData();
            }
        }

        private void btnStudentList_Click(object sender, EventArgs e)
        {
            if (flx.Rows.Count < 2)
            {
                Box.warnBox("Please select a row.");
                return;
            }

            StudentList_OfTeacher frm = new StudentList_OfTeacher();
            int teacher_id = Convert.ToInt32(flx[flx.RowSel, "teacherID"]);
            frm.room_teacher_id = Convert.ToInt32(flx[flx.RowSel, "room_teacher_id"]);
            frm.teacher_id = teacher_id;
            frm.aycode = cmbAY.Text;
            frm.ShowDialog();
        }
    }
}

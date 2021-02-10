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

namespace AttendanceSystem.Reports
{
    public partial class TeacherReportStudentLog_SearchStudent : Form
    {

        MySqlCommand cmd;
        MySqlConnection con;
        string query;

        TeacherReportStudentLog _frm;

        AdminAttendanceMonitoringForm frm2;

        ClassAcademicYear ay;

        private int tid;


        public TeacherReportStudentLog_SearchStudent(TeacherReportStudentLog _frm)
        {
            InitializeComponent();
            this._frm = _frm;

            ay = new ClassAcademicYear();

            this.tid = Properties.Settings.Default.userID;
           
        }

        public TeacherReportStudentLog_SearchStudent(AdminAttendanceMonitoringForm frm2, int tid)
        {
            InitializeComponent();
            this.frm2 = frm2;
            ay = new ClassAcademicYear();

            this.tid = tid;
        }



        private void LoadData()
        {
            con = Connection.con();
            con.Open();
            query = "proc_studentlist_byteacher";
            cmd = new MySqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("?vtid", tid);
            cmd.Parameters.AddWithValue("?vaycode", cmbAY.Text);
            cmd.Parameters.AddWithValue("?vsearch", txtsearch.Text);
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

        private void TeacherReportStudentLog_SearchStudent_Load(object sender, EventArgs e)
        {
            ay.comboAcademicYear(cmbAY);
            cmbAY.Text = new ClassAcademicYear().getCurrentAYActive();

            LoadData();

            try
            {
               
            }
            catch (Exception er)
            {

                // throw;
                Box.errBox(er.Message);
            }
        }

        private void txtsearch_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                LoadData();
            }
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            if(this.flx.Rows.Count > 1)
            {
                string name = flx[flx.RowSel, "lname"] + ", " + flx[flx.RowSel, "fname"] + " " + flx[flx.RowSel, "mname"];
                int id = Convert.ToInt32(flx[flx.RowSel, "id"]);

                if (_frm != null)
                {
                    _frm.txtStudentName.Text = name;
                    _frm.id = id;
                }

                if (frm2 != null)
                {
                    frm2.txtStudentName.Text = name;
                    frm2.student_id = id;
                }
              
            }

            this.Close();
        }
    }
}

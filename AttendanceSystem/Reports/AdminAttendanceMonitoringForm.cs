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
    public partial class AdminAttendanceMonitoringForm : Form
    {

        public int teacher_id;
        public int student_id;


        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public AdminAttendanceMonitoringForm()
        {
            InitializeComponent();
        }

        private void AdminAttendanceMonitoringForm_Load(object sender, EventArgs e)
        {
            new ClassAcademicYear().comboAcademicYear(cmbAy);
            cmbAy.Text = new ClassAcademicYear().getCurrentAYActive();
        }


        void LoadReport()
        {
            int ayid = Helper.getAYID(cmbAy);

            con = Connection.con();
            con.Open();

            query = "proc_attendance_student";
            cmd = new MySqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("?vid", student_id);
            cmd.Parameters.AddWithValue("?vayid", ayid);
            cmd.Parameters.AddWithValue("?vfrom", dtFrom.Value.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("?vto", dtTo.Value.ToString("yyyy-MM-dd"));

            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);

            adptr.Dispose();
            cmd.Dispose();
            con.Close();


            TeacherReportStudentLogRPT rpt = new TeacherReportStudentLogRPT();
            rpt.SetDataSource(dt);
            crystalReportViewer1.ReportSource = rpt;
        }

        private void btnBrowseTeacher_Click(object sender, EventArgs e)
        {
            BrowseTeacherReport frm = new BrowseTeacherReport(this);
            frm.ShowDialog();
        }

        private void btnBrowseStudent_Click(object sender, EventArgs e)
        {
            TeacherReportStudentLog_SearchStudent frm = new TeacherReportStudentLog_SearchStudent(this, teacher_id);
            frm.ShowDialog();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                LoadReport();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        //private void LoadReport()
        //{
        //    int ayid = Helper.getAYID(cmbAy);

        //    con = Connection.con();
        //    con.Open();

        //    query = "proc_attendance_student";
        //    cmd = new MySqlCommand(query, con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("?vid", id);
        //    cmd.Parameters.AddWithValue("?vayid", ayid);
        //    cmd.Parameters.AddWithValue("?vfrom", dtFrom.Value.ToString("yyyy-MM-dd"));
        //    cmd.Parameters.AddWithValue("?vto", dtTo.Value.ToString("yyyy-MM-dd"));

        //    DataTable dt = new DataTable();
        //    MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
        //    adptr.Fill(dt);

        //    adptr.Dispose();
        //    cmd.Dispose();
        //    con.Close();


        //    TeacherReportStudentLogRPT rpt = new TeacherReportStudentLogRPT();
        //    rpt.SetDataSource(dt);
        //    crystalReportViewer1.ReportSource = rpt;

        //}



    }
}

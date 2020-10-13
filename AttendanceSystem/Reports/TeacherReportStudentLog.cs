using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AttendanceSystem.Classes;
using MySql.Data.MySqlClient;


namespace AttendanceSystem.Reports
{
    public partial class TeacherReportStudentLog : Form
    {


        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public int id;


        
        public TeacherReportStudentLog()
        {
            InitializeComponent();
        }

        private void TeacherReportStudentLog_Load(object sender, EventArgs e)
        {
            new ClassAcademicYear().comboAcademicYear(cmbAy);
            cmbAy.Text = new ClassAcademicYear().getCurrentAYActive();
        }

        private void LoadReport()
        {
            int ayid = Helper.getAYID(cmbAy);
           
            con = Connection.con();
            con.Open();

            query = "proc_attendance_student";
            cmd = new MySqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("?vid", id);
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

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                LoadReport();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //t//hrow;
            }
        }

        private void btnSearchStudent_Click(object sender, EventArgs e)
        {
            TeacherReportStudentLog_SearchStudent frm = new TeacherReportStudentLog_SearchStudent(this);
            frm.ShowDialog();
        }
    }
}

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



namespace AttendanceSystem.Reports
{
    public partial class TeacherReport : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        int teacherid;

        

        public TeacherReport()
        {
            InitializeComponent();
            teacherid = Properties.Settings.Default.userID;
        }


        public void LoadReport()
        {
            con = Connection.con();
            con.Open();
            query = "proc_teacher_absentstdlist";
            cmd = new MySqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("?vdate", dtFrom.Value.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("?vtid",teacherid);
            cmd.Parameters.AddWithValue("?vaycode", cmbAy.Text.Trim());
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();


            ReportTeacherStdAbsent rpt = new ReportTeacherStdAbsent();
            rpt.SetDataSource(dt);
            crystalReportViewer1.ReportSource = rpt;

        }

        private void TeacherReport_Load(object sender, EventArgs e)
        {
            new ClassAcademicYear().comboAcademicYear(cmbAy);
            //con = Connection.con();
            //con.Open();

            //new ClassGrade().populateComboGrade(con, cmbGrade);
            //// new ClassSection().populateCombo(con, cmbSection, cmbGrade.Text);
            //con.Close();
            //con.Dispose();
            cmbAy.Text = new ClassAcademicYear().getCurrentAYActive();


        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            LoadReport();
        }
    }
}

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

namespace AttendanceSystem.Reports
{
    public partial class GeneralReport : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public GeneralReport()
        {
            InitializeComponent();
        }


        public void LoadReport()
        {
            con = Connection.con();
            con.Open();
            query = "proc_attmonitoring";
            cmd = new MySqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("?vgrade", cmbGrade.Text);
            cmd.Parameters.AddWithValue("?vsection", cmbSection.Text); 
            cmd.Parameters.AddWithValue("?vaycode", cmbAy.Text);
            cmd.Parameters.AddWithValue("?vdatefrom", dtFrom.Value.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("?vdateto", dtTo.Value.ToString("yyyy-MM-dd"));
  
            DataTable dt = new DataTable();
            MySqlDataAdapter adtpr = new MySqlDataAdapter(cmd);
            adtpr.Fill(dt);
            adtpr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();


            ReportAttendanceMonitoring rpt = new ReportAttendanceMonitoring();
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
               // throw;
            }
        }

        private void ReportsMonitoring_Load(object sender, EventArgs e)
        {
            new ClassAcademicYear().comboAcademicYear(cmbAy);
            con = Connection.con();
            con.Open();

            new ClassGrade().populateComboGrade(con, cmbGrade);
           // new ClassSection().populateCombo(con, cmbSection, cmbGrade.Text);
            con.Close();
            con.Dispose();
            cmbAy.Text = new ClassAcademicYear().getCurrentAYActive();
        }

        private void cmbGrade_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con = Connection.con();
                con.Open();
                new ClassSection().populateCombo(con, cmbSection, cmbGrade.Text);
                con.Close();
                con.Dispose();
            }
            catch (Exception)
            {

               // throw;
            }
        }
    }
}

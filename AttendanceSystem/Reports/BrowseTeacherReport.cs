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


namespace AttendanceSystem.Reports
{
    public partial class BrowseTeacherReport : Form
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        AdminAttendanceMonitoringForm _frm;

        public BrowseTeacherReport(AdminAttendanceMonitoringForm _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }


        void Loaddata()
        {
            try
            {
                con = Connection.con();
                con.Open();
                query = @"select * from (SELECT
                    a.userID, a.username, a.pwd, a.pin, a.lname, a.fname, a.mname, a.sex,
                    a.mobileNo
                    FROM
                    users a where a.role = 'TEACHER') as tbl1 where lname like ?key or fname like ?key or mname like ?key";
                cmd = new MySqlCommand(query, con);

                DataTable dt = new DataTable();
                MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("?key", txtSearch.Text + "%");
                adptr.Fill(dt);
                adptr.Dispose();
                cmd.Dispose();
                con.Close();
                con.Dispose();

                flx.AutoGenerateColumns = false;
                flx.DataSource = dt;
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
               // throw;
            }
         

        }

        private void txtSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                Loaddata();
            }
        }

        private void BrowseTeacherReport_Load(object sender, EventArgs e)
        {
            Loaddata();
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                _frm.txtTeacherName.Text = flx[flx.RowSel, "lname"] + ", " + flx[flx.RowSel, "fname"] + " " + flx[flx.RowSel, "mname"];
                _frm.teacher_id = Convert.ToInt32(flx[flx.RowSel, "userID"]);
                this.Close();
            }
            else
            {
                Box.warnBox("No data selected or found.");
            }
        }
    }
}

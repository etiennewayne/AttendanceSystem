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


namespace AttendanceSystem
{
    public partial class SetupTeacher_BrowseTeacher : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        SetupTeacherAddModify _frm;

        public SetupTeacher_BrowseTeacher(SetupTeacherAddModify _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }

        public void LoadData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from users where role='TEACHER' and lname like ?lname and fname like ?fname order by lname asc";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?lname", txtlname.Text + "%");
            cmd.Parameters.AddWithValue("?fname", txtfname.Text + "%");
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            this.flx.AutoGenerateColumns = false;
            this.flx.DataSource = dt;
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                LoadData();
            }
            catch (Exception er)
            {

                // throw;
                Box.errBox(er.Message);
            }
        }

        private void SetupTeacher_BrowseTeacher_Load(object sender, EventArgs e)
        {
            try
            {
                LoadData();
            }
            catch (Exception er)
            {

                // throw;
                Box.errBox(er.Message);
            }
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                _frm.txtlname.Text = Convert.ToString(this.flx[flx.RowSel, "lname"]);
                _frm.txtfname.Text = Convert.ToString(this.flx[flx.RowSel, "fname"]);
                _frm.txtmname.Text = Convert.ToString(this.flx[flx.RowSel, "mname"]);
                _frm.teacher_id = Convert.ToInt32(this.flx[flx.RowSel, "userID"]);
                this.Close();
            }
            catch (Exception er)
            {}
        }
    }
}

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

namespace AttendanceSystem
{
    public partial class RoomBrowseTeachers : Form
    {
        MySqlCommand cmd;
        MySqlConnection con;
        string query;
        ClassPosition cat = new ClassPosition();

        RoomAdd _frm;


        public RoomBrowseTeachers(RoomAdd _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }

        public void Loaddata()
        {
            con = Connection.con();
            con.Open();
            query = "select * from (select * from vw_users where position ='teacher') as a " +
                "where lname like ?lname and fname like ?fname and mobileNo like ?mobile and position like ?pos";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?lname", txtlname.Text + "%");
            cmd.Parameters.AddWithValue("?fname", txtfname.Text + "%");
            cmd.Parameters.AddWithValue("?mobile", txtMobile.Text + "%");
            cmd.Parameters.AddWithValue("?pos", cmbCategory.Text + "%");
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

        private void RoomBrowseTeachers_Load(object sender, EventArgs e)
        {
            try
            {

                //if (isStudentActive)
                //{
                //    tabControl1.SelectedIndex = 1;
                //    //tabPage1.
                //}

                cat.allInComboBox(cmbCategory);

                Loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                _frm.txtTeacherID.Text = Convert.ToString(flx[flx.RowSel, "userID"]);
                string lname = Convert.ToString(flx[flx.RowSel, "lname"]);
                string fname = Convert.ToString(flx[flx.RowSel, "fname"]);
                string mname = Convert.ToString(flx[flx.RowSel, "mname"]);
                _frm.txtName.Text = (lname + ", " + fname + " " + mname).Trim();

                this.Close();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                // throw;
            }
        }


    }
}

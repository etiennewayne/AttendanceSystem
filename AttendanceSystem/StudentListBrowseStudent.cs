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
    public partial class StudentListBrowseStudent : Form
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        StudentListAdd _frm;



        public string aycode;
        public int teacherid;

        public StudentListBrowseStudent(StudentListAdd _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }



        void LoadData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from (select * from vw_aystudents where ayCode=?aycode and id not in (select id from studentlists)) as b where lname like ?lname and fname like  ?fname";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?aycode", aycode);
            cmd.Parameters.AddWithValue("?lname", txtlname.Text + "%");
            cmd.Parameters.AddWithValue("?fname", txtfname.Text + "%");
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

        private void StudentListBrowseStudent_Load(object sender, EventArgs e)
        {
            try
            {
                LoadData();
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
                LoadData();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                _frm.txtStudentID.Text = Convert.ToString(flx[flx.RowSel,"id"]);
                _frm.txtlname.Text = Convert.ToString(flx[flx.RowSel, "lname"]);
                _frm.txtfname.Text = Convert.ToString(flx[flx.RowSel, "fname"]);
                _frm.txtmname.Text = Convert.ToString(flx[flx.RowSel, "mname"]);
                this.Close();
            }
            else
            {
                Box.warnBox("No data found.");
            }
        }
    }
}

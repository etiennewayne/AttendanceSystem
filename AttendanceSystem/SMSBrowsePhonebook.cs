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


namespace AttendanceSystem
{
    public partial class SMSBrowsePhonebook : Form
    {
        MySqlCommand cmd;
        MySqlConnection con;
        string query;

        ClassPosition cat;

        SMSMainform _frm;

        public SMSBrowsePhonebook(SMSMainform _frm)
        {
            InitializeComponent();
            this._frm = _frm;

            cat = new ClassPosition();
        }

        private void SMSBrowsePhonebook_Load(object sender, EventArgs e)
        {
            try
            {
                cat.allInComboBox(cmbCategory);
                loaddata();
            }
            catch (Exception er)
            {

                Box.errBox(er.Message);
            }
        }


        public void loaddata()
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_phonebook where lname like ?lname and fname like ?fname and mname like ?mname and mobileNo like ?mobile and position like ?pos";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?lname", txtlname.Text + "%");
            cmd.Parameters.AddWithValue("?fname", txtfname.Text + "%");
            cmd.Parameters.AddWithValue("?mname", txtmname.Text + "%");
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

        private void btnSelect_Click(object sender, EventArgs e)
        {
            if (flx.Rows.Count > 1)
            {
                _frm.txtMobileNo.Text = Convert.ToString(flx[flx.RowSel,"mobileNo"]);
                this.Close();
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
                loaddata();
            }
            catch (Exception er)
            {

                Box.errBox(er.Message);
            }
        }
    }
}

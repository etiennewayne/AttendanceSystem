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
    public partial class PhoneBookAdd : Form
    {
        public int id;
        MySqlCommand cmd;
        MySqlConnection con;
        string query;

        ClassPosition cat;

        PhoneBookMainform _frm;

        public PhoneBookAdd(PhoneBookMainform _frm)
        {
            InitializeComponent();

            cat = new ClassPosition();
            this._frm = _frm;
        }

       void processSave()
        {

            int posid = cat.getID(cmbPosition.Text);

            if (id > 0)
            {
                con = Connection.con();
                con.Open();
                query = "update phonebook set lname = ?lname, fname=?fname, mname=?mname," +
                    " mobileNo = ?mobile, positionID=?posid where phonebookID=?id";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?lname", txtlname.Text.Trim());
                cmd.Parameters.AddWithValue("?fname", txtfname.Text.Trim());
                cmd.Parameters.AddWithValue("?mname", txtmname.Text.Trim());
                cmd.Parameters.AddWithValue("?mobile", txtContact.Text);
                cmd.Parameters.AddWithValue("?posid", posid);

                cmd.Parameters.AddWithValue("?id", id);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                con.Dispose();

                Box.infoBox("Contact successfully updated!");
                _frm.loaddata();
                this.Close();

            }
            else
            {
                con = Connection.con();
                con.Open();
                query = "insert into phonebook set lname = ?lname, fname=?fname, mname=?mname, " +
                    "mobileNo = ?mobile, positionID=?posid";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?lname", txtlname.Text.Trim());
                cmd.Parameters.AddWithValue("?fname", txtfname.Text.Trim());
                cmd.Parameters.AddWithValue("?mname", txtlname.Text.Trim());
                cmd.Parameters.AddWithValue("?mobile", txtContact.Text);
                cmd.Parameters.AddWithValue("?posid", posid);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                con.Dispose();

                Box.infoBox("Contact successfully saved!");
                _frm.loaddata();
                this.Close();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtlname.Text))
            {
                Box.warnBox("Please input name.");
                return;
            }

            if (!txtContact.MaskFull)
            {
                Box.warnBox("Please input contact no.");
                return;
            }
            if (String.IsNullOrEmpty(cmbPosition.Text))
            {
                Box.warnBox("Please select category.");
                return;
            }

            processSave();
        }

        private void PhoneBookAdd_Load(object sender, EventArgs e)
        {
            try
            {
                cat.allInComboBox(cmbPosition);

                if (id > 0)
                {
                    getData();
                }
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
               // throw;
            }
           
        }



        void getData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_phonebook where phonebookID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            if (dt.Rows.Count > 0)
            {
                txtlname.Text = Convert.ToString(dt.Rows[0]["lname"]);
                txtfname.Text = Convert.ToString(dt.Rows[0]["fname"]);
                txtmname.Text = Convert.ToString(dt.Rows[0]["mname"]);
                txtContact.Text = Convert.ToString(dt.Rows[0]["mobileNo"]);
                cmbPosition.Text = Convert.ToString(dt.Rows[0]["position"]);
            }

        }


        //if (!txtContact.MaskFull)
        //   {
        //       Box.warnBox("Please input contact no.");
        //       return;
        //   }
    }
}

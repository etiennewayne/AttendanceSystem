using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;


namespace AttendanceSystem
{
    public partial class Login : Form
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        int posid;


        public Login()
        {
            InitializeComponent();
        }

        string position;

        bool Auth()
        {
            
            bool flag = false;
            con = Connection.con();
            con.Open();
            query = "select * from users where username=?user and pwd=?pwd";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?user", txtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("?pwd", txtPwd.Text.Trim());
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                flag = true;
                Properties.Settings.Default.userID = Convert.ToInt32(dr["userID"]);
                Properties.Settings.Default.username = Convert.ToString(dr["username"]);
                Properties.Settings.Default.lname = Convert.ToString(dr["lname"]);
                Properties.Settings.Default.fname = Convert.ToString(dr["fname"]);
                Properties.Settings.Default.mname = Convert.ToString(dr["mname"]);
                position = Convert.ToString(dr["role"]);
              
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return flag;

        }
    
        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtUsername.Text))
            {
                Box.warnBox("Please input username.");
                txtUsername.Focus();
                return;
            }
            if (String.IsNullOrEmpty(txtPwd.Text))
            {
                Box.warnBox("Please input password.");
                txtPwd.Focus();
                return;
            }

            try
            {
                if (Auth())
                {
                    txtUsername.Text = "";
                    txtPwd.Text = "";
                    if (position == "ADMINISTRATOR")
                    {
                        AdministratorForm frm = new AdministratorForm(this);
                        frm.Show();
                        this.Hide();
                    }

                    if(position == "TEACHER")
                    {
                        TeacherMainForm frm = new TeacherMainForm(this);
                        frm.Show();
                        this.Hide();
                    }
                    if (position == "STAFF")
                    {
                        Mainform frm = new Mainform(this);
                        frm.Show();
                        this.Hide();
                    }
                }
                else
                {
                    Box.warnBox("Username and Password error!");
                    txtPwd.Focus();

                }
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;

            }
           
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Login_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.F5)
            {
                //Connection  setting
                ConnectionSetting frm = new ConnectionSetting();
                frm.ShowDialog();
            }
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            ConnectionSetting frm = new ConnectionSetting();
            frm.ShowDialog();
        }
    }
}

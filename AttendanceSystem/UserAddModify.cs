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
    public partial class UserAddModify : Form
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        public int id;


        UserMainform _frm;
        string temp = String.Empty;

        ClassPosition cat;

        string tempMobileNo, tempPIN;


        public UserAddModify(UserMainform _frm)
        {
            InitializeComponent();

            cat = new ClassPosition();

            this._frm = _frm;
        }

        public UserAddModify()
        {
            InitializeComponent();
            cat = new ClassPosition();
        }

        #region CRUD
        int insert()
        {
            int i= 0;
            query = @"insert into users set username=?uname, pwd=?pwd, pin=?pin, lname=?lname, fname=?fname, mname=?mname, sex=?sex, mobileNo=?mobile, role=?role";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?uname", txtuser.Text.Trim());
            cmd.Parameters.AddWithValue("?pwd", txtpwd.Text.Trim());
            cmd.Parameters.AddWithValue("?pin", txtPIN.Text.Trim());
            cmd.Parameters.AddWithValue("?lname", txtLname.Text.Trim());
            cmd.Parameters.AddWithValue("?fname", txtFname.Text.Trim());
            cmd.Parameters.AddWithValue("?mname", txtMname.Text.Trim());
            cmd.Parameters.AddWithValue("?sex", cmbSex.Text.Trim());
            cmd.Parameters.AddWithValue("?mobile", txtContactNo.Text.Trim());
            cmd.Parameters.AddWithValue("?role", cmbRole.Text.Trim());
            i = cmd.ExecuteNonQuery();
            id = Helper.returnLastInsertID(con);
            cmd.Dispose();


            //query = "insert into phonebook SET lname =?lname, fname=?fname, mname=?mname, mobileNo=?mobile, positionID=?posid";
            //cmd = new MySqlCommand(query, con);
            //cmd.Parameters.AddWithValue("?lname", txtLname.Text.Trim());
            //cmd.Parameters.AddWithValue("?fname", txtFname.Text.Trim());
            //cmd.Parameters.AddWithValue("?mname", txtMname.Text.Trim());
            //cmd.Parameters.AddWithValue("?mobile", txtContactNo.Text.Trim());
            //cmd.Parameters.AddWithValue("?posid", posid);
            //cmd.ExecuteNonQuery();
            //cmd.Dispose();
            return i;
        }

        int update()
        {
            int i = 0;
            query = @"update users set username=?uname, pwd=?pwd, pin=?pin, lname=?lname, fname=?fname, 
                        mname=?mname, sex=?sex, mobileNo=?mobile, role=?role where userID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?uname", txtuser.Text.Trim());
            cmd.Parameters.AddWithValue("?pwd", txtpwd.Text.Trim());
            cmd.Parameters.AddWithValue("?pin", txtPIN.Text.Trim());
            cmd.Parameters.AddWithValue("?lname", txtLname.Text.Trim());
            cmd.Parameters.AddWithValue("?fname", txtFname.Text.Trim());
            cmd.Parameters.AddWithValue("?mname", txtMname.Text.Trim());
            cmd.Parameters.AddWithValue("?sex", cmbSex.Text.Trim());
            cmd.Parameters.AddWithValue("?mobile", txtContactNo.Text.Trim());
            cmd.Parameters.AddWithValue("?role", cmbRole.Text.Trim());
            cmd.Parameters.AddWithValue("?id", id);
            i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

      
        void getData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from users where userID=?id";
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
                temp = txtuser.Text = Convert.ToString(dt.Rows[0]["username"]);
                txtpwd.Text = Convert.ToString(dt.Rows[0]["pwd"]);
                tempPIN = txtPIN.Text = Convert.ToString(dt.Rows[0]["pin"]);
                cmbRole.Text = Convert.ToString(dt.Rows[0]["role"]);
                txtLname.Text = Convert.ToString(dt.Rows[0]["lname"]);
                txtFname.Text = Convert.ToString(dt.Rows[0]["fname"]);
                txtMname.Text = Convert.ToString(dt.Rows[0]["mname"]);
                cmbSex.Text = Convert.ToString(dt.Rows[0]["sex"]);
                tempMobileNo = txtContactNo.Text = Convert.ToString(dt.Rows[0]["mobileNo"]);
                
            }
        }

        bool isExist()
        {
            bool flag = true;
            con = Connection.con();
            con.Open();
            query = "select * from users where username = ?uname";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?uname", txtuser.Text);
            MySqlDataReader dr = cmd.ExecuteReader();
            flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return flag;
        }

        bool isExistPIN()
        {
            bool flag = true;
            con = Connection.con();
            con.Open();
            query = "select * from users where pin = ?pin";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?pin", txtPIN.Text);
            MySqlDataReader dr = cmd.ExecuteReader();
            flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return flag;
        }

        bool isExistMobileNo()
        {
            bool flag = true;
            con = Connection.con();
            con.Open();
            query = "select * from users where mobileNo = ?mobileNo";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?mobileNo", txtContactNo.Text);
            MySqlDataReader dr = cmd.ExecuteReader();
            flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return flag;
        }


        #endregion

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtuser.Text))
            {
                Box.warnBox("Please input username.");
                txtuser.Focus();
                return;
            }
            if (String.IsNullOrEmpty(txtpwd.Text))
            {
                Box.warnBox("Please input password.");
                txtpwd.Focus();
                return;
            }
            if(txtpwd.Text != txtRPwd.Text)
            {
                Box.warnBox("Password not match.");
                txtpwd.Focus();
                return;
            }

            if (String.IsNullOrEmpty(cmbRole.Text))
            {
                Box.warnBox("Please select position.");
                cmbRole.Focus();
                return;
            }

            if (String.IsNullOrEmpty(txtLname.Text))
            {
                Box.warnBox("Please input lastname.");
                txtLname.Focus();
                return;
            }

            if (String.IsNullOrEmpty(txtFname.Text))
            {
                Box.warnBox("Please input firstname.");
                txtFname.Focus();
                return;
            }
            if (String.IsNullOrEmpty(cmbSex.Text))
            {
                Box.warnBox("Please select sex.");
                cmbSex.Focus();
                return;
            }

            if (String.IsNullOrEmpty(txtPIN.Text))
            {
                Box.warnBox("Please input PIN.");
                txtPIN.Focus();
                return;
            }

            if (!txtContactNo.MaskFull)
            {
                Box.warnBox("Please input contact no.");
                return;
            }

            if (id == 0)
            {
                if (isExist())
                {
                    Box.warnBox("Username already taken.");
                    return;
                }

                if (isExistMobileNo())
                {
                    Box.warnBox("Mobile Number already taken.");
                    return;
                }

                if (isExistPIN())
                {
                    Box.warnBox("PIN already in used. Please input another PIN.");
                    txtPIN.Text = "";
                    txtPIN.Focus();
                    return;
                }
            }

            if (id > 0)
            {
                if(temp != txtuser.Text)
                {
                    if (isExist())
                    {
                        Box.warnBox("Username already taken.");
                        return;
                    }
                }

                if(tempMobileNo != txtContactNo.Text)
                {
                    if (isExistMobileNo())
                    {
                        Box.warnBox("Mobile Number already taken. (Ayaw pugsa!)");
                        return;
                    }
                }

                if (tempPIN != txtPIN.Text)
                {
                    if (isExistPIN())
                    {
                        Box.warnBox("PIN already in used. Please input another PIN.");
                        txtPIN.Text = "";
                        txtPIN.Focus();
                        return;
                    }
                }
            }
           

            processSave();
            _frm.loadData();
            this.Close();

        }


        void processSave()
        {
            

            if (id > 0)
            {
                con = Connection.con();
                con.Open();
                if (update()>0)
                {
                    con.Close();
                    con.Dispose();
                    Box.infoBox("Data successfully updated.");
                }
                else
                {
                    con.Close();
                    con.Dispose();
                    Box.errBox("Something went wrong. Please contact System Administrator.");
                }
               
            }
            else
            {
                con = Connection.con();
                con.Open();
                if (insert() > 0)
                {
                    con.Close();
                    con.Dispose();
                    Box.infoBox("Data successfully saved.");
                }
                else
                {
                    con.Close();
                    con.Dispose();
                    Box.errBox("Something went wrong. Please contact System Administrator.");
                }
            }
        }

        private void UserAddModify_Load(object sender, EventArgs e)
        {
            cat.allInComboBox(cmbRole);

          
            if (id > 0)
            {
                //Box.infoBox(id.ToString());
                getData();

                
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void checkShowPwd_CheckedChanged(object sender, EventArgs e)
        {
            if (checkShowPwd.Checked)
            {
                txtpwd.PasswordChar = '\0';
                txtRPwd.PasswordChar = '\0';
            }
            else {
                txtpwd.PasswordChar = '*';
                txtRPwd.PasswordChar = '*';
            }
                
        }
    }
}

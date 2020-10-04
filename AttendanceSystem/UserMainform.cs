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
    public partial class UserMainform : Form
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public UserMainform()
        {
            InitializeComponent();
        }

        public void loadData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from users where username like ?uname and lname like ?lname and fname like ?fname";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?uname", txtUsername.Text + "%");
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

        public int delete(int id)
        {
            int i = 0;
            query = @"delete from users where userID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }



        private void UserMainform_Load(object sender, EventArgs e)
        {
            try
            {
                loadData();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void txtUsername_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                try
                {
                    loadData();
                }
                catch (Exception er)
                {
                    Box.errBox(er.Message);
                    //throw;
                }
            }
        }

        private void txtlname_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                try
                {
                    loadData();
                }
                catch (Exception er)
                {
                    Box.errBox(er.Message);
                    //throw;
                }
            }
        }

        private void txtfname_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                try
                {
                    loadData();
                }
                catch (Exception er)
                {
                    Box.errBox(er.Message);
                    //throw;
                }
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            UserAddModify frm = new UserAddModify(this);
            frm.id = 0;
            frm.ShowDialog();
        }

        private void btnModify_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                UserAddModify frm = new UserAddModify(this);
                frm.id = Convert.ToInt32(flx[flx.RowSel,"userID"]);
                frm.ShowDialog();
            }
            else
            {
                Box.warnBox("Please select a row.");
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            try
            {
                loadData();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (flx.Rows.Count > 1)
            {
               
                int id = Convert.ToInt32(flx[flx.RowSel, "userID"]);
                if(Box.questionBox("Are you sure you want to delete this row?", "DELETE?"))
                {
                   
                    con = Connection.con();
                    con.Open();
                    if (delete(id) > 0)
                    {
                        con.Close();
                        con.Dispose();
                        Box.infoBox("Data deleted successfully");
                        loadData();
                    }
                    else
                    {
                        con.Close();
                        con.Dispose();
                        Box.errBox("Something went wrong. Please contact System Administrator.");
                    }
                }
            
            }
            else
            {
                Box.warnBox("Please select a row.");
            }
        }
    }
}

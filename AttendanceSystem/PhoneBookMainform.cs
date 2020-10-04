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
    public partial class PhoneBookMainform : Form
    {
        MySqlCommand cmd;
        MySqlConnection con;
        string query;

        ClassPosition cat = new ClassPosition();


        public bool isStudentActive;




        public PhoneBookMainform()
        {
            InitializeComponent();
        }


        public void loaddata()
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_phonebook where lname like ?lname and fname like ?fname and mobileNo like ?mobile and position like ?pos";
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

        private void btnAdd_Click(object sender, EventArgs e)
        {
            PhoneBookAdd frm = new PhoneBookAdd(this);
            frm.id = 0;
            frm.ShowDialog();
        }

        private void btnModify_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                PhoneBookAdd frm = new PhoneBookAdd(this);
                frm.id = Convert.ToInt32(flx[flx.RowSel,"phonebookID"]);
                frm.ShowDialog();
            }
            else
            {
                Box.warnBox("No data selected.");
            }
        }

        private void PhoneBookMainform_Load(object sender, EventArgs e)
        {
            try
            {

                //if (isStudentActive)
                //{
                //    tabControl1.SelectedIndex = 1;
                //    //tabPage1.
                //}
               
                cat.allInComboBox(cmbCategory);

                loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            try
            {
              

                loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                if(Box.questionBox("Are you sure you want to delete this row?", "DELETE?"))
                {
                    int id = Convert.ToInt32(flx[flx.RowSel,"phonebookID"]);
                    Helper.deleteData("phonebook", "phonebookID", id);
                    loaddata();
                    Box.infoBox("Row deleted.");
                }
            }
            else
            {
                Box.warnBox("No data found.");
            }
        }

        private void txtName_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                try
                {


                    loaddata();
                }
                catch (Exception er)
                {
                    Box.errBox(er.Message);
                    //throw;
                }
            }
        }

        private void textBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                try
                {


                    loaddata();
                }
                catch (Exception er)
                {
                    Box.errBox(er.Message);
                    //throw;
                }
            }
        }

        private void txtMobile_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                try
                {


                    loaddata();
                }
                catch (Exception er)
                {
                    Box.errBox(er.Message);
                    //throw;
                }
            }
        }

        private void cmbCategory_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                try
                {


                    loaddata();
                }
                catch (Exception er)
                {
                    Box.errBox(er.Message);
                    //throw;
                }
            }
        }



    }
}

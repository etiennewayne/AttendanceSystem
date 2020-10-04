using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Windows.Forms;

namespace AttendanceSystem
{
    public partial class StudentMainform : Form
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query = String.Empty;


        ClassStudent std;
        public StudentMainform()
        {
            InitializeComponent();
            std = new ClassStudent();
        }

        private void StudentMainform_Load(object sender, EventArgs e)
        {
            loaddata();  
        }

        public void loaddata()
        {
            try
            {
                std.studentID = txtstdID.Text;
                std.rfid = txtRFID.Text;
                std.lname = txtlname.Text;
                std.fname = txtfname.Text;
                flx.AutoGenerateColumns = false;
                flx.DataSource = std.dtStudent(0);
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            loaddata();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            StudentAddForm frm = new StudentAddForm(this);
            frm.id = 0;
            frm.ShowDialog();
        }

        private void btnModify_Click(object sender, EventArgs e)
        {
            if (flx.Rows.Count > 1)
            {
                StudentAddForm frm = new StudentAddForm(this);
                frm.id = Convert.ToInt32(flx[flx.RowSel,"id"]);
                frm.ShowDialog();
            }
            else
            {
                Box.warnBox("Please select data.");
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if(Box.questionBox("Are you sure you want to delete this data?", "DELETE?"))
            {
                con = Connection.con();
                con.Open();

                std.delete(con, Convert.ToInt32(flx[flx.RowSel, "id"]));
                con.Close();
                con.Dispose();
                Box.infoBox("Row successfully deleted.");
                loaddata();
            }
        }
    }
}

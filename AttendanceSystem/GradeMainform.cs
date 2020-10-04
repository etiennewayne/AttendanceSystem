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
    public partial class GradeMainform : Form
    {
        ClassGrade cGrade;
        MySqlConnection con;


        public GradeMainform()
        {
            InitializeComponent();
            cGrade = new ClassGrade();
        }


        public void loadData()
        {
            try
            {
                con = Connection.con();
                con.Open();
                //cGrade.dt
                cGrade.grade = txtGrade.Text;
                flx.AutoGenerateColumns = false;
                flx.DataSource = cGrade.dtGrade(con);
                con.Close();
                con.Dispose();

              
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void GradeMainform_Load(object sender, EventArgs e)
        {
            loadData();
        }

        private void txtGrade_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                loadData();
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            GradeAddModify frm = new GradeAddModify(this);
            frm.id = 0;
            frm.ShowDialog();
        }

        private void btnModify_Click(object sender, EventArgs e)
        {if(flx.Rows.Count < 2)
            {
                Box.warnBox("Please select a row.");
                return;
            }

            GradeAddModify frm = new GradeAddModify(this);
            frm.id = Convert.ToInt32(flx[flx.RowSel,"gradeID"]);
            frm.ShowDialog();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            loadData();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (flx.Rows.Count < 2)
            {
                Box.warnBox("Please select a row.");
                return;
            }

            if(Box.questionBox("Are you sure you want to delete this row?", "DELETE?"))
            {
                con=Connection.con();
                con.Open();
                cGrade.delete(con, Convert.ToInt32(flx[flx.RowSel, "gradeID"]));
                con.Close();
                con.Dispose();
                Box.infoBox("Data deleted.");
                loadData();
            }
        }
    }
}

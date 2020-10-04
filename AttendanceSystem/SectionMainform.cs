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
    public partial class SectionMainform : Form
    {
        MySqlConnection con;


        ClassSection section;
        ClassGrade cGrade;
        public SectionMainform()
        {
            InitializeComponent();
            section = new ClassSection();
            cGrade = new ClassGrade();
        }

        public void loadData()
        {
            try
            {

                section.section = txtSection.Text;
                section.grade = cmbGrade.Text;

                con = Connection.con();
                con.Open();
                flx.AutoGenerateColumns = false;
                flx.DataSource = section.dtSection(con);
                con.Close();
                con.Dispose();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void SectionMainform_Load(object sender, EventArgs e)
        {
            con = Connection.con();
            con.Open();
            cGrade.populateComboGrade(con, cmbGrade);
            con.Close();con.Dispose();
            loadData();

        }

        private void cmbGrade_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                loadData();
            }
        }

        private void txtSection_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                loadData();
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            SectionAddModify frm = new SectionAddModify(this);
            frm.ShowDialog();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            loadData();
        }

        private void btnModify_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                SectionAddModify frm = new SectionAddModify(this);
                frm.id = Convert.ToInt32(flx[flx.RowSel,"sectionID"]);
                frm.ShowDialog();
            }
            else
            {
                Box.warnBox("Please select a row.");
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (flx.Rows.Count < 2)
                {
                    Box.warnBox("Please select a row.");
                    return;
                }

                if (Box.questionBox("Are you sure you want to delete this row?", "DELETE?"))
                {
                   // con = Connection.con();
                    int id = (int)flx[flx.RowSel, "sectionID"];
                    con = Connection.con();
                    con.Open();
                    section.delete(con, id);
                    Box.infoBox("Data deleted successfully.");
                    loadData();

                }

            }
            catch (Exception er)
            {

                Box.errBox(er.Message);
            }
        }


    }
}

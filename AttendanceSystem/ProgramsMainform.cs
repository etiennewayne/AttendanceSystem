using AttendanceSystem.Classes;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace AttendanceSystem
{
    public partial class ProgramsMainform : Form
    {
        MySqlConnection con;
        Programs cProg;
        
        public ProgramsMainform()
        {
            InitializeComponent();
            cProg = new Programs();
        }

        public void loadData()
        {
            try
            {
                cProg.progCode = txtpCode.Text;
                cProg.progDesc = txtpDesc.Text;
                flx.AutoGenerateColumns = false;

                con = Connection.con();
                con.Open();
                flx.DataSource = cProg.dtPrograms(con);
                con.Close();
                con.Dispose();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }
        private void ProgramsMainform_Load(object sender, EventArgs e)
        {
            loadData();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            loadData();
        }

        private void txtpCode_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                loadData();
            }
        }

        private void txtpDesc_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                loadData();
            }
        }

        private void btnModify_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                ProgramAddModify frm = new ProgramAddModify(this);
                frm.id = Convert.ToInt32(flx[flx.RowSel,"programID"]);
                frm.ShowDialog();
            }
            else
            {
                Box.warnBox("Please select a row.");
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            ProgramAddModify frm = new ProgramAddModify(this);
            frm.id = 0;
            frm.ShowDialog();

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count < 2)
            {
                Box.warnBox("Please select a row.");
                return;
            }
            if(Box.questionBox("Are you sure you want to delete this row?", "DELETE?"))
            {
                con = Connection.con();
                int id = Convert.ToInt32(flx[flx.RowSel,"programID"]);
                con.Open();
                cProg.delete(con, id);
                con.Close();
                con.Dispose();
                Box.infoBox("Successfully deleted.");
                loadData();
            }
        }
    }
}

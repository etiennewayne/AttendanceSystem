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
    public partial class ProgramAddModify : Form
    {
        MySqlCommand cmd;
        string query;
        MySqlConnection con;

        public int id;


        Programs cProg;

        string temp = "";
        ProgramsMainform _frm;
        public ProgramAddModify(ProgramsMainform _frm)
        {
            InitializeComponent();
            cProg = new Programs();
            this._frm = _frm;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtpCode.Text))
            {
                Box.warnBox("Please input Program Code.");
                return;
            }
            if (String.IsNullOrEmpty(txtDesc.Text))
            {
                Box.warnBox("Please input Program Description.");
                return;
            }

            if (id == 0)
            {
                con = Connection.con();
                con.Open();
                if(cProg.isExistProgram(con, txtpCode.Text))
                {
                    Box.warnBox("Program already exist.");
                    return;
                }
                con.Close();
                con.Dispose();
            }
            if (id > 0)
            {
                if(temp != txtpCode.Text)
                {
                    con = Connection.con();
                    con.Open();
                    if (cProg.isExistProgram(con, txtpCode.Text))
                    {
                        Box.warnBox("Program already exist.");
                        return;
                    }
                    con.Close();
                    con.Dispose();
                }
            }

            processSave();
            _frm.loadData();
            this.Close();
        }


        void processSave()
        {
            cProg.progCode = txtpCode.Text.Trim();
            cProg.progDesc = txtDesc.Text.Trim();

            if (id > 0)
            {
                con = Connection.con();
                con.Open();
                if(cProg.update(con, id)>0)
                {
                    con.Close();
                    con.Dispose();
                    Box.infoBox("Data successfully updated.");
                }
                else
                {
                    con.Close();
                    con.Dispose();
                    Box.warnBox("An error occured. Please contact system administrator.");
                }
              
            }
            else
            {
                con = Connection.con();
                con.Open();
                if(cProg.insert(con) > 0)
                {
                    id = Helper.returnLastInsertID(con);
                    con.Close();
                    con.Dispose();
                    Box.infoBox("Data successfully saved.");
                }
                else
                {
                    con.Close();
                    con.Dispose();
                    Box.warnBox("An error occured. Please contact system administrator.");
                }
               

            }
        }

        void getData()
        {
            con = Connection.con();
            con.Open();
            DataTable dt = new DataTable();
            dt = cProg.getData(con, id);
            con.Close();
            con.Dispose();
            if(dt.Rows.Count > 0)
            {
                temp = txtpCode.Text = Convert.ToString(dt.Rows[0]["progCode"]);
                txtDesc.Text = Convert.ToString(dt.Rows[0]["progDesc"]);
            }
        }
        private void ProgramAddModify_Load(object sender, EventArgs e)
        {
            if (id > 0)
            {
                getData();
            }
        }
    }
}

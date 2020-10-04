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
    public partial class GradeAddModify : Form
    {
        MySqlCommand cmd;
        string query;
        MySqlConnection con;

        public int id;
        string temp = "";
        GradeMainform _frm;

        ClassGrade cGrade;

        public GradeAddModify(GradeMainform _frm)
        {
            InitializeComponent();
            cGrade = new ClassGrade();
            this._frm = _frm;
        }

        void getData()
        {
            con = Connection.con();
            con.Open();
            DataTable dt = new DataTable();
            dt = cGrade.getData(con, id);
            con.Close();
            con.Dispose();
            if(dt.Rows.Count > 0)
            {
                temp = txtGrade.Text = Convert.ToString(dt.Rows[0]["grade"]);
            }
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtGrade.Text))
            {
                Box.warnBox("Please input grade level.");
                return;
            }
            if (id == 0)
            {
                con = Connection.con();
                con.Open();
                if(cGrade.isExist(con, txtGrade.Text.Trim()))
                {
                    Box.warnBox("Grade already in the database.");
                    return;
                }
                con.Close();
                con.Dispose();
            }

            if (id > 0)
            {
                if(temp != txtGrade.Text)
                {
                    con = Connection.con();
                    con.Open();
                    if (cGrade.isExist(con, txtGrade.Text.Trim()))
                    {
                        Box.warnBox("Grade already in the database.");
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
            if (id > 0)
            {
                con = Connection.con();
                con.Open();
                cGrade.grade = txtGrade.Text.Trim();
                if(cGrade.edit(con, id) > 0)
                {
                    con.Close();
                    con.Dispose();
                    Box.infoBox("Data successfully updated.");
                }
                else
                {
                    Box.warnBox("Something went wrong. Please contact system adminstrator.");
                    con.Close();
                    con.Dispose();

                }
             
            }
            else
            {
                con = Connection.con();
                con.Open();
                cGrade.grade = txtGrade.Text.Trim();
                if (cGrade.insert(con) > 0)
                {
                    id = Helper.returnLastInsertID(con);
                    con.Close();
                    con.Dispose();
                    Box.infoBox("Data successfully saved!");
                }
                else
                {
                    Box.warnBox("Something went wrong. Please contact system adminstrator.");
                    con.Close();
                    con.Dispose();

                }
              
            }
        }

        private void GradeAddModify_Load(object sender, EventArgs e)
        {
            if (id > 0)
            {
                getData();
            }
        }
    }
}

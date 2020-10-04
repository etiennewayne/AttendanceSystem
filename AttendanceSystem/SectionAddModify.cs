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
    public partial class SectionAddModify : Form
    {
        ClassGrade cgrade;
        MySqlConnection con;
        ClassSection section;

        public int id;

        SectionMainform sMain;


        public SectionAddModify(SectionMainform sMain)
        {
            InitializeComponent();
            cgrade =new ClassGrade();
            section = new ClassSection();
            this.sMain = sMain;
          
        }

        private void SectionAddModify_Load(object sender, EventArgs e)
        {
            con = Connection.con();
            con.Open();
            cgrade.populateComboGrade(con, cmbGrade);
            con.Close();
            con.Dispose();

            if (id > 0)
            {
                getData();
            }

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(cmbGrade.Text))
            {
                Box.warnBox("Please select Grade.");
                return;
            }
            if (String.IsNullOrEmpty(txtSection.Text))
            {
                Box.warnBox("Please input section.");
                return;
            }


            processSave();
            sMain.loadData();
            this.Close();

        }


        void processSave()
        {
            if (id > 0)
            {
                con = Connection.con();
                con.Open();
                section.grade = cmbGrade.Text;
                section.section = txtSection.Text;
               if(section.update(con, id) > 0)
                {
                    con.Close();
                    con.Dispose();
                    Box.infoBox("Data successfully updated.");
                }
                else
                {
                    con.Close();
                    con.Dispose();
                    Box.warnBox("Something went wrong. Please contact system administrator.");
                }
            }
            else
            {
                con = Connection.con();
                con.Open();
                section.grade = cmbGrade.Text;
                section.section = txtSection.Text;
                if (section.insert(con)>0)
                {
                    con.Close();
                    con.Dispose();
                    Box.infoBox("Data successfully saved.");
                }
                else
                {
                    con.Close();
                    con.Dispose();
                    Box.warnBox("Something went wrong. Please contact system administrator.");
                }
            }
        }

        void getData()
        {
            con = Connection.con();
            con.Open();
            DataTable dt = new DataTable();
            dt = section.getData(con, id);
            con.Close();
            con.Dispose();

            if(dt.Rows.Count > 0)
            {
                cmbGrade.Text = Convert.ToString(dt.Rows[0]["grade"]);
                txtSection.Text = Convert.ToString(dt.Rows[0]["section"]);
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

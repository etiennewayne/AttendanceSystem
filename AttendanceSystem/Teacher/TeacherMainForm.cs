using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using AttendanceSystem.Reports;
using AttendanceSystem.Teacher;

namespace AttendanceSystem
{
    public partial class TeacherMainForm : Form
    {
        Login _frm;

        public TeacherMainForm(Login _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }

        private bool CheckOpened(string name)
        {
            FormCollection fc = Application.OpenForms;

            foreach (Form frm in fc)
            {
                if (frm.Name == name)
                {
                    return true;
                }
            }
            return false;
        }


        private void TeacherMainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            _frm.Show();
        }

        private void toolStripAccount_Click(object sender, EventArgs e)
        {
            if (CheckOpened("TeacherAccount"))
            {
                Application.OpenForms["TeacherAccount"].BringToFront();
            }
            else
            {
                TeacherAccount frm = new TeacherAccount();
                frm.Show();
            }
        }

        private void TeacherMainForm_Load(object sender, EventArgs e)
        {
            lblUsername.Text = Properties.Settings.Default.username.ToUpper();
            this.Text = Properties.Settings.Default.username.ToUpper();

           // Box.infoBox(Properties.Settings.Default.userID.ToString());
        }

        private void btnMenuStudent_Click(object sender, EventArgs e)
        {
            StudentList frm = new StudentList();
            frm.ShowDialog();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (CheckOpened("TeacherReportStudentLog"))
            {
                Application.OpenForms["TeacherReportStudentLog"].BringToFront();
            }
            else
            {
                TeacherReportStudentLog frm = new TeacherReportStudentLog();
                frm.Show();
            }
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            if (CheckOpened("TeacherReport"))
            {
                Application.OpenForms["TeacherReport"].BringToFront();
            }
            else
            {
                TeacherReport frm = new TeacherReport();
                frm.Show();
            }
        }
    }
}

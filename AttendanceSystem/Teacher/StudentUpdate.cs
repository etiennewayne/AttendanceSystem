using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace AttendanceSystem.Teacher
{
    public partial class StudentUpdate : StudentAddForm
    {

        StudentList _frm;
       // public int myid;

        public StudentUpdate(StudentList _frm, int id) 
            : base(null)
        {
            // InitializeComponent();
            this.id = id;
            btnNew.Enabled = false;
            this._frm = _frm;
        }


        public override void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtRFID.Text))
            {
                if (!Box.questionBox("No RFID inputted. Do you want to continue?", "NO RFID!"))
                {
                    txtRFID.Focus();
                    return;
                }

            }

            if (String.IsNullOrEmpty(txtStudentID.Text))
            {
                Box.warnBox("Please input Student ID.");
                txtStudentID.Focus();
                return;
            }


            if (String.IsNullOrEmpty(txtlname.Text))
            {
                Box.warnBox("Please input Lastname.");
                txtlname.Focus();
                return;
            }
            if (String.IsNullOrEmpty(txtfname.Text))
            {
                Box.warnBox("Please input Firstname.");
                txtfname.Focus();
                return;
            }


            //if (String.IsNullOrEmpty(cmbGrade.Text) && String.IsNullOrEmpty(cmbProgram.Text))
            //{
            //    Box.warnBox("Please input Grade or Program.");
            //   // cmbGrade.Focus();
            //    return;
            //}

            if (!txtContact.MaskFull)
            {
                Box.warnBox("Please input contact no.");
                return;
            }


            if (id == 0)
            {
                if (Helper.isExist("student", "rfid", txtRFID.Text.Trim()))
                {
                    Box.warnBox("RFID already in used.");
                    return;
                }
            }


            try
            {
                processSave();
                _frm.LoadData();

            }
            catch (Exception er)
            {

                // throw;
                Box.errBox(er.Message);
            }


        }


    }
}

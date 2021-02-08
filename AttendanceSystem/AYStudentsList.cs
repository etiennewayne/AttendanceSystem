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
    public partial class AYStudentsList : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public AYStudentsList()
        {
            InitializeComponent();
        }



        public void loaddata()
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_aystudents where ayCode like ?aycode and studentID like ?stdid and lname like ?lname and fname like ?fname";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?ayCode", cmbAYCode.Text + "%");
            cmd.Parameters.AddWithValue("?stdid", txtSstudentID.Text + "%");
            cmd.Parameters.AddWithValue("?lname", txtlname.Text + "%");
            cmd.Parameters.AddWithValue("?fname", txtfname.Text + "%");
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



        private void AYStudentsList_Load(object sender, EventArgs e)
        {
            try
            {
                Helper.LoadCmb("select distinct(ayCode) from academicyear order by aycode asc", cmbAYCode);
                cmbAYCode.Text = new AttendanceSystem.Classes.ClassAcademicYear().getCurrentAYActive();


                loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message + "\nPlease contact System Administrator.");
               // throw;
            }
           
        }

        private void btnRemove_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                if (Box.questionBox("Are you sure you want to remove this student?", "REMOVE?"))
                {
                    try
                    {
                        int id = Convert.ToInt32(flx[flx.RowSel, "ayStudentID"]);
                        if (removeStudent(id))
                        {
                            Box.infoBox("Student successfully removed.");
                            loaddata();
                        }
                        else
                        {
                            Box.warnBox("Something went wrong. Please contact system administrator.");
                        }
                    }
                    catch (Exception er)
                    {
                        Box.errBox(er.Message);
                       // throw;
                    }
                   

                }
            }
            else
            {
                Box.warnBox("No data found.");
            }
            
        }


        Boolean removeStudent(int stdid)
        {
            con = Connection.con();
            con.Open();
            query = "delete from ay_students where ayStudentID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", stdid);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            if (i > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void cmbAYCode_KeyDown(object sender, KeyEventArgs e)
        {
            //try
            //{
            //    loaddata();
            //}
            //catch (Exception er)
            //{
            //    Box.errBox(er.Message);
            //   // throw;
            //}
        }

        private void txtSstudentID_KeyDown(object sender, KeyEventArgs e)
        {
            try
            {
                loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                // throw;
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            loaddata();
        }
    }
}

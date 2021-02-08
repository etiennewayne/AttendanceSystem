using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;


namespace AttendanceSystem
{
    public partial class StudentList_OfTeacher : Form
    {

        public int teacher_id;

        public int room_teacher_id;


        public string aycode;


        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public StudentList_OfTeacher()
        {
            InitializeComponent();
        }


        public void LoadData()
        {
            con = Connection.con();
            con.Open();

            //this will populate grades from database to comboBox Grade
        

            query = @"select * from (select * from vw_students_by_teacher where teacher_id = ?tid) as a 
                    where lname like ?lname and fname like ?fname";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?tid", teacher_id);
        
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

        private void StudentList_OfTeacher_Load(object sender, EventArgs e)
        {
            try
            {
                new Classes.ClassAcademicYear().comboAcademicYear(cmbAcademicYear);
                cmbAcademicYear.Text = aycode;
                LoadData();


            }
            catch (Exception)
            {

                //throw;
            }
        }

     

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                LoadData();
            }
            catch (Exception)
            {}
        }

      

        private void btnRemove_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                remove();
                Box.infoBox("Remove successfully.");
                LoadData();
            }
            else
            {
                Box.warnBox("No data selected.");
            }
        }


        void remove()
        {
            int nid = Convert.ToInt32(flx[flx.RowSel, "ayStudentID"]);
            con = Connection.con();
            con.Open();
            query = "DELETE FROM ay_students WHERE ayStudentID =?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", nid);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();

        }
    }
}

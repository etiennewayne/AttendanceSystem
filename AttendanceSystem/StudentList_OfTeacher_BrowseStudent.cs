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
    public partial class StudentList_OfTeacher_BrowseStudent : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        ClassGrade cGrade;
        ClassSection cSection;

        public string aycode;
        public int room_teacher_id;

        StudentList_OfTeacher _frm;


        public StudentList_OfTeacher_BrowseStudent(StudentList_OfTeacher _frm)
        {
            InitializeComponent();
            cGrade = new ClassGrade();
            cSection = new ClassSection();

            this._frm = _frm;
        }

        private void StudentList_OfTeacher_BrowseStudent_Load(object sender, EventArgs e)
        {
            try
            {
                new Classes.ClassAcademicYear().comboAcademicYear(cmbAcademicYear);
                cmbAcademicYear.Text = aycode;

                LoadData();

                con = Connection.con();
                con.Open();
                cGrade.populateComboGrade(con, cmbGrade);
                con.Close();
                con.Dispose();


             

            }
            catch (Exception)
            {}
        }

        void LoadData()
        {
            con = Connection.con();
            con.Open();

          

            query = @"select * from (select * from vw_aystudents where ayCode=?aycode and ayStudentID not in (select ayStudentID from studentlists)) as b 
                where lname like ?lname and fname like  ?fname and grade like ?grade and section like ?section";
                //and grade like ?grade and section like ?section";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?aycode", cmbAcademicYear.Text);
            cmd.Parameters.AddWithValue("?lname", txtlname.Text + "%");
            cmd.Parameters.AddWithValue("?fname", txtfname.Text + "%");
            cmd.Parameters.AddWithValue("?grade", cmbGrade.Text + "%");
            cmd.Parameters.AddWithValue("?section", cmbSection.Text + "%");

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

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                LoadData();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
               // throw;
            }
        }

        private void cmbGrade_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con = Connection.con();
                con.Open();
                cSection.populateCombo(con, cmbSection, cmbGrade.Text);
                con.Close();
                con.Dispose();
            }
            catch (Exception)
            {
            }
               
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                save();
                Box.infoBox("Student successfully added.");
                LoadData();
                _frm.LoadData();
                //this.Close();
            }
            else
            {
                Box.warnBox("No date selected.");
            }
        }

        void save()
        {

            int ayStudentID = Convert.ToInt32(flx[flx.RowSel, "ayStudentID"]);
            con = Connection.con();
            con.Open();
            query = "insert into studentlists (room_teacher_id, ayStudentID) values (?room_teacher_id, ?ayStudentID)";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?room_teacher_id", room_teacher_id);
            cmd.Parameters.AddWithValue("?ayStudentID", ayStudentID);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }
    }
}

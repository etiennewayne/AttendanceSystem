using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AttendanceSystem.Classes;
using MySql.Data.MySqlClient;


namespace AttendanceSystem
{
    public partial class SetupTeacherAddModify : Form
    {

        SetupTeacherForm _frm;

        public int room_id = 0;
        public int teacher_id = 0;

        ClassAcademicYear ay;


        public int id;


        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        ClassGrade grade;
        ClassSection section;



        public SetupTeacherAddModify(SetupTeacherForm _frm)
        {
            InitializeComponent();


            grade = new ClassGrade();
            section = new ClassSection();
            ay = new ClassAcademicYear();


            this._frm = _frm;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SetupTeacher_BrowseRoom frm = new SetupTeacher_BrowseRoom(this);
            frm.ShowDialog();
        }

        private void SetupTeacherAddModify_Load(object sender, EventArgs e)
        {
            ay.comboAcademicYear(cmbAY);
            cmbAY.Text = new ClassAcademicYear().getCurrentAYActive();

            con = Connection.con();
            con.Open();
            grade.populateComboGrade(con, cmbGrade);
            con.Close();
            con.Dispose();

            if (id > 0)
            {
                //if id has value, you are in edit mode.
                getData();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SetupTeacher_BrowseTeacher frm = new SetupTeacher_BrowseTeacher(this);
            frm.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {


            if (String.IsNullOrEmpty(cmbAY.Text))
            {
                Box.warnBox("Please select academic year.");
                return;
            }


            if (String.IsNullOrEmpty(cmbGrade.Text))
            {
                Box.warnBox("Please select grade level.");
                return;
            }


            if (String.IsNullOrEmpty(cmbSection.Text))
            {
                Box.warnBox("Please select section.");
                return;
            }

            if (String.IsNullOrEmpty(txtRoom.Text) && room_id < 1)
            {
                Box.warnBox("Please select room.");
                return;
            }

            if (String.IsNullOrEmpty(txtlname.Text) && teacher_id < 1)
            {
                Box.warnBox("Please select teacher.");
                return;
            }

            if (isExist())
            {
                Box.warnBox("Grade and section assigned by another teacher.");
                return;
            }

            if (isAssignedRoom())
            {
                Box.warnBox("Room already used in this academic year.");
                return;
            }


            if (isTeacherAssigned())
            {
                Box.warnBox("Teacher already assigned.");
                return;
            }



            proccessSave();
        }

        void proccessSave()
        {
            if (id > 0)
            {
                update(this.id);
              
            }
            else
            {
                save();
          
            }
            _frm.LoadData();
            this.Close();
        }


        void save()
        {
            con = Connection.con();
            con.Open();

            int ayid = ay.getID(con, cmbAY.Text);

            int grade_id = grade.gradeID(con, cmbGrade.Text);
            int section_id = section.getSectionID(con, cmbSection.Text, cmbGrade.Text);

            query = "INSERT INTO rooms_teacher (teacherID, roomID, academicyearID, gradeID, sectionID) VALUES (?tid, ?roomid, ?ayid, ?gradeid, ?sectionid)";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?tid", teacher_id);
            cmd.Parameters.AddWithValue("?roomid", room_id);
            cmd.Parameters.AddWithValue("?ayid", ayid);
            cmd.Parameters.AddWithValue("?gradeid", grade_id);
            cmd.Parameters.AddWithValue("?sectionid", section_id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            Box.infoBox("Teacher setup saved successfully.");
        }

        void update(int id)
        {
            con = Connection.con();
            con.Open();

            int ayid = ay.getID(con, cmbAY.Text);
            int grade_id = grade.gradeID(con, cmbGrade.Text);
            int section_id = section.getSectionID(con, cmbSection.Text, cmbGrade.Text);

            query = "UPDATE rooms_teacher SET teacherID =?tid, roomID=?roomid, academicyearID=?ayid, gradeID=?gradeid, sectionID=?sectionid WHERE room_teacher_id = ?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?tid", teacher_id);
            cmd.Parameters.AddWithValue("?roomid", room_id);
            cmd.Parameters.AddWithValue("?ayid", ayid);
            cmd.Parameters.AddWithValue("?gradeid", grade_id);
            cmd.Parameters.AddWithValue("?sectionid", section_id);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            Box.infoBox("Teacher setup updated successfully.");
        }



        bool isExist()
        {
            con = Connection.con();
            con.Open();

            int ayid = ay.getID(con, cmbAY.Text);
            int grade_id = grade.gradeID(con, cmbGrade.Text);
            int section_id = section.getSectionID(con, cmbSection.Text, cmbGrade.Text);

            query = "select * from rooms_teacher where academicyearID=?ayid and gradeID=?gid and sectionID=?sid";
            cmd = new MySqlCommand(query, con);
     
            cmd.Parameters.AddWithValue("?ayid", ayid);
            cmd.Parameters.AddWithValue("?gid", grade_id);
            cmd.Parameters.AddWithValue("?sid", section_id);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            bool flag = false;
            flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return flag;
        }


        bool isAssignedRoom()
        {
            con = Connection.con();
            con.Open();

            int ayid = ay.getID(con, cmbAY.Text);
        
            query = "select * from rooms_teacher where roomID=?roomid and academicyearID=?ayid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?roomid", room_id);
            cmd.Parameters.AddWithValue("?ayid", ayid);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            bool flag = false;
            flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return flag;
        }

        bool isTeacherAssigned()
        {
            con = Connection.con();
            con.Open();

            int ayid = ay.getID(con, cmbAY.Text);

            query = "select * from rooms_teacher where teacherID=?tid and academicyearID=?ayid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?tid", teacher_id);
            cmd.Parameters.AddWithValue("?ayid", ayid);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            bool flag = false;
            flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return flag;
        }




        //get data in edit mode
        void getData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_rooms_teacher where room_teacher_id = ?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            if(dt.Rows.Count > 0)
            {
                cmbAY.Text = Convert.ToString(dt.Rows[0]["ayCode"]);

                room_id = Convert.ToInt32(dt.Rows[0]["roomID"]);
                txtRoom.Text = Convert.ToString(dt.Rows[0]["roomCode"]);
                txtRoomDesc.Text = Convert.ToString(dt.Rows[0]["roomDesc"]);

                cmbGrade.Text = Convert.ToString(dt.Rows[0]["grade"]);
                cmbSection.Text = Convert.ToString(dt.Rows[0]["section"]);

                teacher_id = Convert.ToInt32(dt.Rows[0]["teacherID"]);
                txtlname.Text = Convert.ToString(dt.Rows[0]["tlname"]);
                txtfname.Text = Convert.ToString(dt.Rows[0]["tfname"]);
                txtmname.Text = Convert.ToString(dt.Rows[0]["tmname"]);
            }
        }

        private void cmbGrade_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con = Connection.con();
                con.Open();
                section.populateCombo(con, cmbSection, cmbGrade.Text);
                con.Close();
                con.Dispose();
            }
            catch (Exception)
            {

            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;


namespace AttendanceSystem.Classes
{
    class ClassStudentList
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public int StudentListID { set; get; }

        public int StudentID { set; get; }

        public string StudentLastname { set; get; }

        public string StudentFirstname { set; get; }

        public string StudentMiddleName { set; get; }

        public string StudentMobileNo { set; get; }

        public int AcademicYearID { set; get; }

        public string AYCode { set; get; }

        public int Semester { set; get; }

        public DataTable StudentList(int teacherID, string aycode)
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_studentlists where teacherID = ?tid and ayCode=?aycode";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?tid", teacherID);
            cmd.Parameters.AddWithValue("?aycode", aycode);
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return dt;
        }

        public DataTable StudentList(int teacherID, string aycode, string lname, string fname)
        {
            con = Connection.con();
            con.Open();
            query = "select * from (select * from vw_studentlists where teacherID = ?tid and ayCode=?aycode) a where lname like ?lname and fname like ?fname";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?tid", teacherID);
            cmd.Parameters.AddWithValue("?aycode", aycode);
            cmd.Parameters.AddWithValue("?lname", lname + "%");
            cmd.Parameters.AddWithValue("?fname", fname + "%");
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return dt;
        }


    }
}

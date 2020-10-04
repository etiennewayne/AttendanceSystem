using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;


namespace AttendanceSystem
{
    class ClassStudent
    {
        MySqlCommand cmd;
        MySqlConnection con;
        string query;


      //  int id;

        public ClassStudent()
        {

        }


        public string rfid { set; get; }
        public string studentID { set; get; }
        public string lrn { set; get; }
        public string lname { set; get; }
        public string fname { set; get; }
        public string mname { set; get; }
        public string sex { set; get; }
        public string grade { set; get; }
        public string section { set; get; }
        public string program { set; get; }
        public int yearlvl   { set; get; }
        public string mobileNo { set; get; }


        int gradeID(MySqlConnection con)
        {
            int gradeid  =0;
            query = "select gradeID from grades where grade=?grade";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?grade", this.grade);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                gradeid = Convert.ToInt32(dr["gradeID"]);
            }
            dr.Close();
            cmd.Dispose();

            return gradeid;
        }

        int sectionID(MySqlConnection con)
        {
            int sectionid = 0;
            query = "select sectionID from sections where section=?section";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?section", this.section);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                sectionid = Convert.ToInt32(dr["sectionID"]);
            }
            dr.Close();
            cmd.Dispose();

            return sectionid;
        }

        int programID(MySqlConnection con)
        {
            int programid = 0;
            query = "select programID from programs where progCode=?pcode";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?pcode", this.program);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                programid = Convert.ToInt32(dr["programID"]);
            }dr.Close();
            cmd.Dispose();

            return programid;
        }


        public void insert(MySqlConnection con)
        {
            query = @"UPDATE student SET rfid=?rfid, studentID=?stdid, lrn=?lrn, lname=?lname, fname=?fname,
                        mname=?mname, sex=?sex, gradeID=?gid, programID=?progID, yearlvl=?yrlvl, mobileNo=?mobile";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?rfid", rfid);
            cmd.Parameters.AddWithValue("?stdid", studentID);
            cmd.Parameters.AddWithValue("?lrn", lrn);
            cmd.Parameters.AddWithValue("?lname", lname);
            cmd.Parameters.AddWithValue("?fname", fname);
            cmd.Parameters.AddWithValue("?mname", mname);
            cmd.Parameters.AddWithValue("?sex", sex);
            cmd.Parameters.AddWithValue("?gid", gradeID(con));
            cmd.Parameters.AddWithValue("?progID", gradeID(con));
            cmd.Parameters.AddWithValue("?yrlvl", yearlvl);
            cmd.Parameters.AddWithValue("?mobile", mobileNo);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }

        public void update(MySqlConnection con, int id)
        {
            query = @"UPDATE student SET rfid=?rfid, studentID=?stdid, lrn=?lrn, lname=?lname, fname=?fname,
                        mname=?mname, sex=?sex, gradeID=?gid, programID=?progID, yearlvl=?yrlvl, mobileNo=?mobile WHERE id=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?rfid", rfid);
            cmd.Parameters.AddWithValue("?stdid", studentID);
            cmd.Parameters.AddWithValue("?lrn", lrn);
            cmd.Parameters.AddWithValue("?lname", lname);
            cmd.Parameters.AddWithValue("?fname", fname);
            cmd.Parameters.AddWithValue("?mname", mname);
            cmd.Parameters.AddWithValue("?sex", sex);
            cmd.Parameters.AddWithValue("?gid", gradeID(con));
            cmd.Parameters.AddWithValue("?progID", gradeID(con));
            cmd.Parameters.AddWithValue("?yrlvl", yearlvl);
            cmd.Parameters.AddWithValue("?mobile", mobileNo);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }

        public void delete(MySqlConnection con, int id)
        {
            query = "delete from student where id=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }


        public DataTable dtStudent()
        {
            DataTable dt = new DataTable();
            con = Connection.con();
            con.Open();
            query = "select * from vw_student where rfid like ?rfid and studentID like ?stdid and lname like ?lname and fname like ?fname";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?rfid", rfid + "%");
            cmd.Parameters.AddWithValue("?stdid", studentID + "%");
            cmd.Parameters.AddWithValue("?lname", lname + "%");
            cmd.Parameters.AddWithValue("?fname", fname + "%");
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return dt;
        }


        

    }
}

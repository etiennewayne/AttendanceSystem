using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
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
      //  public string program { set; get; }
        public string guardian { set; get; }
        //public string progDesc { set; get; }
        public int yearlvl   { set; get; }
        public string mobileNo { set; get; }

        public string pmobileNo { set; get; }

        public PictureBox picBox { set; get; }

        public int exempted { set; get; }

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

      

        //int programID(MySqlConnection con)
        //{
        //    int programid = 0;
        //    query = "select programID from programs where progCode=?pcode";
        //    cmd = new MySqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("?pcode", this.program);
        //    MySqlDataReader dr;
        //    dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        programid = Convert.ToInt32(dr["programID"]);
        //    }dr.Close();
        //    cmd.Dispose();

        //    return programid;
        //}


        public int insert(MySqlConnection con)
        {
            int gradeid = gradeID(con);
          //  int programid = programID(con);
            int sectionid = new ClassSection().getSectionID(con, section, grade);
            query = @"INSERT INTO student SET rfid=?rfid, studentID=?stdid, lrn=?lrn, lname=?lname, fname=?fname,
                        mname=?mname, sex=?sex, gradeID=?gid, sectionID=?sectionid, mobileNo=?mobile, pMobileNo=?pmobile, guardian=?guardian, img = ?img, isExempted=?xmtd";

            //query = @"INSERT INTO student SET rfid=?rfid, studentID=?stdid, lrn=?lrn, lname=?lname, fname=?fname,
            //            mname=?mname, sex=?sex, gradeID=?gid, programID=?progID, yearlvl=?yrlvl, mobileNo=?mobile, img=?img";

            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?rfid", rfid);
            cmd.Parameters.AddWithValue("?stdid", studentID);
            cmd.Parameters.AddWithValue("?lrn", lrn);
            cmd.Parameters.AddWithValue("?lname", lname);
            cmd.Parameters.AddWithValue("?fname", fname);
            cmd.Parameters.AddWithValue("?mname", mname);
            cmd.Parameters.AddWithValue("?sex", sex);
            cmd.Parameters.AddWithValue("?gid", gradeid);
            cmd.Parameters.AddWithValue("?sectionid", sectionid);
           // cmd.Parameters.AddWithValue("?progID",programid);
          //  cmd.Parameters.AddWithValue("?yrlvl", yearlvl);
            cmd.Parameters.AddWithValue("?mobile", mobileNo);
            cmd.Parameters.AddWithValue("?pmobile", pmobileNo);
            cmd.Parameters.AddWithValue("?guardian", guardian);
            cmd.Parameters.AddWithValue("?img", imgData());

           

            cmd.Parameters.AddWithValue("?xmtd", exempted);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public int update(MySqlConnection con, int id)
        {
            int gradeid = gradeID(con);
         //   int programid = programID(con);
            int sectionid = new ClassSection().getSectionID(con, section, grade);

            query = @"UPDATE student SET rfid=?rfid, studentID=?stdid, lrn=?lrn, lname=?lname, fname=?fname,
                        mname=?mname, sex=?sex, gradeID=?gid, sectionID=?sectionid, mobileNo=?mobile,  pMobileNo=?pmobile, guardian=?guardian, img=?img, isExempted=?xmtd WHERE id=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?rfid", rfid);
            cmd.Parameters.AddWithValue("?stdid", studentID);
            cmd.Parameters.AddWithValue("?lrn", lrn);
            cmd.Parameters.AddWithValue("?lname", lname);
            cmd.Parameters.AddWithValue("?fname", fname);
            cmd.Parameters.AddWithValue("?mname", mname);
            cmd.Parameters.AddWithValue("?sex", sex);
            cmd.Parameters.AddWithValue("?gid", gradeid);
            cmd.Parameters.AddWithValue("?sectionid", sectionid);
           // cmd.Parameters.AddWithValue("?progID", programid);
          //  cmd.Parameters.AddWithValue("?yrlvl", yearlvl);
            cmd.Parameters.AddWithValue("?mobile", mobileNo);
            cmd.Parameters.AddWithValue("?pmobile", pmobileNo);
            cmd.Parameters.AddWithValue("?guardian", guardian);
            cmd.Parameters.AddWithValue("?img", imgData());
            cmd.Parameters.AddWithValue("?xmtd", exempted);
            cmd.Parameters.AddWithValue("?id", id);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public int delete(MySqlConnection con, int id)
        {
            query = "delete from student where id=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public byte[] imgData()
        {
            bool isNullOrEmptyPictureBox = picBox == null || picBox.Image == null;
            if (!isNullOrEmptyPictureBox)
            {
                Image image = picBox.Image;
                MemoryStream memoryStream = new MemoryStream();
                image.Save(memoryStream, ImageFormat.Jpeg);
                return memoryStream.ToArray();
            }
            else
                return null;
           
        }

        public void studentImage(PictureBox p, DataTable dt, string colname)
        {
            if (!DBNull.Value.Equals(dt.Rows[0][colname]))
            {
                byte[] result = (byte[])dt.Rows[0][colname];

                int ArraySize = result.GetUpperBound(0);
                MemoryStream ms = new MemoryStream(result, 0, ArraySize);
                p.Image = Image.FromStream(ms);

            }
        }


        public DataTable dtStudent(int id)
        {
            DataTable dt = new DataTable();
            con = Connection.con();
            con.Open();
            if (id > 0)
            {
                query = "select * from vw_student where id=?id";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?id", id);
   
            }
            else
            {
                query = "select * from vw_student where rfid like ?rfid and studentID like ?stdid and lname like ?lname and fname like ?fname";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?rfid", rfid + "%");
                cmd.Parameters.AddWithValue("?stdid", studentID + "%");
                cmd.Parameters.AddWithValue("?lname", lname + "%");
                cmd.Parameters.AddWithValue("?fname", fname + "%");
            }
           
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return dt;
        }

        public DataTable dtStudent(string rfid, string aycode)
        {
            DataTable dt = new DataTable();
            con = Connection.con();
            con.Open();
        
                query = "select * from vw_aystudents where rfid = ?rfid and ayCode=?aycode";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?rfid", rfid);
            cmd.Parameters.AddWithValue("?aycode", aycode);



            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return dt;
        }

        public DataTable dtStudent(string rfid)
        {
            DataTable dt = new DataTable();
            con = Connection.con();
            con.Open();

            query = "select * from vw_student where rfid = ?rfid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?rfid", rfid);
            //cmd.Parameters.AddWithValue("?aycode", aycode);



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

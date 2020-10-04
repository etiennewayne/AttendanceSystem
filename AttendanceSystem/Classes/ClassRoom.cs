using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace AttendanceSystem.Classes
{
    class ClassRoom
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;



        public int roomID { set; get; }

        public int teacherID { set; get; }

        public string roomCode { set; get; }

        public string roomDesc { set; get; }

        public string Lastname
        {
            set;get;
        }

        public string Firstname
        {
            set; get;
        }

        public string Middlename
        {
            set; get;
        }

        public string MobileNo
        {
            set; get;
        }

        public string Position
        {
            set; get;
        }
        public string Fullname
        {
            set; get;
        }


        public ClassRoom()
        {

        }


        public void getTeacher(int teacherID)
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_rooms where teacherID = ?tid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?tid", teacherID);
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Lastname = Convert.ToString(dr["lname"]);
                Firstname = Convert.ToString(dr["fname"]);
                Middlename = Convert.ToString(dr["mname"]);
                MobileNo = Convert.ToString(dr["mobileNo"]);
                Position = Convert.ToString(dr["position"]);
                Fullname = Convert.ToString(dr["fullname"]);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            

        }


        public int update(MySqlConnection con, int id)
        {
            query = @"UPDATE rooms SET roomCode=?roomCode, roomDesc=?roomDesc WHERE roomID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?roomCode", roomCode);
            cmd.Parameters.AddWithValue("?roomDesc", roomDesc);
            cmd.Parameters.AddWithValue("?id", id);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public int insert(MySqlConnection con)
        {
            query = @"INSERT INTO rooms SET roomCode=?roomCode, roomDesc=?roomDesc, teacherID=?tid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?roomCode", roomCode);
            cmd.Parameters.AddWithValue("?roomDesc", roomDesc);
            cmd.Parameters.AddWithValue("?tid", teacherID);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public void delete(MySqlConnection con, int id)
        {
            query = @"DELETE FROM rooms WHERE roomID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }


    }
}

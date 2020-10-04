using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;


namespace AttendanceSystem
{
    class ClassPhonebookTeacher
    {

        MySqlCommand cmd;
        MySqlConnection con;
        string query;


        public int phonebookID { set; get; }

        public string Lastname
        {
            set; get;
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

    }
}

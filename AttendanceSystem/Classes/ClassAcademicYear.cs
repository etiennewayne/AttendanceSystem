using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace AttendanceSystem.Classes
{
    class ClassAcademicYear
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        public int getID(MySqlConnection con, string ayCode)
        {
            int ayid = 0;
            //con.Open();
            query = "select academicyearID from academicyear where ayCode=?aycode limit 1";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?aycode", ayCode);
            ayid = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.Dispose();
            return ayid;
        }

        public string getCurrentAYActive(MySqlConnection con)
        {
            string aycode="";
            query = "select ayCode from academicyear where active=1 limit 1";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?aycode", aycode);
            aycode = Convert.ToString(cmd.ExecuteScalar());
            cmd.Dispose();
            return aycode;
        }

        public string getCurrentAYActive()
        {
            string aycode = "";
            con = Connection.con();
            con.Open();

            query = "select ayCode from academicyear where active=1 limit 1";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?aycode", aycode);
            aycode = Convert.ToString(cmd.ExecuteScalar());
            cmd.Dispose();
           
            con.Close();
            con.Dispose();
            return aycode;
        }



        public void comboAcademicYear(ComboBox cmb)
        {
            con = Connection.con();
            con.Open();
            query = "select * from academicyear order by ayCode asc";
            cmd = new MySqlCommand(query, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmb.Items.Add(Convert.ToString(dr["ayCode"]));
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }

    }
}

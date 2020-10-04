using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace AttendanceSystem
{
    class ClassSection
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query = String.Empty;
        //int id;


        public ClassSection()
        {

        }


        public int sectionID { set; get; }
        public string section { set; get; }

        public void populateCombo(MySqlConnection con, ComboBox cmb)
        {
            query = "select section from sections order by section asc";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?section", this.section);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmb.Items.Add(Convert.ToString(dr["section"]));
            }
            dr.Close();
            cmd.Dispose();
        }

        int getSectionID(MySqlConnection con)
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


        public void update(MySqlConnection con, int id)
        {
            query = @"UPDATE student SET section=?section WHERE sectionID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?section", section);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }

        public void insert(MySqlConnection con)
        {
            query = @"UPDATE student SET section=?section";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?section", section);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }

        public void delete(MySqlConnection con, int id)
        {
            query = @"DELETE FROM student WHERE sectionID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }
       


    }
}

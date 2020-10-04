using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace AttendanceSystem
{
    class ClassSection 
    {
        //MySqlConnection con;
        MySqlCommand cmd;
        string query = String.Empty;
        //int id;


        public ClassSection()
        {

        }


        public int sectionID { set; get; }
        public string section { set; get; }
        public string grade { set; get; }


        public void populateCombo(MySqlConnection con, ComboBox cmb, string grade)
        {
            cmb.Items.Clear();
            query = "select section from vw_sections where grade=?grade order by section asc";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?grade", grade);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmb.Items.Add(Convert.ToString(dr["section"]));
            }
            dr.Close();
            cmd.Dispose();
        }

        public int getSectionID(MySqlConnection con, string section, string grade)
        {
            int sectionid = 0;
            query = "select sectionID from vw_sections where section=?section and grade=?grade";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?section", section);
            cmd.Parameters.AddWithValue("?grade", grade);
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

        public int getGradeID(MySqlConnection con, string g)
        {
            int gradeid = 0;
            query = "select gradeID from grades where grade=?grade";
            cmd = new MySqlCommand(query, con);
         // cmd.Parameters.AddWithValue("?section", section);
            cmd.Parameters.AddWithValue("?grade", g);
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


        public int update(MySqlConnection con, int id)
        {
            int gid = getGradeID(con, grade);
            query = @"UPDATE sections SET gradeID=?gid, section=?section WHERE sectionID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?gid", gid);
            cmd.Parameters.AddWithValue("?section", section);
            cmd.Parameters.AddWithValue("?id", id);
            int i =cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public int insert(MySqlConnection con)
        {
            int gid = getGradeID(con, grade);
            query = @"insert sections SET gradeID=?gid, section=?section";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?gid", gid);
            cmd.Parameters.AddWithValue("?section", section);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public void delete(MySqlConnection con, int id)
        {
           
            query = @"DELETE FROM sections WHERE sectionID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }



        public DataTable dtSection(MySqlConnection con)
        {

            DataTable dt = new DataTable();
            query = "select * from vw_sections where section like ?section and grade like ?grade";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?section", section + "%");
            cmd.Parameters.AddWithValue("?grade", grade + "%");
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            cmd.Dispose();
            adptr.Dispose();

            return dt;
        }

        public DataTable getData(MySqlConnection con, int id)
        {
            DataTable dt = new DataTable();
            query = "select * from vw_sections where sectionID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            cmd.Dispose();
            adptr.Dispose();

            return dt;
        }



    }
}

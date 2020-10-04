using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Text;
using System.Windows.Forms;
using System.Data;

namespace AttendanceSystem
{
    class ClassGrade
    {
        MySqlCommand cmd;
        string query;

        public ClassGrade()
        {

        }

      
        public string grade { set; get; }


        public void populateComboGrade(MySqlConnection con, ComboBox cmb)
        {
            cmb.Items.Clear();
            query = "select grade from grades order by cast(grade as unsigned)";
            cmd = new MySqlCommand(query, con);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmb.Items.Add(Convert.ToString(dr["grade"]));
            }
            dr.Close();
            cmd.Dispose();
        }

        public bool isExist(MySqlConnection con, string grade)
        {
            bool flag = false;
            query = "select * from grades where grade=?grade";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?grade", grade);
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                flag = true;
            }dr.Close();
            cmd.Dispose();

            return flag;
        }
        public int gradeID(MySqlConnection con, string cmbString) {
            int id = 0;
            query = "select gradeID from grades where grade=?grade";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?grade", cmbString);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                id = Convert.ToInt32(dr["gradeID"]);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return id;
        }


        public int insert(MySqlConnection con)
        {
            query = "insert into grades set grade=?grade";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?grade", grade);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public int edit(MySqlConnection con, int id)
        {
            query = "update grades set grade=?grade where gradeID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?grade", grade);
            cmd.Parameters.AddWithValue("?id", id);
            int i=cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public void delete(MySqlConnection con, int id)
        {
            query = "delete from grades where gradeID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }

        public DataTable dtGrade(MySqlConnection con)
        {

            DataTable dt = new DataTable();
            query = "select * from grades where grade like ?grade";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?grade", grade+"%");
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            cmd.Dispose();
            adptr.Dispose();
         
            return dt;
        }

        public DataTable getData(MySqlConnection con, int id)
        {
            DataTable dt = new DataTable();
            query = "select * from grades where gradeID=?id";
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

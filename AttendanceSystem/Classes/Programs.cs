using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Data;

namespace AttendanceSystem.Classes
{
    class Programs
    {
        MySqlCommand cmd;
        string query = String.Empty;

        public Programs() { }


        public string progCode { set; get; }
        public string progDesc{ set; get; }

        public void populateCombo(MySqlConnection con, ComboBox cmb)
        {
            cmb.Items.Clear();
            query = "select progCode from programs order by progCode asc";
            cmd = new MySqlCommand(query, con);
           // cmd.Parameters.AddWithValue("?section", this.section);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmb.Items.Add(Convert.ToString(dr["progCode"]));
            }
            dr.Close();
            cmd.Dispose();
        }

        public int getProgramID(MySqlConnection con)
        {
            int id = 0;
            query = "select programID from programs where progCode=?progCode";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?progCode", this.progCode);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                id = Convert.ToInt32(dr["progCode"]);
            }
            dr.Close();
            cmd.Dispose();

            return id;
        }

        public string getProgramDesc(MySqlConnection con, string cmbString)
        {
            string desc = "";
            query = "select progDesc from programs where progCode=?progCode";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?progCode", cmbString);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                desc = Convert.ToString(dr["progDesc"]);
            }
            dr.Close();
            cmd.Dispose();

            return desc;
        }

        public bool isExistProgram(MySqlConnection con, string pCode)
        {
            bool flag = false;
           // string desc = "";
            query = "select * from programs where progCode=?progCode";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?progCode", pCode);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //desc = Convert.ToString(dr["progDesc"]);
                flag = true;
            }
            dr.Close();
            cmd.Dispose();

            return flag;
        }


        public int update(MySqlConnection con, int id)
        {
            query = @"UPDATE programs SET progCode=?progCode, progDesc=?progDesc WHERE programID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?progCode", progCode);
            cmd.Parameters.AddWithValue("?progDesc", progDesc);
            cmd.Parameters.AddWithValue("?id", id);
           int i =cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public int insert(MySqlConnection con)
        {
            query = @"INSERT INTO programs SET progCode=?progCode, progDesc=?progDesc";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?progCode", progCode);
            cmd.Parameters.AddWithValue("?progDesc", progDesc);
            int i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return i;
        }

        public void delete(MySqlConnection con, int id)
        {
            query = @"DELETE FROM programs WHERE programID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }

        public DataTable dtPrograms(MySqlConnection con)
        {
            DataTable dt = new DataTable();
            query = @"SELECT * FROM programs WHERE progCode LIKE ?pCode AND progDesc LIKE ?pDesc";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?pCode", progCode + "%");
            cmd.Parameters.AddWithValue("?pDesc", progDesc + "%");
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            //cmd.ExecuteNonQuery();
            cmd.Dispose();
            return dt;
        }

        public DataTable getData(MySqlConnection con, int id)
        {
            DataTable dt = new DataTable();
            query = @"SELECT * FROM programs WHERE programID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id",id);

            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            //cmd.ExecuteNonQuery();
            cmd.Dispose();
            return dt;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;


namespace AttendanceSystem.Classes
{
    class ClassPosition
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        public void allInComboBox(ComboBox cmb)
        {
            cmb.Items.Clear();
            con= Connection.con();
            con.Open();
            query = "select * from positions order by position asc";
            cmd = new MySqlCommand(query, con);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmb.Items.Add(Convert.ToString(dr["position"]));
            }dr.Close();
            con.Close();
            con.Dispose();
        }


        public int getID(string pos)
        {
            //cmb.Items.Clear();
            int id = 0;
            con = Connection.con();
            con.Open();
            query = "select * from positions where position=?pos";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?pos", pos);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
               id = Convert.ToInt32(dr["positionID"]);
            }
            dr.Close();
            con.Close();
            con.Dispose();
            return id;
        }


    }
}

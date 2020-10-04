using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace AttendanceSystem.Classes
{
    class ClassPort
    {
        MySqlCommand cmd;
        MySqlConnection con;
        string query;




        public Int16 getRFIDPort()
        {
            con = Connection.con();
            con.Open();
            query = "select * from port_setting where type='RFID'";
            cmd = new MySqlCommand(query, con);
            string port =  "0";
            MySqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read()){
                port = Convert.ToString(dr["port"]);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return Convert.ToInt16(port.Replace("COM", ""));
        }


        public Int16 getSMSPort()
        {
            con = Connection.con();
            con.Open();
            query = "select * from port_setting where type='SMS'";
            cmd = new MySqlCommand(query, con);
            string port = "0";
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                port = Convert.ToString(dr["port"]);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return Convert.ToInt16(port.Replace("COM", ""));
        }


    }
}

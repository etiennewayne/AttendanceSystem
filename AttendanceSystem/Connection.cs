using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Text;
using System.Windows.Forms;

/// <summary>
/// FUCK THE FEELING...............
/// I choose to hide it, cause i don't want to bother you anymore
/// happy ka naman sa kanya diba? thats matter most. I made mistake, for you sorry is not enough,
/// I aleady did what i can, if its disappoint you, i can't do nothing more. :'(
/// kita nlng tayo next chapter sa buhay natin....
/// </summary>

namespace AttendanceSystem
{
    class Connection
    {
        static string host = Properties.Settings.Default.server;
        static string dbuser = Properties.Settings.Default.dbuser;
        static string dbpwd = Properties.Settings.Default.dbpwd;
        static string database = Properties.Settings.Default.database;

        public static MySqlConnection con()
        {
          

            //string[] lines = System.IO.File.ReadAllLines(Application.StartupPath + "/config.txt");
            // return new MySqlConnection(lines[0] + ";" + lines[1] + ";user=root;password=''");
            return new MySqlConnection("server="+host+";database="+database+";user="+dbuser+";password="+dbpwd);
        }


        public static string getConnectionString()
        {
            return "server=" + host + ";database=" + database + ";user=" + dbuser + ";password=" + dbpwd;
        }
    }
}


///nothing i can do with this feeling..
///bigat lang po.. sana maunawaan ninyo..
///i need to wrote these as comments, cause i need to..
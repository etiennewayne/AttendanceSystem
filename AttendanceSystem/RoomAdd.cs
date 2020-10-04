using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Windows.Forms;

namespace AttendanceSystem
{
    public partial class RoomAdd : Form
    {

        MySqlCommand cmd;
        MySqlConnection con;
        string query;

        public int id;
       // int teacherid;


        RoomsMainform _frm;
        string temp;


        string assignedRoom;

        public RoomAdd(RoomsMainform _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtRoomCode.Text))
            {
                Box.warnBox("Please input room code.");
                return;
            }

            if (id == 0)
            {
                if (isRoomCodeExist())
                {
                    Box.warnBox("Room name already in the list.");
                    return;
                }
            }

            if (temp != txtRoomCode.Text)
            {
                if (isRoomCodeExist())
                {
                    Box.warnBox("Room name already in the list.");
                    return;
                }
            }

            if (!String.IsNullOrEmpty(txtTeacherID.Text))
            {
                if (isTeacherExist())
                {
                    Box.warnBox("Teacher already assigned in " + assignedRoom);
                    return;
                }

            }

            //if (String.IsNullOrEmpty(txtTeacherID.Text))
            //{
            //    Box.warnBox("Please select teacher.");
            //    return;
            //}

            //if (String.IsNullOrEmpty(txtTeacherID.Text))
            //{
            //    Box.warnBox("Please select a teacher.");
            //    return;
            //}


            processSave();
            _frm.LoadData();
            this.Close();
        }



        void processSave()
        {
            if (id > 0)
            {
                con = Connection.con();
                con.Open();
                query = "UPDATE rooms SET roomCode=?roomcode, roomDesc=?roomdesc, teacherID=?tid WHERE roomID=?rid";

                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?roomcode", txtRoomCode.Text.Trim());
                cmd.Parameters.AddWithValue("?roomdesc", txtRoomDesc.Text.Trim());
                cmd.Parameters.AddWithValue("?tid", txtTeacherID.Text);
                cmd.Parameters.AddWithValue("?rid", id);
                int i = cmd.ExecuteNonQuery();

                cmd.Dispose();

                con.Close();
                con.Dispose();

                if (i > 0) { Box.infoBox("Room successfully updated."); }

            }
            else
            {
                con = Connection.con();
                con.Open();
                query = "INSERT INTO rooms SET roomCode=?roomcode, roomDesc=?roomdesc, teacherID=?tid";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?roomcode", txtRoomCode.Text.Trim());
                cmd.Parameters.AddWithValue("?roomdesc", txtRoomDesc.Text.Trim());
                cmd.Parameters.AddWithValue("?tid", txtTeacherID.Text);
                int i = cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                con.Dispose();

                if (i > 0) { Box.infoBox("Room successfully saved."); }

            }
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            RoomBrowseTeachers frm = new RoomBrowseTeachers(this);
            frm.ShowDialog();
        }

        private void RoomAdd_Load(object sender, EventArgs e)
        {
            if (id > 0)
            {
                getData();
            }
        }


        void getData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_rooms where roomID = ?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            if (dt.Rows.Count > 0)
            {
                temp = txtRoomCode.Text = Convert.ToString(dt.Rows[0]["roomCode"]);
                txtRoomDesc.Text = Convert.ToString(dt.Rows[0]["roomDesc"]);
                if(Convert.ToInt32(dt.Rows[0]["teacherID"]) > 1)
                {
                    txtTeacherID.Text = Convert.ToString(dt.Rows[0]["teacherID"]);
                }
                
                string lname = Convert.ToString(dt.Rows[0]["lname"]);
                string fname = Convert.ToString(dt.Rows[0]["fname"]);
                string mname = Convert.ToString(dt.Rows[0]["mname"]);

                txtName.Text = Convert.ToString(dt.Rows[0]["fullname"]);
            }
        }

        bool isRoomCodeExist()
        {
            con = Connection.con();
            con.Open();
            query = "select * from vw_rooms where roomCode=?roomcode";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?roomcode", txtRoomCode.Text.Trim());
            MySqlDataReader dr = cmd.ExecuteReader();
            bool flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return flag;
            
        }

        bool isTeacherExist()
        { bool flag = false;
            con = Connection.con();
            con.Open();
            query = "select * from vw_rooms where teacherID=?tid";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?tid", txtTeacherID.Text.Trim());
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                flag = true;
                assignedRoom = Convert.ToString(dr["roomCode"]);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
            return flag;
        }

    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using AttendanceSystem.Classes;

using MySql.Data.MySqlClient;


namespace AttendanceSystem
{
    public partial class RoomsMainform : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        ClassRoom room;
        

        public RoomsMainform()
        {
            InitializeComponent();
            room = new ClassRoom();
        }

        public void LoadData()
        {
            try
            {
                con = Connection.con();
                con.Open();
                query = "select * from vw_rooms where roomCode like ?roomcode";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?roomcode", "%" + txtCode.Text + "%");
                DataTable dt = new DataTable();
                MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
                adptr.Fill(dt);

                this.flx.AutoGenerateColumns = false;
                this.flx.DataSource = dt;
            }
            catch (Exception er)
            {

                //throw;
                Box.errBox(er.Message);
            }
        }

        private void RoomsMainform_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            RoomAdd frm = new RoomAdd(this);
            frm.ShowDialog();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        private void btnModify_Click(object sender, EventArgs e)
        {
            try
            {
                if(flx.Rows.Count > 1)
                {
                    RoomAdd frm = new RoomAdd(this);
                    frm.id = Convert.ToInt32(flx[flx.RowSel,"roomID"]);
                    frm.ShowDialog();
                }
                else
                {
                    Box.infoBox("No data found.");
                }
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
              //  throw;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (flx.Rows.Count > 1)
                {
                    
                    if(Box.questionBox("Are you sure you want to delete this room?", "DELETE?"))
                    {
                        int id = Convert.ToInt32(flx[flx.RowSel, "roomID"]);

                        Helper.deleteData("rooms", "roomID", id);
                        Box.infoBox("Room successfully deleted.");
                        LoadData();
                    }
                }
                else
                {
                    Box.infoBox("No data found.");
                }
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //  throw;
            }
        }

        private void studentListToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if(flx.Rows.Count > 1)
            {
                int teacherid = Convert.ToInt32(flx[flx.RowSel, "teacherID"]);
                if (teacherid > 0)
                {
                    StudentListMainform frm = new StudentListMainform();
                    frm.roomid = Convert.ToInt32(flx[flx.RowSel, "roomID"]);
                    frm.teacherid = teacherid;
                    frm.ShowDialog();
                }
                else
                {
                    Box.warnBox("No teacher found on this room.");
                }
            }
            else
            {
                Box.warnBox("No data found.");
            }
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            studentListToolStripMenuItem_Click(sender, e);
        }
    }
}

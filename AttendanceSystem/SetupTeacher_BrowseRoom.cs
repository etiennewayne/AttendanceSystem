using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using MySql.Data.MySqlClient;



namespace AttendanceSystem
{
    public partial class SetupTeacher_BrowseRoom : Form
    {
        SetupTeacherAddModify _frm;


        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public SetupTeacher_BrowseRoom(SetupTeacherAddModify _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }
        


        public void loadData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from rooms where roomCode like ?roomcode order by roomCode asc";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?roomcode", txtSearch.Text + "%");
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();

            cmd.Dispose();
            con.Close();
            con.Dispose();

            this.flx.DataSource = dt;
        
        }

        private void SetupTeacher_BrowseRoom_Load(object sender, EventArgs e)
        {
            try
            {
                loadData();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                _frm.txtRoom.Text = this.flx[flx.RowSel, "roomCode"].ToString();
                _frm.txtRoomDesc.Text = this.flx[flx.RowSel, "roomDesc"].ToString();
                _frm.room_id = Convert.ToInt32(this.flx[flx.RowSel, "roomID"]);
                this.Close();

            }
            catch (Exception er)
            { }
            
           
        }
    }
}

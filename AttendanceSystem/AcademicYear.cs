using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace AttendanceSystem
{
    public partial class AcademicYear : Form
    {
        MySqlConnection con;
        MySqlCommand cmd;
        string query;


        public AcademicYear()
        {
            InitializeComponent();
        }


        public void loaddata()
        {
            con = Connection.con();
            con.Open();
            query = "select * from academicyear where ayCode like ?aycode and ayDesc like ?aydesc";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?ayCode", txtayCode.Text + "%");
            cmd.Parameters.AddWithValue("?aydesc", txtayDesc.Text + "%");
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            flx.AutoGenerateColumns = false;
            flx.DataSource = dt;
        }

        private void AcademicYear_Load(object sender, EventArgs e)
        {
            try
            {
                loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            AcademicYearAdd frm = new AcademicYearAdd(this);
            frm.id = 0;
            frm.ShowDialog();
        }

        private void btnModify_Click(object sender, EventArgs e)
        {

            if(flx.Rows.Count > 1)
            {
                AcademicYearAdd frm = new AcademicYearAdd(this);
                frm.id = Convert.ToInt32(flx[flx.RowSel, "academicyearID"]);
                frm.ShowDialog();
            }
            else
            {
                Box.warnBox("No data selected.");
            }
          
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            try
            {
                loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
                //throw;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (flx.Rows.Count > 1)
            {
                int id = Convert.ToInt32(flx[flx.RowSel, "academicyearID"]);
                if (Box.questionBox("Are you sure you want to delete this row?", "DELETE!"))
                {
                    Helper.deleteData("academicyear", "academicyearID", id);
                    Box.infoBox("Row successfully deleted.");
                    loaddata();
                }
            }
            else
            {
                Box.warnBox("No data selected.");
            }

            

        }

        private void btnSetActive_Click(object sender, EventArgs e)
        {
            try
            {
                con = Connection.con();
                con.Open();
                query = "update academicyear set active = 0; update academicyear set active = 1 where academicyearID=?id";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?id", Convert.ToInt32(flx[flx.RowSel, "academicyearID"]));
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Dispose();
                con.Close();

                Box.infoBox("Set active successfully.");
                loaddata();
            }
            catch (Exception er)
            {
                Box.errBox(er.Message);
              //  throw;
            }
        }
    }
}

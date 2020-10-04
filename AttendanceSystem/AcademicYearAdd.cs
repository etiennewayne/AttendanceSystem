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
    public partial class AcademicYearAdd : Form
    {

        MySqlConnection con;
        MySqlCommand cmd;
        string query;

        AcademicYear _frm;

        public int id;

        string temp;



        public AcademicYearAdd(AcademicYear _frm)
        {
            InitializeComponent();
            this._frm = _frm;
        }


        void getData()
        {
            con = Connection.con();
            con.Open();
            query = "select * from academicyear where academicyearID=?id";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?id", id);
            
            DataTable dt = new DataTable();
            MySqlDataAdapter adptr = new MySqlDataAdapter(cmd);
            adptr.Fill(dt);
            adptr.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            if(dt.Rows.Count > 0)
            {
                txtAYCode.Text = Convert.ToString(dt.Rows[0]["ayCode"]);
                temp = Convert.ToString(dt.Rows[0]["ayCode"]);
                txtAYDesc.Text = Convert.ToString(dt.Rows[0]["ayDesc"]);
                txtSemester.Text = Convert.ToString(dt.Rows[0]["semester"]);
                //bool duerme = Convert.ToBoolean(dt.Rows[0]["active"]);
                //if (duerme)
                //{
                //    checkActive.Checked = true;
                //}
               // else { checkActive.Checked = false; }
            }
        }

        void processSave()
        {
            if (id > 0)
            {
                //update
                con = Connection.con();
                con.Open();
                query = "update academicyear set ayCode=?aycode, ayDesc=?aydesc, semester=?sem where academicyearID=?id";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?aycode", txtAYCode.Text);
                cmd.Parameters.AddWithValue("?aydesc", txtAYDesc.Text);
                cmd.Parameters.AddWithValue("?sem", txtSemester.Text);
                //if (checkActive.Checked) { cmd.Parameters.AddWithValue("?active", 1); }
                //else { cmd.Parameters.AddWithValue("?active", 0); }
                cmd.Parameters.AddWithValue("?id", id);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                con.Dispose();

                Box.infoBox("Academic year successfully updated.");
                _frm.loaddata();
                this.Close();
            }
            else
            {
                //insert
                con = Connection.con();
                con.Open();
                query = "insert into academicyear set ayCode=?aycode, ayDesc=?aydesc, semester=?sem";
                cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("?aycode", txtAYCode.Text);
                cmd.Parameters.AddWithValue("?aydesc", txtAYDesc.Text);
                cmd.Parameters.AddWithValue("?sem", txtSemester.Text);
                //bool duerme = false;
                //if (checkActive.Checked) { cmd.Parameters.AddWithValue("?active", 1); }
                //else { cmd.Parameters.AddWithValue("?active", 0); }
                
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                con.Dispose();

                Box.infoBox("Academic year successfully saved.");
                _frm.loaddata();
                this.Close();

            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtAYCode.Text))
            {
                Box.warnBox("Please input A.Y. Code.");
                return;
            }

            if (String.IsNullOrEmpty(txtAYDesc.Text))
            {
                Box.warnBox("Please input A.Y. Description.");
                return;
            }

            if (id == 0)
            {
                if(Helper.isExist("academicyear","ayCode", txtAYCode.Text))
                {
                    Box.warnBox("Academic Code already taken. Pag move on nah.");
                    return;
                }
            }

            if (id > 0)
            {
                if(temp != txtAYCode.Text)
                {
                    if (Helper.isExist("academicyear", "ayCode", txtAYCode.Text))
                    {
                        Box.warnBox("Academic Code already taken. Pag move on nah.");
                        return;
                    }
                }
            }

            processSave();

        }

        private void AcademicYearAdd_Load(object sender, EventArgs e)
        {
            if (id > 0)
            {
                getData();
            }
        }


    }
}

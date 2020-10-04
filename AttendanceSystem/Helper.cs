using C1.Win.C1FlexGrid;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace AttendanceSystem
{
    class Helper
    {


        //=====================================================
        //*************ACCESS LEVEL CONTROLS METHOD************
        //=====================================================
        //public static void SetupControlAccess(Form frm, ContextMenuStrip cstrip)
        //{
        //    //for Contextmenu Items (RIGHTCLICK)
        //    if (cstrip != null)
        //    {
        //        foreach (ToolStripItem menuitem in cstrip.Items)
        //        {
        //            //Box.infoBox(menuitem.GetType().ToString());
        //            if (menuitem.GetType() == typeof(ToolStripSeparator))
        //            {
        //                menuitem.Enabled = false;
        //            }

        //            if (menuitem.GetType() == typeof(ToolStripMenuItem))
        //            {
        //                if (!getAccessControlsList(frm.Name).Contains(menuitem.Name))
        //                {
        //                    //menuitem.Enabled = false;
        //                    menuitem.Enabled = false;
        //                }
        //            }

        //        }
        //    }



        //    foreach (Control ctrl in frm.Controls)
        //    {
        //        if (ctrl.GetType() == typeof(ToolStrip))
        //        {
        //            foreach (ToolStripItem item in ((ToolStrip)ctrl).Items)
        //            {

        //                if (item.GetType() == typeof(ToolStripSplitButton))
        //                {
        //                    foreach (ToolStripMenuItem item2 in ((ToolStripSplitButton)item).DropDownItems)
        //                    {
        //                        //Box.infoBox(item2.Name);
        //                        if (!getAccessControlsList(frm.Name).Contains(item2.Name))
        //                        {
        //                            item2.Enabled = false;
        //                            //item2.Visible = false;
        //                        }
        //                    }
        //                }

        //                if (!getAccessControlsList(frm.Name).Contains(item.Name))
        //                {
        //                    item.Visible = false;
        //                    //item.Visible = false;
        //                }


        //            }
        //        }
        //    }
        //}

        //static List<string> getAccessControlsList(string className)
        //{
        //    MySqlConnection con;
        //    MySqlCommand cmd;
        //    string query;

        //    var retList = new List<string>();

        //    con = Connection.con();
        //    con.Open();
        //    query = "select * from vw_access where positionID=?posid and className=?classname";
        //    cmd = new MySqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("?posid", Properties.Settings.Default.positionID);
        //    cmd.Parameters.AddWithValue("?classname", className);
        //    MySqlDataReader dr;
        //    dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        retList.Add(Convert.ToString(dr["controlName"]));
        //    }
        //    dr.Close();
        //    con.Close();
        //    con.Dispose();

        //    return retList;
        //}



        private static Control GetControlByName(string controlName, Control.ControlCollection parent)
        {
            Control c = null;
            foreach (Control ctrl in parent)
            {
                if (ctrl.Name.Equals(controlName))
                {
                    c = ctrl;
                    return c;
                }

                if (ctrl.GetType() == typeof(ToolStrip))
                {
                    foreach (ToolStripItem item in ((ToolStrip)ctrl).Items)
                    {
                        if (item.Name.Equals(controlName))
                        {
                            switch (item.GetType().Name)
                            {
                                case "ToolStripComboBox":
                                    c = ((ToolStripComboBox)item).Control;
                                    break;
                                case "ToolStripTextBox":
                                    c = ((ToolStripTextBox)item).Control;
                                    break;
                            }
                            if (c != null)
                            {
                                break;
                            }
                        }
                    }
                }
                if (c == null)
                    c = GetControlByName(controlName, ctrl.Controls);
                else
                    break;
            }
            return c;
        }
        //=====================================================
        // ********** ACCESS LEVEL CONTROLS METHOD************
        //=====================================================





        //=====================================================
        //            PLACEHOLDER METHOD
        //=====================================================
        public static void RemoveText(object sender, EventArgs e, string text)
        {
            TextBox myTxtbx = (TextBox)sender;
            if (myTxtbx.Text == text)
            {
                myTxtbx.ForeColor = System.Drawing.Color.Black;
                myTxtbx.Text = "";
            }
        }

        public static void AddText(object sender, EventArgs e, string text)
        {
            TextBox myTxtbx = (TextBox)sender;
            if (string.IsNullOrWhiteSpace(myTxtbx.Text))
            {
                myTxtbx.ForeColor = System.Drawing.Color.Gray;
                myTxtbx.Text = text;
            }

        }
        //=====================================================
        //            PLACEHOLDER METHOD
        //=====================================================






        //=====================================================
        //          LOAD COMBOBOX WITH PER CONNECTION
        //=====================================================

        public static void LoadCmb(string query, ComboBox cmb)
        {
            MySqlConnection con;
            MySqlCommand cmd;
            // string query;
            cmb.Items.Clear();
            con = Connection.con();
            con.Open();
            cmd = new MySqlCommand(query, con);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmb.Items.Add(Convert.ToString(dr[0]));
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }

        public static void LoadCmbPerCon(MySqlConnection con, string query, ComboBox cmb)
        {
            //MySqlConnection con;
            MySqlCommand cmd;
            // string query;
            cmb.Items.Clear();
            con = Connection.con();
            con.Open();
            cmd = new MySqlCommand(query, con);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmb.Items.Add(Convert.ToString(dr[0]));
            }
            dr.Close();
            cmd.Dispose();
            // con.Close();
            // con.Dispose();
        }
        //=====================================================
        //          LOAD COMBOBOX WITH PER CONNECTION
        //=====================================================


        public static string getActiveAYCode()
        {
            string ay = "";

            MySqlConnection con;
            MySqlCommand cmd;
            // string query;
            //cmb.Items.Clear();
            con = Connection.con();
            con.Open();
            cmd = new MySqlCommand("select ayCode from academicyear where active = 1", con);
            MySqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ay = Convert.ToString(dr[0]);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return ay;
        }




        public static bool isExist(string tblname, string colname, string key)
        {
            bool flag = true;
            MySqlConnection con;
            MySqlCommand cmd;
            string query;

            con = Connection.con();
            con.Open();
            query = "select * from " + tblname + " where " + colname + " = ?key";
            cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("?key", key);
            MySqlDataReader dr;

            dr = cmd.ExecuteReader();
            flag = dr.Read();
            dr.Close();
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return flag;
        }

        public static void deleteData(string tblname, string colname, int id)
        {
            MySqlConnection con;
            MySqlCommand cmd;
            string query;

            con = Connection.con();
            con.Open();
            query = "delete from " + tblname + " where " + colname + "=" + id;
            cmd = new MySqlCommand(query, con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }

        public static void textbox_keypress_integer(object sender, KeyPressEventArgs e)
        {
            const char Delete = (char)8;
            e.Handled = !Char.IsDigit(e.KeyChar) && e.KeyChar != Delete;
        }

        public static void textbox_keypress_decimal(object sender, KeyPressEventArgs e)
        {

            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && e.KeyChar != '.')
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if (e.KeyChar == '.' && (sender as TextBox).Text.IndexOf('.') > -1)
            {
                e.Handled = true;
            }

            //set four decimal input from decimal point
            if (!char.IsControl(e.KeyChar))
            {

                TextBox textBox = (TextBox)sender;

                if (textBox.Text.IndexOf('.') > -1 &&
                         textBox.Text.Substring(textBox.Text.IndexOf('.')).Length >= 5)
                {
                    e.Handled = true;
                }

            }
        }

        public static void Comma(object sender, EventArgs e)
        {
            TextBox txtqty = (TextBox)sender;
            try
            {
                int iKeep = txtqty.SelectionStart - 1;
                for (int i = iKeep; i > 0; i--)
                    if (txtqty.Text[i] == ',')
                        iKeep -= 1;

                txtqty.Text = String.Format("{0:N0}", Convert.ToInt32(txtqty.Text.Replace(",", "")));
                for (int i = 0; i < iKeep; i++)
                    if (txtqty.Text[i] == ',')
                        iKeep += 1;

                txtqty.SelectionStart = iKeep + 1;
            }
            catch
            {
                //errorhandling
            }
        }

        public static void Grid_DisableEnter_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        public static void setAutoComplete(TextBox textbox, string tablename, string colname)
        {
            textbox.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            textbox.AutoCompleteSource = AutoCompleteSource.CustomSource;
            AutoCompleteStringCollection coll = new AutoCompleteStringCollection();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader dr;
            conn = Connection.con();
            conn.Open();
            string query = "SELECT DISTINCT(" + colname + ") FROM " + tablename + " ORDER BY " + colname + " ASC";
            cmd = new MySqlCommand(query, conn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                coll.Add(dr[colname].ToString());
            }
            conn.Close();
            dr.Close();
            textbox.AutoCompleteCustomSource = coll;
        }

        public static void setAutoCompletePerCon(MySqlConnection con, TextBox textbox, string tablename, string colname)
        {
            textbox.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            textbox.AutoCompleteSource = AutoCompleteSource.CustomSource;
            AutoCompleteStringCollection coll = new AutoCompleteStringCollection();

            MySqlCommand cmd;
            MySqlDataReader dr;
            con = Connection.con();
            con.Open();
            string query = "SELECT DISTINCT(" + colname + ") FROM " + tablename + " ORDER BY " + colname + " ASC";
            cmd = new MySqlCommand(query, con);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                coll.Add(dr[colname].ToString());
            }
            dr.Close();
            cmd.Dispose();
            textbox.AutoCompleteCustomSource = coll;
        }

        public static string toUpperFirstLetter(String s)
        {
            return System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(s.ToLower());
        }

        public static int returnLastInsertID(MySqlConnection con)
        {
            MySqlCommand cmd = new MySqlCommand("select last_insert_id()", con);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }

        public static void NumRow(C1.Win.C1FlexGrid.C1FlexGrid grid)
        {
            for (int rowno = 1; rowno <= grid.Rows.Count - 1; rowno++)
            {
                grid[rowno, 0] = rowno.ToString();
            }
        }

        public static void setZeroTextBox_KeyUp(object sender, KeyEventArgs e)
        {
            TextBox textBox = (TextBox)sender;
            if (textBox.Text.Trim() == "")
            {
                textBox.Text = "0";
            }
        }

        //public static void LoadSheet(C1FlexGrid _flx, XLSheet xsheet, int noCol)
        //{
        //    int row;
        //    int col;

        //    XLCell cell;

        //    for (row = 1; row < xsheet.Rows.Count; row++)
        //    {
        //        _flx.Rows.Add();
        //        for (col = 0; col < noCol; col++)
        //        {
        //            if (row <= xsheet.Rows.Count - 1)
        //            {
        //                if (xsheet.GetCell(row, col) != null)
        //                {
        //                    cell = xsheet.GetCell(row, col);
        //                    _flx[row, col + 1] = Convert.ToString(cell.Value).ToUpper();
        //                }
        //                _flx[row, 0] = Convert.ToString(row);
        //                //_flx.DrawMode = C1.Win.C1FlexGrid.DrawModeEnum.OwnerDraw;

        //            }
        //            Application.DoEvents();
        //        }

        //    }

        //    //Helper.NumRow(_flx);
        //    //Application.DoEvents();
        //}


        public static double DiscountInPercent(double amount, double percent)
        {
            return amount * (amount / 100);
        }
        //public static string SafeGetString(this MySqlDataReader reader, int colindex)
        //{
        //    if (!reader.IsDBNull(colindex))
        //        return reader.GetString(colindex);
        //    return string.Empty;
        //}

        //public static void FirstDayMonth(DateTimePicker datePicker)
        //{
        //    DateTime v = new DateTime();
        //    datePicker.Value = new DateTime(v.Year, v.Month, 1);
        //}

        public static void FirstDayOfMonth_AddMethod(DateTime value, DateTimePicker dt)
        {
            dt.Value = value.Date.AddDays(1 - value.Day);
        }
        public static void LastDayOfMonth_AddMethod(DateTime value, DateTimePicker dt)
        {
            dt.Value = (value.Date.AddDays(1 - value.Day)).AddMonths(1).AddDays(-1);
        }

    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace AttendanceSystem
{
    public partial class ConnectionSetting : Form
    {
        public ConnectionSetting()
        {
            InitializeComponent();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.server = txtServer.Text;
            Properties.Settings.Default.database = txtDatabase.Text;
            Properties.Settings.Default.dbuser = txtUser.Text;
            Properties.Settings.Default.dbpwd = txtPwd.Text;
            Properties.Settings.Default.Save();
            Box.infoBox("Settings saved");
            this.Close();
        }

        private void ConnectionSetting_Load(object sender, EventArgs e)
        {
            txtServer.Text = Properties.Settings.Default.server;
            txtDatabase.Text = Properties.Settings.Default.database;
            txtUser.Text = Properties.Settings.Default.dbuser;
            txtPwd.Text = Properties.Settings.Default.dbpwd;
        }
    }
}

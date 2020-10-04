using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace AttendanceSystem
{
    public partial class ManagePortMainform : Form
    {
        public ManagePortMainform()
        {
            InitializeComponent();
        }


        void getComPorts()
        {
            string[] ports = SerialPort.GetPortNames();
            foreach (string port in ports)
            {
                ///Console.WriteLine(port);
                cmbRFIDPort.Items.Add(port);
             //   cmbSMSPort.Items.Add(port);
            }
        }

        private void ManagePortMainform_Load(object sender, EventArgs e)
        {
            getComPorts();

            cmbRFIDPort.Text = Properties.Settings.Default.rfidPort;
           // cmbSMSPort.Text = Properties.Settings.Default.smsPort;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {

          
            Properties.Settings.Default.rfidPort = cmbRFIDPort.Text;
           // Properties.Settings.Default.smsPort = cmbSMSPort.Text;
            Properties.Settings.Default.Save();
            Box.infoBox("Ports successfully saved.");
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AttendanceSystem
{
    public partial class SetupTeacherForm : Form
    {
        public SetupTeacherForm()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            SetupTeacherAddModify frm = new SetupTeacherAddModify(this);
            frm.ShowDialog();
        }
    }
}

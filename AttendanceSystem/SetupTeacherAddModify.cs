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
    public partial class SetupTeacherAddModify : Form
    {

        SetupTeacherForm _frm;

        public int room_id = 0;
        public int teacher_id = 0;

        public SetupTeacherAddModify(SetupTeacherForm _frm)
        {
            InitializeComponent();

            this._frm = _frm;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SetupTeacher_BrowseRoom frm = new SetupTeacher_BrowseRoom(this);
            frm.ShowDialog();
        }

        private void SetupTeacherAddModify_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            SetupTeacher_BrowseTeacher frm = new SetupTeacher_BrowseTeacher(this);
            frm.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtRoom.Text) && room_id < 1)
            {
                Box.warnBox("Please select room.");
                return;
            }

            if (String.IsNullOrEmpty(txtlname.Text) && teacher_id < 1)
            {
                Box.warnBox("Please select teacher.");
                return;
            }

            proccessSave();
        }

        void proccessSave()

        {

        }
    }
}

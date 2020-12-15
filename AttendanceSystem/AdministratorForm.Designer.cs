namespace AttendanceSystem
{
    partial class AdministratorForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripAccount = new System.Windows.Forms.ToolStripButton();
            this.btnManageStudent = new System.Windows.Forms.ToolStripSplitButton();
            this.btnMenuStudent = new System.Windows.Forms.ToolStripMenuItem();
            this.btnMenuValidateStudent = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripButton7 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSplitButton2 = new System.Windows.Forms.ToolStripSplitButton();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripAcademicYear = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton3 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton4 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton2 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton6 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSplitButton1 = new System.Windows.Forms.ToolStripSplitButton();
            this.sendMessageToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.textBlastToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSplitButton3 = new System.Windows.Forms.ToolStripSplitButton();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem3 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStrip2 = new System.Windows.Forms.ToolStrip();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.lblUser = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripLabel2 = new System.Windows.Forms.ToolStripLabel();
            this.lblTime = new System.Windows.Forms.ToolStripLabel();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.toolStrip1.SuspendLayout();
            this.toolStrip2.SuspendLayout();
            this.SuspendLayout();
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripAccount,
            this.btnManageStudent,
            this.toolStripButton7,
            this.toolStripSplitButton2,
            this.toolStripAcademicYear,
            this.toolStripButton3,
            this.toolStripButton4,
            this.toolStripButton2,
            this.toolStripButton6,
            this.toolStripSplitButton1,
            this.toolStripSplitButton3,
            this.toolStripButton1});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(1219, 86);
            this.toolStrip1.TabIndex = 0;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolStripAccount
            // 
            this.toolStripAccount.Image = global::AttendanceSystem.Properties.Resources.account64x64;
            this.toolStripAccount.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripAccount.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripAccount.Name = "toolStripAccount";
            this.toolStripAccount.Size = new System.Drawing.Size(68, 83);
            this.toolStripAccount.Text = "Users";
            this.toolStripAccount.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripAccount.Click += new System.EventHandler(this.toolStripAccount_Click);
            // 
            // btnManageStudent
            // 
            this.btnManageStudent.DropDownButtonWidth = 20;
            this.btnManageStudent.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btnMenuStudent,
            this.btnMenuValidateStudent});
            this.btnManageStudent.Image = global::AttendanceSystem.Properties.Resources.Student_id_icon;
            this.btnManageStudent.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.btnManageStudent.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnManageStudent.Name = "btnManageStudent";
            this.btnManageStudent.Size = new System.Drawing.Size(119, 83);
            this.btnManageStudent.Text = "Manage Student";
            this.btnManageStudent.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // btnMenuStudent
            // 
            this.btnMenuStudent.Name = "btnMenuStudent";
            this.btnMenuStudent.Size = new System.Drawing.Size(159, 22);
            this.btnMenuStudent.Text = "Student";
            this.btnMenuStudent.Click += new System.EventHandler(this.btnMenuStudent_Click);
            // 
            // btnMenuValidateStudent
            // 
            this.btnMenuValidateStudent.Name = "btnMenuValidateStudent";
            this.btnMenuValidateStudent.Size = new System.Drawing.Size(159, 22);
            this.btnMenuValidateStudent.Text = "Validate Student";
            this.btnMenuValidateStudent.Click += new System.EventHandler(this.btnMenuValidateStudent_Click);
            // 
            // toolStripButton7
            // 
            this.toolStripButton7.Image = global::AttendanceSystem.Properties.Resources.Phonebook_icon64x64;
            this.toolStripButton7.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripButton7.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton7.Name = "toolStripButton7";
            this.toolStripButton7.Size = new System.Drawing.Size(72, 83);
            this.toolStripButton7.Text = "Phonebook";
            this.toolStripButton7.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton7.Click += new System.EventHandler(this.toolStripButton7_Click);
            // 
            // toolStripSplitButton2
            // 
            this.toolStripSplitButton2.DropDownButtonWidth = 20;
            this.toolStripSplitButton2.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1});
            this.toolStripSplitButton2.Image = global::AttendanceSystem.Properties.Resources.teacher_icon64x64;
            this.toolStripSplitButton2.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripSplitButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripSplitButton2.Name = "toolStripSplitButton2";
            this.toolStripSplitButton2.Size = new System.Drawing.Size(89, 83);
            this.toolStripSplitButton2.Text = "Rooms";
            this.toolStripSplitButton2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(139, 22);
            this.toolStripMenuItem1.Text = "Setup Room";
            this.toolStripMenuItem1.Click += new System.EventHandler(this.toolStripMenuItem1_Click);
            // 
            // toolStripAcademicYear
            // 
            this.toolStripAcademicYear.Image = global::AttendanceSystem.Properties.Resources.Calendar_icon68x68;
            this.toolStripAcademicYear.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripAcademicYear.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripAcademicYear.Name = "toolStripAcademicYear";
            this.toolStripAcademicYear.Size = new System.Drawing.Size(89, 83);
            this.toolStripAcademicYear.Text = "Academic Year";
            this.toolStripAcademicYear.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripAcademicYear.Click += new System.EventHandler(this.toolStripAcademicYear_Click);
            // 
            // toolStripButton3
            // 
            this.toolStripButton3.Image = global::AttendanceSystem.Properties.Resources.level_competition_winner_class_grade_512;
            this.toolStripButton3.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripButton3.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton3.Name = "toolStripButton3";
            this.toolStripButton3.Size = new System.Drawing.Size(68, 83);
            this.toolStripButton3.Text = "Grade";
            this.toolStripButton3.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton3.Click += new System.EventHandler(this.toolStripButton3_Click);
            // 
            // toolStripButton4
            // 
            this.toolStripButton4.Image = global::AttendanceSystem.Properties.Resources.skill_icon;
            this.toolStripButton4.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripButton4.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton4.Name = "toolStripButton4";
            this.toolStripButton4.Size = new System.Drawing.Size(68, 83);
            this.toolStripButton4.Text = "Section";
            this.toolStripButton4.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton4.Click += new System.EventHandler(this.toolStripButton4_Click);
            // 
            // toolStripButton2
            // 
            this.toolStripButton2.Image = global::AttendanceSystem.Properties.Resources.Program_icon;
            this.toolStripButton2.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton2.Name = "toolStripButton2";
            this.toolStripButton2.Size = new System.Drawing.Size(68, 83);
            this.toolStripButton2.Text = "Programs";
            this.toolStripButton2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton2.Visible = false;
            this.toolStripButton2.Click += new System.EventHandler(this.toolStripButton2_Click);
            // 
            // toolStripButton6
            // 
            this.toolStripButton6.Image = global::AttendanceSystem.Properties.Resources.ports64x64;
            this.toolStripButton6.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripButton6.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton6.Name = "toolStripButton6";
            this.toolStripButton6.Size = new System.Drawing.Size(79, 83);
            this.toolStripButton6.Text = "Manage Port";
            this.toolStripButton6.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton6.Click += new System.EventHandler(this.toolStripButton6_Click);
            // 
            // toolStripSplitButton1
            // 
            this.toolStripSplitButton1.DropDownButtonWidth = 20;
            this.toolStripSplitButton1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.sendMessageToolStripMenuItem,
            this.textBlastToolStripMenuItem});
            this.toolStripSplitButton1.Image = global::AttendanceSystem.Properties.Resources.SMS_Message_icon64x641;
            this.toolStripSplitButton1.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripSplitButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripSplitButton1.Name = "toolStripSplitButton1";
            this.toolStripSplitButton1.Size = new System.Drawing.Size(89, 83);
            this.toolStripSplitButton1.Text = "SMS";
            this.toolStripSplitButton1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // sendMessageToolStripMenuItem
            // 
            this.sendMessageToolStripMenuItem.Name = "sendMessageToolStripMenuItem";
            this.sendMessageToolStripMenuItem.Size = new System.Drawing.Size(130, 22);
            this.sendMessageToolStripMenuItem.Text = "Setup SMS";
            this.sendMessageToolStripMenuItem.Click += new System.EventHandler(this.sendMessageToolStripMenuItem_Click);
            // 
            // textBlastToolStripMenuItem
            // 
            this.textBlastToolStripMenuItem.Name = "textBlastToolStripMenuItem";
            this.textBlastToolStripMenuItem.Size = new System.Drawing.Size(130, 22);
            this.textBlastToolStripMenuItem.Text = "Text Blast";
            this.textBlastToolStripMenuItem.Visible = false;
            this.textBlastToolStripMenuItem.Click += new System.EventHandler(this.textBlastToolStripMenuItem_Click);
            // 
            // toolStripSplitButton3
            // 
            this.toolStripSplitButton3.DropDownButtonWidth = 20;
            this.toolStripSplitButton3.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem2,
            this.toolStripMenuItem3});
            this.toolStripSplitButton3.Image = global::AttendanceSystem.Properties.Resources.Reports_icon64x64;
            this.toolStripSplitButton3.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripSplitButton3.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripSplitButton3.Name = "toolStripSplitButton3";
            this.toolStripSplitButton3.Size = new System.Drawing.Size(89, 83);
            this.toolStripSplitButton3.Text = "Report";
            this.toolStripSplitButton3.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem2.Text = "General Report";
            this.toolStripMenuItem2.Click += new System.EventHandler(this.toolStripMenuItem2_Click);
            // 
            // toolStripMenuItem3
            // 
            this.toolStripMenuItem3.Name = "toolStripMenuItem3";
            this.toolStripMenuItem3.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem3.Text = "Attendance Monitoring";
            this.toolStripMenuItem3.Click += new System.EventHandler(this.toolStripMenuItem3_Click);
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.Image = global::AttendanceSystem.Properties.Resources.logout_icon64x64;
            this.toolStripButton1.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(68, 83);
            this.toolStripButton1.Text = "Log out";
            this.toolStripButton1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton1.Click += new System.EventHandler(this.toolStripButton1_Click_1);
            // 
            // toolStrip2
            // 
            this.toolStrip2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.toolStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripLabel1,
            this.lblUser,
            this.toolStripSeparator1,
            this.toolStripLabel2,
            this.lblTime});
            this.toolStrip2.Location = new System.Drawing.Point(0, 542);
            this.toolStrip2.Name = "toolStrip2";
            this.toolStrip2.Size = new System.Drawing.Size(1219, 25);
            this.toolStrip2.TabIndex = 1;
            this.toolStrip2.Text = "toolStrip2";
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.Font = new System.Drawing.Font("Bookman Old Style", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(52, 22);
            this.toolStripLabel1.Text = "USER :";
            // 
            // lblUser
            // 
            this.lblUser.Name = "lblUser";
            this.lblUser.Size = new System.Drawing.Size(86, 22);
            this.lblUser.Text = "toolStripLabel2";
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripLabel2
            // 
            this.toolStripLabel2.Font = new System.Drawing.Font("Bookman Old Style", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolStripLabel2.Name = "toolStripLabel2";
            this.toolStripLabel2.Size = new System.Drawing.Size(50, 22);
            this.toolStripLabel2.Text = "TIME :";
            // 
            // lblTime
            // 
            this.lblTime.Name = "lblTime";
            this.lblTime.Size = new System.Drawing.Size(43, 22);
            this.lblTime.Text = "0:00:00";
            // 
            // timer1
            // 
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // AdministratorForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1219, 567);
            this.Controls.Add(this.toolStrip2);
            this.Controls.Add(this.toolStrip1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AdministratorForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Administrator (Attendance Monitoring System) VER 2019.12.30";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.AdministratorForm_FormClosing);
            this.Load += new System.EventHandler(this.AdministratorForm_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.toolStrip2.ResumeLayout(false);
            this.toolStrip2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton toolStripButton3;
        private System.Windows.Forms.ToolStripButton toolStripButton2;
        private System.Windows.Forms.ToolStripButton toolStripAccount;
        private System.Windows.Forms.ToolStripButton toolStripButton4;
        private System.Windows.Forms.ToolStripButton toolStripButton6;
        private System.Windows.Forms.ToolStripButton toolStripAcademicYear;
        private System.Windows.Forms.ToolStripButton toolStripButton7;
        private System.Windows.Forms.ToolStripSplitButton toolStripSplitButton1;
        private System.Windows.Forms.ToolStripMenuItem sendMessageToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem textBlastToolStripMenuItem;
        private System.Windows.Forms.ToolStripSplitButton toolStripSplitButton2;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripSplitButton btnManageStudent;
        private System.Windows.Forms.ToolStripMenuItem btnMenuStudent;
        private System.Windows.Forms.ToolStripMenuItem btnMenuValidateStudent;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private System.Windows.Forms.ToolStrip toolStrip2;
        private System.Windows.Forms.ToolStripLabel toolStripLabel1;
        private System.Windows.Forms.ToolStripLabel lblUser;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripLabel toolStripLabel2;
        private System.Windows.Forms.ToolStripLabel lblTime;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.ToolStripSplitButton toolStripSplitButton3;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem3;
    }
}
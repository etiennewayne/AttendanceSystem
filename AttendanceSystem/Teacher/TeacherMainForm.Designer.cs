namespace AttendanceSystem
{
    partial class TeacherMainForm
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
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripAccount = new System.Windows.Forms.ToolStripButton();
            this.btnManageStudent = new System.Windows.Forms.ToolStripSplitButton();
            this.btnMenuStudent = new System.Windows.Forms.ToolStripMenuItem();
            this.btnMenuValidateStudent = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripButton7 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSplitButton1 = new System.Windows.Forms.ToolStripSplitButton();
            this.sendMessageToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.textBlastToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripReport = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStrip2 = new System.Windows.Forms.ToolStrip();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.lblUsername = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
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
            this.toolStripSplitButton1,
            this.toolStripReport,
            this.toolStripButton1});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(996, 86);
            this.toolStrip1.TabIndex = 1;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolStripAccount
            // 
            this.toolStripAccount.Image = global::AttendanceSystem.Properties.Resources.account64x64;
            this.toolStripAccount.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripAccount.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripAccount.Name = "toolStripAccount";
            this.toolStripAccount.Size = new System.Drawing.Size(76, 83);
            this.toolStripAccount.Text = "My Account";
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
            this.btnMenuStudent.Size = new System.Drawing.Size(180, 22);
            this.btnMenuStudent.Text = "My Student";
            this.btnMenuStudent.Click += new System.EventHandler(this.btnMenuStudent_Click);
            // 
            // btnMenuValidateStudent
            // 
            this.btnMenuValidateStudent.Name = "btnMenuValidateStudent";
            this.btnMenuValidateStudent.Size = new System.Drawing.Size(180, 22);
            this.btnMenuValidateStudent.Text = "Validate Student";
            this.btnMenuValidateStudent.Visible = false;
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
            this.toolStripButton7.Visible = false;
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
            this.toolStripSplitButton1.Visible = false;
            // 
            // sendMessageToolStripMenuItem
            // 
            this.sendMessageToolStripMenuItem.Name = "sendMessageToolStripMenuItem";
            this.sendMessageToolStripMenuItem.Size = new System.Drawing.Size(149, 22);
            this.sendMessageToolStripMenuItem.Text = "Send Message";
            // 
            // textBlastToolStripMenuItem
            // 
            this.textBlastToolStripMenuItem.Name = "textBlastToolStripMenuItem";
            this.textBlastToolStripMenuItem.Size = new System.Drawing.Size(149, 22);
            this.textBlastToolStripMenuItem.Text = "Text Blast";
            // 
            // toolStripReport
            // 
            this.toolStripReport.Image = global::AttendanceSystem.Properties.Resources.Reports_icon64x64;
            this.toolStripReport.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripReport.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripReport.Name = "toolStripReport";
            this.toolStripReport.Size = new System.Drawing.Size(68, 83);
            this.toolStripReport.Text = "Report";
            this.toolStripReport.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripReport.Click += new System.EventHandler(this.toolStripReport_Click);
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
            this.toolStripButton1.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // toolStrip2
            // 
            this.toolStrip2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.toolStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripLabel1,
            this.lblUsername,
            this.toolStripSeparator1});
            this.toolStrip2.Location = new System.Drawing.Point(0, 510);
            this.toolStrip2.Name = "toolStrip2";
            this.toolStrip2.Size = new System.Drawing.Size(996, 25);
            this.toolStrip2.TabIndex = 2;
            this.toolStrip2.Text = "toolStrip2";
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(40, 22);
            this.toolStripLabel1.Text = "USER :";
            // 
            // lblUsername
            // 
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(59, 22);
            this.lblUsername.Text = "username";
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // TeacherMainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(996, 535);
            this.Controls.Add(this.toolStrip2);
            this.Controls.Add(this.toolStrip1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "TeacherMainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Teacher";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.TeacherMainForm_FormClosing);
            this.Load += new System.EventHandler(this.TeacherMainForm_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.toolStrip2.ResumeLayout(false);
            this.toolStrip2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton toolStripAccount;
        private System.Windows.Forms.ToolStripSplitButton btnManageStudent;
        private System.Windows.Forms.ToolStripMenuItem btnMenuStudent;
        private System.Windows.Forms.ToolStripMenuItem btnMenuValidateStudent;
        private System.Windows.Forms.ToolStripButton toolStripButton7;
        private System.Windows.Forms.ToolStripSplitButton toolStripSplitButton1;
        private System.Windows.Forms.ToolStripMenuItem sendMessageToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem textBlastToolStripMenuItem;
        private System.Windows.Forms.ToolStrip toolStrip2;
        private System.Windows.Forms.ToolStripLabel toolStripLabel1;
        private System.Windows.Forms.ToolStripLabel lblUsername;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripButton toolStripReport;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
    }
}
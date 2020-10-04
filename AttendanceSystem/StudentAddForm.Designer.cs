namespace AttendanceSystem
{
    partial class StudentAddForm
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtParentsContact = new System.Windows.Forms.MaskedTextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.checkExempted = new System.Windows.Forms.CheckBox();
            this.label14 = new System.Windows.Forms.Label();
            this.txtguardian = new System.Windows.Forms.TextBox();
            this.cmbSex = new System.Windows.Forms.ComboBox();
            this.label13 = new System.Windows.Forms.Label();
            this.lblLrn = new System.Windows.Forms.Label();
            this.txtLRN = new System.Windows.Forms.TextBox();
            this.btnScan = new System.Windows.Forms.Button();
            this.txtContact = new System.Windows.Forms.MaskedTextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.cmbSection = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.cmbGrade = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtmname = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtfname = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtlname = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtStudentID = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtRFID = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.btnBrowse = new System.Windows.Forms.Button();
            this.label12 = new System.Windows.Forms.Label();
            this.btnNew = new System.Windows.Forms.Button();
            this.picStudent = new System.Windows.Forms.PictureBox();
            this.btnClose = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picStudent)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtParentsContact);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.checkExempted);
            this.groupBox1.Controls.Add(this.label14);
            this.groupBox1.Controls.Add(this.txtguardian);
            this.groupBox1.Controls.Add(this.cmbSex);
            this.groupBox1.Controls.Add(this.label13);
            this.groupBox1.Controls.Add(this.lblLrn);
            this.groupBox1.Controls.Add(this.txtLRN);
            this.groupBox1.Controls.Add(this.btnScan);
            this.groupBox1.Controls.Add(this.txtContact);
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.cmbSection);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.cmbGrade);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.txtmname);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txtfname);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.txtlname);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txtStudentID);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtRFID);
            this.groupBox1.Location = new System.Drawing.Point(12, 47);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(521, 379);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Student Information";
            // 
            // txtParentsContact
            // 
            this.txtParentsContact.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtParentsContact.Location = new System.Drawing.Point(105, 277);
            this.txtParentsContact.Mask = "+63##########";
            this.txtParentsContact.Name = "txtParentsContact";
            this.txtParentsContact.Size = new System.Drawing.Size(184, 21);
            this.txtParentsContact.TabIndex = 12;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(25, 277);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(74, 15);
            this.label8.TabIndex = 31;
            this.label8.Text = "Parents No.:";
            // 
            // checkExempted
            // 
            this.checkExempted.AutoSize = true;
            this.checkExempted.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.checkExempted.Location = new System.Drawing.Point(105, 332);
            this.checkExempted.Name = "checkExempted";
            this.checkExempted.Size = new System.Drawing.Size(91, 19);
            this.checkExempted.TabIndex = 14;
            this.checkExempted.Text = "Is Exempted";
            this.checkExempted.UseVisualStyleBackColor = true;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(32, 306);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(64, 15);
            this.label14.TabIndex = 28;
            this.label14.Text = "Guardian :";
            // 
            // txtguardian
            // 
            this.txtguardian.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtguardian.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtguardian.Location = new System.Drawing.Point(105, 304);
            this.txtguardian.MaxLength = 50;
            this.txtguardian.Name = "txtguardian";
            this.txtguardian.Size = new System.Drawing.Size(393, 21);
            this.txtguardian.TabIndex = 13;
            // 
            // cmbSex
            // 
            this.cmbSex.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSex.FormattingEnabled = true;
            this.cmbSex.Items.AddRange(new object[] {
            "MALE",
            "FEMALE"});
            this.cmbSex.Location = new System.Drawing.Point(106, 160);
            this.cmbSex.Name = "cmbSex";
            this.cmbSex.Size = new System.Drawing.Size(140, 23);
            this.cmbSex.TabIndex = 8;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(69, 163);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(31, 15);
            this.label13.TabIndex = 26;
            this.label13.Text = "Sex:";
            // 
            // lblLrn
            // 
            this.lblLrn.AutoSize = true;
            this.lblLrn.Location = new System.Drawing.Point(258, 55);
            this.lblLrn.Name = "lblLrn";
            this.lblLrn.Size = new System.Drawing.Size(35, 15);
            this.lblLrn.TabIndex = 25;
            this.lblLrn.Text = "LRN:";
            // 
            // txtLRN
            // 
            this.txtLRN.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtLRN.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtLRN.Location = new System.Drawing.Point(299, 52);
            this.txtLRN.MaxLength = 30;
            this.txtLRN.Name = "txtLRN";
            this.txtLRN.Size = new System.Drawing.Size(200, 21);
            this.txtLRN.TabIndex = 4;
            // 
            // btnScan
            // 
            this.btnScan.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnScan.Location = new System.Drawing.Point(258, 22);
            this.btnScan.Name = "btnScan";
            this.btnScan.Size = new System.Drawing.Size(96, 27);
            this.btnScan.TabIndex = 1;
            this.btnScan.Text = "Scan ID";
            this.btnScan.UseVisualStyleBackColor = true;
            this.btnScan.Click += new System.EventHandler(this.btnScan_Click);
            // 
            // txtContact
            // 
            this.txtContact.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtContact.Location = new System.Drawing.Point(105, 250);
            this.txtContact.Mask = "+63##########";
            this.txtContact.Name = "txtContact";
            this.txtContact.Size = new System.Drawing.Size(184, 21);
            this.txtContact.TabIndex = 11;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(31, 250);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(70, 15);
            this.label10.TabIndex = 22;
            this.label10.Text = "Mobile No.:";
            // 
            // cmbSection
            // 
            this.cmbSection.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSection.FormattingEnabled = true;
            this.cmbSection.Location = new System.Drawing.Point(106, 218);
            this.cmbSection.Name = "cmbSection";
            this.cmbSection.Size = new System.Drawing.Size(183, 23);
            this.cmbSection.TabIndex = 10;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(49, 221);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(51, 15);
            this.label7.TabIndex = 14;
            this.label7.Text = "Section:";
            // 
            // cmbGrade
            // 
            this.cmbGrade.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbGrade.FormattingEnabled = true;
            this.cmbGrade.Location = new System.Drawing.Point(106, 189);
            this.cmbGrade.Name = "cmbGrade";
            this.cmbGrade.Size = new System.Drawing.Size(140, 23);
            this.cmbGrade.TabIndex = 9;
            this.cmbGrade.SelectedIndexChanged += new System.EventHandler(this.cmbGrade_SelectedIndexChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(56, 192);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(44, 15);
            this.label6.TabIndex = 12;
            this.label6.Text = "Grade:";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(20, 136);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(80, 15);
            this.label5.TabIndex = 10;
            this.label5.Text = "Middlename:";
            // 
            // txtmname
            // 
            this.txtmname.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtmname.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtmname.Location = new System.Drawing.Point(106, 133);
            this.txtmname.MaxLength = 50;
            this.txtmname.Name = "txtmname";
            this.txtmname.Size = new System.Drawing.Size(393, 21);
            this.txtmname.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(35, 109);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(65, 15);
            this.label4.TabIndex = 8;
            this.label4.Text = "Firstname:";
            // 
            // txtfname
            // 
            this.txtfname.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtfname.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtfname.Location = new System.Drawing.Point(106, 106);
            this.txtfname.MaxLength = 50;
            this.txtfname.Name = "txtfname";
            this.txtfname.Size = new System.Drawing.Size(393, 21);
            this.txtfname.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(35, 82);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 15);
            this.label3.TabIndex = 6;
            this.label3.Text = "Lastname:";
            // 
            // txtlname
            // 
            this.txtlname.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtlname.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtlname.Location = new System.Drawing.Point(106, 79);
            this.txtlname.MaxLength = 50;
            this.txtlname.Name = "txtlname";
            this.txtlname.Size = new System.Drawing.Size(393, 21);
            this.txtlname.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(33, 55);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 15);
            this.label2.TabIndex = 4;
            this.label2.Text = "Student ID:";
            // 
            // txtStudentID
            // 
            this.txtStudentID.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtStudentID.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtStudentID.Location = new System.Drawing.Point(106, 52);
            this.txtStudentID.MaxLength = 15;
            this.txtStudentID.Name = "txtStudentID";
            this.txtStudentID.Size = new System.Drawing.Size(146, 21);
            this.txtStudentID.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(62, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 15);
            this.label1.TabIndex = 1;
            this.label1.Text = "RFID:";
            // 
            // txtRFID
            // 
            this.txtRFID.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtRFID.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtRFID.Location = new System.Drawing.Point(106, 25);
            this.txtRFID.MaxLength = 30;
            this.txtRFID.Name = "txtRFID";
            this.txtRFID.Size = new System.Drawing.Size(146, 21);
            this.txtRFID.TabIndex = 0;
            // 
            // label11
            // 
            this.label11.BackColor = System.Drawing.Color.Green;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.White;
            this.label11.Location = new System.Drawing.Point(7, 9);
            this.label11.Name = "label11";
            this.label11.Padding = new System.Windows.Forms.Padding(10, 0, 0, 0);
            this.label11.Size = new System.Drawing.Size(838, 31);
            this.label11.TabIndex = 4;
            this.label11.Text = "ADD / MODIFY STUDENT INFORMATION";
            this.label11.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // btnBrowse
            // 
            this.btnBrowse.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBrowse.Location = new System.Drawing.Point(539, 393);
            this.btnBrowse.Name = "btnBrowse";
            this.btnBrowse.Size = new System.Drawing.Size(304, 33);
            this.btnBrowse.TabIndex = 3;
            this.btnBrowse.Text = "Browse";
            this.btnBrowse.UseVisualStyleBackColor = true;
            this.btnBrowse.Click += new System.EventHandler(this.btnBrowse_Click);
            // 
            // label12
            // 
            this.label12.BackColor = System.Drawing.Color.Green;
            this.label12.Location = new System.Drawing.Point(9, 429);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(833, 14);
            this.label12.TabIndex = 8;
            // 
            // btnNew
            // 
            this.btnNew.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnNew.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNew.Image = global::AttendanceSystem.Properties.Resources.Actions_list_add_user_icon32x32;
            this.btnNew.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnNew.Location = new System.Drawing.Point(573, 446);
            this.btnNew.Name = "btnNew";
            this.btnNew.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.btnNew.Size = new System.Drawing.Size(87, 44);
            this.btnNew.TabIndex = 7;
            this.btnNew.Text = "New";
            this.btnNew.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // picStudent
            // 
            this.picStudent.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picStudent.Location = new System.Drawing.Point(539, 47);
            this.picStudent.Name = "picStudent";
            this.picStudent.Size = new System.Drawing.Size(306, 342);
            this.picStudent.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picStudent.TabIndex = 5;
            this.picStudent.TabStop = false;
            // 
            // btnClose
            // 
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClose.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClose.Image = global::AttendanceSystem.Properties.Resources.Close_2_icon24x24;
            this.btnClose.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnClose.Location = new System.Drawing.Point(757, 446);
            this.btnClose.Name = "btnClose";
            this.btnClose.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.btnClose.Size = new System.Drawing.Size(88, 44);
            this.btnClose.TabIndex = 2;
            this.btnClose.Text = "Close";
            this.btnClose.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // btnSave
            // 
            this.btnSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSave.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSave.Image = global::AttendanceSystem.Properties.Resources.save24x24;
            this.btnSave.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnSave.Location = new System.Drawing.Point(666, 446);
            this.btnSave.Name = "btnSave";
            this.btnSave.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.btnSave.Size = new System.Drawing.Size(85, 44);
            this.btnSave.TabIndex = 1;
            this.btnSave.Text = "Save";
            this.btnSave.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // StudentAddForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(855, 506);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.btnBrowse);
            this.Controls.Add(this.picStudent);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnSave);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "StudentAddForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add / Modify Student";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.StudentAddForm_FormClosing);
            this.Load += new System.EventHandler(this.StudentAddForm_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picStudent)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Button btnScan;
        private System.Windows.Forms.PictureBox picStudent;
        private System.Windows.Forms.Button btnBrowse;
        private System.Windows.Forms.Label lblLrn;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.CheckBox checkExempted;
        public System.Windows.Forms.Button btnNew;
        public System.Windows.Forms.TextBox txtRFID;
        public System.Windows.Forms.TextBox txtStudentID;
        public System.Windows.Forms.TextBox txtlname;
        public System.Windows.Forms.TextBox txtfname;
        public System.Windows.Forms.TextBox txtmname;
        public System.Windows.Forms.ComboBox cmbGrade;
        public System.Windows.Forms.ComboBox cmbSection;
        public System.Windows.Forms.MaskedTextBox txtContact;
        public System.Windows.Forms.TextBox txtLRN;
        public System.Windows.Forms.ComboBox cmbSex;
        public System.Windows.Forms.TextBox txtguardian;
        public System.Windows.Forms.MaskedTextBox txtParentsContact;
        private System.Windows.Forms.Label label8;
    }
}
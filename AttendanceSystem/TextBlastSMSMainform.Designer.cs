namespace AttendanceSystem
{
    partial class TextBlastSMSMainform
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
            this.cmbCategory = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.lblNoSMS = new System.Windows.Forms.Label();
            this.txtMsg = new System.Windows.Forms.TextBox();
            this.btnSave = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txtSubject = new System.Windows.Forms.TextBox();
            this.txtSubjectDesc = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.threadSendSMS = new System.ComponentModel.BackgroundWorker();
            this.lblSMSNo = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.lblSMSSent = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rdoStudent = new System.Windows.Forms.RadioButton();
            this.rdoPhonebook = new System.Windows.Forms.RadioButton();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cmbCategory
            // 
            this.cmbCategory.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCategory.FormattingEnabled = true;
            this.cmbCategory.Location = new System.Drawing.Point(77, 57);
            this.cmbCategory.Name = "cmbCategory";
            this.cmbCategory.Size = new System.Drawing.Size(188, 23);
            this.cmbCategory.TabIndex = 0;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(11, 60);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(61, 15);
            this.label3.TabIndex = 60;
            this.label3.Text = "Category :";
            // 
            // linkLabel1
            // 
            this.linkLabel1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.linkLabel1.AutoSize = true;
            this.linkLabel1.Location = new System.Drawing.Point(345, 5);
            this.linkLabel1.Name = "linkLabel1";
            this.linkLabel1.Size = new System.Drawing.Size(70, 15);
            this.linkLabel1.TabIndex = 5;
            this.linkLabel1.TabStop = true;
            this.linkLabel1.Text = "Phonebook";
            this.linkLabel1.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked);
            // 
            // lblNoSMS
            // 
            this.lblNoSMS.AutoSize = true;
            this.lblNoSMS.Location = new System.Drawing.Point(7, 189);
            this.lblNoSMS.Name = "lblNoSMS";
            this.lblNoSMS.Size = new System.Drawing.Size(64, 15);
            this.lblNoSMS.TabIndex = 76;
            this.lblNoSMS.Text = "Message :";
            // 
            // txtMsg
            // 
            this.txtMsg.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtMsg.Location = new System.Drawing.Point(77, 189);
            this.txtMsg.Multiline = true;
            this.txtMsg.Name = "txtMsg";
            this.txtMsg.Size = new System.Drawing.Size(319, 93);
            this.txtMsg.TabIndex = 3;
            // 
            // btnSave
            // 
            this.btnSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSave.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSave.Location = new System.Drawing.Point(243, 288);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(153, 34);
            this.btnSave.TabIndex = 4;
            this.btnSave.Text = "Save and Send";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 88);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(54, 15);
            this.label2.TabIndex = 79;
            this.label2.Text = "Subject :";
            // 
            // txtSubject
            // 
            this.txtSubject.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtSubject.Location = new System.Drawing.Point(77, 86);
            this.txtSubject.Name = "txtSubject";
            this.txtSubject.Size = new System.Drawing.Size(188, 21);
            this.txtSubject.TabIndex = 1;
            // 
            // txtSubjectDesc
            // 
            this.txtSubjectDesc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtSubjectDesc.Location = new System.Drawing.Point(77, 130);
            this.txtSubjectDesc.Multiline = true;
            this.txtSubjectDesc.Name = "txtSubjectDesc";
            this.txtSubjectDesc.Size = new System.Drawing.Size(319, 53);
            this.txtSubjectDesc.TabIndex = 2;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(17, 112);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(119, 15);
            this.label4.TabIndex = 81;
            this.label4.Text = "Subject Description :";
            // 
            // threadSendSMS
            // 
            this.threadSendSMS.DoWork += new System.ComponentModel.DoWorkEventHandler(this.threadSendSMS_DoWork);
            // 
            // lblSMSNo
            // 
            this.lblSMSNo.AutoSize = true;
            this.lblSMSNo.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSMSNo.Location = new System.Drawing.Point(13, 17);
            this.lblSMSNo.Name = "lblSMSNo";
            this.lblSMSNo.Size = new System.Drawing.Size(52, 18);
            this.lblSMSNo.TabIndex = 83;
            this.lblSMSNo.Text = "label5";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.lblSMSNo);
            this.groupBox2.Location = new System.Drawing.Point(3, 326);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(127, 45);
            this.groupBox2.TabIndex = 83;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Total SMS";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.lblSMSSent);
            this.groupBox3.Location = new System.Drawing.Point(136, 326);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(113, 45);
            this.groupBox3.TabIndex = 84;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "SMS Sent";
            // 
            // lblSMSSent
            // 
            this.lblSMSSent.AutoSize = true;
            this.lblSMSSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSMSSent.Location = new System.Drawing.Point(16, 17);
            this.lblSMSSent.Name = "lblSMSSent";
            this.lblSMSSent.Size = new System.Drawing.Size(52, 18);
            this.lblSMSSent.TabIndex = 83;
            this.lblSMSSent.Text = "label1";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rdoStudent);
            this.groupBox1.Controls.Add(this.rdoPhonebook);
            this.groupBox1.Location = new System.Drawing.Point(10, 6);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(255, 45);
            this.groupBox1.TabIndex = 84;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Option";
            // 
            // rdoStudent
            // 
            this.rdoStudent.AutoSize = true;
            this.rdoStudent.Location = new System.Drawing.Point(126, 17);
            this.rdoStudent.Name = "rdoStudent";
            this.rdoStudent.Size = new System.Drawing.Size(67, 19);
            this.rdoStudent.TabIndex = 1;
            this.rdoStudent.TabStop = true;
            this.rdoStudent.Text = "Student";
            this.rdoStudent.UseVisualStyleBackColor = true;
            this.rdoStudent.CheckedChanged += new System.EventHandler(this.rdoStudent_CheckedChanged);
            // 
            // rdoPhonebook
            // 
            this.rdoPhonebook.AutoSize = true;
            this.rdoPhonebook.Location = new System.Drawing.Point(13, 17);
            this.rdoPhonebook.Name = "rdoPhonebook";
            this.rdoPhonebook.Size = new System.Drawing.Size(88, 19);
            this.rdoPhonebook.TabIndex = 0;
            this.rdoPhonebook.TabStop = true;
            this.rdoPhonebook.Text = "Phonebook";
            this.rdoPhonebook.UseVisualStyleBackColor = true;
            this.rdoPhonebook.CheckedChanged += new System.EventHandler(this.rdoPhonebook_CheckedChanged);
            // 
            // TextBlastSMSMainform
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(427, 383);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.txtSubjectDesc);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtSubject);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.linkLabel1);
            this.Controls.Add(this.lblNoSMS);
            this.Controls.Add(this.txtMsg);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.cmbCategory);
            this.Controls.Add(this.label3);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "TextBlastSMSMainform";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Text Blast";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.TextBlastSMSMainform_FormClosing);
            this.Load += new System.EventHandler(this.TextBlastSMSMainform_Load);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmbCategory;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.LinkLabel linkLabel1;
        private System.Windows.Forms.Label lblNoSMS;
        private System.Windows.Forms.TextBox txtMsg;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtSubject;
        private System.Windows.Forms.TextBox txtSubjectDesc;
        private System.Windows.Forms.Label label4;
        private System.ComponentModel.BackgroundWorker threadSendSMS;
        private System.Windows.Forms.Label lblSMSNo;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label lblSMSSent;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rdoStudent;
        private System.Windows.Forms.RadioButton rdoPhonebook;
    }
}
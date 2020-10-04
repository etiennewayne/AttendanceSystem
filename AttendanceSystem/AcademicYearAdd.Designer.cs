namespace AttendanceSystem
{
    partial class AcademicYearAdd
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
            this.label1 = new System.Windows.Forms.Label();
            this.btnSave = new System.Windows.Forms.Button();
            this.txtAYCode = new System.Windows.Forms.TextBox();
            this.txtAYDesc = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtSemester = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(17, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "A.Y. Code :";
            // 
            // btnSave
            // 
            this.btnSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSave.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSave.Location = new System.Drawing.Point(294, 102);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(75, 35);
            this.btnSave.TabIndex = 4;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // txtAYCode
            // 
            this.txtAYCode.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtAYCode.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtAYCode.Location = new System.Drawing.Point(88, 21);
            this.txtAYCode.Name = "txtAYCode";
            this.txtAYCode.Size = new System.Drawing.Size(175, 21);
            this.txtAYCode.TabIndex = 0;
            // 
            // txtAYDesc
            // 
            this.txtAYDesc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtAYDesc.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtAYDesc.Location = new System.Drawing.Point(88, 48);
            this.txtAYDesc.Name = "txtAYDesc";
            this.txtAYDesc.Size = new System.Drawing.Size(281, 21);
            this.txtAYDesc.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 50);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(64, 15);
            this.label2.TabIndex = 3;
            this.label2.Text = "A.Y. Desc :";
            // 
            // txtSemester
            // 
            this.txtSemester.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtSemester.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtSemester.Location = new System.Drawing.Point(88, 75);
            this.txtSemester.Name = "txtSemester";
            this.txtSemester.Size = new System.Drawing.Size(281, 21);
            this.txtSemester.TabIndex = 2;
            this.txtSemester.Visible = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 77);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 15);
            this.label3.TabIndex = 6;
            this.label3.Text = "Semester :";
            this.label3.Visible = false;
            // 
            // AcademicYearAdd
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(381, 153);
            this.Controls.Add(this.txtSemester);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtAYDesc);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtAYCode);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AcademicYearAdd";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Academic Year Add / Modify";
            this.Load += new System.EventHandler(this.AcademicYearAdd_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.TextBox txtAYCode;
        private System.Windows.Forms.TextBox txtAYDesc;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtSemester;
        private System.Windows.Forms.Label label3;
    }
}
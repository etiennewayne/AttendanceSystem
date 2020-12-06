namespace AttendanceSystem
{
    partial class StudentListBrowseStudent
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(StudentListBrowseStudent));
            this.flx = new C1.Win.C1FlexGrid.C1FlexGrid();
            this.label2 = new System.Windows.Forms.Label();
            this.txtlname = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtfname = new System.Windows.Forms.TextBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnSearch = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbGrade = new System.Windows.Forms.ComboBox();
            this.cmbSection = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.flx)).BeginInit();
            this.SuspendLayout();
            // 
            // flx
            // 
            this.flx.AllowEditing = false;
            this.flx.BorderStyle = C1.Win.C1FlexGrid.Util.BaseControls.BorderStyleEnum.FixedSingle;
            this.flx.ColumnInfo = resources.GetString("flx.ColumnInfo");
            this.flx.ExtendLastCol = true;
            this.flx.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
            this.flx.Location = new System.Drawing.Point(12, 80);
            this.flx.Name = "flx";
            this.flx.Rows.DefaultSize = 20;
            this.flx.SelectionMode = C1.Win.C1FlexGrid.SelectionModeEnum.Row;
            this.flx.Size = new System.Drawing.Size(769, 321);
            this.flx.StyleInfo = resources.GetString("flx.StyleInfo");
            this.flx.TabIndex = 25;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(61, 13);
            this.label2.TabIndex = 31;
            this.label2.Text = "Lastname :";
            // 
            // txtlname
            // 
            this.txtlname.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtlname.Location = new System.Drawing.Point(84, 12);
            this.txtlname.Name = "txtlname";
            this.txtlname.Size = new System.Drawing.Size(132, 22);
            this.txtlname.TabIndex = 30;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(233, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 13);
            this.label1.TabIndex = 33;
            this.label1.Text = "Firstname :";
            // 
            // txtfname
            // 
            this.txtfname.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtfname.Location = new System.Drawing.Point(302, 12);
            this.txtfname.Name = "txtfname";
            this.txtfname.Size = new System.Drawing.Size(132, 22);
            this.txtfname.TabIndex = 32;
            // 
            // btnAdd
            // 
            this.btnAdd.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.Image = global::AttendanceSystem.Properties.Resources.Actions_list_add_user_icon24x24;
            this.btnAdd.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAdd.Location = new System.Drawing.Point(679, 408);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.btnAdd.Size = new System.Drawing.Size(102, 37);
            this.btnAdd.TabIndex = 34;
            this.btnAdd.Text = "Select";
            this.btnAdd.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnSearch
            // 
            this.btnSearch.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSearch.Image = global::AttendanceSystem.Properties.Resources.search_icon16x16;
            this.btnSearch.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnSearch.Location = new System.Drawing.Point(691, 6);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.btnSearch.Size = new System.Drawing.Size(90, 26);
            this.btnSearch.TabIndex = 35;
            this.btnSearch.Text = "Search";
            this.btnSearch.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(37, 42);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(41, 13);
            this.label3.TabIndex = 37;
            this.label3.Text = "Grade:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(248, 42);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 13);
            this.label4.TabIndex = 39;
            this.label4.Text = "Section:";
            // 
            // cmbGrade
            // 
            this.cmbGrade.FormattingEnabled = true;
            this.cmbGrade.Location = new System.Drawing.Point(84, 40);
            this.cmbGrade.Name = "cmbGrade";
            this.cmbGrade.Size = new System.Drawing.Size(132, 21);
            this.cmbGrade.TabIndex = 40;
            this.cmbGrade.SelectedIndexChanged += new System.EventHandler(this.cmbGrade_SelectedIndexChanged);
            // 
            // cmbSection
            // 
            this.cmbSection.FormattingEnabled = true;
            this.cmbSection.Location = new System.Drawing.Point(302, 39);
            this.cmbSection.Name = "cmbSection";
            this.cmbSection.Size = new System.Drawing.Size(132, 21);
            this.cmbSection.TabIndex = 41;
            // 
            // StudentListBrowseStudent
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 457);
            this.Controls.Add(this.cmbSection);
            this.Controls.Add(this.cmbGrade);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnSearch);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtfname);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtlname);
            this.Controls.Add(this.flx);
            this.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "StudentListBrowseStudent";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Students";
            this.Load += new System.EventHandler(this.StudentListBrowseStudent_Load);
            ((System.ComponentModel.ISupportInitialize)(this.flx)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private C1.Win.C1FlexGrid.C1FlexGrid flx;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtlname;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtfname;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cmbGrade;
        private System.Windows.Forms.ComboBox cmbSection;
    }
}
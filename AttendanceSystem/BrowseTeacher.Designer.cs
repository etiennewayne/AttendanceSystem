namespace AttendanceSystem
{
    partial class BrowseTeacher
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BrowseTeacher));
            this.btnSearch = new System.Windows.Forms.Button();
            this.label11 = new System.Windows.Forms.Label();
            this.txtlname = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.flx = new C1.Win.C1FlexGrid.C1FlexGrid();
            this.txtfname = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.flx)).BeginInit();
            this.SuspendLayout();
            // 
            // btnSearch
            // 
            this.btnSearch.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSearch.Image = global::AttendanceSystem.Properties.Resources.search_icon16x16;
            this.btnSearch.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnSearch.Location = new System.Drawing.Point(377, 64);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.btnSearch.Size = new System.Drawing.Size(90, 29);
            this.btnSearch.TabIndex = 40;
            this.btnSearch.Text = "Search";
            this.btnSearch.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnSearch.UseVisualStyleBackColor = true;
            // 
            // label11
            // 
            this.label11.BackColor = System.Drawing.Color.Green;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.White;
            this.label11.Image = global::AttendanceSystem.Properties.Resources.Books_icon24x241;
            this.label11.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.label11.Location = new System.Drawing.Point(2, -1);
            this.label11.Name = "label11";
            this.label11.Padding = new System.Windows.Forms.Padding(10, 0, 0, 0);
            this.label11.Size = new System.Drawing.Size(474, 31);
            this.label11.TabIndex = 39;
            this.label11.Text = "TEACHERS";
            this.label11.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // txtlname
            // 
            this.txtlname.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtlname.Location = new System.Drawing.Point(82, 33);
            this.txtlname.Name = "txtlname";
            this.txtlname.Size = new System.Drawing.Size(138, 23);
            this.txtlname.TabIndex = 38;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(64, 15);
            this.label1.TabIndex = 37;
            this.label1.Text = "Lastname :";
            // 
            // flx
            // 
            this.flx.AllowEditing = false;
            this.flx.BorderStyle = C1.Win.C1FlexGrid.Util.BaseControls.BorderStyleEnum.FixedSingle;
            this.flx.ColumnInfo = resources.GetString("flx.ColumnInfo");
            this.flx.ExtendLastCol = true;
            this.flx.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
            this.flx.Location = new System.Drawing.Point(12, 100);
            this.flx.Name = "flx";
            this.flx.Rows.DefaultSize = 20;
            this.flx.SelectionMode = C1.Win.C1FlexGrid.SelectionModeEnum.Row;
            this.flx.Size = new System.Drawing.Size(455, 425);
            this.flx.StyleInfo = resources.GetString("flx.StyleInfo");
            this.flx.TabIndex = 36;
            // 
            // txtfname
            // 
            this.txtfname.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtfname.Location = new System.Drawing.Point(82, 62);
            this.txtfname.Name = "txtfname";
            this.txtfname.Size = new System.Drawing.Size(138, 23);
            this.txtfname.TabIndex = 42;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 64);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 15);
            this.label2.TabIndex = 41;
            this.label2.Text = "Firstname :";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(11, 64);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 15);
            this.label3.TabIndex = 41;
            this.label3.Text = "Firstname :";
            // 
            // BrowseTeacher
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(477, 581);
            this.Controls.Add(this.txtfname);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnSearch);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.txtlname);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.flx);
            this.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "BrowseTeacher";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Browse Teacher";
            ((System.ComponentModel.ISupportInitialize)(this.flx)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtlname;
        private System.Windows.Forms.Label label1;
        private C1.Win.C1FlexGrid.C1FlexGrid flx;
        private System.Windows.Forms.TextBox txtfname;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
    }
}
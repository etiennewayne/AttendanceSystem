namespace AttendanceSystem.Reports
{
    partial class BrowseTeacherReport
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BrowseTeacherReport));
            this.flx = new C1.Win.C1FlexGrid.C1FlexGrid();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnSelect = new System.Windows.Forms.Button();
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
            this.flx.Location = new System.Drawing.Point(12, 38);
            this.flx.Name = "flx";
            this.flx.Rows.DefaultSize = 20;
            this.flx.SelectionMode = C1.Win.C1FlexGrid.SelectionModeEnum.Row;
            this.flx.Size = new System.Drawing.Size(474, 425);
            this.flx.StyleInfo = resources.GetString("flx.StyleInfo");
            this.flx.TabIndex = 37;
            // 
            // txtSearch
            // 
            this.txtSearch.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtSearch.Location = new System.Drawing.Point(61, 12);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(346, 20);
            this.txtSearch.TabIndex = 40;
            this.txtSearch.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtSearch_KeyDown);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(11, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 39;
            this.label1.Text = "Search:";
            // 
            // btnSelect
            // 
            this.btnSelect.Location = new System.Drawing.Point(411, 469);
            this.btnSelect.Name = "btnSelect";
            this.btnSelect.Size = new System.Drawing.Size(75, 26);
            this.btnSelect.TabIndex = 41;
            this.btnSelect.Text = "Select";
            this.btnSelect.UseVisualStyleBackColor = true;
            this.btnSelect.Click += new System.EventHandler(this.btnSelect_Click);
            // 
            // BrowseTeacherReport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(496, 507);
            this.Controls.Add(this.btnSelect);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.flx);
            this.Name = "BrowseTeacherReport";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "BrowseTeacher";
            this.Load += new System.EventHandler(this.BrowseTeacherReport_Load);
            ((System.ComponentModel.ISupportInitialize)(this.flx)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private C1.Win.C1FlexGrid.C1FlexGrid flx;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnSelect;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace QLNhanSu
{
    public partial class SuaTtsanbong : System.Web.UI.Page
    {
        string connstring = ConfigurationManager.ConnectionStrings["QLsanbong"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void LoadData()
        {
            using (SqlConnection mycon = new SqlConnection(connstring))
            {
                mycon.Open();
                string sql = "SELECT * FROM SanBong";
                SqlCommand cmd = new SqlCommand(sql, mycon);
                SqlDataReader data = cmd.ExecuteReader();

                while (data.Read())
                {
                    TableRow row = new TableRow();

                    // 1. Mã Sân
                    TableCell cellMa = new TableCell();
                    string maSan = data["MaSan"].ToString();
                    cellMa.Text = maSan;
                    row.Cells.Add(cellMa);

                    // 2. Tên Sân
                    TableCell cellTen = new TableCell();
                    cellTen.Text = data["TenSan"].ToString();
                    row.Cells.Add(cellTen);

                    // 3. Loại Sân
                    TableCell cellLoai = new TableCell();
                    cellLoai.Text = data["LoaiSan"].ToString();
                    row.Cells.Add(cellLoai);

                    // 4. Giá Thuê (TextBox)
                    TableCell cellGia = new TableCell();
                    TextBox txtGia = new TextBox();
                    txtGia.ID = "txtGia_" + maSan;
                    txtGia.Text = data["GiaThue"].ToString();
                    cellGia.Controls.Add(txtGia);
                    row.Cells.Add(cellGia);

                    // 5. Trạng Thái (DropDownList)
                    TableCell cellTrangThai = new TableCell();
                    DropDownList ddlTrangThai = new DropDownList();
                    ddlTrangThai.ID = "ddlTT_" + maSan;
                    ddlTrangThai.Items.Add(new ListItem("Trống", "Trống"));
                    ddlTrangThai.Items.Add(new ListItem("Đang sử dụng", "Đang sử dụng"));
                    ddlTrangThai.Items.Add(new ListItem("Bảo trì", "Bảo trì"));

                    string currentStatus = data["TrangThai"].ToString();
                    if (ddlTrangThai.Items.FindByValue(currentStatus) != null)
                    {
                        ddlTrangThai.SelectedValue = currentStatus;
                    }
                    cellTrangThai.Controls.Add(ddlTrangThai);
                    row.Cells.Add(cellTrangThai);

                    // 6. Nút Cập Nhật
                    TableCell cellAction = new TableCell();
                    Button btnUpdate = new Button();
                    btnUpdate.Text = "Cập nhật";
                    btnUpdate.CommandArgument = maSan;
                    btnUpdate.Click += new EventHandler(BtnUpdate_Click);
                    cellAction.Controls.Add(btnUpdate);
                    row.Cells.Add(cellAction);

                    // Thêm dòng vào bảng
                    tblNV.Rows.Add(row);
                }
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string maSan = btn.CommandArgument;

            TextBox txtGia = null;
            DropDownList ddlTrangThai = null;

            // Tìm TextBox và DropDownList tương ứng trong dòng
            foreach (TableRow row in tblNV.Rows)
            {
                foreach (TableCell cell in row.Cells)
                {
                    foreach (Control control in cell.Controls)
                    {
                        if (control is TextBox && control.ID == "txtGia_" + maSan)
                        {
                            txtGia = (TextBox)control;
                        }
                        else if (control is DropDownList && control.ID == "ddlTT_" + maSan)
                        {
                            ddlTrangThai = (DropDownList)control;
                        }
                    }
                }
            }

            if (txtGia != null && ddlTrangThai != null)
            {
                using (SqlConnection mycon = new SqlConnection(connstring))
                {
                    mycon.Open();
                    string sql = "UPDATE SanBong SET GiaThue = @GiaThue, TrangThai = @TrangThai WHERE MaSan = @MaSan";
                    SqlCommand cmd = new SqlCommand(sql, mycon);
                    cmd.Parameters.AddWithValue("@GiaThue", txtGia.Text.Trim());
                    cmd.Parameters.AddWithValue("@TrangThai", ddlTrangThai.SelectedValue);
                    cmd.Parameters.AddWithValue("@MaSan", maSan);

                    cmd.ExecuteNonQuery();
                }

                // Tải lại trang để cập nhật thông tin mới
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}
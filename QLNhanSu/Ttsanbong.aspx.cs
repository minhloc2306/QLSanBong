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
    public partial class HienNV : System.Web.UI.Page
    {
        string connstring = ConfigurationManager.ConnectionStrings["QLsanbong"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataSanBong();
            }
        }

        private void LoadDataSanBong()
        {
            using (SqlConnection mycon = new SqlConnection(connstring))
            {
                mycon.Open();
                string sql = "SELECT MaSan, TenSan, LoaiSan, GiaThue, TrangThai FROM SanBong";
                SqlCommand cmd = new SqlCommand(sql, mycon);
                SqlDataReader data = cmd.ExecuteReader();

                while (data.Read())
                {
                    TableRow row = new TableRow();

                    // Cột 1: Mã Sân
                    TableCell cellMaSan = new TableCell();
                    cellMaSan.Text = data["MaSan"].ToString();
                    row.Cells.Add(cellMaSan);

                    // Cột 2: Tên Sân
                    TableCell cellTenSan = new TableCell();
                    cellTenSan.Text = data["TenSan"].ToString();
                    row.Cells.Add(cellTenSan);

                    // Cột 3: Loại Sân
                    TableCell cellLoaiSan = new TableCell();
                    cellLoaiSan.Text = data["LoaiSan"].ToString();
                    row.Cells.Add(cellLoaiSan);

                    // Cột 4: Giá Thuê (Định dạng phân cách hàng nghìn + VNĐ)
                    TableCell cellGiaThue = new TableCell();
                    if (data["GiaThue"] != DBNull.Value)
                    {
                        cellGiaThue.Text = Convert.ToDecimal(data["GiaThue"]).ToString("N0") + " VNĐ";
                    }
                    row.Cells.Add(cellGiaThue);

                    // Cột 5: Trạng Thái
                    TableCell cellTrangThai = new TableCell();
                    cellTrangThai.Text = data["TrangThai"].ToString();
                    row.Cells.Add(cellTrangThai);

                    // Thêm dòng vào bảng
                    tblNV.Rows.Add(row);
                }
            }
        }
    }
}
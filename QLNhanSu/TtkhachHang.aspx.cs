using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace QLNhanSu
{
    public partial class TtkhachHang : System.Web.UI.Page
    {
        string connstring = ConfigurationManager.ConnectionStrings["QLsanbong"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataKhachHang();
            }
        }

        private void LoadDataKhachHang()
        {
            using (SqlConnection con = new SqlConnection(connstring))
            {
                con.Open();
                string sql = "SELECT HovaTen, SoDienThoai, MaSan, NgayDat, ThoiGianBatDau, ThoiGianKetThuc, TongTien FROM DatSan";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvKhachHang.DataSource = dt;
                gvKhachHang.DataBind();
            }
        }

        // 1. Nhấn nút Sửa
        protected void gvKhachHang_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvKhachHang.EditIndex = e.NewEditIndex;
            LoadDataKhachHang();
        }

        // 2. Nhấn nút Hủy
        protected void gvKhachHang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvKhachHang.EditIndex = -1;
            LoadDataKhachHang();
        }

        // 3. Nhấn nút Cập nhật
        protected void gvKhachHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvKhachHang.Rows[e.RowIndex];

            // Lấy dữ liệu khóa chính từ DataKeyNames
            string sdt = gvKhachHang.DataKeys[e.RowIndex].Values["SoDienThoai"].ToString();
            string maSan = gvKhachHang.DataKeys[e.RowIndex].Values["MaSan"].ToString();

            // Lấy dữ liệu mới nhập từ TextBox
            string hoTen = ((TextBox)row.FindControl("txtHovaTen")).Text.Trim();
            string ngayDat = ((TextBox)row.FindControl("txtNgayDat")).Text.Trim();
            string gioBD = ((TextBox)row.FindControl("txtThoiGianBatDau")).Text.Trim();
            string gioKT = ((TextBox)row.FindControl("txtThoiGianKetThuc")).Text.Trim();
            string tongTien = ((TextBox)row.FindControl("txtTongTien")).Text.Trim();

            using (SqlConnection con = new SqlConnection(connstring))
            {
                con.Open();
                string sql = @"UPDATE DatSan 
                               SET HovaTen = @HoTen, 
                                   NgayDat = @NgayDat, 
                                   ThoiGianBatDau = @GioBD, 
                                   ThoiGianKetThuc = @GioKT, 
                                   TongTien = @TongTien 
                               WHERE SoDienThoai = @SoDienThoai AND MaSan = @MaSan";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@HoTen", hoTen);
                cmd.Parameters.AddWithValue("@NgayDat", ngayDat);
                cmd.Parameters.AddWithValue("@GioBD", gioBD);
                cmd.Parameters.AddWithValue("@GioKT", gioKT);
                cmd.Parameters.AddWithValue("@TongTien", string.IsNullOrEmpty(tongTien) ? (object)DBNull.Value : Convert.ToDecimal(tongTien));
                cmd.Parameters.AddWithValue("@SoDienThoai", sdt);
                cmd.Parameters.AddWithValue("@MaSan", maSan);

                cmd.ExecuteNonQuery();
            }

            gvKhachHang.EditIndex = -1;
            lblMessage.Text = "Cập nhật thành công!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            LoadDataKhachHang();
        }

        // 4. Nhấn nút Xóa
        protected void gvKhachHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string sdt = gvKhachHang.DataKeys[e.RowIndex].Values["SoDienThoai"].ToString();
            string maSan = gvKhachHang.DataKeys[e.RowIndex].Values["MaSan"].ToString();

            using (SqlConnection con = new SqlConnection(connstring))
            {
                con.Open();
                string sql = "DELETE FROM DatSan WHERE SoDienThoai = @SoDienThoai AND MaSan = @MaSan";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@SoDienThoai", sdt);
                cmd.Parameters.AddWithValue("@MaSan", maSan);
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Xóa thành công!";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            LoadDataKhachHang();
        }
    }
}
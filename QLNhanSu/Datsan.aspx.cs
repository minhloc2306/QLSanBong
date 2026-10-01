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
    public partial class Datsan : System.Web.UI.Page
    {
        string connstring = ConfigurationManager.ConnectionStrings["QLsanbong"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox4NgayDat.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void Button1DangKi_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1HovaTen.Text) ||
                string.IsNullOrEmpty(TextBox2SoDienThoai.Text) ||
                string.IsNullOrEmpty(TextBox3MaSan.Text))
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Vui lòng nhập đầy đủ Họ tên, SĐT và Mã sân!";
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connstring))
                {
                    con.Open();

                    // 1. Chỉ thực hiện lưu dữ liệu vào duy nhất bảng DatSan
                    string sqlInsertDatSan = @"INSERT INTO DatSan (HovaTen, SoDienThoai, MaSan, NgayDat, ThoiGianBatDau, ThoiGianKetThuc, TongTien) 
                                               VALUES (@HoTen, @SDT, @MaSan, @NgayDat, @Start, @End, @TongTien)";

                    SqlCommand cmdDatSan = new SqlCommand(sqlInsertDatSan, con);
                    cmdDatSan.Parameters.AddWithValue("@HoTen", TextBox1HovaTen.Text.Trim());
                    cmdDatSan.Parameters.AddWithValue("@SDT", TextBox2SoDienThoai.Text.Trim());
                    cmdDatSan.Parameters.AddWithValue("@MaSan", TextBox3MaSan.Text.Trim());
                    cmdDatSan.Parameters.AddWithValue("@NgayDat", TextBox4NgayDat.Text);
                    cmdDatSan.Parameters.AddWithValue("@Start", TextBox5ThoiGianBatDau.Text);
                    cmdDatSan.Parameters.AddWithValue("@End", TextBox6ThoiGianKetThuc.Text);

                    decimal tongTien = 0;
                    decimal.TryParse(TextBox7TongTien.Text.Trim(), out tongTien);
                    cmdDatSan.Parameters.AddWithValue("@TongTien", tongTien);

                    cmdDatSan.ExecuteNonQuery();

                    // 2. Thông báo thành công
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "Đã đăng kí thành công";

                    ClearInputs();
                }
            }
            catch (Exception ex)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Lỗi khi lưu dữ liệu: " + ex.Message;
            }
        }

        private void ClearInputs()
        {
            TextBox1HovaTen.Text = "";
            TextBox2SoDienThoai.Text = "";
            TextBox3MaSan.Text = "";
            TextBox5ThoiGianBatDau.Text = "";
            TextBox6ThoiGianKetThuc.Text = "";
            TextBox7TongTien.Text = "";
        }
    }
}
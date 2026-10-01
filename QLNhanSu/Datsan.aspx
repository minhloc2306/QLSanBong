<%@ Page Title="Đặt Sân Bóng" Language="C#" MasterPageFile="~/trangmau.Master" AutoEventWireup="true" CodeBehind="Datsan.aspx.cs" Inherits="QLNhanSu.Datsan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .title-page {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #0f172a;
            margin: 20px 0 25px 0;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Khung Form Card căn giữa đồng nhất chuẩn giao diện hệ thống */
        .form-card {
            max-width: 480px;
            margin: 0 auto 40px auto;
            background: #ffffff;
            padding: 25px 30px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: 600;
            color: #334155;
            margin-bottom: 6px;
            font-size: 14px;
        }

        /* Input chuẩn kích thước & hiệu ứng focus */
        .form-control {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            font-size: 14px;
            color: #1e293b;
            outline: none;
            box-sizing: border-box;
            transition: all 0.2s ease-in-out;
            background-color: #fff;
        }

        .form-control:focus {
            border-color: #0284c7;
            box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.15);
        }

        /* Nút Đăng Ký đặt sân chuẩn tông xanh chủ đạo */
        .btn-submit {
            background-color: #0284c7;
            color: #ffffff;
            border: none;
            padding: 10px 18px;
            font-size: 14px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.2s ease;
        }

        .btn-submit:hover {
            background-color: #0369a1;
        }

        /* Label thông báo kết quả */
        .msg-label {
            display: block;
            margin-top: 12px;
            font-size: 14px;
            font-weight: 600;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-page">ĐẶT SÂN BÓNG</div>

    <div class="form-card">
        <div class="form-group">
            <label>Họ và Tên:</label>
            <asp:TextBox ID="TextBox1HovaTen" runat="server" CssClass="form-control" placeholder="Nhập họ và tên"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Số Điện Thoại:</label>
            <asp:TextBox ID="TextBox2SoDienThoai" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Mã Sân:</label>
            <asp:TextBox ID="TextBox3MaSan" runat="server" CssClass="form-control" placeholder="Nhập mã sân bóng"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Ngày Đặt:</label>
            <asp:TextBox ID="TextBox4NgayDat" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Thời Gian Bắt Đầu:</label>
            <asp:TextBox ID="TextBox5ThoiGianBatDau" runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Thời Gian Kết Thúc:</label>
            <asp:TextBox ID="TextBox6ThoiGianKetThuc" runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Tổng Tiền:</label>
            <asp:TextBox ID="TextBox7TongTien" runat="server" CssClass="form-control" placeholder="Nhập tổng tiền"></asp:TextBox>
        </div>

        <asp:Button ID="Button1DangKi" runat="server" Text="Đăng Kí" CssClass="btn-submit" OnClick="Button1DangKi_Click" />

        <asp:Label ID="Label1" runat="server" CssClass="msg-label"></asp:Label>
    </div>
</asp:Content>
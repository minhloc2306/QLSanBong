<%@ Page Title="Sửa Thông Tin Sân Bóng" Language="C#" MasterPageFile="~/trangmau.Master" AutoEventWireup="true" CodeBehind="SuaTtsanbong.aspx.cs" Inherits="QLNhanSu.SuaTtsanbong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .title-page {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #0f172a;
            margin: 15px 0 20px 0;
            text-transform: uppercase;
        }

        /* Đội ngũ style chuẩn căn giữa và đổ bóng cho bảng */
        .table-custom {
            width: 90%;
            max-width: 1000px;
            margin: 0 auto 30px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .table-custom th {
            background-color: #0f172a;
            color: #ffffff;
            padding: 12px 10px;
            text-align: center !important;
            font-size: 14px;
            font-weight: 600;
            border: none;
        }

        .table-custom td {
            padding: 10px;
            border-bottom: 1px solid #e2e8f0;
            text-align: center !important;
            vertical-align: middle;
            color: #334155;
            font-size: 14px;
        }

        .table-custom tr:nth-child(even) {
            background-color: #f8fafc;
        }

        .table-custom tr:hover {
            background-color: #f1f5f9;
        }

        /* Input và Dropdown trong bảng */
        .table-custom input[type="text"] {
            padding: 6px 10px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            text-align: center;
            width: 80%;
            font-size: 14px;
        }

        .table-custom select {
            padding: 6px 10px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            font-size: 14px;
        }

        .table-custom input[type="submit"], 
        .table-custom button {
            background-color: #0284c7;
            color: #ffffff;
            border: none;
            padding: 6px 14px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            font-size: 13px;
            transition: background 0.2s;
        }

        .table-custom input[type="submit"]:hover, 
        .table-custom button:hover {
            background-color: #0369a1;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-page">SỬA THÔNG TIN SÂN BÓNG</div>

    <asp:Table ID="tblNV" runat="server" CssClass="table-custom">
        <asp:TableHeaderRow runat="server">
            <asp:TableHeaderCell runat="server">Mã Sân</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Tên Sân</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Loại Sân</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Giá Thuê</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Trạng Thái</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Cập Nhật</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
</asp:Content>
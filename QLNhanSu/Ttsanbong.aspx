<%@ Page Title="Trạng Thái Sân Bóng" Language="C#" MasterPageFile="~/trangmau.Master" AutoEventWireup="true" CodeBehind="Ttsanbong.aspx.cs" Inherits="QLNhanSu.HienNV" %>

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
        .table-custom {
            width: 95%;
            margin: 0 auto;
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
            text-align: center;
            font-size: 14px;
            font-weight: 600;
            border: none;
        }
        .table-custom td {
            padding: 10px;
            border-bottom: 1px solid #e2e8f0;
            text-align: center;
            color: #334155;
            font-size: 14px;
        }
        .table-custom tr:nth-child(even) {
            background-color: #f8fafc;
        }
        .table-custom tr:hover {
            background-color: #f1f5f9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-page">TRẠNG THÁI SÂN BÓNG</div>
    
    <asp:Table ID="tblNV" runat="server" CssClass="table-custom">
        <asp:TableHeaderRow ID="TableHeaderRow1" runat="server">
            <asp:TableHeaderCell runat="server">Mã Sân</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Tên Sân</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Loại Sân</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Giá Thuê</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Trạng Thái</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
</asp:Content>
<%@ Page Title="Thông Tin Khách Hàng" Language="C#" MasterPageFile="~/trangmau.Master" AutoEventWireup="true" CodeBehind="TtkhachHang.aspx.cs" Inherits="QLNhanSu.TtkhachHang" %>

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
        .btn-action {
            color: #0284c7;
            text-decoration: none;
            font-weight: 600;
            margin: 0 4px;
        }
        .btn-action:hover {
            text-decoration: underline;
        }
        .txt-edit {
            width: 90%;
            padding: 5px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-page">THÔNG TIN KHÁCH HÀNG ĐẶT SÂN</div>
    
    <div style="text-align: center; margin-bottom: 10px;">
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
    </div>

    <asp:GridView ID="gvKhachHang" runat="server" AutoGenerateColumns="False" 
        CssClass="table-custom" GridLines="Both"
        DataKeyNames="SoDienThoai,MaSan,NgayDat,ThoiGianBatDau"
        OnRowEditing="gvKhachHang_RowEditing" 
        OnRowCancelingEdit="gvKhachHang_RowCancelingEdit" 
        OnRowUpdating="gvKhachHang_RowUpdating" 
        OnRowDeleting="gvKhachHang_RowDeleting">
        
        <Columns>
            <%-- Cột 1: Họ và Tên --%>
            <asp:TemplateField HeaderText="Họ và Tên">
                <ItemTemplate>
                    <asp:Label ID="lblHovaTen" runat="server" Text='<%# Eval("HovaTen") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtHovaTen" runat="server" Text='<%# Eval("HovaTen") %>' CssClass="txt-edit"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <%-- Cột 2: Số Điện Thoại --%>
            <asp:TemplateField HeaderText="Số Điện Thoại">
                <ItemTemplate>
                    <asp:Label ID="lblSoDienThoai" runat="server" Text='<%# Eval("SoDienThoai") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtSoDienThoai" runat="server" Text='<%# Eval("SoDienThoai") %>' CssClass="txt-edit"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <%-- Cột 3: Mã Sân --%>
            <asp:TemplateField HeaderText="Mã Sân">
                <ItemTemplate>
                    <asp:Label ID="lblMaSan" runat="server" Text='<%# Eval("MaSan") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtMaSan" runat="server" Text='<%# Eval("MaSan") %>' CssClass="txt-edit"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <%-- Cột 4: Ngày Đặt --%>
            <asp:TemplateField HeaderText="Ngày Đặt">
                <ItemTemplate>
                    <asp:Label ID="lblNgayDat" runat="server" Text='<%# Eval("NgayDat", "{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtNgayDat" runat="server" Text='<%# Eval("NgayDat", "{0:yyyy-MM-dd}") %>' CssClass="txt-edit"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <%-- Cột 5: Thời Gian Bắt Đầu --%>
            <asp:TemplateField HeaderText="Thời Gian Bắt Đầu">
                <ItemTemplate>
                    <asp:Label ID="lblThoiGianBatDau" runat="server" Text='<%# Eval("ThoiGianBatDau") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtThoiGianBatDau" runat="server" Text='<%# Eval("ThoiGianBatDau") %>' CssClass="txt-edit"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <%-- Cột 6: Thời Gian Kết Thúc --%>
            <asp:TemplateField HeaderText="Thời Gian Kết Thúc">
                <ItemTemplate>
                    <asp:Label ID="lblThoiGianKetThuc" runat="server" Text='<%# Eval("ThoiGianKetThuc") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtThoiGianKetThuc" runat="server" Text='<%# Eval("ThoiGianKetThuc") %>' CssClass="txt-edit"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <%-- Cột 7: Tổng Tiền --%>
            <asp:TemplateField HeaderText="Tổng Tiền">
                <ItemTemplate>
                    <asp:Label ID="lblTongTien" runat="server" Text='<%# Eval("TongTien", "{0:N0}") + " VNĐ" %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtTongTien" runat="server" Text='<%# Eval("TongTien") %>' CssClass="txt-edit"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <%-- Cột Chức Năng (Sửa / Xóa) nằm bên phải --%>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" 
                HeaderText="Chức Năng" 
                EditText="Sửa" DeleteText="Xóa" 
                UpdateText="Cập nhật" CancelText="Hủy" 
                ControlStyle-CssClass="btn-action" />
        </Columns>
    </asp:GridView>
</asp:Content>
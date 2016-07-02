<%@ Page Title="" Language="C#" MasterPageFile="~/VPDKDD.Master" AutoEventWireup="true" CodeBehind="F300_TraCuuHoSo.aspx.cs" Inherits="BK_VPDKDatDai.F300_TraCuuHoSo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel='stylesheet' href='http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' />
    <script src='http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js'></script>
    <script src="virtual_keyboard/jquery.virtual_keyboard.js"></script>
    <link href="virtual_keyboard/jquery.virtual_keyboard.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center; width:36%; float:left;">
        <h3>XIN MỜI NHẬP MÃ SỐ CẦN TRA CỨU</h3>
        <p>(nhập Mã số hồ sơ, CMND, nhấn nút TÌM KIẾM sẽ có kết quả bên phải)</p>
        <div>
            <table style="width:90%; margin:0px auto;">
                <tr>
                    <td style="text-align:left"><span style="font-weight:bold;">Mã số hồ sơ <span style="color:red;">(*)</span></span></td>
                    <td>
                        <asp:TextBox runat="server" ID="m_txt_ma_ho_so"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left"><span style="font-weight:bold;">Chứng minh nhân dân <span style="color:red;">(*)</span></span></td>
                    <td>
                        <asp:TextBox runat="server" ID="m_txt_cmnd"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button runat="server" ID="m_cmd_tim_kiem" ClientIDMode="Static" Text="TÌM KIẾM" OnClick="m_cmd_tim_kiem_Click"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><p style="font-style:italic; color:#d40000; margin-top:10px;">Lưu ý: Dấu * là trường bắt buộc nhập</p></td>
                </tr>
            </table>
	    </div>
    </div>

    <div style="width:55%; height:600px; float:right; border:1px solid #ccc;text-align: justify; padding:0px 40px; max-height:600px; overflow-y:scroll">
        <h3 style="text-align:center">KẾT QUẢ TRA CỨU THÔNG TIN HỒ SƠ</h3>
        <div>
            <span style="font-weight:bold">I. Thông tin hồ sơ</span><br />
            <span>Bộ phận tiếp nhận và trả kết quả Văn phòng Đăng ký đất đai Hà Nội</span><br />
            <span>Tiếp nhận hồ sơ của:</span><asp:Label runat="server" id="hosohoten"></asp:Label><br />
            <span>Địa chỉ đất, nhà:</span><asp:Label runat="server" id="hosodiachi"></asp:Label><br />
            <span>Số điện thoại của khách hàng:</span><asp:Label runat="server" id="hososdt"></asp:Label><span> Email</span><asp:Label runat="server" id="hosoemail"></asp:Label><br />
            <span>Số chứng minh thư nhân dân/hộ chiếu:</span><asp:Label runat="server" id="hosocmnd"></asp:Label><span> do </span><asp:Label runat="server" id="hosodonvicap"></asp:Label><span> Cấp ngày: </span><asp:Label runat="server" id="hosocapngay"></asp:Label><br />
            <span>Nội dung yêu cầu giải quyết: </span><asp:Label runat="server" id="hosonoidung"></asp:Label><br />
            <span>1. Số lượng hồ sơ nhận:</span><asp:Label runat="server" id="hososoluong"></asp:Label><br />
            <span>2. Thời hạn giải quyết hồ sơ theo quy định là: </span><asp:Label runat="server" id="hosothoihangiaiquyet"></asp:Label><span> ngày làm việc.</span><br />
            <span>3. Thời gian nhận hồ sơ: </span><asp:Label runat="server" id="hosothoigiannhanhoso"></asp:Label><br />
            <span>Cán bộ xử lý: </span><asp:Label runat="server" id="hosocbxl"></asp:Label><br />
            <span style="font-weight:bold">II. Trạng thái hồ sơ</span><br />
            <table border="1" style="width:80%; margin:0px auto;">
                <tr>
                    <th style="text-align:center">Nội dung</th>
                    <th style="text-align:center">Ngày</th>
                    <th style="text-align:center">Có - Chưa có</th>
                </tr>
                <tr>
                    <td style="text-align:left;">Chuyển thông tin địa chính sang cơ quan thuế</td>
                    <td style="text-align:center">
                        <asp:Label runat="server" ID="m_lbl_ngay_chuyen_thong_tin_dia_chinh"></asp:Label>
                    </td>
                    <td style="text-align:center">
                        <asp:CheckBox runat="server" ID="m_chkb_ngay_chuyen_thong_tin_dia_chinh"/>
                    </td>
                </tr>
                <tr>
                    <td>Có thông báo thuế</td>
                    <td style="text-align:center"></td>
                    <td style="text-align:center">
                        <asp:CheckBox runat="server" ID="m_chkb_co_thong_bao_thue"/>
                    </td>
                </tr>
                <tr>
                    <td>Trình cấp giấy chứng nhận</td>
                    <td style="text-align:center">
                        <asp:Label runat="server" ID="m_lbl_ngay_trinh_cap_giay_chung_nhan"></asp:Label>
                    </td>
                    <td style="text-align:center">
                        <asp:CheckBox runat="server" ID="m_chkb_trinh_cap_giay_chung_nhan"/>
                    </td>
                </tr>
                <tr>
                    <td>Có giấy chứng nhận</td>
                    <td style="text-align:center"></td>
                    <td style="text-align:center">
                        <asp:CheckBox runat="server" ID="m_chkb_co_giay_chung_nhan"/>
                    </td>
                </tr>
            </table>
            <span style="font-weight:bold">Ghi chú</span><br />
            <span style="font-weight:bold">Khi nhận kết quả cần có:</span><br />
            <span style="font-style:italic">- Tổ chức: Giấy giới thiệu, Phiếu nhận hồ sơ, CMT Nhân dân; Cá nhân: Phiếu nhận hồ sơ, CMT nhân dân và đúng chính chủ; - Đối với trường hợp được ủy quyền, mang theo văn bản ủy quyền.</span><br />
            <span style="font-weight:bold">Thời gian giải quyết không bao gồm:</span><br />
            <span style="font-style:italic">- Thời gian thẩm định lấy ý kiến của các cơ quan hữu quan; Thời gian bổ sung hồ sơ cần phải làm rõ một số nội dung; Thứ 7, chủ nhật và các ngày nghỉ lễ.</span><br />
        </div>
    </div>

    <%--<script>
        $('input[type="text"]').keyboard();
    </script>--%>
</asp:Content>

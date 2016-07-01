<%@ Page Title="" Language="C#" MasterPageFile="~/VPDKDD.Master" AutoEventWireup="true" CodeBehind="F300_TraCuuHoSo.aspx.cs" Inherits="BK_VPDKDatDai.F300_TraCuuHoSo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="virtual_keyboard/jquery.virtual_keyboard.js"></script>
    <link href="virtual_keyboard/jquery.virtual_keyboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center; width:36%; float:left;">
        <h3>XIN MỜI NHẬP MÃ SỐ CẦN TRA CỨU</h3>
        <p>(nhập Mã số hồ sơ, CMND, nhấn nút TÌM KIẾM sẽ có kết quả bên phải)</p>
        <div>
            <table style="width:90%; margin:0px auto;">
                <tr>
                    <td style="text-align:left"><span style="font-weight:bold;">Mã số hồ sơ <span style="color:red;">(*)</span></span></td>
                    <td><input type="text" value="" placeholder="Nhập mã hồ sơ" style="width: 200px;height: 29px;margin: 0px;margin-right: 8px;" /></td>
                </tr>
                <tr>
                    <td style="text-align:left"><span style="font-weight:bold;">Chứng minh nhân dân <span style="color:red;">(*)</span></span></td>
                    <td><input type="text" value="" placeholder="Nhập số CMND" style="width: 200px;height: 29px;margin: 0px;margin-right: 8px;" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="submit" id="submit" value="TÌM KIẾM" style="background: #eee none repeat scroll 0 0;border: 1px solid #ccc;border-radius: 3px;cursor: pointer;font-size: 1em;font-weight: bold;height: 38px;margin: 0;padding: 0 15px; margin-top:10px;" /></td>
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
            <span>Tiếp nhận hồ sơ của:</span><span id="hoso-hoten"></span><br />
            <span>Địa chỉ đất, nhà:</span><span id="hoso-diachi"></span><br />
            <span>Số điện thoại của khách hàng:</span><span id="hoso-sdt"></span><span>Email</span><span id="hoso-email"></span><br />
            <span>Số chứng minh thư nhân dân/hộ chiếu:</span><span id="hoso-cmnd"></span><span> do </span><span id="hoso-donvicap"></span><span> Cấp ngày: </span><span id="hoso-capngay"></span><br />
            <span>Nội dung yêu cầu giải quyết: </span><span id="hoso-noidung"></span><br />
            <span>1. Số lượng hồ sơ nhận:</span><span id="hoso-soluong"></span><br />
            <span>2. Thời hạn giải quyết hồ sơ theo quy định là: </span><span id="hoso-thoihangiaiquyet"></span><span> ngày làm việc.</span><br />
            <span>3. Thời gian nhận hồ sơ: </span><span id="hoso-thoigiannhanhoso"></span><br />
            <span>Cán bộ xử lý: </span><span id="hoso-cbxl"></span><br />
            <span style="font-weight:bold">II. Trạng thái hồ sơ</span><br />
            <table border="1" style="width:80%; margin:0px auto;">
                <tr>
                    <th style="text-align:center">Nội dung</th>
                    <th style="text-align:center">Ngày</th>
                    <th style="text-align:center">Có - Chưa có</th>
                </tr>
                <tr>
                    <td style="text-align:left;">Chuyển thông tin địa chính sang cơ quan thuế</td>
                    <td style="text-align:center">22/06/2015</td>
                    <td style="text-align:center"><input type="checkbox" checked="checked"/></td>
                </tr>
                <tr>
                    <td>Có thông báo thuế</td>
                    <td style="text-align:center"></td>
                    <td style="text-align:center"><input type="checkbox" checked="checked"/></td>
                </tr>
                <tr>
                    <td>Trình cấp giấy chứng nhận</td>
                    <td style="text-align:center">22/06/2015</td>
                    <td style="text-align:center"><input type="checkbox" checked="checked"/></td>
                </tr>
                <tr>
                    <td>Có giấy chứng nhận</td>
                    <td style="text-align:center"></td>
                    <td style="text-align:center"><input type="checkbox" checked="checked"/></td>
                </tr>
            </table>
            <span style="font-weight:bold">Ghi chú</span><br />
            <span style="font-weight:bold">Khi nhận kết quả cần có:</span><br />
            <span style="font-style:italic">- Tổ chức: Giấy giới thiệu, Phiếu nhận hồ sơ, CMT Nhân dân; Cá nhân: Phiếu nhận hồ sơ, CMT nhân dân và đúng chính chủ; - Đối với trường hợp được ủy quyền, mang theo văn bản ủy quyền.</span><br />
            <span style="font-weight:bold">Thời gian giải quyết không bao gồm:</span><br />
            <span style="font-style:italic">- Thời gian thẩm định lấy ý kiến của các cơ quan hữu quan; Thời gian bổ sung hồ sơ cần phải làm rõ một số nội dung; Thứ 7, chủ nhật và các ngày nghỉ lễ.</span><br />
        </div>
    </div>

    <script>
        $('textarea,input').keyboard({
            type: 'gatekeeper',
            theme: 'default',
            hide_on_focus_out: false
        });
    </script>
</asp:Content>

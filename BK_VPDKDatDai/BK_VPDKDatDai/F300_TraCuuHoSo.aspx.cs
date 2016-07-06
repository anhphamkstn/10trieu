using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BK_VPDKDatDai
{
    public partial class F300_TraCuuHoSo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void m_cmd_tim_kiem_Click(object sender, EventArgs e)
        {
            try
            {
                var v_ett = new BK_HSVPDKDDEntities();
                var v_dr = v_ett.V_HO_SO.Where(
                        x => x.SoBienNhan.Trim() == m_txt_ma_ho_so.Text.Trim() &&
                            (
                                x.CMTChuSoHuu.Trim() == m_txt_cmnd.Text.Trim() ||
                                x.SoDKKDChuDauTu.Trim() == m_txt_cmnd.Text.Trim()
                            )
                    ).FirstOrDefault();
                #region data2form
                if (v_dr != null)
                {
                    if (v_dr.CoPhaiNopThue.HasValue)
                    {
                        if (v_dr.CoPhaiNopThue.Value)
                        {
                            m_hdf_thue_yn.Value = "T";
                        }
                        else
                        {
                            m_hdf_thue_yn.Value = "F";
                        }
                    }
                    else
                    {
                        m_hdf_thue_yn.Value = "F";
                    }
                    //hosocapngay.Text = "--Ngày cấp CMND--";
                    //hosodonvicap.Text = "--Đơn vị cấp CMND--";
                    hosocbxl.Text = v_dr.UserNameThuLy;
                    if (v_dr.HoSoChuDauTuNop.HasValue)
                    {
                        if (v_dr.HoSoChuDauTuNop.Value)
                        {
                            hosocmnd.Text = "";
                            hosodkkd.Text = v_dr.SoDKKDChuDauTu;
                            hosohoten.Text = v_dr.TenChuDauTu;
                            hososdt.Text = v_dr.DienThoaiChuDauTu;
                        }
                        else
                        {
                            hosodkkd.Text = "";
                            hosocmnd.Text = v_dr.CMTChuSoHuu;
                            hosohoten.Text = v_dr.TenChuSoHuu;
                            hososdt.Text = v_dr.DienThoaiNguoiNop;
                        }
                    }
                    else
                    {
                        hosodkkd.Text = "";
                        hosocmnd.Text = v_dr.CMTChuSoHuu;
                        hosohoten.Text = v_dr.TenChuSoHuu;
                        hososdt.Text = v_dr.DienThoaiNguoiNop;
                    }
                    hosodiachi.Text = getDiaChi(v_dr);
                    hosoemail.Text = v_dr.MailChuSoHuu;
                    hosonoidung.Text = v_dr.VeViec;
                    hososoluong.Text = v_dr.SoLuongHoSoNop.HasValue ? v_dr.SoLuongHoSoNop.ToString() : "";
                    hosothoigiannhanhoso.Text = v_dr.NgayNhan.HasValue ? v_dr.NgayNhan.Value.Hour.ToString() + " giờ " + v_dr.NgayNhan.Value.Minute.ToString() + " phút, ngày " + v_dr.NgayNhan.Value.Day.ToString() + " tháng " + v_dr.NgayNhan.Value.Month.ToString() + " năm " + v_dr.NgayNhan.Value.Year.ToString() : "";
                    hosothoigiantraketqua.Text =
                        v_dr.NgayHenTraCongVan.HasValue ?
                        " ngày " + v_dr.NgayHenTraCongVan.Value.Day.ToString() + " tháng " + v_dr.NgayHenTraCongVan.Value.Month.ToString() + " năm " + v_dr.NgayHenTraCongVan.Value.Year.ToString() :
                        " ngày " + v_dr.NgayHenTra.Value.Day.ToString() + " tháng " + v_dr.NgayHenTra.Value.Month.ToString() + " năm " + v_dr.NgayHenTra.Value.Year.ToString();
                    hosothoihangiaiquyet.Text = v_dr.SoNgayGiaiQuyet.HasValue ? v_dr.SoNgayGiaiQuyet.ToString() : "";

                    m_lbl_ngay_chuyen_thong_tin_dia_chinh.Text = v_dr.NgayChuyenThue.HasValue ? v_dr.NgayChuyenThue.Value.ToString("dd/MM/yyyy") : "";
                    m_lbl_ngay_trinh_cap_giay_chung_nhan.Text = v_dr.NgayTrinhSo.HasValue ? v_dr.NgayTrinhSo.Value.ToString("dd/MM/yyyy") : "";
                    if (v_dr.DangChuyenThue.HasValue)
                    {
                        if (v_dr.DangChuyenThue.Value)//------v_dr.da_chuyen_thong_tin_dia_chinh
                        {
                            m_chkb_ngay_chuyen_thong_tin_dia_chinh.Checked = true;
                        }
                        else
                        {
                            m_chkb_ngay_chuyen_thong_tin_dia_chinh.Checked = false;
                        }
                    }
                    else
                    {
                        m_chkb_ngay_chuyen_thong_tin_dia_chinh.Checked = false;
                    }

                    if (v_dr.DaCoTBT.HasValue)
                    {
                        if (v_dr.DaCoTBT.Value)
                        {
                            m_chkb_co_thong_bao_thue.Checked = true;
                        }
                        else
                        {
                            m_chkb_co_thong_bao_thue.Checked = false;
                        }
                    }
                    else
                    {
                        m_chkb_co_thong_bao_thue.Checked = false;
                    }

                    if (v_dr.DangTrinhSo.HasValue)
                    {
                        if (v_dr.DangTrinhSo.Value)//------v_dr.da_trinh_cap_giay_chung_nhan
                        {
                            m_chkb_trinh_cap_giay_chung_nhan.Checked = true;
                        }
                        else
                        {
                            m_chkb_trinh_cap_giay_chung_nhan.Checked = false;
                        }
                    }
                    else
                    {
                        m_chkb_trinh_cap_giay_chung_nhan.Checked = false;
                    }

                    if (v_dr.DaCoGCN.HasValue)
                    {
                        if (v_dr.DaCoGCN.Value)
                        {
                            m_chkb_co_giay_chung_nhan.Checked = true;
                        }
                        else
                        {
                            m_chkb_co_giay_chung_nhan.Checked = false;
                        }
                    }
                    else
                    {
                        m_chkb_co_giay_chung_nhan.Checked = false;
                    }
                    m_lbl_ket_qua.Text = "";
                    m_lbl_yeu_cau.Text = "";
                }
                else
                {
                    m_lbl_ket_qua.Text = "Mã số hồ sơ hoặc chứng minh thư không hợp lệ !!!";
                    m_lbl_yeu_cau.Text = "Vui lòng nhập lại Mã số hồ sơ và Chứng minh thư chính xác";
                    clearData();
                }
                #endregion
            }
            catch (Exception)
            {
                m_lbl_ket_qua.Text = "Mã số hồ sơ hoặc chứng minh thư không hợp lệ !!!";
                m_lbl_yeu_cau.Text = "Vui lòng nhập lại Mã số hồ sơ và Chứng minh thư chính xác";
                clearData();
            }
        }

        private string getDiaChi(V_HO_SO v_dr)
        {
            string v_str = "";
            v_str = getString(v_dr.CanHoSo) + getString(v_dr.TangSo) + getString(v_dr.TenChungCu) + getString(v_dr.TenDuAn) + getString(v_dr.DM_Guild) + getString(v_dr.DM_District);
            return v_str;
        }

        private string getString(string p)
        {
            if (p != "")
            {
                return p + " ";
            }
            else
            {
                return "";
            }
        }

        private void clearData()
        {
            //hosocapngay.Text = "--Ngày cấp CMND--";
            hosodkkd.Text = "";
            hosocbxl.Text = "";
            hosocmnd.Text = "";
            hosodiachi.Text = "";
            //hosodonvicap.Text = "--Đơn vị cấp CMND--";
            hosoemail.Text = "";
            hosohoten.Text = "";
            hosonoidung.Text = "";
            hososdt.Text = "";
            hososoluong.Text = "";
            hosothoigiannhanhoso.Text = "";
            hosothoihangiaiquyet.Text = "";
            m_lbl_ngay_chuyen_thong_tin_dia_chinh.Text = "";
            m_lbl_ngay_trinh_cap_giay_chung_nhan.Text = "";
            m_chkb_ngay_chuyen_thong_tin_dia_chinh.Checked = false;
            m_chkb_co_thong_bao_thue.Checked = false;
            m_chkb_trinh_cap_giay_chung_nhan.Checked = false;
            m_chkb_co_giay_chung_nhan.Checked = false;
            hosothoigiantraketqua.Text = "";
        }

        protected void m_cmd_xoa_trang_Click(object sender, EventArgs e)
        {
            try
            {
                clearData();
                m_txt_cmnd.Text = "";
                m_txt_ma_ho_so.Text = "";
                m_lbl_ket_qua.Text = "";
                m_lbl_yeu_cau.Text = "";
            }
            catch (Exception)
            {
                
            }
        }
    }
}
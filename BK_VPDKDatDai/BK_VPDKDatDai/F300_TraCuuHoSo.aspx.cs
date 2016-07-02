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
                var v_dr = traCuuHoSo(m_txt_ma_ho_so.Text.Trim(), m_txt_cmnd.Text.Trim());
                if (v_dr != null)
                {
                    hosocapngay.Text = v_dr["NGAY_CAP_CMND"].ToString();
                    hosocbxl.Text = v_dr["CANBOXULY"].ToString();
                    hosocmnd.Text = v_dr["CMND"].ToString();
                    hosodiachi.Text = v_dr["DIACHI"].ToString();
                    hosodonvicap.Text = v_dr["DONVICAP"].ToString();
                    hosoemail.Text = v_dr["EMAIL"].ToString();
                    hosohoten.Text = v_dr["HOTEN"].ToString();
                    hosonoidung.Text = v_dr["NOIDUNG"].ToString();
                    hososdt.Text = v_dr["SDT"].ToString();
                    hososoluong.Text = v_dr["SOLUONGHOSO"].ToString();
                    hosothoigiannhanhoso.Text = v_dr["THOIGIANNHANHOSO"].ToString();
                    hosothoihangiaiquyet.Text = v_dr["THOIGIANGIAIQUYET"].ToString();

                    m_lbl_ngay_chuyen_thong_tin_dia_chinh.Text = v_dr["NGAY_CHUYEN_THONG_TIN_DIA_CHINH"].ToString();
                    m_lbl_ngay_trinh_cap_giay_chung_nhan.Text = v_dr["NGAY_TRINH_CAP_GIAY_CHUNG_NHAN"].ToString();
                    if ((bool)v_dr["CHUYEN_THONG_TIN_DIA_CHINH"])
                    {
                        m_chkb_ngay_chuyen_thong_tin_dia_chinh.Checked = true;
                    }
                    else
                    {
                        m_chkb_ngay_chuyen_thong_tin_dia_chinh.Checked = false;
                    }
                    if ((bool)v_dr["CO_THONG_BAO_THUE"])
                    {
                        m_chkb_co_thong_bao_thue.Checked = true;
                    }
                    else
                    {
                        m_chkb_co_thong_bao_thue.Checked = false;
                    }
                    if ((bool)v_dr["TRINH_CAP_GIAY_CHUNG_NHAN"])
                    {
                        m_chkb_trinh_cap_giay_chung_nhan.Checked = true;
                    }
                    else
                    {
                        m_chkb_trinh_cap_giay_chung_nhan.Checked = false;
                    }
                    if ((bool)v_dr["CO_GIAY_CHUNG_NHAN"])
                    {
                        m_chkb_co_giay_chung_nhan.Checked = true;
                    }
                    else
                    {
                        m_chkb_co_giay_chung_nhan.Checked = false;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private DataRow traCuuHoSo(string ip_str_ma_ho_so, string ip_str_cmnd)
        {
            DataSet v_ds = getTrangThaiHoSo(ip_str_ma_ho_so, ip_str_cmnd);
            if (v_ds.Tables[0].Rows.Count != 0)
            {
                return v_ds.Tables[0].Rows[0];
            }
            return null;
        }

        private DataSet getTrangThaiHoSo(string ip_str_ma_ho_so, string ip_str_cmnd)
        {
            //connect db query storeprocedure
            return null;
        }
    }
}
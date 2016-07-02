using DevExpress.Web.ASPxTreeView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BK_VPDKDatDai
{
    public partial class F200_TraCuuThuTuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ASPxTreeView1.SelectedNode != null)
                {
                    ASPxTreeView1.ExpandToNode(ASPxTreeView1.SelectedNode);
                    ASPxTreeView1.SelectedNode.Expanded = true;
                }
            }
        }

        protected void ASPxTreeView1_Load(object sender, EventArgs e)
        {
            QUAN_LY_DAT_DAIEntities v_ett = new QUAN_LY_DAT_DAIEntities();
            var v_lst_root = v_ett.DM_TIEU_DE.Where(x=>x.ID_CHA == null).OrderBy(x => x.THU_TU_HIEN_THI).ToList();
            foreach (var item in v_lst_root)
            {
                TreeViewNode v_node = new TreeViewNode(item.TIEU_DE, item.ID.ToString(), "", "#" + item.ID);
                createTree(v_node, item);
                ASPxTreeView1.Nodes.Add(v_node);
            }

            
            ASPxTreeView1.ShowTreeLines = false;
        }

        private void createTree(TreeViewNode v_node, DM_TIEU_DE item)
        {
            while (getCountNodeChild(item) > 0 && v_node.Nodes.Count != getCountNodeChild(item))
            {
                QUAN_LY_DAT_DAIEntities v_ett = new QUAN_LY_DAT_DAIEntities();
                var v_lst_child = v_ett.DM_TIEU_DE.Where(x => x.ID_CHA == item.ID).ToList();
                foreach (var itemChild in v_lst_child)
                {
                    TreeViewNode v_node_child = new TreeViewNode(itemChild.TIEU_DE, itemChild.ID.ToString(), "", "#" + itemChild.ID);
                    v_node.Nodes.Add(v_node_child);
                    createTree(v_node_child, itemChild);
                }
            }
        }

        private int getCountNodeChild(DM_TIEU_DE item)
        {
            QUAN_LY_DAT_DAIEntities v_ett = new QUAN_LY_DAT_DAIEntities();
            return v_ett.DM_TIEU_DE.Where(x => x.ID_CHA == item.ID).ToList().Count;
        }
    }
}
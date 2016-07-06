using DevExpress.Web.ASPxTreeView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BK_VPDKDatDai
{
    public partial class F400_TraCuuLuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ASPxTreeView1.SelectedNode != null)
                {
                    ASPxTreeView1.ExpandToNode(ASPxTreeView1.SelectedNode);
                    ASPxTreeView1.SelectedNode.Expanded = true;
                    ASPxTreeView1.ShowExpandButtons = false;
                }
            }
        }

        protected void ASPxTreeView1_Load(object sender, EventArgs e)
        {
            QUAN_LY_DAT_DAIEntities v_ett = new QUAN_LY_DAT_DAIEntities();
            var v_lst_root = v_ett.DM_LUAT.Where(x=>x.ID_CHA == null).OrderBy(x => x.THU_TU_HIEN_THI).ToList();
            var v_lst = v_ett.DM_LUAT.ToList();
            foreach (var item in v_lst_root)
            {
                TreeViewNode v_node = new TreeViewNode(item.TIEU_DE, item.ID.ToString(), "", "#" + item.ID);
                createTree(v_node, item, v_lst);
                ASPxTreeView1.Nodes.Add(v_node);
            }

            
            ASPxTreeView1.ShowTreeLines = false;
        }

        private void createTree(TreeViewNode v_node, DM_LUAT item, List<DM_LUAT> ip_lst_node)
        {
            while (getCountNodeChild(item) > 0 && v_node.Nodes.Count != getCountNodeChild(item))
            {
                QUAN_LY_DAT_DAIEntities v_ett = new QUAN_LY_DAT_DAIEntities();
                var v_lst_child = ip_lst_node.Where(x => x.ID_CHA == item.ID).ToList();
                foreach (var itemChild in v_lst_child)
                {
                    TreeViewNode v_node_child = new TreeViewNode(itemChild.TIEU_DE, itemChild.ID.ToString(), "", "#" + itemChild.ID);
                    v_node.Nodes.Add(v_node_child);
                    createTree(v_node_child, itemChild, ip_lst_node);
                }
            }
        }

        private int getCountNodeChild(DM_LUAT item)
        {
            QUAN_LY_DAT_DAIEntities v_ett = new QUAN_LY_DAT_DAIEntities();
            return v_ett.DM_LUAT.Where(x => x.ID_CHA == item.ID).ToList().Count;
        }
    }
}
<%@ Page Title="" Language="C#" MasterPageFile="~/VPDKDD.Master" AutoEventWireup="true" CodeBehind="F200_TraCuuThuTuc.aspx.cs" Inherits="BK_VPDKDatDai.F200_TraCuuThuTuc" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSiteMapControl" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <script src="Scripts/tree_view/bootstrap-treeview.js"></script>
    <link href="Content/f200.css" rel="stylesheet" />
    <link href="Content/bootstrap-treeview.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="maincontent">
                <div class="left">
                    <div class="ldan" id="ldan">
                        <h2>Tra cứu thủ tục</h2>
                        <div id="treeview1" class="treeview">
                            <dx:ASPxTreeView ID="ASPxTreeView1" runat="server" OnLoad="ASPxTreeView1_Load" AllowSelectNode="true" Width="300px">
                                <ClientSideEvents NodeClick="function(s, e) {
                                        e.node.SetExpanded(!e.node.GetExpanded());
                                    }"></ClientSideEvents>
                            </dx:ASPxTreeView>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div id="ccenter">
                    <div class="center">
                        <h1 class="h1ff">TRANG THÔNG TIN - TRA CỨU</h1>
                        <div class="info">
                            <p>Trang thông tin - tra cứu: thủ tục hành chính nhà đất</p>
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>

            <script>
                function getProducts(v_id) {
                    $.getJSON("api/tracuu?id="+v_id,
                        function (data) {
                            $(".info").empty().append(data.NOI_DUNG);
                            $(".h1ff").empty().append(data.TIEU_DE);
                        });
                }

                $(window).bind('hashchange', function () {
                    getProducts(window.location.hash.substr(1));
                });

                $(document).ready(function () {
                    getProducts(window.location.hash.substr(1));
                });

            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

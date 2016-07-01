<%@ Page Title="" Language="C#" MasterPageFile="~/VPDKDD.Master" AutoEventWireup="true" CodeBehind="F200_TraCuuThuTuc.aspx.cs" Inherits="BK_VPDKDatDai.F200_TraCuuThuTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <script src="Scripts/tree_view/bootstrap-treeview.js"></script>
    <link href="Content/f200.css" rel="stylesheet" />
    <link href="Content/bootstrap-treeview.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="maincontent">
        <div class="left">
            <div class="ldan" id="ldan">
                <h2>Tra cứu thủ tục</h2>
                    <div id="treeview1" class="treeview"></div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
        <div id="ccenter">
            <div class="center">
                <h1 class="h1ff">Title</h1>
                <div class="info">
                       <p>Hello would!</p>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <script>
       
        $(function() {

            var defaultData = [
              {
                  text: 'Parent 1',
                  href: '#parent1',
                  tags: ['4'],
                  nodes: [
                    {
                        text: 'Child 1',
                        href: '#child1',
                        tags: ['2'],
                        nodes: [
                          {
                              text: 'Grandchild 1',
                              href: '#grandchild1',
                              tags: ['0']
                          },
                          {
                              text: 'Grandchild 2',
                              href: '#grandchild2',
                              tags: ['0']
                          }
                        ]
                    },
                    {
                        text: 'Child 2',
                        href: '#child2',
                        tags: ['0']
                    }
                  ]
              },
              {
                  text: 'Parent 2',
                  href: '#parent2',
                  tags: ['0']
              },
              {
                  text: 'Parent 3',
                  href: '#parent3',
                  tags: ['0']
              },
              {
                  text: 'Parent 4',
                  href: '#parent4',
                  tags: ['0']
              },
              {
                  text: 'Parent 5',
                  href: '#parent5'  ,
                  tags: ['0']
              }
            ];

            $('#treeview1').treeview({
                levels: 1,
                data: defaultData
            });
         
        })
     
    </script>

</asp:Content>

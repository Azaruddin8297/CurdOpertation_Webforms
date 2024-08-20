<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="CurdOperations.Employee.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Registration</title>
    <style type="text/css">
        .auto-style1 {
            width: 67%;
            height: 193px;
        }
        .auto-style2 {
            text-align: center;
            width: 504px;
        }
        .auto-style5 {
            width: 260px;
            text-align: center;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            text-align: left;
        }
        .auto-style8 {
            text-align: left;
            width: 504px;
        }
        .auto-style9 {
            margin-right: 564px;
        }
        #Id{

        }
    </style>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Include DataTables CSS and JS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1" align="center">
                <tr>
                    <td class="auto-style6" colspan="2">
                        <h3 class="auto-style7"><strong>Employee Registration</strong></h3>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        Id</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="Id" runat="server" disabled="disabled"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Name</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">City</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="City" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Country</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Country" runat="server"></asp:TextBox> <!-- Fixed ID -->
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Salary</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Salary" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Department</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Department" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="Save_Btn" runat="server" Height="35px" OnClick="Save_Btn_Click" Text="Submit" Width="113px" />
                        <asp:Button ID="Edit_btn" runat="server" Height="35px" Width="113px"  Text="Edit" OnClick="Edit_btn_Click" />
                        <asp:Button ID="Delete_btn" runat="server" Height="35px" Width="113px" Text="Delete" OnClick="Delete_btn_Click" />
                        <asp:Button ID="Clear_btn" runat="server" Height="35px" Width="113px" Text="Clear All" OnClick="Clear_btn_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

        <div class="auto-style6">
        </div>
        <div class="auto-style6">
&nbsp;
            <div class="auto-style6">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="auto-style9" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="1304px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connection %>" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
    </form>
       </body>
</html>

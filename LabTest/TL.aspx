<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TL.aspx.cs" Inherits="LabTest.TL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="ChkHeader" runat="server" AutoPostBack="true" Text ="Select All" onCheckedChanged="ChkHeader_CheckedChanged"/>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="ChkEmpty" runat="server" OnCheckedChanged="ChkEmpty_CheckedChanged" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                <asp:BoundField DataField="Sunday" HeaderText="Sunday" SortExpression="Sunday" />
                <asp:BoundField DataField="Monday" HeaderText="Monday" SortExpression="Monday" />
                <asp:BoundField DataField="Tuesday" HeaderText="Tuesday" SortExpression="Tuesday" />
                <asp:BoundField DataField="Wednesday" HeaderText="Wednesday" SortExpression="Wednesday" />
                <asp:BoundField DataField="Thursday" HeaderText="Thursday" SortExpression="Thursday" />
                <asp:BoundField DataField="Friday" HeaderText="Friday" SortExpression="Friday" />
                <asp:BoundField DataField="Saturday" HeaderText="Saturday" SortExpression="Saturday" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                <ControlStyle BorderColor="Red" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestLabConnectionString %>" ProviderName="<%$ ConnectionStrings:TestLabConnectionString.ProviderName %>" SelectCommand="Select Ct.CategoryName,Sub.EmployeeName,Ti.Sunday,Ti.Monday,Ti.Tuesday,Ti.Wednesday,Ti.Thursday,Ti.Friday,Ti.Saturday
From TimeSpent Ti
Join Category Ct
on Ti.CategoryId=Ct.CategoryId
inner join SubCategory Sub
on Ti.SubCategoryId=Sub.SubCategoryId;

"></asp:SqlDataSource>
    </form>
</body>
</html>

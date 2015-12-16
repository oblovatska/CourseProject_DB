<%@ Page Title="Формування звітів" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="CourseProject.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center><h2>Звіт про популярність послуг</h2><br />
       <br />
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Назва послуги" HeaderText="Назва послуги" 
                SortExpression="Назва послуги" />
            <asp:BoundField DataField="Кількість клієнтів" HeaderText="Кількість клієнтів" 
                ReadOnly="True" SortExpression="Кількість клієнтів" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
        
        
           
            SelectCommand="SELECT Service_.Name AS 'Назва послуги', COUNT(*) AS 'Кількість клієнтів' 
FROM SeasonTicket 
LEFT JOIN Service_ ON SeasonTicket.service_ID = Service_.Service_ID
GROUP BY Service_.Name 
ORDER BY 'Кількість клієнтів' DESC">
    </asp:SqlDataSource>
       <br />
    <asp:Button ID="SaveReport1" runat="server" onclick="SaveReport1_Click" 
        Text="Зберегти у Word" />
       <br />
       <br />
      <h2>Звіт із прибутків за послугами</h2> <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Назва послуги" HeaderText="Назва послуги" 
                SortExpression="Назва послуги" />
            <asp:BoundField DataField="Прибуток" HeaderText="Прибуток" ReadOnly="True" 
                SortExpression="Прибуток" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
        
        
           
            SelectCommand="SELECT Service_.Name AS 'Назва послуги', ROUND(SUM(SeasonTicket.Cost),2) AS Прибуток 
FROM SeasonTicket 
INNER JOIN Service_ ON SeasonTicket.service_ID = Service_.Service_ID 
GROUP BY Service_.Name 
ORDER BY Прибуток DESC">
    </asp:SqlDataSource>
       <br />
    <asp:Button ID="Report2" runat="server" onclick="Report2_Click" 
        Text="Зберегти у Word" />
    <br />
    </center>
</asp:Content>

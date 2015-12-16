<%@ Page Title="Видалення послуг" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="deleteServiceForm.aspx.cs" Inherits="CourseProject.deleteServiceForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center><p>
       <h2> Поточний список послуг</h2></p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Назва послуги" HeaderText="Назва послуги" 
                    SortExpression="Назва послуги" />
                <asp:BoundField DataField="Вартість одного заняття" 
                    HeaderText="Вартість одного заняття" 
                    SortExpression="Вартість одного заняття" />
                <asp:BoundField DataField="Вартість обмеженого абонемента на місяць" 
                    HeaderText="Вартість обмеженого абонемента на місяць" 
                    SortExpression="Вартість обмеженого абонемента на місяць" />
                <asp:BoundField DataField="Вартість необмеженого абонемента на місяць" 
                    HeaderText="Вартість необмеженого абонемента на місяць" 
                    SortExpression="Вартість необмеженого абонемента на місяць" />
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
            
            
            SelectCommand="SELECT Name AS 'Назва послуги', OneClassValue AS 'Вартість одного заняття', MonthlyClassesDeterminedValue AS 'Вартість обмеженого абонемента на місяць', MonthlyClassesNotDeterminedValue AS 'Вартість необмеженого абонемента на місяць' FROM Service_">
        </asp:SqlDataSource>
    </p>
    <p>
        Для видалення послуги оберіть її зі списку 
        нижче та натисніть кнопку </a>&quot;Видалити&quot;.</p>
    <p>
        <asp:DropDownList ID="chosenService" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            SelectCommand="SELECT [Name] FROM [Service_]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="deleteService" runat="server" onclick="deleteService_Click" 
            Text="Видалити" />
    </p></center>
    <p>
        <br />
        <asp:Button ID="Back" runat="server" onclick="Back_Click" Text="Назад" />
    </p>
</asp:Content>

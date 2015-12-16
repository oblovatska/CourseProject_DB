<%@ Page Title="Додавання послуг" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addServiceForm.aspx.cs" Inherits="CourseProject.addServiceForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>  <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Назва_послуги" HeaderText="Назва_послуги" 
                    SortExpression="Назва_послуги" />
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
            
            
            
            SelectCommand="SELECT Name AS 'Назва_послуги', OneClassValue AS 'Вартість одного заняття', MonthlyClassesDeterminedValue AS 'Вартість обмеженого абонемента на місяць', MonthlyClassesNotDeterminedValue AS 'Вартість необмеженого абонемента на місяць' FROM Service_">
        </asp:SqlDataSource>
    </p>
    <p>
        Для додавання нової послуги заповніть, будь ласка, поля нижче та натисніть 
        кнопку &quot;Додати&quot;:</p>
    <p>
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="price1" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="price2" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="price3" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="addService" runat="server" onclick="addService_Click" 
            Text="Додати" />
    </p></center>
    <p>
        <br />
        <asp:Button ID="Back" runat="server" onclick="Back_Click" Text="Назад" />
    </p>
</asp:Content>

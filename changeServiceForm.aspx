<%@ Page Title="Зміна даних про послуги" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="changeServiceForm.aspx.cs" Inherits="CourseProject.changeServiceForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center> <p>
       <h2> Поточний список послуг</h2></p>
    <p>
   
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Enabled="False" EnableTheming="True" 
            EnableViewState="False" HorizontalAlign="Center" CellPadding="4" 
            ForeColor="#333333" GridLines="None" UseAccessibleHeader="False">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <rowstyle Height="20px" Width="30" HorizontalAlign="Center" 
                VerticalAlign="Middle" BackColor="#EFF3FB" />
        <alternatingrowstyle  Height="20px" BackColor="White"/>
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
            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" 
                BackColor="#2461BF" />
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
        Для зміни даних про послугу оберіть її у списку нижче, введіть нові значення 
        полів та натисніть кнопку &quot;Змінити&quot;.</p>
    <p>
        <asp:DropDownList ID="chosenService" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name" 
            onselectedindexchanged="chosenService_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            SelectCommand="SELECT [Name] FROM [Service_]"></asp:SqlDataSource>
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
        <asp:Button ID="change" runat="server" onclick="change_Click" Text="Змінити" />
    </p></center>
    <p>
        <br />
        <asp:Button ID="Back" runat="server" onclick="Back_Click" Text="Назад" />
    </p>
</asp:Content>

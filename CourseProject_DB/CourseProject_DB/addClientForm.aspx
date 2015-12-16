<%@ Page Title="Додавання клієнта" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addClientForm.aspx.cs" Inherits="CourseProject.addClientForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center> <p>
        <h2>Поточний список клієнтів:</h2>
       <asp:GridView ID="GridView1" runat="server" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Номер клієнта" 
            DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
            GridLines="None" style="margin-right: 7px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Номер клієнта" HeaderText="Номер клієнта" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Номер клієнта" />
                <asp:BoundField DataField="Прізвище" HeaderText="Прізвище" 
                    SortExpression="Прізвище" />
                <asp:BoundField DataField="Імя" HeaderText="Імя" SortExpression="Імя" />
                <asp:BoundField DataField="По-батькові" HeaderText="По-батькові" 
                    SortExpression="По-батькові" />
                <asp:BoundField DataField="Номер телефону" HeaderText="Номер телефону" 
                    SortExpression="Номер телефону" />
                <asp:BoundField DataField="Номер клубної карти" 
                    HeaderText="Номер клубної карти" SortExpression="Номер клубної карти" />
                <asp:BoundField DataField="Номер довідки" HeaderText="Номер довідки" 
                    SortExpression="Номер довідки" />
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
            
           SelectCommand="SELECT Client_ID AS 'Номер клієнта',LastName AS Прізвище, Name AS Імя , SecondName AS 'По-батькові', PhoneNumber AS 'Номер телефону', ClubCard_ID AS 'Номер клубної карти', MedicalCertificate_ID AS  'Номер довідки' FROM Client" 
           onselecting="SqlDataSource1_Selecting">
        </asp:SqlDataSource>
       </p>
       <p>
        Для додавання нового клієнта у базу заповніть, будь ласка, наступні поля:</p>
    <p>
       <asp:TextBox ID="NewSurname" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="NewName" runat="server" ontextchanged="NewName_TextChanged"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="NewSecondName" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="NewPhoneNumber" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="AddNewClient" runat="server" Text="Додати" 
            onclick="AddNewClient_Click" />
    </p></center>
       <p>
           <asp:Button ID="Back" runat="server" onclick="Back_Click" Text="Назад" />
    </p>
    
</asp:Content>

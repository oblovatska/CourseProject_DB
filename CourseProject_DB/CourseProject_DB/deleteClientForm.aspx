<%@ Page Title="Видалення клієнтів" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="deleteClientForm.aspx.cs" Inherits="CourseProject.deleteClientForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <center><p>
        <h2>Поточний список клієнтів</h2>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
         DataKeyNames="Номер клієнта" DataSourceID="SqlDataSource1" 
            >
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
             
             SelectCommand="SELECT Client_ID AS 'Номер клієнта',LastName AS 'Прізвище', Name AS Імя , SecondName AS 'По-батькові', PhoneNumber AS 'Номер телефону', ClubCard_ID AS 'Номер клубної карти', MedicalCertificate_ID AS  'Номер довідки' FROM Client">
        </asp:SqlDataSource>
    </p>
   <p>
        Для видалення клієнта оберіть його у списку нижче та натисніть кнопку &quot;Видалити&quot;</p>
    <p>
        <asp:DropDownList ID="ChosenClient" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="new" DataValueField="new">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            SelectCommand="SELECT CAST(Client_ID AS VARCHAR(50)) + ' ' + LastName + ' ' + Name + ' ' + SecondName  AS new FROM Client ORDER BY new">
        </asp:SqlDataSource>
        <asp:Button ID="deleteClient" runat="server" onclick="deleteClient_Click" 
            Text="Видалити" />
    </p></center>
    <p>
        <asp:Button ID="Back" runat="server" onclick="Back_Click" style="height: 26px" 
            Text="Назад" />
     </p>
</asp:Content>

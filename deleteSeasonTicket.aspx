<%@ Page Title="Видалення абонементів" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="deleteSeasonTicket.aspx.cs" Inherits="CourseProject.deleteSeasonTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center><p>
       <h2>Поточний список абонементів</h2> </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Номер абонемента" DataSourceID="SqlDataSource1" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Прізвище клієнта" HeaderText="Прізвище клієнта" 
                    SortExpression="Прізвище клієнта" />
                <asp:BoundField DataField="Номер абонемента" HeaderText="Номер абонемента" 
                    SortExpression="Номер абонемента" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Назва послуги" HeaderText="Назва послуги" 
                    SortExpression="Назва послуги" />
                <asp:BoundField DataField="Тип відвідування" HeaderText="Тип відвідування" 
                    SortExpression="Тип відвідування" />
                <asp:BoundField DataField="Вартість абонемента" 
                    HeaderText="Вартість абонемента" ReadOnly="True" 
                    SortExpression="Вартість абонемента" />
                <asp:BoundField DataField="Початок дії" HeaderText="Початок дії" 
                    SortExpression="Початок дії" />
                <asp:BoundField DataField="Кінець дії" HeaderText="Кінець дії" 
                    SortExpression="Кінець дії" />
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
            
            
            
            SelectCommand="SELECT Client.LastName AS 'Прізвище клієнта', SeasonTicket.SeasonTicket_ID AS 'Номер абонемента', Service_.Name AS 'Назва послуги' , SeasonTicket.ClassesType AS 'Тип відвідування' , ROUND(SeasonTicket.Cost, 2) AS 'Вартість абонемента', SeasonTicket.StartOf AS 'Початок дії', SeasonTicket.EndOf AS 'Кінець дії' FROM Client, ClubCard, SeasonTicket, Service_ WHERE (Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND SeasonTicket.service_ID = Service_.Service_ID)  ORDER BY  Client.LastName">
        </asp:SqlDataSource>
    </p>
    <p>
        Для видалення абонемента оберіть його у списку нижче та натисніть кнопку 
        &quot;Видалити&quot;.</p>
    <p>
        <asp:DropDownList ID="chosenSeasonTicket" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="new" DataValueField="new">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            SelectCommand="SELECT CAST(SeasonTicket.SeasonTicket_ID AS VARCHAR(10)) + ' - ' + Client.LastName + ' - ' + Service_.Name AS new FROM Client,Service_,SeasonTicket,ClubCard WHERE Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND Service_.Service_ID = SeasonTicket.service_ID">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="deleteST" runat="server" onclick="deleteST_Click" 
            Text="Видалити" />
    </p></center>
    <p>
        <br />
        <asp:Button ID="Back" runat="server" onclick="Back_Click" Text="Назад" />
    </p>
</asp:Content>

<%@ Page Title="Видалення занять" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="deleteClassesForm.aspx.cs" Inherits="CourseProject.deleteClassesForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center> <p>
       <h2> Поточний розклад занять:</h2></p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Прізвище_клієнта" HeaderText="Прізвище_клієнта" 
                    SortExpression="Прізвище_клієнта" />
                <asp:BoundField DataField="Назва послуги" HeaderText="Назва послуги" 
                    SortExpression="Назва послуги" />
                <asp:BoundField DataField="День тижня" HeaderText="День тижня" 
                    SortExpression="День тижня" />
                <asp:BoundField DataField="Початок заняття" HeaderText="Початок заняття" 
                    SortExpression="Початок заняття" />
                <asp:BoundField DataField="Кінець заняття" HeaderText="Кінець заняття" 
                    SortExpression="Кінець заняття" />
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
            
            
            
            SelectCommand="SELECT DISTINCT Client.LastName AS 'Прізвище_клієнта', Service_.Name AS 'Назва послуги', Classes.DayOfTheWeek AS 'День тижня', Classes.StartTime AS 'Початок заняття', Classes.EndTime AS 'Кінець заняття' FROM Client, ClubCard, SeasonTicket, Service_, Classes WHERE (Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND SeasonTicket.SeasonTicket_ID = Classes.SeasonTicket_ID AND SeasonTicket.service_ID = Service_.Service_ID)">
        </asp:SqlDataSource>
    </p>
    <p>
        Для видалення заняття оберіть його у списку нижче та натисніть кнопку 
        &quot;Видалити&quot;.</p>
    <p>
        <asp:DropDownList ID="chosen" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="Column1" DataValueField="Column1">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            SelectCommand="SELECT CAST(Classes.Classes_ID AS VARCHAR(10)) + ' - ' + Client.LastName  + ' - ' + Classes.DayOfTheWeek + ' - ' +  Service_.Name FROM Client, ClubCard, SeasonTicket, Classes, Service_ WHERE Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND SeasonTicket.SeasonTicket_ID = Classes.SeasonTicket_ID AND SeasonTicket.service_ID = Service_.Service_ID">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="delete" runat="server" onclick="delete_Click" Text="Видалити" />
    </p></center>
    <p>
        <br />
        <asp:Button ID="Back" runat="server" onclick="Back_Click" Text="Назад" />
    </p>
</asp:Content>

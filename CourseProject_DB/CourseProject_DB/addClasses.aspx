<%@ Page Title="Додавання занять" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addClasses.aspx.cs" Inherits="CourseProject.addClasses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center><p>
      <h2>  Поточний розклад занять:</h2></p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Прізвище клієнта" HeaderText="Прізвище клієнта" 
                    SortExpression="Прізвище клієнта" />
                <asp:BoundField DataField="Назва_послуги" HeaderText="Назва_послуги" 
                    SortExpression="Назва_послуги" />
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
            
            
            
            SelectCommand="SELECT DISTINCT Client.LastName AS 'Прізвище клієнта', Service_.Name AS Назва_послуги, Classes.DayOfTheWeek AS 'День тижня', Classes.StartTime AS 'Початок заняття', Classes.EndTime AS 'Кінець заняття' FROM Client, ClubCard, SeasonTicket, Service_, Classes WHERE (Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND SeasonTicket.SeasonTicket_ID = Classes.SeasonTicket_ID AND SeasonTicket.service_ID = Service_.Service_ID)">
        </asp:SqlDataSource>
    </p>
    <p>
        Для додавання заняття оберіть абонемент зі списку нижче та введіть дані про нове 
        заняття:</p>
    <p>
        <asp:DropDownList ID="seasonTicket" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="new" DataValueField="new">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            SelectCommand="SELECT CAST(SeasonTicket.SeasonTicket_ID AS VARCHAR(10)) + ' - ' + Client.LastName + ' - ' + Service_.Name AS new FROM Client,Service_,SeasonTicket,ClubCard WHERE Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND Service_.Service_ID = SeasonTicket.service_ID AND SeasonTicket.ClassesType = 'Обмежений'">
        </asp:SqlDataSource>
    </p>
    <p>
        День:&nbsp;
        <asp:DropDownList ID="day" runat="server">
            <asp:ListItem>Понеділок</asp:ListItem>
            <asp:ListItem>Вівторок</asp:ListItem>
            <asp:ListItem>Середа</asp:ListItem>
            <asp:ListItem>Четвер</asp:ListItem>
            <asp:ListItem>П&#39;&#39;ятниця</asp:ListItem>
            <asp:ListItem>Субота</asp:ListItem>
        </asp:DropDownList>
&nbsp;Час початку:&nbsp;
        <asp:DropDownList ID="start" runat="server">
            <asp:ListItem Selected="True">10:00</asp:ListItem>
            <asp:ListItem>10:30</asp:ListItem>
            <asp:ListItem>11:00</asp:ListItem>
            <asp:ListItem>11:30</asp:ListItem>
            <asp:ListItem>12:00</asp:ListItem>
            <asp:ListItem>14:00</asp:ListItem>
            <asp:ListItem>14:30</asp:ListItem>
            <asp:ListItem>15:00</asp:ListItem>
            <asp:ListItem>15:30</asp:ListItem>
            <asp:ListItem>16:00</asp:ListItem>
            <asp:ListItem>16:30</asp:ListItem>
            <asp:ListItem>17:00</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Тривалість заняття - 1 година.</p>
    <p>
        <asp:Button ID="add" runat="server" onclick="add_Click" Text="Додати" />
    </p>
    </center>
    <p>
        <br />
        <asp:Button ID="Back" runat="server" onclick="Back_Click" Text="Назад" />
    </p>
</asp:Content>

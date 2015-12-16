<%@ Page Title="Додавання абонемента" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addSeasonTicketForm.aspx.cs" Inherits="CourseProject.addSeasonTicketForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center><p>
        <h2>Поточний список абонементів:</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="Номер абонемента" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Прізвище клієнта" HeaderText="Прізвище клієнта" 
                SortExpression="Прізвище клієнта" />
            <asp:BoundField DataField="Номер абонемента" HeaderText="Номер абонемента" 
                InsertVisible="False" ReadOnly="True" SortExpression="Номер абонемента" />
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
        <h2>Поточний розклад занять:</h2><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource4" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Прізвище клієнта" HeaderText="Прізвище клієнта" 
                        SortExpression="Прізвище клієнта" />
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
        <p>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
                
                
                SelectCommand="SELECT DISTINCT Client.LastName AS 'Прізвище клієнта', Service_.Name AS 'Назва послуги', Classes.DayOfTheWeek AS 'День тижня', Classes.StartTime AS 'Початок заняття', Classes.EndTime AS 'Кінець заняття' FROM Client, ClubCard, SeasonTicket, Service_, Classes WHERE (Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND SeasonTicket.SeasonTicket_ID = Classes.SeasonTicket_ID AND SeasonTicket.service_ID = Service_.Service_ID)">
            </asp:SqlDataSource>
        </p>
        <p>
        </p>
    <p>
        Для додавання нового абонемента оберіть, будь ласка, клієнта, послугу та вид 
        абонемента.</p>
    <p>
        <asp:DropDownList ID="client" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="new" DataValueField="new">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            SelectCommand="SELECT CAST(Client_ID AS VARCHAR(50)) + ' ' + LastName + ' ' + Name + ' ' + SecondName  AS new FROM Client ORDER BY new">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="service" runat="server" DataSourceID="SqlDataSource3" 
            DataTextField="Name" DataValueField="Name">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            SelectCommand="SELECT [Name] FROM [Service_]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="classesType" runat="server" AutoPostBack="True" 
            onselectedindexchanged="classesType_SelectedIndexChanged">
            <asp:ListItem Selected="True">Одиничний</asp:ListItem>
            <asp:ListItem>Обмежений</asp:ListItem>
            <asp:ListItem>Необмежений</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Початок дії абонемента:</p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Число:&nbsp;
        <asp:DropDownList ID="startDate" runat="server" AutoPostBack="True" 
            onselectedindexchanged="startDate_SelectedIndexChanged">
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>23</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>26</asp:ListItem>
            <asp:ListItem>27</asp:ListItem>
            <asp:ListItem>28</asp:ListItem>
            <asp:ListItem>29</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>31</asp:ListItem>
        </asp:DropDownList>
&nbsp; Місяць:&nbsp;&nbsp;
        <asp:DropDownList ID="startMonth" runat="server" AutoPostBack="True" 
            onselectedindexchanged="startMonth_SelectedIndexChanged">
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp; Рік:&nbsp;
        <asp:DropDownList ID="startYear" runat="server">
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        Кінець дії абонемента:</p>
    <p>
        Число:&nbsp;&nbsp;
        <asp:DropDownList ID="endDate" runat="server" AutoPostBack="True" 
            onselectedindexchanged="endDate_SelectedIndexChanged">
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>23</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>26</asp:ListItem>
            <asp:ListItem>27</asp:ListItem>
            <asp:ListItem>28</asp:ListItem>
            <asp:ListItem>29</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>31</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp; Місяць:&nbsp;
        <asp:DropDownList ID="endMonth" runat="server" AutoPostBack="True" 
            onselectedindexchanged="endMonth_SelectedIndexChanged">
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
        </asp:DropDownList>
&nbsp; Рік:&nbsp;
        <asp:DropDownList ID="endYear" runat="server">
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
&nbsp;Час проведення занять:</p>
    <p>
        <asp:DropDownList ID="day1" runat="server" Enabled="False">
            <asp:ListItem>Понеділок</asp:ListItem>
            <asp:ListItem>Вівторок</asp:ListItem>
            <asp:ListItem>Середа</asp:ListItem>
            <asp:ListItem>Четвер</asp:ListItem>
            <asp:ListItem>П&#39;&#39;ятниця</asp:ListItem>
            <asp:ListItem>Субота</asp:ListItem>
        </asp:DropDownList>
&nbsp; Початок заняття:&nbsp;
        <asp:DropDownList ID="start1" runat="server" Enabled="False">
            <asp:ListItem>10:00</asp:ListItem>
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
&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:DropDownList ID="day2" runat="server" Enabled="False">
            <asp:ListItem>Понеділок</asp:ListItem>
            <asp:ListItem>Вівторок</asp:ListItem>
            <asp:ListItem>Середа</asp:ListItem>
            <asp:ListItem>Четвер</asp:ListItem>
            <asp:ListItem>П&#39;&#39;ятниця</asp:ListItem>
            <asp:ListItem>Субота</asp:ListItem>
        </asp:DropDownList>
&nbsp; Початок заняття:&nbsp;
        <asp:DropDownList ID="start2" runat="server" Enabled="False">
            <asp:ListItem>10:00</asp:ListItem>
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
&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        Продовжуваність заняття складає 1 годину.</p>
    <p>
        <asp:Button ID="add" runat="server" onclick="add_Click" Text="Додати" />
    </p>
    </center>
    <p>
        <br />
        <asp:Button ID="Back" runat="server" onclick="Back_Click" Text="Назад" />
    </p>
</asp:Content>

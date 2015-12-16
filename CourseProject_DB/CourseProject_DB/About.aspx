<%@ Page Title="Перегляд даних" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="CourseProject.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <center><h2>
        КЛІЄНТИ</h2>
    <p>
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" DataKeyNames="Номер клієнта" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Номер клієнта" HeaderText="Номер клієнта" 
                    SortExpression="Номер клієнта" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Прізвище" HeaderText="Прізвище" 
                    SortExpression="Прізвище" />
                <asp:BoundField DataField="Імя" HeaderText="Імя" 
                    SortExpression="Імя" />
                <asp:BoundField DataField="По-батькові" HeaderText="По-батькові" 
                    SortExpression="По-батькові" />
                <asp:BoundField DataField="Номер телефону" 
                    HeaderText="Номер телефону" SortExpression="Номер телефону" />
                <asp:BoundField DataField="Номер клубної карти" HeaderText="Номер клубної карти" 
                    SortExpression="Номер клубної карти" />
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
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            SelectCommand="SELECT Client_ID AS 'Номер клієнта',LastName AS Прізвище, Name AS Імя , SecondName AS 'По-батькові', PhoneNumber AS 'Номер телефону', ClubCard_ID AS 'Номер клубної карти', MedicalCertificate_ID AS  'Номер довідки' FROM Client" 
            onselecting="SqlDataSource1_Selecting">
        </asp:SqlDataSource>
    </p>
    <h2>
        ПОСЛУГИ</h2>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" 
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            
            SelectCommand="SELECT Name AS 'Назва послуги', OneClassValue AS 'Вартість одного заняття', MonthlyClassesDeterminedValue AS 'Вартість обмеженого абонемента на місяць', MonthlyClassesNotDeterminedValue AS 'Вартість необмеженого абонемента на місяць' FROM Service_">
        </asp:SqlDataSource>
    </p>
    <h2>
        АБОНЕМЕНТИ</h2>
    <p>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Номер абонемента" DataSourceID="SqlDataSource3" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            
            
            SelectCommand="SELECT Client.LastName AS 'Прізвище клієнта', SeasonTicket.SeasonTicket_ID AS 'Номер абонемента', Service_.Name AS 'Назва послуги' , SeasonTicket.ClassesType AS 'Тип відвідування', ROUND(SeasonTicket.Cost, 2) AS 'Вартість абонемента', SeasonTicket.StartOf AS 'Початок дії', SeasonTicket.EndOf AS 'Кінець дії' FROM Client, ClubCard, SeasonTicket, Service_ WHERE (Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND SeasonTicket.service_ID = Service_.Service_ID)  ORDER BY  Client.LastName">
        </asp:SqlDataSource>
    </p>
    <h2>
        ЗАНЯТТЯ</h2>
    <p>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
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
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CourseProjectConnectionString %>" 
            
            
            
            SelectCommand="SELECT DISTINCT Client.LastName AS 'Прізвище клієнта', Service_.Name AS 'Назва послуги', Classes.DayOfTheWeek AS 'День тижня', Classes.StartTime AS 'Початок заняття', Classes.EndTime AS 'Кінець заняття' FROM Client, ClubCard, SeasonTicket, Service_, Classes WHERE (Client.Client_ID = ClubCard.Client_ID AND ClubCard.ClubCard_ID = SeasonTicket.ClubCard_ID AND SeasonTicket.SeasonTicket_ID = Classes.SeasonTicket_ID AND SeasonTicket.service_ID = Service_.Service_ID)">
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
        </center> 
</asp:Content>

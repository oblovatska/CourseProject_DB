<%@ Page Title="Робота з даними" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="CourseProject.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <center>
    <h2>КЛІЄНТИ</h2>
        <asp:Button ID="addNewClient" runat="server" onclick="addNewClient_Click" 
            Text="Додати нового клієнта" />
    <p>
        <asp:Button ID="ChangeClient" runat="server" onclick="Button1_Click" 
            Text="Змінити дані про клієнта" />
    </p>
    <p>
        <asp:Button ID="DeleteClient" runat="server" onclick="Delete_Click" 
            Text="Видалити клієнта" />
    </p>
    <h2>АБОНЕМЕНТИ</h2>
    <p>

        <asp:Button ID="addSeasonTicket" runat="server" Text="Додати новий абонемент" 
            onclick="addSeasonTicket_Click" />
    </p>
    <p>
        <asp:Button ID="changeSeasonTicket" runat="server" onclick="Button1_Click1" 
            Text="Змінити дані про абонемент" />
    </p>
    <p>
        <asp:Button ID="deleteSeasonTicket" runat="server" 
            onclick="deleteSeasonTicket_Click" Text="Видалити абонемент" 
            style="height: 26px" />
    </p>
        <h2>ПОСЛУГИ</h2>
    <p>
        <asp:Button ID="AddService" runat="server" onclick="AddService_Click" 
            Text="Додати послугу" />
    </p>
    <p>
        <asp:Button ID="changeService" runat="server" onclick="changeService_Click" 
            Text="Змінити дані про послугу" />
    </p>
    <p>
        <asp:Button ID="deleteService" runat="server" onclick="deleteService_Click" 
            Text="Видалити послугу" />
    </p>
            <p>
                <h2>ЗАНЯТТЯ</h2></p>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Додати заняття" 
                    onclick="Button1_Click2" />
    </p>
            <p>
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Змінити заняття" />
    </p>
            <p>
                <asp:Button ID="deleteClasses" runat="server" Text="Видалити заняття" 
                    onclick="deleteClasses_Click" />
    </p>
    </center>
    <p>
        &nbsp;</p>
</asp:Content>

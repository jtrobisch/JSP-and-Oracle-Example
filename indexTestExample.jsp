<%-- 
    Document   : index
    Created on : 10-Jul-2019, 12:47:10
    Author     : jtrobisch
--%>
<%@page import="WebAppCoreComponents.database"%>
<%@page import="WebAppCoreComponents.customer"%>
<%@page import="java.util.*;"%>
<%@page import="java.util.Iterator;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JSP Code Test Page</h1>
        <!--Insert Record Test-->
            <% database dbObj = new database();%>
            <% String outputInsertResult = dbObj.InsertRecords("Joe Trobi",23,"Walsall",2000);%>
            <p><%=outputInsertResult%></p>
        <!--END-->
        
        <!--Return Records Test-->
            <% ArrayList<customer> RecordsFound = new ArrayList<customer>();%>
            <% RecordsFound = dbObj.ReturnRecords();%>
            <% for (Iterator<customer> i = RecordsFound.iterator(); i.hasNext();) {
                customer item = i.next();
                out.println("<p>" + item.name +"</p>");
            }%>
        <!--END-->
        
        <!--Delete Record Test-->
            <% String outputDeleteResult = dbObj.DeleteRecord(1); %>
            <p><%=outputDeleteResult%></p>
        <!--END-->
        
        <!--Update Record Test-->
            <% String outputUpdateResult = dbObj.UpdateRecord(6,"James Smith",10,"Walsall World",10); %>
            <p><%=outputUpdateResult%></p>
        <!--END-->
     </body>
</html>

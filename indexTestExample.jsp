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
        <h1>Hello World!</h1>
    </body>
    
        <% database x = new database();%>
        <% String z = x.InsertRecords("Joe33",23,"walsall",2000);%>
        <p><%=z%></p>
        
        <% ArrayList<customer> Records = new ArrayList<customer>();%>
        <% Records = x.ReturnRecords();%>
         <%       for (Iterator<customer> i = Records.iterator(); i.hasNext();) {
          customer xx = i.next();
          out.println("<p>" + xx.name +"</p>");
       }%>

        <% String zxx = x.DeleteRecord(222); %>
        <p><%=zxx%></p>

        <% String zxx2 = x.UpdateRecord(6,"James Smith",22,"Wally Walsall",10); %>
        <p><%=zxx2%></p>
        
         
</html>

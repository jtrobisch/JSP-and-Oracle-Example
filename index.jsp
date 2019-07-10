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
        <style>
            table, th, td {
              border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>JSP Interface Example Page</h1>
        <% database dbObj = new database();%>
        
        <h2>Insert Record:</h2>
        <!--Insert Record -->
            <%if(request.getParameter("Submit")==null){%>
                <form action="index.jsp" method="POST">
                     Name: <input type="text" id="name" name="name" />
                     Age: <input type="text" id="age" name="age" />
                     Address: <input type="text" id="address" name="address" />
                     Salary: <input type="text" id="salary" name="salary" />
                     <input type="submit" value="Add Record" name="Submit" />
               </form>
            <%}else{%>
                <% String outputInsertResult = dbObj.InsertRecords(request.getParameter("name"),Integer.parseInt(request.getParameter("age")),request.getParameter("address"),Double.parseDouble(request.getParameter("salary"))); %>
                <p><%=outputInsertResult%></p>
            <%}%>
        <!--END-->
        
        <h2>Delete Record:</h2>
        <!--Delete Record -->
             <%if(request.getParameter("Submit2")==null){%>
                <form action="index.jsp" method="POST">
                     ID: <input type="text" id="customer_id" name="customer_id" />
                     <input type="submit" value="Delete Record" name="Submit2" />
               </form>
            <%}else{%>
                <% String outputDeleteResult = dbObj.DeleteRecord(Integer.parseInt(request.getParameter("customer_id"))); %>
                <p><%=outputDeleteResult%></p>
            <%}%>
        <!--END-->
        
        <h2>Update Record:</h2>
        <!--Update Record Test-->
            <%if(request.getParameter("Submit3")==null){%>
                <form action="index.jsp" method="POST">
                    ID <input type="text" id="customer_id" name="customer_id" />
                    Name: <input type="text" id="name" name="name" />
                    Age: <input type="text" id="age" name="age" />
                    Address: <input type="text" id="address" name="address" />
                    Salary: <input type="text" id="salary" name="salary" />
                    <input type="submit" value="Update Record" name="Submit3" />
               </form>
            <%}else{%>
                <% String outputUpdateResult = dbObj.UpdateRecord(Integer.parseInt(request.getParameter("customer_id")),request.getParameter("name"),Integer.parseInt(request.getParameter("age")),request.getParameter("address"),Double.parseDouble(request.getParameter("salary"))); %>
                <p><%=outputUpdateResult%></p>
            <%}%>
        <!--END-->
        
        <h2>Customer Records Found:</h2>
        <!--Return Records -->
            <% ArrayList<customer> RecordsFound = new ArrayList<customer>();%>
            <% RecordsFound = dbObj.ReturnRecords();%>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Address</th>
                    <th>Salary(&#163;)</th>
                </tr>
            <% for (Iterator<customer> i = RecordsFound.iterator(); i.hasNext();) {
                customer item = i.next();
                out.println("<tr>");
                out.println("<td>" + item.ID +"</td>");
                out.println("<td>" + item.name +"</td>");
                out.println("<td>" + item.age +"</td>");
                out.println("<td>" + item.address +"</td>");
                out.println("<td>" + item.salary +"</td>");
                out.println("</tr>");
            }%>
            </table>
        <!--END-->
     </body>
</html>

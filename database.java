/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebAppCoreComponents;

import java.sql.*;
import java.sql.Statement;
import java.util.*;
/**
 *
 * @author jtrobisch
 */
public class database {
    
    public String InsertRecords(String Name, int Age, String Address, double Salary){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","JSPWebApp","myMagicPass");
            PreparedStatement statement = con.prepareStatement("INSERT INTO customers VALUES (NULL,?,?,?,?)");
            statement.setString(1,Name);
            statement.setInt(2, Age);
            statement.setString(3, Address);
            statement.setDouble(4, Salary);
            int affectedRows = statement.executeUpdate();
            con.close();
            return affectedRows + " Row(s) inserted sucessfully.";
        }catch(Exception e){ 
           return e.getMessage();
        } 
    }
    
    public ArrayList<customer> ReturnRecords(){
        ArrayList<customer> Records = new ArrayList<customer>();  //list to hold customer objects
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","JSPWebApp","myMagicPass");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM customers");
            while(rs.next()){
                customer x = new customer(); //create new customer object
                x.ID = rs.getInt(1); //set proeprties of new object
                x.name = rs.getString(2);
                x.age = rs.getInt(3);
                x.address = rs.getString(4);
                x.salary = rs.getDouble(5);
                Records.add(x);//add object to list
            }
            con.close();
        }catch(Exception e){ 
            return null;
        }
        return Records;
    }

    public String DeleteRecord(int ID){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","JSPWebApp","myMagicPass");
            PreparedStatement statement = con.prepareStatement("DELETE FROM customers WHERE ID = ?");
            statement.setInt(1,ID);
            int affectedRows = statement.executeUpdate();
            con.close();
            if(affectedRows > 0){
                return affectedRows + " Record(s) deleted sucessfully.";
            }else{
                 return "No record(s) found to delete.";
            }
        }catch(Exception e){ 
            return e.getMessage();
        } 
    }

    public String UpdateRecord(int ID, String Name, int Age, String Address, double Salary){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","JSPWebApp","myMagicPass");
         
            PreparedStatement statement = con.prepareStatement("UPDATE customers SET name=?,age=?,address=?,salary=? WHERE id =?");
            statement.setString(1,Name);
            statement.setInt(2,Age);
            statement.setString(3,Address);
            statement.setDouble(4,Salary);
            statement.setInt(5,ID);
            int affectedRows = statement.executeUpdate();
            con.close();
            if(affectedRows > 0){
                return affectedRows + " Record(s) updated sucessfully.";
            }else{
                return "No record(s) found to update.";
            }
        }catch(Exception e){ 
           return e.getMessage();
        }       
    }
}

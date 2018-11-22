<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.transaction.*" %>

<%
 Connection con1 = null;
 Connection con2 = null;
 Statement stmt1 = null;
 Statement stmt2 = null;
	
    InitialContext ctx = new InitialContext();
    UserTransaction tx = (UserTransaction) ctx.lookup("java:comp/UserTransaction");
    try
    {
          tx.begin();
        
          //DataSource ds1 = (DataSource)ctx.lookup("dbsource");
          //DataSource ds2 = (DataSource)ctx.lookup("dbsource2");
          DataSource ds1 = (DataSource)ctx.lookup("LXADB1");
          DataSource ds2 = (DataSource)ctx.lookup("LXADB2");

          con1 = ds1.getConnection();
          con2 = ds2.getConnection();
         	
          stmt1 = con1.createStatement();
          stmt2 = con2.createStatement();
          int i = stmt1.executeUpdate("update emp set ename='aaa' where empno='1'");
          int j = stmt2.executeUpdate("update dept set dname='ACCOUNTING2' where DEPTNO='10'");
         	
          System.out.println("count1 :" + i);
          System.out.println("count2 :" + j);
          out.println("count1 :" + i);
          out.println("count2 :" + j);
			
          tx.commit();
          
          // Test ---------------------------------------
          /*
          if (i > 0)
          {
	          tx.commit();
          }
          else
          {
        	  tx.rollback();
        	  out.println("<br>rollback");
          }
          */
          // ---------------------------------------------          
    }
    catch(Exception e) 
    {
            e.printStackTrace();
            tx.rollback();
    }
    finally 
    {
        try 
        {
         stmt1.close();
        }
        catch(Exception e1)
        {}       
        try 
        {
         stmt2.close();
        }
        catch(Exception e2){}        
        try 
        {
         con1.close();
        }
        catch(Exception e3)
        {}
        try 
        {
         con2.close();
        }
        catch(Exception e4)
        {} 	
 }
%>

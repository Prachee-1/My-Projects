<%@include file="header.jsp" %>
<%@include file="../ConnectionMaster.jsp" %>
<h1 align="center">Your Orders</h1>
<table class="table table-bordered">
<thead>
<tr>
<th>Book No</th>
<th>Quantity</th>
<th>Amount</th>
</tr>
</thead>

<%
try{
	String bno="",email="",qty="",amt="";
	email=(String)session.getAttribute("emailid");
	PreparedStatement pst=cn.prepareStatement("Select * from book_order where email=?");
	pst.setString(1, email);
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		bno=rs.getString("book_no");
		email=rs.getString("email");
		qty=rs.getString("qty");
		amt=rs.getString("amount");
		%>
		<tr>
		<th><%=bno %></th>
		<th><%=qty %></th>
		<th><%=amt %></th>
		</tr>
		<% 
	}
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
<%@include file="footer.jsp" %>
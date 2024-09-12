<%@ page import="java.sql.PreparedStatement" %>
<%@ include file="header.jsp"%>
<%@ include file="ConnectionMaster.jsp"%>

<div class="container">
<h1 align=center>Books</h1>
<div class="row">
<%
PreparedStatement pst=cn.prepareStatement("Select * from book");
ResultSet rs=pst.executeQuery();
String bn,t,a,p,i;
int cnt=0;
while(rs.next())
{
	cnt++;
	bn=rs.getString("book_no");
	t=rs.getString("title");
	a=rs.getString("author");
	p=rs.getString("price");
	i=rs.getString("image");
	%>
	<div class="col-md-3">
	<div class="thumbnail">
	<a href="images/<%=i %>" target="_blank">
	<img src="images/<%=i %>" class="img-responsive">
	<div class="caption">
	<strong><%=t %></strong><br>
	Author<b><%=a %></b><br>
	Price<big><%=p %></big>
	</div>
	</a>
	</div>
	</div>
	<% 
	if(cnt==4)
	{
		out.println("</div><div class=row>");
		cnt=0;
	}
}
%>
</div>

<jsp:include page="footer.jsp"></jsp:include>
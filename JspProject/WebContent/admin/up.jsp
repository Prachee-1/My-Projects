<%@include file="header.jsp"%>
<%@include file="../ConnectionMaster.jsp" %>

<%
String bno=request.getParameter("bookno");
session.setAttribute("bno",bno);
String t="",a="",p="",i="";
PreparedStatement pst=cn.prepareStatement("Select * from book where book_no=?");
pst.setString(1, bno);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
	t=rs.getString("title");
	a=rs.getString("author");
	p=rs.getString("price");
	i=rs.getString("image");
}
%>
<div class="container">
<h1>Upload Book Details Here</h1>

<form action="upload.jsp" method="post" encrypt="multipart/form-data">
<img src="../images/<%=i %>" width=100 height=100><br>
Select an image to Change:<br />
<input type="submit" value="Upload" />
</form>
<form method=post class="form-vertical">
<div class="form-group" >
	<label for="nm">book no</label>
	<input type="text" class="form-control" id="bn" name="bookno" value="<%=bno %>">
</div>

<div class="form-group">
	<label for="ad">title</label>
	<input type="text" class="form-control" id="tl" name="title" value="<%=t %>">
</div>

<div class="form-group">
	<label for="con">author</label>
	<input type="text" class="form-control" id="auth" name="author" value="<%=a %>">
</div>

<div class="form-group">
	<label for="price">Price</label>
	<input type="text" class="form-control" id="pri" name="price" value="<%=p %>">
</div>

<button type="submit" name="btnsub" id=btnsub class="btn-btn default">Submit</button>
<button type="reset" class="btn-btn danger">Reset</button>

</form>
<%@include file="footer.jsp" %>
<%
if(request.getParameter("btnsub")!=null)
{
	String bn,tl,auth,pri,im;
	bn=request.getParameter("bookno");
	tl=request.getParameter("title");
	auth=request.getParameter("author");
	pri=request.getParameter("price");
	im=(String)session.getAttribute("filepath");
	if(im==null)
		im=i;
	PreparedStatement pst3=cn.prepareStatement("update book set title=?,author=?,price=?,image=? where book_no=?");
	pst3.setString(1, bn);
	pst3.setString(2, tl);
	pst3.setString(3, auth);
	pst3.setString(4, pri);
	pst3.setString(5, im);
	int ans=pst3.executeUpdate();
	if(ans!=0)
	{
		out.println("<script>alert('Data Saved Successfully')</script>");
	}
	else
	{
		out.println("<script>alert('Error Occured!')</script>");
	}
}
%>
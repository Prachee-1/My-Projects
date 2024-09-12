<%@ include file="header.jsp"%>
<%@ include file="../ConnectionMaster.jsp"%>
<div class="container">
<h1>Upload Details Here</h1>
Select an image to upload:<br />
<form action="upload.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br/>
<input type="submit" value="Upload" />
<br/>
</form>
<form method=post class="form-vertical">
<div class="form-group" >
	<label for="nm">book no</label>
	<input type="text" class="form-control" id="bn" name="bookno">
</div>

<div class="form-group">
	<label for="ad">title</label>
	<input type="text" class="form-control" id="tl" name="title">
</div>

<div class="form-group">
	<label for="con">author</label>
	<input type="text" class="form-control" id="auth" name="author">
</div>

<div class="form-group">
	<label for="price">Price</label>
	<input type="text" class="form-control" id="pri" name="price">
</div>

<button type="submit" name="btnsub" id=btnsub class="btn-btn default">Submit</button>
<button type="reset" class="btn-btn danger">Reset</button>

</form>
<h1 align=center>Our Books</h1>
<table class="taable table-bordered">
<thead>
<tr>
<th>Action</th>
<th>Book No</th>
<th>Title</th>
<th>Author</th>
<th>Price</th>
<th>Image</th>
</tr>
</thead>
<tbody>
<%
try
{
	PreparedStatement pst=cn.prepareStatement("Select * from book");
	ResultSet rs=pst.executeQuery();
	String bno="",t="",a="",p="",i="";
	while(rs.next())
	{
		bno=rs.getString("book_no");
		t=rs.getString("title");
		a=rs.getString("author");
		p=rs.getString("price");
		i=rs.getString("image");
		%>
		<tr>
		<td>
		<a href='del.jsp?bookno=<%=bno %>' class="btn btn-danger btn-xs">Delete</a>
		<a href='up.jsp?bookno=<%=bno %>' class="btn btn-info btn-xs">Update</a>
		</td>
		<td><%=bno %></td>
		<td><%=t %></td>
		<td><%=a %></td>
		<td><%=p %></td>
		<td><img src='d:\images\<%=i %>' width=100 height=100></td>
		</tr>
		<% 		
	}
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</tbody>
</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<%
if(request.getParameter("btnsub")!=null)
{
	String bn,tl,auth,pri,im;
	bn=request.getParameter("bookno");
	tl=request.getParameter("title");
	auth=request.getParameter("author");
	pri=request.getParameter("price");
	im=(String)session.getAttribute("filepath");
	PreparedStatement pst2=cn.prepareStatement("insert into book values(?,?,?,?,?)");
	pst2.setString(1, bn);
	pst2.setString(2, tl);
	pst2.setString(3, auth);
	pst2.setString(4, pri);
	pst2.setString(5, im);
	int ans=pst2.executeUpdate();
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








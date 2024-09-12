<%@ include file="header.jsp"%>
<%@ include file="ConnectionMaster.jsp"%>
<div class="container">
<h1>Register Here</h1>
<form method=post class="form-vertical">

<div class="form-group" >
	<label for="nm">Name</label>
	<input type="text" class="form-control" id="nm" name="name">
</div>

<div class="form-group">
	<label for="ad">Address</label>
	<input type="text" class="form-control" id="ad" name="address">
</div>

<div class="form-group">
	<label for="con">Contact</label>
	<input type="text" class="form-control" id="con" name="contact">
</div>

<div class="form-group">
	<label for="email">Email</label>
	<input type="email" class="form-control" id="email" name="email">
</div>

<div class="form-group">
	<label for="pwd">Password</label>
	<input type="password" class="form-control" id="pwd" name="password">
</div>

<button type="submit" name="btnsub" id=btnsub class="btn-btn default">Submit</button>
<button type="reset" class="btn-btn danger">Reset</button>

</form>
</div>
<%@ include file="footer.jsp"%>
<%
if(request.getParameter("btnsub")!=null)
{
	String nm,ad,con,eml,pass;
	nm=request.getParameter("name");
	ad=request.getParameter("address");
	con=request.getParameter("contact");
	eml=request.getParameter("email");
	pass=request.getParameter("password");
	PreparedStatement pst=cn.prepareStatement("insert into register values(?,?,?,?,?)");
	pst.setString(1, nm);
	pst.setString(2, ad);
	pst.setString(3, con);
	pst.setString(4, eml);
	pst.setString(5, pass);
	int ans=pst.executeUpdate();
	
	if(ans!=0) {
		out.print("<script>alert('Registration Successful')</script>");
	}
	else {
		out.print("<script>alert('Problem Occured!')</script>");
	}
}

%>

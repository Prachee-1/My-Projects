<%@ include file="header.jsp"%>
<%@ include file="ConnectionMaster.jsp"%>

<form method=post class="form-vertical">

<div class="form-group">
	<label for="email">Email: </label>
	<input type="email" class="form-control" id="email" name="email">
</div>

<div class="form-group">
	<label for="pwd">Password: </label>
	<input type="password" class="form-control" id="pwd" name="password">
</div>

<button type="submit" name="btnsub" id=btnsub class="btn-btn primary">Submit</button>
</form>

<%@ include file="footer.jsp"%>
<%

if(request.getParameter("btnsub")!=null)
{
	String nm,ad,con,eml,pass;
	eml=request.getParameter("email");
	pass=request.getParameter("password");
	PreparedStatement pst=cn.prepareStatement("select * from register where email=? and password=?");
	pst.setString(1, eml);
	pst.setString(2, pass);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		session.setAttribute("emailid",eml);
		response.sendRedirect("user/uindex.jsp");
	}
	else{
		out.println("<font color:red>Invalid username and password</font>");
	}
}
%>
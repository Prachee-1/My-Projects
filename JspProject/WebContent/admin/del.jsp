<%@include file="../ConnectionMaster.jsp"%>
<%
try
{
	String bno=request.getParameter("bookno");
	PreparedStatement pst=cn.prepareStatement("delete from book where bookno=?");
	pst.setString(1,bno);
	pst.executeUpdate();
	out.println("<script>alert('Record Deleted');window.location</script>");
}
catch(Exception ex){
	ex.printStackTrace();
}
%>
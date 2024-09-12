<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
String filePath="F:\\JspProject\\WebContent\\images\\"; 
File file;
	int maxFileSize=5000*1024;
	int maxMemSize=5000*1024;
	String contentType=request.getContentType();
	if((contentType.indexOf("multipart/form-data")>=0))
	{
		DiskFileItemFactory factory=new DiskFileItemFactory();
		//minimum size will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		//location to save data that is larger than maxMemSize
		factory.setRepository(new File(filePath));
		
		//create new file upload handler
		ServletFileUpload upload=new ServletFileUpload(factory);
		//maximum file size is uploaded
		upload.setSizeMax(maxFileSize);
		try{
			//parse the req. to get file item
			List fileItems =upload.parseRequest(request);
			
			//process the upload file item
			Iterator i=fileItems.iterator();
			out.println("<html>");
			out.println("<head>");
			out.println("<title>JSP File Upload</title>");
			out.println("</head>");
			out.println("<body>");
			while(i.hasNext())
			{
				FileItem fi=(FileItem)i.next();
				if(!fi.isFormField())
				{
					//get the uploaded file parameter
					String fieldName=fi.getFieldName();
					String fileName=fi.getName();
					boolean isInMemory=fi.isInMemory();
					long sizeInBytes=fi.getSize();
					//write the file
					if(fileName.lastIndexOf("\\")>=0){
						file=new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
					}else{
						file=new File(filePath + fileName.substring(fileName.lastIndexOf("\\")+1));
					}
					fi.write(file);
					session.setAttribute("filepath", fileName.substring(fileName.lastIndexOf("\\")+1));
					response.sendRedirect("mbooks.jsp");
				}
			}
			out.println("</body>");
			out.println("</html>");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}else{
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet Upload</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>No file Uploaded</p>");
		out.println("</body>");
		out.println("</html>");
	}
%>
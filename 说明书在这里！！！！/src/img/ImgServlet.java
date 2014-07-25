package img;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import db.dbConn;

public class ImgServlet extends HttpServlet {
	public String getWebClassesPath() {   
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();   
		return path;   
	}   
	public String getWebInfPath() throws IllegalAccessException {   
        String path = getWebClassesPath();   
        if (path.indexOf("WEB-INF") > 0) {   
            path = path.substring(0, path.indexOf("WEB-INF") + 8);   
        } else {   
            throw new IllegalAccessException("路径获取错误");   
        }   
        return path;   
    }   
  
    public String getWebRoot() throws IllegalAccessException {   
        String path = getWebClassesPath();   
        if (path.indexOf("WEB-INF") > 0) {   
            path = path.substring(0, path.indexOf("WEB-INF/classes"));   
        } else {   
            throw new IllegalAccessException("路径获取错误");   
        }   
        return path;   
   }	  
	String problemPath=null;
	String contestPath=null;
	/**
	 * Constructor of the object.
	 */
	public ImgServlet() {
		super();
		String path = null;
		try {
			path = getWebRoot();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		problemPath = path + "/img/avatar/";
		contestPath = path + "/images/acm/";
		File file1=new File(problemPath);
		File file2=new File(contestPath);
		if(!file1.isDirectory())file1.mkdirs();
		if(!file2.isDirectory())file2.mkdirs();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		String path="";
		int order=0;

		
		
		try {
		 	boolean isMultipart = ServletFileUpload.isMultipartContent(request);//检查输入请求是否为multipart表单数据。
		 	int count=0;
		 	if (isMultipart == true) {
		       FileItemFactory factory = new DiskFileItemFactory();//为该请求创建一个DiskFileItemFactory对象，通过它来解析请求。执行解析后，所有的表单项目都保存在一个List中。
		       ServletFileUpload upload = new ServletFileUpload(factory);
		       
		       List<FileItem> items=upload.parseRequest(request);
		       Iterator<FileItem> itr = items.iterator();
		       upload.setSizeMax(4194304);
		       
		       while (itr.hasNext()) 
		       {
		           FileItem item = (FileItem) itr.next();
		           //检查当前项目是普通表单项目还是上传文件。
		           if (item.isFormField()) 
		           {//如果是普通表单项目，显示表单内容。
		        	   
		        	    response.sendRedirect("/index.jsp");
		       			return ;
		        	  
		           } 
		           else 
		           {//如果是上传文件，显示文件名。
		        	   try {
			        	   String fileName=item.getName();//获得文件名，包括路径
			        	   //out.print("<script type='text/javascript'>alert("+fileName+");>");
			               if(fileName!=null){
			            	   
			            	   out.println("the upload file name is " + fileName+" the path is  "+item.getFieldName());
			            	   /*
				            	   System.out.println("the upload file name is " + fileName+" the path is  "+item.getFieldName()+" st="+st);
				            	   File fullFile=new File(fileName);
				                   File savedFile=new File(uploadPath,fullFile.getName());
				        	   */
			            	   String user_id = (String)session.getAttribute("login");
				        	   int st=fileName.lastIndexOf("\\");
			            	   if(st!=-1){
			            		   fileName=fileName.substring(st+1);
			            	   }
			            	   st = fileName.lastIndexOf(".");
			            	   if (st!=-1){
			            		   fileName=fileName.substring(st);
			            	   }
			            	   fileName=user_id+fileName;
			            	   
		            		   dbConn conn = new dbConn();
		            		   String que = "insert into photo (user_id, name) values('"+user_id+"', '"+fileName+"')";
		            		   conn.executeUpdate(que);
		            		 
		            		   conn.close();
			            	   
			            	   if(item.getFieldName().equals("image"))
				        	   {

				        		   item.write(new File(problemPath,fileName));
				        	   }
				        	   
				        	}
		        	   } catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
		        	   }
		           }
		       }
		       out.print("<script type='text/javascript'>alert('upload Image success!');</script><meta http-equiv='refresh' content='0;url=/index.jsp'>");
		    } 
		    else 
		    {
		    	out.print("<script type='text/javascript'>alert('data type must be multipart !');</script><meta http-equiv='refresh' content='0;url=/index.jsp'>");
		    }
	    } catch (FileUploadException e) {
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

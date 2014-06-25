
<%
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	int count=0;
 	if (isMultipart == true) {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		       
		List<FileItem> items=upload.parseRequest(request);
		Iterator<FileItem> itr = items.iterator();
		upload.setSizeMax(4194304);
		       
		while (itr.hasNext()) 
		{
			FileItem item = (FileItem) itr.next();
			
			if (item.isFormField())
			{
				response.sendRedirect("/index.jsp");
				return ;
			} 
			else 
			{//如果是上传文件
				try {
					String fileName=item.getName();
					if(fileName!=null){
						out.println("the upload file name is " + fileName+" the path is  "+item.getFieldName());
				            	   //System.out.println("the upload file name is " + fileName+" the path is  "+item.getFieldName()+" st="+st);
				            	   //File fullFile=new File(fileName);
				                   //File savedFile=new File(uploadPath,fullFile.getName());
						
						/*
						int st=fileName.lastIndexOf("\\");
						if(st!=-1){
							fileName=fileName.substring(st+1);
						}
			            	   
						if(item.getFieldName().equals("image"))
						{
							item.write(new File(problemPath,fileName));
						}
						*/
				    }
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		//out.print("<script type='text/javascript'>alert('upload Image success!');</script><meta http-equiv='refresh' content='0;url=uploadImage'>");
	} 


%>
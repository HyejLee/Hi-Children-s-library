<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ldo" class="library.librDO"/>
<jsp:setProperty name="ldo" property="*"/>
<jsp:useBean id="ldao" class="library.librDAO"/>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = ldo.getUserId();
		String pw = ldo.getPassword();
		
		int result = ldao.login(id, pw);
		
		if (result == 1){ 
			session.setAttribute("sid", id);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'"); 
			script.println("</script>");
			
		}else if (result == 0){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");	
			script.println("history.back()"); 
			script.println("</script>");
			
		}else if (result == -1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");	
			script.println("history.back()");	
			script.println("</script>");
			
		}else if (result == -2){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");	
			script.println("history.back()");	
			script.println("</script>");
		}
		
		
	%>
</body>
</html>
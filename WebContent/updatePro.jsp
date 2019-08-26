<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="board.BoardDBBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="article" class="board.BoardDataBean">
  <jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
String pageNum=request.getParameter("pageNum");

article.setRegDate(new Timestamp(System.currentTimeMillis()));
article.setIp(request.getRemoteAddr());

BoardDBBean dbPro = BoardDBBean.getInstance();
int check = dbPro.updateArticle(article);

if(check == 1){
	%>
	  <meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>" >
	  <%
} else if (check==2) {
	
} else {
	%>
	<script type="text/javascript" >
	 alert("비밀번호가 맞지 않습니다.");
	 history.go(-1);
  </script>
<%
}


%>
























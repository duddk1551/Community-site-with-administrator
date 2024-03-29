<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="리스트 페이지"/>
<%@ include file="../part/head.jspf" %>
<h1>${title}</h1>


<table>
	<tr>
		<th>번호</th>
		<th>날짜</th>
		<th>제목</th>
		<th>작성자</th>
		<th>비고</th>
	</tr>
	<c:forEach items="${list}" var="article">
		<tr>
			<td>${article.id}</td>
			<td>${article.regDate}</td>
			<td>${article.title}</td>
			<td>${article.extra.writer}</td>
		</tr>
	</c:forEach>
</table>

<ul>
	<c:if test="${page.prev}">
		<li><a href="article/list?boardId=${param.boardId}&cPage=${page.startPage-1}"></a></li>
	</c:if>
	<c:forEach begin="${page.startPage}" end="${page.endPage}" var="idx">
		<li>
			<a href="/article/list?boardId=${param.boardId}&cPage=${idx}"><c:out value="${idx}"/></a>
		</li>
	</c:forEach>
	<c:if test="${page.next}">
		<li><a href="/article/list?boardId=${param.boardId}&cPage=${page.endPage+1}"></a></li>
	</c:if>
</ul>
<%@ include file="../part/foot.jspf" %>
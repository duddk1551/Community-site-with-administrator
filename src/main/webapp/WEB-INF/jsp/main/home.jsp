<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="메인 페이지"/>
<%@ include file="../part/head.jspf" %>
<h1>${title}</h1>
<a href="/article/list?boardId=1">자유게시판</a>
<a href="/article/list?boardId=2">공지사항</a>
<%@ include file="../part/foot.jspf" %> 
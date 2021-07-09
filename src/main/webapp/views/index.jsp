<%@page import="com.ict.db.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.ict.db.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<VO> list = DAO.getInstance().getList();
	
	// EL과 JSTL을 사용하기 위해서는 pageContext, request, session, application에 저장 해야한다.
	pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, th, td
	{
		border: 3px solid skyblue;
		border-collapse: collapse;
	}
	div
	{
		text-align: center;
		margin: auto;
	}
	table 
	{
		width: 500px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>
	<div>
		<h1>전체 회원 정보 보기</h1>
		<h3> [ 인원 추가 ] </h3>
		<table>
			<thead>
				<tr>
					<th style="width: 20%;">IDX</th>
					<th style="width: 40%;">ID</th>
					<th style="width: 40%;">NAME</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="3"><h2>원하는 정보가 존재하지 않습니다.</h2></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list }">
							<tr>
								<td>${k.idx }</td>
								<td>${k.id }</td>
								<td>${k.name }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				
			</tfoot>
		</table>
	</div>
</body>
</html>
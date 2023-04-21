<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>수정폼</h3>
	<form action="${pageContext.request.contextPath }/member/edit.do" method="post">
		<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="${vo.id }" readonly></td>
			</tr>
			<tr>
				<th>PWD</th>
				<td><input type="password" name="pwd" value="${vo.pwd }"></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name" value="${vo.name }"></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="email" name="email" value="${vo.email }"></td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input type="tel" name="phone" value="${vo.phone }"></td>
			</tr>
			<tr>
				<th>수정</th>
				<td><input type="submit" value="수정"> 
				<input type="button" value="취소"
				onclick="javascript:location.href='${pageContext.request.contextPath }/member/member_index.jsp'"></td>

			</tr>

		</table>
	</form>
</body>
</html>
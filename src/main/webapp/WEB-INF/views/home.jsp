<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../views/common/librarys.jsp" %>
</head>
<body>
<%@ include file="../views/common/navbar.jsp" %>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<%@ include file="../views/common/footer.jsp" %>
</body>
</html>

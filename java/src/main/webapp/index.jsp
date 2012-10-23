<%@ page language="java"
   contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<?xml version="1.0" enconding="UTF-8" ?>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>Kanban</title>
		<script type="text/javascript" src="js/mootools-core.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
	</head>
	
	<body>
		<table>
			<tr>
				<td>
					<label>Kanban:</label>
				</td>
				<td>
					<select id="cbAllKanbans" onchange="onchangeSelectKanban()"/>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<a id="avancar" href='#' name="/Kanban/kanban.jsp?name=" onclick="alert('Selecione um kanban!');">
						&lt;Board&gt;
					</a>
					<a href="logout.jsp">&lt;Logout&gt;</a>
				</td>
			</tr>
		</table>
		
		<script type="text/javascript">
		<% if( request.isUserInRole("requestPOST") ){ %>
			dataDispatcherGetAllKanbans();
		<% } %>
		
		</script>
	</body>
</html>

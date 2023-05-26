
<%@page import="org.hibernate.Query"%>
<%@page import="com.KeepNotes.dao.FactoryProvider"%>
<%@page import="org.hibernate.Hibernate"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Note"%>
<%@page import="com.KeepNotes.dao.KeepNotes_dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>


</head>
<body>
	<div class="container-fluid p-0 m-0">

		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes:</h1>

		<div class="row">

			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card mt-4 ml-2 mr-2">
					<img class="card-img-top ml-2 mt-2" style="max-width: 80px"
						src="img/notes.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title" style="font-family: cursive"><b><%=note.getTitle()%></b></h5>
						<p class="card-text" style="font-family: cursive"><%=note.getContent()%></p>
						<p style="font-family: cursive" class="text-primary">Last Updated: <%=note.getAddedDate() %></p>
						<div class="container text-center">
							<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
							<a href="update.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
						</div>
						
					</div>
				</div>

				<%
				}
				s.close();
				%>

			</div>

		</div>

	</div>

</body>
</html>
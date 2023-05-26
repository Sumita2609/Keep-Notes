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
		<h1>Please fill your note detail</h1>
		<br>
		<!-- add form -->
		<form action="SaveNoteServlet" method="post"  >
			<div class="form-group">
				<label for="title"><h4>Note Title</h4></label> 
				<input name="title" required type="text" 
				class="form-control" 
				id="title"
				aria-describedby="emailHelp" placeholder="Enter title"> 
			</div>
			
			
			<div class="form-group">
				<label for="content"><h4>Note content</h4></label> 
				<textarea name="content" required id="content" placeholder="Enter your content here" class="form-control" style="height:300px"></textarea>
			</div>
			<br>
			<button type="submit" class="btn btn-primary">Add</button>
		</form>
	</div>

</body>
</html>
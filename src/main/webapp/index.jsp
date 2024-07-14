<%@page import="com.odoo.combat.api.v1.dtos.Item"%>
<%@page import="com.odoo.combat.api.v1.dtos.Root"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Root root = (Root) request.getAttribute("books");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Librarian Home</title>
<jsp:include page="components/head-imports.jsp"></jsp:include>

</head>
<body>

	<div class="page">
		<jsp:include page="components/navbar.jsp"></jsp:include>

		<div class="page-wrapper">
			<!-- Page header -->
			<div class="page-header d-print-none">
				<div class="container-xl">
					<div class="row g-2 justify-content-end">
						<div class="col-md-2">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#addBooks">
								<i class="bi bi-book"></i> &nbsp; Add books
							</button>

							<!-- Modal -->
						</div>
						<div class="col-md-2">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#addUsers">
								<i class="bi bi-person"></i> &nbsp; Add Users
						</div>
					</div>

					<div class="row g-2 align-items-center">
						<div class="col">
							<!-- Page pre-title -->
							<h2 class="page-title">New Arrivals</h2>
						</div>
					</div>

				</div>
			</div>
			<!-- Page body -->
			<div class="page-body">
				<div class="container">

					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

						<%
						for (Item item : root.getItems()) {
						%>
						<div class="col">
							<div class="card shadow-sm">
								<div class="card-body">
									<img alt=""
										src="<%=item.getVolumeInfo().getImageLinks() != null
		? item.getVolumeInfo().getImageLinks().getThumbnail()
		: "./resources/img/no-img.svg"%>"
										class="img-fluid p-2" width="150px">
									<p class="card-text"><%=item.getVolumeInfo().getDescription() != null && item.getVolumeInfo().getDescription().length() > 100
		? item.getVolumeInfo().getDescription().substring(0, 100) + ".."
		: item.getVolumeInfo().getDescription() + ""%></p>
								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Books Modal -->
	<div class="modal fade" id="addBooks" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="add_books">Add Books</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form id="add-books-ajax">
					<div class="modal-body">
						<div class="mb-3">
							<label for="isbn" class="form-label">ISBN: </label> <input
								type="text" class="form-control" id="isbn" name="isbn13"
								placeholder="Enter ISBN">
						</div>
						<div class="mb-3">
							<label for="qty" class="form-label">Quantity: </label> <input
								type="number" class="form-control" id="qty" name="quantity"
								placeholder="Add Quantity: ">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save
							changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Add Users Modal -->
	<div class="modal fade" id="addUsers" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="add_books">Add User</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form id="add-user-ajax">
					<div class="modal-body">
						<div class="mb-3">
							<label for="name" class="form-label">Full Name: </label> <input
								type="text" class="form-control" id="name" name="name"
								placeholder="Enter Full Name">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email: </label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="Enter Email: ">
						</div>

						<div class="mb-3">
							<label for="password" class="form-label">Password: </label> <input
								type="password" class="form-control" id="password" name="password"
								placeholder="Enter Password: ">
						</div>

						<div class="mb-3">
							<label for="contact" class="form-label">Contact: </label> <input
								type="text" class="form-control" id="contact" name="phone"
								placeholder="Enter Contact: ">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>

			</div>
		</div>
	</div>


	<jsp:include page="components/footer.jsp"></jsp:include>
	<jsp:include page="components/footer-imports.jsp"></jsp:include>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#add-books-ajax').on('submit', function(event) {
				event.preventDefault();

				const formData = {};
				$(this).serializeArray().forEach(function(item) {
					formData[item.name] = item.value;
				});

				$.ajax({
					url : '/api/inventory',
					type : 'POST',
					contentType : 'application/json', // Send data as JSON
					data : JSON.stringify(formData),
					success : function(response) {
						alert("Book Added Successfully");
					},
					error : function(xhr, status, error) {
						alert("Error: " + error);
					}
				});
			});
			
			$('#add-user-ajax').on('submit', function(event) {
				event.preventDefault();

				const formData = {};
				$(this).serializeArray().forEach(function(item) {
					formData[item.name] = item.value;
				});

				$.ajax({
					url : 'api/users/create',
					type : 'POST',
					contentType : 'application/json', // Send data as JSON
					data : JSON.stringify(formData),
					success : function(response) {
						alert("User Added Successfully");
					},
					error : function(xhr, status, error) {
						alert("Error: " + error);
					}
				});
			});
		});
	</script>
</body>
</html>
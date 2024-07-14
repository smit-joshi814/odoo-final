<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="currentColor"
									class="icon icon-tabler icons-tabler-filled icon-tabler-book">
                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                <path
										d="M12.088 4.82a10 10 0 0 1 9.412 .314a1 1 0 0 1 .493 .748l.007 .118v13a1 1 0 0 1 -1.5 .866a8 8 0 0 0 -8 0a1 1 0 0 1 -1 0a8 8 0 0 0 -7.733 -.148l-.327 .18l-.103 .044l-.049 .016l-.11 .026l-.061 .01l-.117 .006h-.042l-.11 -.012l-.077 -.014l-.108 -.032l-.126 -.056l-.095 -.056l-.089 -.067l-.06 -.056l-.073 -.082l-.064 -.089l-.022 -.036l-.032 -.06l-.044 -.103l-.016 -.049l-.026 -.11l-.01 -.061l-.004 -.049l-.002 -.068v-13a1 1 0 0 1 .5 -.866a10 10 0 0 1 9.412 -.314l.088 .044l.088 -.044z" />
              </svg>
								Add books
							</button>

							<!-- Modal -->
						</div>
						<div class="col-md-2">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#addUsers">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="icon icon-tabler icons-tabler-outline icon-tabler-users">
                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                <path d="M9 7m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" />
                <path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" />
                <path d="M16 3.13a4 4 0 0 1 0 7.75" />
                <path d="M21 21v-2a4 4 0 0 0 -3 -3.85" />
              </svg>
								Add Users
						</div>
					</div>

					<div class="row g-2 align-items-center">
						<div class="col">
							<!-- Page pre-title -->
							<h2 class="page-title">New Arrivals</h2>
						</div>
						<div class="col">
							<!-- Page pre-title -->
							<h2 class="page-title">Trending</h2>
						</div>
					</div>

				</div>
			</div>
			<!-- Page body -->
			<div class="page-body">
				<div class="container">
					<div class="row row-deck row-cards justify-content-around">
						<div class="col-sm-4 col-lg-5">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-auto">
											<img src="dist\img\books\book1.jfif" alt="Book Cover"
												height="100px" width="90px">
										</div>
										<div class="col-auto" style="position: relative;">
											<div class="font-weight-medium">
												<a href="">
													<h2>Book Title</h2>
												</a>
											</div>
											<div class="text-secondary">
												<a href="">
													<h3>Author</h3>
												</a>
											</div>
											<div class="text-secondary">Enter the book description
											</div>

											<!-- Edit -->
											<button type="button" class="btn btn-secondary"
												data-bs-toggle="modal" data-bs-target="#editBooks"
												style="position: absolute; top: 10px; right: -30px;">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="icon icon-tabler icons-tabler-outline icon-tabler-edit">
                        <path stroke="none" d="M0 0h24v24H0z"
														fill="none" />
                        <path
														d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" />
                        <path
														d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" />
                        <path d="M16 5l3 3" />
                      </svg>

												<!-- Delete -->
												<button type="button" class="btn btn-secondary"
													style="position: absolute; top: 10px; right: -130px;">
													<!-- Download SVG icon from http://tabler-icons.io/i/mail -->
													<svg xmlns="http://www.w3.org/2000/svg" width="24"
														height="24" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round"
														class="icon icon-tabler icons-tabler-outline icon-tabler-trash-x">
                          <path stroke="none" d="M0 0h24v24H0z"
															fill="none" />
                          <path d="M4 7h16" />
                          <path
															d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                          <path
															d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          <path d="M10 12l4 4m0 -4l-4 4" />
                        </svg>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-lg-5">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-auto">
											<img src="dist\img\books\book1.jfif" alt="Book Cover"
												height="100px" width="90px">
										</div>
										<div class="col-auto" style="position: relative;">
											<div class="font-weight-medium">
												<a href="">
													<h2>Book Title</h2>
												</a>
											</div>
											<div class="text-secondary">
												<a href="">
													<h3>Author</h3>
												</a>
											</div>
											<div class="text-secondary">Enter the book description
											</div>

											<!-- Edit -->
											<button type="button" class="btn btn-secondary"
												data-bs-toggle="modal" data-bs-target="#editBooks"
												style="position: absolute; top: 10px; right: -30px;">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="icon icon-tabler icons-tabler-outline icon-tabler-edit">
                        <path stroke="none" d="M0 0h24v24H0z"
														fill="none" />
                        <path
														d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" />
                        <path
														d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" />
                        <path d="M16 5l3 3" />
                      </svg>

												<!-- Delete -->
												<button type="button" class="btn btn-secondary"
													style="position: absolute; top: 10px; right: -130px;">
													<!-- Download SVG icon from http://tabler-icons.io/i/mail -->
													<svg xmlns="http://www.w3.org/2000/svg" width="24"
														height="24" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round"
														class="icon icon-tabler icons-tabler-outline icon-tabler-trash-x">
                          <path stroke="none" d="M0 0h24v24H0z"
															fill="none" />
                          <path d="M4 7h16" />
                          <path
															d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                          <path
															d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          <path d="M10 12l4 4m0 -4l-4 4" />
                        </svg>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer footer-transparent d-print-none">
				<div class="container-xl">
					<div class="row text-center align-items-center flex-row-reverse">
						<div class="col-lg-auto ms-lg-auto">
							<ul class="list-inline list-inline-dots mb-0">
							</ul>
						</div>
						<div class="col-12 col-lg-auto mt-3 mt-lg-0">
							<ul class="list-inline list-inline-dots mb-0">
								<li class="list-inline-item">Copyright &copy; 2023 <a
									href="." class="link-secondary">Public Library Management
										System</a>. All rights reserved.
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
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
				<form action="#">
					<div class="modal-body">
						<div class="mb-3">
							<label for="isbn" class="form-label">ISBN: </label> <input
								type="text" class="form-control" id="isbn"
								placeholder="Enter ISBN">
						</div>
						<div class="mb-3">
							<label for="qty" class="form-label">Quantity: </label> <input
								type="number" class="form-control" id="qty"
								placeholder="Add Quantity: ">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Edit Books -->
	<div class="modal fade" id="editBooks" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="edit_books">Edit Book</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="#">
					<div class="modal-body">
						<div class="mb-3">
							<label for="isbn" class="form-label">ISBN: </label> <input
								type="text" class="form-control" id="isbn"
								placeholder="Enter ISBN">
						</div>
						<div class="mb-3">
							<label for="qty" class="form-label">Quantity: </label> <input
								type="number" class="form-control" id="qty"
								placeholder="Add Quantity: ">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
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
				<form action="#">
					<div class="modal-body">
						<div class="mb-3">
							<label for="name" class="form-label">Full Name: </label> <input
								type="text" class="form-control" id="name"
								placeholder="Enter Full Name">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email: </label> <input
								type="email" class="form-control" id="email"
								placeholder="Enter Email: ">
						</div>

						<div class="mb-3">
							<label for="password" class="form-label">Password: </label> <input
								type="password" class="form-control" id="password"
								placeholder="Enter Password: ">
						</div>

						<div class="mb-3">
							<label for="contact" class="form-label">Contact: </label> <input
								type="text" class="form-control" id="contact"
								placeholder="Enter Contact: ">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Add</button>
					</div>
				</form>

			</div>
		</div>
	</div>


	<jsp:include page="components/footer.jsp"></jsp:include>
	<jsp:include page="components/footer-imports.jsp"></jsp:include>

</body>
</html>
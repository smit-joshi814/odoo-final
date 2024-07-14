<%@page import="com.odoo.combat.entities.Users"%>

<!-- Navbar -->
<header class="navbar navbar-expand-md d-print-none">
	<div class="container-xl">
		<h1
			class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
			<a href="."> Public Library </a>
		</h1>
		<div class="navbar-nav flex-row order-md-last">
			<div class="nav-item d-none d-md-flex me-3"></div>
			<div class="d-none d-md-flex">
				<a href="?theme=dark" class="nav-link px-0 hide-theme-dark"
					title="Enable dark mode" data-bs-toggle="tooltip"
					data-bs-placement="bottom"> <!-- Download SVG icon from http://tabler-icons.io/i/moon -->
					<i class="ti ti-moon icon"></i>
				</a> <a href="?theme=light" class="nav-link px-0 hide-theme-light"
					title="Enable light mode" data-bs-toggle="tooltip"
					data-bs-placement="bottom"> <!-- Download SVG icon from http://tabler-icons.io/i/sun -->
					<i class="ti ti-sun icon"></i>
				</a>
				<div class="nav-item dropdown d-none d-md-flex me-3">
					<a href="#" class="nav-link px-0" data-bs-toggle="dropdown"
						tabindex="-1" aria-label="Show notifications"> <!-- Download SVG icon from http://tabler-icons.io/i/bell -->
						<i class="ti ti-bell icon"></i> <span class="badge bg-red"></span>
					</a>
					<div
						class="dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Last updates</h3>
							</div>
							<div class="list-group list-group-flush list-group-hoverable">
								<div class="list-group-item">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="status-dot status-dot-animated bg-red d-block"></span>
										</div>
										<div class="col text-truncate">
											<a href="#" class="text-body d-block">Example 1</a>
											<div class="d-block text-secondary text-truncate mt-n1">
												Change deprecated html tags to text decoration classes
												(#29604)</div>
										</div>
										<div class="col-auto">
											<a href="#" class="list-group-item-actions"> <!-- Download SVG icon from http://tabler-icons.io/i/star -->
												<i class="ti-star ti icon"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="status-dot d-block"></span>
										</div>
										<div class="col text-truncate">
											<a href="#" class="text-body d-block">Example 2</a>
											<div class="d-block text-secondary text-truncate mt-n1">
												justify-content:between ⇒ justify-content:space-between
												(#29734)</div>
										</div>
										<div class="col-auto">
											<a href="#" class="list-group-item-actions show"> <!-- Download SVG icon from http://tabler-icons.io/i/star -->
												<i class="ti-star ti icon"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="status-dot d-block"></span>
										</div>
										<div class="col text-truncate">
											<a href="#" class="text-body d-block">Example 3</a>
											<div class="d-block text-secondary text-truncate mt-n1">
												Update change-version.js (#29736)</div>
										</div>
										<div class="col-auto">
											<a href="#" class="list-group-item-actions"> <!-- Download SVG icon from http://tabler-icons.io/i/star -->
												<i class="ti-star ti icon"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="status-dot status-dot-animated bg-green d-block"></span>
										</div>
										<div class="col text-truncate">
											<a href="#" class="text-body d-block">Example 4</a>
											<div class="d-block text-secondary text-truncate mt-n1">
												Regenerate package-lock.json (#29730)</div>
										</div>
										<div class="col-auto">
											<a href="#" class="list-group-item-actions"> <!-- Download SVG icon from http://tabler-icons.io/i/star -->
												<i class="ti-star ti icon"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link d-flex lh-1 text-reset p-0"
					data-bs-toggle="dropdown" aria-label="Open user menu"> <span
					class="avatar avatar-sm"
					style="background-image: url(./static/avatars/000m.jpg);"></span>
					<div class="d-none d-xl-block ps-2">
						<div>Smit Joshi</div>
						<div class="mt-1 small text-secondary">Librarian</div>
					</div>
				</a>
				<div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
					<a href="settings.html" class="dropdown-item">Settings</a> <a
						href="sign-in.html" class="dropdown-item">Logout</a>
				</div>
			</div>
		</div>
	</div>
</header>
<header class="navbar-expand-md">
	<div class="collapse navbar-collapse" id="navbar-menu">
		<div class="navbar">
			<div class="container-xl">
				<div
					class="my-2 my-md-0 flex-grow-1 flex-md-grow-1 order-first order-md-last">
					<button class="navbar-toggler collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#sidebar-menu"
						aria-controls="sidebar-menu" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<form action="./" method="get" autocomplete="off" novalidate>
						<div class="input-icon">
							<span class="input-icon-addon"> <!-- Download SVG icon from http://tabler-icons.io/i/search -->
								<i class="ti icon ti-search"></i>
							</span> <input type="text" value="" class="form-control"
								placeholder="Search" aria-label="Search in website" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</header>
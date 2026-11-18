<nav class="navbar navbar-expand-lg bg-white border-bottom shadow-sm py-3"
     data-bs-theme="light">

    <div class="container">

        <!-- Logo -->
        <a class="navbar-brand fw-bold fs-3 text-dark"
           href="${pageContext.request.contextPath}/">
            <i class="bi bi-check2-square text-primary"></i>
            Todo<span class="text-primary">App</span>
        </a>

        <!-- Mobile menu -->
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#todoNavbar"
                aria-controls="todoNavbar"
                aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation -->
        <div class="collapse navbar-collapse" id="todoNavbar">

            <ul class="navbar-nav ms-auto align-items-lg-center gap-2">

                <li class="nav-item">
                    <a class="nav-link text-dark fw-semibold px-3"
                       href="${pageContext.request.contextPath}/">
                        <i class="bi bi-house-door me-1"></i>
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="btn btn-primary px-4 py-2 fw-semibold"
                       href="${pageContext.request.contextPath}/create">
                        <i class="bi bi-plus-lg me-1"></i>
                        Add Todo
                    </a>
                </li>

                <li class="nav-item" >
                    <form action="${pageContext.request.contextPath}/logout" method="post" class="m-0">
                        <button type="submit" class="btn btn-outline-danger px-4 py-2 fw-semibold">
                            <i class="bi bi-box-arrow-right me-1"></i>
                            Logout
                        </button>
                    </form>

                </li>

            </ul>
        </div>
    </div>
</nav>
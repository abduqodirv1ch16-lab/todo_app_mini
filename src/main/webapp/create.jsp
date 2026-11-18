
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Create Todo | TodoApp</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
          rel="stylesheet">
</head>

<body style="background-color: #211638; min-height: 100vh;">

<jsp:include page="/navbar.jsp"/>

<div class="container py-5">

    <div class="row justify-content-center">
        <div class="col-12 col-md-9 col-lg-6">

            <!-- Heading -->
            <div class="text-center mb-4">

                <div class="d-inline-flex align-items-center justify-content-center
                            rounded-4 mb-3"
                     style="width: 70px; height: 70px;
                            background-color: #7952b3;">

                    <i class="bi bi-plus-circle text-white fs-2"></i>
                </div>

                <h2 class="fw-bold text-white mb-2">
                    Create New Todo
                </h2>

                <p class="text-white-50">
                    Add a new task to your daily plan
                </p>

            </div>

            <!-- Form Card -->
            <div class="card border-0 rounded-4 shadow-lg">

                <div class="card-body p-4 p-md-5">

                    <form method="post">

                        <label for="todo" class="form-label fw-semibold text-dark mb-2">
                            <i class="bi bi-pencil-square me-2"
                               style="color: #7952b3;"></i>
                            Todo title
                        </label>

                        <input
                                type="text"
                                class="form-control form-control-lg rounded-3 mb-4"
                                id="todo"
                                name="todo"
                                placeholder="What do you need to do?"
                                maxlength="255"
                                required
                                autofocus>

                        <div class="d-flex flex-column flex-sm-row gap-3">

                            <button type="submit"
                                    class="btn btn-lg text-white rounded-3 flex-grow-1"
                                    style="background-color: #7952b3;
                                           border-color: #7952b3;">

                                <i class="bi bi-plus-lg me-2"></i>
                                Add Todo

                            </button>

                            <a href="${pageContext.request.contextPath}/"
                               class="btn btn-outline-secondary btn-lg rounded-3 px-4">

                                <i class="bi bi-arrow-left me-2"></i>
                                Cancel

                            </a>

                        </div>

                    </form>

                </div>
            </div>

            <!-- Footer text -->
            <p class="text-center text-white-50 small mt-4">
                <i class="bi bi-lightbulb me-1"></i>
                Small tasks lead to big achievements.
            </p>

        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

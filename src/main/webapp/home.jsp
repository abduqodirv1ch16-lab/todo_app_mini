
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo App | Home</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
          rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: #211638;
        }

        .main-container {
            max-width: 900px;
        }

        .todo-card {
            border: none;
            border-radius: 22px;
            overflow: hidden;
        }

        .todo-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 18px 22px;
            border-bottom: 1px solid #eeeaf4;
            transition: background .2s;
        }

        .todo-item:last-child {
            border-bottom: none;
        }

        .todo-item:hover {
            background: #faf8fd;
        }

        .todo-name {
            flex: 1;
            min-width: 0;
            overflow-wrap: anywhere;
            font-weight: 600;
            color: #302047;
        }

        .todo-name.completed {
            text-decoration: line-through;
            color: #999;
        }

        /* iPhone style switch */
        .switch {
            position: relative;
            display: inline-block;
            width: 52px;
            height: 30px;
            flex-shrink: 0;
            cursor: pointer;
        }

        .switch input {
            display: none;
        }

        .slider {
            position: absolute;
            inset: 0;
            background: #dc3545;
            border-radius: 50px;
            transition: .25s;
        }

        .slider::before {
            content: "";
            position: absolute;
            width: 22px;
            height: 22px;
            left: 4px;
            top: 4px;
            background: white;
            border-radius: 50%;
            transition: .25s;
            box-shadow: 0 1px 4px rgba(0,0,0,.2);
        }

        .switch input:checked + .slider {
            background: #198754;
        }

        .switch input:checked + .slider::before {
            transform: translateX(22px);
        }

        .action-btn {
            width: 38px;
            height: 38px;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            border-radius: 11px;
            flex-shrink: 0;
        }

        .empty-icon {
            font-size: 50px;
            color: #7952b3;
        }

        @media (max-width: 576px) {
            .todo-item {
                padding: 15px 12px;
                gap: 10px;
            }
        }
    </style>
</head>

<body>

<jsp:include page="/navbar.jsp"/>

<div class="container main-container py-5">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">

        <div>
            <h2 class="text-white fw-bold mb-2">My Tasks</h2>
            <p class="text-white-50 mb-0">
                Vazifalaringizni boshqaring va maqsadlaringizga erishing.
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/create"
           class="btn btn-light rounded-3 px-4 py-2 fw-semibold">
            <i class="bi bi-plus-lg me-2"></i>
            Add Todo
        </a>

    </div>

    <!-- Todo Card -->
    <div class="card todo-card shadow-lg">

        <!-- Card Header -->
        <div class="card-body p-4 border-bottom">

            <div class="d-flex justify-content-between align-items-center">

                <div>
                    <h5 class="fw-bold mb-1">My Todo List</h5>
                    <small class="text-secondary">
                        Barcha vazifalaringiz
                    </small>
                </div>

                <span class="badge rounded-pill px-3 py-2"
                      style="background: #7952b3;">
                    ${allTodo.size()} Tasks
                </span>

            </div>

        </div>

        <!-- Todo Items -->
        <div>

            <c:choose>

                <c:when test="${empty allTodo}">

                    <div class="text-center py-5 px-3">

                        <i class="bi bi-clipboard-check empty-icon"></i>

                        <h5 class="fw-bold mt-3">
                            Hozircha Todo mavjud emas
                        </h5>

                        <p class="text-secondary">
                            Birinchi vazifangizni qo‘shing.
                        </p>

                        <a href="${pageContext.request.contextPath}/create"
                           class="btn text-white px-4 rounded-3"
                           style="background: #7952b3;">
                            <i class="bi bi-plus-lg me-2"></i>
                            Add Todo
                        </a>

                    </div>

                </c:when>

                <c:otherwise>

                    <c:forEach var="todo" items="${allTodo}" varStatus="status">

                        <div class="todo-item">

                            <!-- Number -->
                            <span class="text-secondary small">
                                ${status.count}.
                            </span>

                            <!-- Todo text -->
                            <div class="todo-name ${todo.completed ? 'completed' : ''}">
                                <c:out value="${todo.todo}"/>
                            </div>



                            <!-- Status Switch -->
                            <form method="post"
                                  action="${pageContext.request.contextPath}/update/${todo.id}"
                                  class="m-0">

                                <label class="switch"
                                       title="${todo.completed ? 'Bajarildi' : 'Bajarilmadi'}">

                                    <input type="checkbox"
                                        ${todo.completed ? 'checked' : ''}
                                           onchange="this.form.submit()">

                                    <span class="slider"></span>
                                </label>

                                <input type="hidden"
                                       name="completed"
                                       value="${not todo.completed}">
                            </form>
                            <!-- Delete -->
                            <form method="post"
                                  action="${pageContext.request.contextPath}/delete"
                                  class="m-0"
                                  onsubmit="return confirm('Ushbu Todo o‘chirilsinmi?')">

                                <input type="hidden"
                                       name="id"
                                       value="${todo.id}">

                                <button type="submit"
                                        class="btn btn-light text-danger action-btn"
                                        title="Delete">

                                    <i class="bi bi-trash3 fs-5"></i>

                                </button>

                            </form>

                        </div>

                    </c:forEach>

                </c:otherwise>

            </c:choose>

        </div>

        <div class="card-footer bg-white border-0 px-4 py-3">
            <small class="text-secondary">
                <i class="bi bi-info-circle me-1"></i>
                Tugmani bosib vazifa holatini o‘zgartiring.
            </small>
        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

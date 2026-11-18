<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | My Tasks</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body>

<div class="min-vh-100 d-flex align-items-center justify-content-center p-3"
     style="background: linear-gradient(135deg, #211638, #49316f);">

    <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5"
         style="width: 100%; max-width: 440px;">

        <div class="text-center mb-4">

            <div class="d-inline-flex align-items-center justify-content-center
                        rounded-4 mb-3"
                 style="width: 65px; height: 65px; background: #f0eafa;">

                <i class="bi bi-person-plus fs-1"
                   style="color: #6541a5;"></i>
            </div>

            <h3 class="fw-bold mb-2">Create Account</h3>

            <p class="text-secondary mb-0">
                My Tasks platformasiga xush kelibsiz!
            </p>
        </div>

        <form method="post">

            <div class="mb-3">
                <label for="fullName" class="form-label fw-semibold">
                    Full Name
                </label>

                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-person text-secondary"></i>
                    </span>

                    <input type="text"
                           class="form-control bg-light border-start-0 py-2"
                           id="fullName"
                           name="fullName"
                           placeholder="To‘liq ismingiz"
                           required>
                </div>
            </div>

            <div class="mb-3">
                <label for="username" class="form-label fw-semibold">
                    Username
                </label>

                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-at text-secondary"></i>
                    </span>

                    <input type="text"
                           class="form-control bg-light border-start-0 py-2"
                           id="username"
                           name="username"
                           placeholder="Username tanlang"
                           required>
                </div>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label fw-semibold">
                    Password
                </label>

                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-lock text-secondary"></i>
                    </span>

                    <input type="password"
                           class="form-control bg-light border-start-0 py-2"
                           id="password"
                           name="password"
                           placeholder="Parol yarating"
                           required>
                </div>
            </div>

            <button type="submit"
                    class="btn btn-lg w-100 text-white fw-semibold rounded-3 py-2"
                    style="background: #6541a5;">

                <i class="bi bi-person-check me-2"></i>
                Create Account
            </button>

        </form>

        <div class="text-center mt-4">
            <span class="text-secondary">Hisobingiz bormi?</span>

            <a href="${pageContext.request.contextPath}/login"
               class="fw-bold text-decoration-none ms-1"
               style="color: #6541a5;">
                Login
            </a>
        </div>

    </div>
</div>

</body>
</html>
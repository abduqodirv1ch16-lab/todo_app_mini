# 📝 Todo App (Java Servlet & JSP)

A simple, clean, and classic **To-Do List Web Application** built with Java, Servlets, JSP, Hibernate (JPA), and PostgreSQL.

## 🚀 Features
- **User Authentication:** Secure Sign Up (Register) and Sign In (Login) system.
- **Task Management:** Create, view, update status (complete/incomplete), and delete tasks.
- **Responsive UI:** Styled cleanly using Bootstrap 5 and Bootstrap Icons.
- **Database Integration:** Persistent data storage using PostgreSQL and Hibernate ORM.

## 🛠️ Tech Stack
- **Backend:** Java, Jakarta Servlets, JSP (JavaServer Pages)
- **Database & ORM:** PostgreSQL, Hibernate (JPA)
- **Frontend:** HTML5, CSS3, Bootstrap 5
- **Build Tool:** Maven

## 📂 Project Structure
```text
src/main/java/uz/pdp/
│
├── dao/          # Database operations (TodoDao, ProfileDao, BaseDao)
├── entity/       # Database models (Todo, Profile)
├── service/      # Business logic layer (TodoService, ProfileService)
└── servlet/      # HTTP Request handlers (Login, Register, Create, Update, Delete, Logout)

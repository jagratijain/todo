<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View ToDo Item List</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    
    <!-- Custom CSS for styling -->
    <style>
        body {
            background: url('path-to-your-background-image.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            padding: 30px;
            margin-top: 50px;
        }

        h1 {
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Arial', sans-serif;
        }

        .table {
            background-color: #ffffff; /* White background for the table */
            border-radius: 8px;
            overflow: hidden; /* Rounded corners */
        }

        .table thead th {
            background-color: #343a40; /* Dark grey background for table header */
            color: #ffffff; /* White text for header */
        }

        .table tbody tr {
            transition: all 0.3s ease; /* Smooth transition for hover */
        }

        .table tbody tr:hover {
            background-color: #f1f1f1; /* Light grey background on hover */
        }

        .btn {
            border-radius: 20px; /* Rounded buttons */
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-primary-block {
            background-color: #007bff;
            border-color: #007bff;
            width: 100%;
            margin-top: 20px;
            border-radius: 20px; /* Rounded "Add New ToDo Item" button */
        }

        a {
            color: white;
        }

        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="p-3">ToDo Item List</h1>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Mark Completed</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="todo" items="${list}">
                    <tr>
                        <td>${todo.id}</td>
                        <td>${todo.title}</td>
                        <td>${todo.date}</td>
                        <td>${todo.status}</td>
                        <td>
                            <a href="/updateToDoStatus/${todo.id}" class="btn btn-success btn-sm">Mark Complete</a>
                        </td>
                        <td>
                            <a href="/editToDoItem/${todo.id}" class="btn btn-primary btn-sm">Edit</a>
                        </td>
                        <td>
                            <a href="/deleteToDoItem/${todo.id}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="/addToDoItem" class="btn btn-primary btn-primary-block">Add New ToDo Item</a>
    </div>

    <!-- JQuery and Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
    <!-- Toastr Notifications -->
    <script>
        window.onload = function() {
            var msg = "${message}";
            if (msg === "Save Success") {
                toastr.success("Item added successfully!!");
            } else if (msg === "Delete Success") {
                toastr.success("Item deleted successfully!!");
            } else if (msg === "Delete Failure") {
                toastr.error("Some error occurred, couldn't delete item.");
            } else if (msg === "Edit Success") {
                toastr.success("Item updated successfully!!");
            }

            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
        }
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add ToDo Item</title>

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
            margin-top: 100px;
            max-width: 600px;
        }

        h1 {
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Arial', sans-serif;
        }

        .form-group label {
            color: #495057;
            font-weight: bold;
        }

        .form-control {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            width: 100%;
            font-size: 18px;
            padding: 10px;
            border-radius: 10px;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .toast-top-right {
            top: 60px;
            right: 12px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="p-3">Add a ToDo Item</h1>

        <form:form action="/saveToDoItem" method="post" modelAttribute="todo">
            <div class="form-group row">
                <label class="col-md-3 col-form-label" for="title">Title</label>
                <div class="col-md-9">
                    <form:input type="text" path="title" id="title" class="form-control" required="required" placeholder="Enter task title" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-3 col-form-label" for="date">Date</label>
                <div class="col-md-9">
                    <form:input type="date" path="date" id="date" class="form-control" required="required" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-3 col-form-label" for="status">Status</label>
                <div class="col-md-9">
                    <form:select path="status" id="status" class="form-control">
                        <form:option value="Incomplete" label="Incomplete" />
                        <form:option value="Complete" label="Complete" />
                    </form:select>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-success btn-block">Save</button>
                </div>
            </div>
        </form:form>
    </div>

    <!-- JQuery and Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
    <!-- Toastr Notifications -->
    <script>
        window.onload = function() {
            var msg = "${message}";
            if (msg === "Save Failure") {
                toastr.error("Something went wrong with the save.");
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

<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>City List</title>
    <!-- Add DataTables CSS and JS files -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        /* Add your custom styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        form {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .update-btn {
            background-color: #007bff;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .save-btn {
            background-color: #28a745; /* Green color for Save button */
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>

    <script>
        $(document).ready(function () {
            // Initialize DataTable
            $('#cityTable').DataTable();
        });

        // Function to open the update modal
        function openUpdateModal(id) {
            $('#updateModal').modal('show');
            // Set the ID in the update form
            $('#updateForm input[name="id"]').val(id);
        }
    </script>
</head>
<body>
<form action="VilleController" method="post">
    Nom : <input type="text" name="ville" /> <br>
    <input type="hidden" name="action" value="create" /> <!-- Add a hidden field for the action -->
    <button class="save-btn">Enregistrer</button>
</form>

<h1>Liste des villes :</h1>
<!-- Create a table with the DataTables id -->
<table id="cityTable">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${villes}" var="v">
        <tr>
            <td>${v.id}</td>
            <td>${v.nom}</td>
            <td>
                <a href="VilleController?action=delete&id=${v.id}" class="delete-btn">Supprimer</a>
                <!-- Use JavaScript to open the update modal -->
                <a href="javascript:void(0);" onclick="openUpdateModal(${v.id})" class="update-btn">Modifier</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Update City Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">Modifier la ville</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateForm" action="VilleController" method="get">
                    <input type="hidden" name="action" value="update" />
                    <input type="hidden" name="id" />
                    Nouveau nom : <input type="text" name="updatedVille" class="form-control" /> <br>
                    <button class="btn btn-primary">Enregistrer</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

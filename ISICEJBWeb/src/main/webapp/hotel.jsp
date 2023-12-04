<%@ page import="entities.Hotel" %>
<%@ page import="entities.Ville" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel List</title>
    <!-- Add DataTables CSS and JS files -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

    <style>
        /* Add your custom styles here */
       body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 20px;
}

/* Style pour le formulaire d'ajout */
form {
    margin-top: 20px;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

form label {
    display: block;
    margin-bottom: 8px;
}

form input, form select {
    width: 100%;
    padding: 8px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

form button {
    background-color: #28a745;
    color: white;
    padding: 8px 12px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

/* Style pour le tableau des hôtels */
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

/* Style pour les boutons d'action dans le tableau */
.delete-btn, .update-btn {
    display: inline-block;
    padding: 8px 12px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    text-decoration: none;
}

.delete-btn {
    background-color: #dc3545;
    color: white;
    margin-right: 5px;
}

.update-btn {
    background-color: #007bff;
    color: white;
}

/* Style pour la boîte de dialogue de mise à jour (ajoutez ces styles à votre code JavaScript) */
#updateDialog {
    display: none;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

#updateDialog form {
    margin: 0; /* Réinitialisez les marges du formulaire dans la boîte de dialogue */
}

    </style>

    <script>
        $(document).ready(function () {
            // Initialize DataTable
            $('#hotelTable').DataTable();
        });
    </script>
</head>
<body>
<form action="HotelController" method="post">
    <label for="nom">Nom :</label>
    <input type="text" name="nom" required /><br>
    
    <label for="adresse">Adresse :</label>
    <input type="text" name="adresse" required /><br>
    
    <label for="telephone">Téléphone :</label>
    <input type="text" name="telephone" required /><br>
  
    
        <label for="ville">Ville :</label>
    <select name="ville" id="ville" class="form-control">
        <option value="-1">Select Ville</option>
        <c:forEach items="${villes}" var="v">
            <option value="${villes.id}" ${!empty hotel && hotel.ville.id == v.id ? 'selected' : ''}>${villes.nom}</option>
        </c:forEach>
    </select>

    <input type="hidden" name="action" value="create" /> <!-- Add a hidden field for the action -->
    <button class="add-btn">Ajouter</button>
</form>


<h1>Liste des hôtels :</h1>
<!-- Create a table with the DataTables id -->
<table id="hotelTable">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Adresse</th>
        <th>Téléphone</th>
        <th>Ville</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${hotels}" var="hotel">
        <tr>
            <td>${hotel.id}</td>
            <td>${hotel.nom}</td>
            <td>${hotel.adresse}</td>
            <td>${hotel.telephone}</td>
            <td>${hotel.ville.nom}</td>
            <td>
                <a href="HotelController?action=delete&id=${hotel.id}" class="delete-btn">Supprimer</a>
                <a href="updateHotel.jsp?id=${hotel.id}" class="update-btn">Modifier</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Form for adding hotels -->

</body>
</html>

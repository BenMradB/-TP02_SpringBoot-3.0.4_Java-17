<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Boot TP02 | Lister Toutes Les Produits </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
    	<div class="mb-3">
           	<a href="create">
    			<button type="button" class="btn btn-primary">Creer Un Produit</button>
        	</a>
    	</div>
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom De Produit</th>
                    <th scope="col">Prix De Produit</th>
                    <th scope="col">Date</th>
                    <th scope="col">Edition</th>
                    <th scope="col">Supression</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${produits}" var="prod">
                    <tr>
                        <th scope="row"> ${prod.idProduit} </th>
                        <td> ${prod.nomProduit} </td>
                        <td> ${prod.prixProduit} </td>
                        <td>
                            <fmt:formatDate value="${prod.dateCreation}" pattern="dd/MM/yyyy" />
                        </td>
                        <td> 
                        	<a href="editerProduit?id=${prod.idProduit}">
                        		<button type="button" class="btn btn-success">Editer</button>
                        	</a>
                        </td>
                        <td>
	                       	<a onclick="return confirm('Etes-vous sûr tu peut supprimr le produit  : ${prod.nomProduit}?')" href="supprimerProduit?id=${prod.idProduit}">
                        		<button type="button" class="btn btn-danger">Suprimer</button>
                        	</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- For icons -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Show News</title>
    <style type="text/css">
        #ver ul li{
            font-size: 26px;
        }
        label {
            color: white;
            font-size: 20px;
        }
        #collapsibleNavbar ul li{
            color: white;
        }
    </style>
</head>
<body>
<div class="jumbotron-fluid">
    <div class="container">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: black;">
            <a href="#" class="navbar-brand text-info p-2" style="font-size: 30px; font-family: Geneva;"><b>NEWSGyan</b></a>
            <button class="navbar-toggler text-black" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">MENU
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
                <ul class="navbar-nav" style="font-size: 20px;">
                    <li class="nav-item"><a class="nav-link text-black pr-5 ml-3" href="/home">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-black pr-5 ml-3" href="/profile">Profile</a></li>
                    <li class="nav-item"><a class="nav-link text-black pr-5 ml-3" href="#">Articles</a></li>
                    <li class="nav-item"><a class="nav-link text-black pr-5 ml-3" href="#">Notifications</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" role="button" data-toggle="dropdown">
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbardrop">
                            <c:forEach items="${cat}" var="x">
                                <a class="dropdown-item" href="shownew?id=${x.id}">${x.category_name}</a>
                            </c:forEach>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link text-black pr-5 ml-3" href="#">Saved News</a></li>
                    <li class="nav-item"><a class="nav-link text-black pr-5 ml-3" href="#">Settings</a></li>
                    <a class="nav-link" href="#" role="image">
                        <img src="${pageContext.servletContext.contextPath}/images/user/${ud.image}" class="rounded-circle" style="height: 40px;width: 40px;">
                        <label>${ud.name}</label>
                    </a>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle pr-5 ml-3" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
                            <i class="fas fa-cog"></i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/log">Sign out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="container mt-5 pt-5">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <c:forEach items="${list}" var="x">
                            <a href="finalnews?id=${x.id}">
                                <img class="card-img-top img-fluid" src="${pageContext.servletContext.contextPath}/images/news/${x.photos}" alt="News">
                                <h4 class="card-title">${x.title}</h4>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-6"></div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
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
    <title>Home</title>
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
    <div class="jumbotron-fluid">
        <img src="${pageContext.servletContext.contextPath}/images/newspaper.jpg" class="card-img img-fluid img-responsive" style="height: 800px;width: 100%;background-size: cover;opacity: 0.4;">
        <div class="container card-img-overlay d-flex flex-column text-center justify-content-center">
            <h1 class="display-1 pt-md-5"><b>NEWSGyan</b></h1>
            <p class="lead" style="font-size: 25px;"><b>Stay updated with current happenings.</b></p>
        </div>
    </div>
    <div class="container mt-5 pt-5">
        <h1 class="pb-3">Recent Posts</h1>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top img-fluid" src="${pageContext.servletContext.contextPath}/images/recent1.jpg" alt="Recent">
                    <div class="card-body">
                        <h4 class="card-title">Recent 1</h4>
                        <p class="card-text">Indian Air Force (IAF) personnel rehearse on a cold and foggy morning for the upcoming Republic Day parade at Vijay Chowk in New Delhi. (Raj K Raj/HT PHOTO).</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top img-fluid" src="${pageContext.servletContext.contextPath}/images/recent2.jpg" alt="Recent">
                    <div class="card-body">
                        <h4 class="card-title">Recent 2</h4>
                        <p class="card-text">Christianity Today’s blistering holiday broadside against Donald Trump highlights a long-term problem facing white evangelicalism: younger generations are dropping out, a problem some Christians say the movement’s association with Trump is only making worse.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top img-fluid" src="${pageContext.servletContext.contextPath}/images/recent4.jpg" alt="Recent">
                    <div class="card-body">
                        <h4 class="card-title">Recent 1</h4>
                        <p class="card-text">The entire state was peaceful," Uttar Pradesh DGP OP Singh was quoted as saying by PTI. He said there was no report of any untoward incident from anywhere in the state. The state was placed under a thick security cover with the deployment of central paramilitary forces in sensitive areas.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- For icons -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Title</title>
    <style type="text/css">
        #ver ul li{
            font-size: 23px;
        }
        label{
            color: white;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="jumbotron-fluid">
    <nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color: #314463">
        <a href="navbar-brand" href="#" class="text-left" style="font-size: 30px;color: white; font-family: Geneva;">NEWSGyan</a>
        <div class="navbar-nav" style="padding-left: 580px;">
            <h2 class="text-center d-block text-white" style="font-family: comic Sans MS;">Welcome To Admin Page</h2>
        </div>
        <ul class="navbar-nav" style="padding-left: 480px;">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbar-Dropdown" role="image" data-toggle="dropdown">
                    <img src="${pageContext.servletContext.contextPath}/images/profile.jpg" class="rounded-circle" style="height: 40px;width: 40px;">
                    <label>${username}</label>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbar-Dropdown">
                    <a class="dropdown-item" href="#">Profile</a>
                    <a class="dropdown-item" href="#">Settings</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/logout">Logout</a>
                </div>
            </li>
        </ul>
    </nav>
    <aside class="main-sidebar sidebar-dark-primary elevation-4 bg-dark" style="height: 100%; width: 300px; overflow: auto; position: fixed;">
        <div class="sidebar d-block" id="ver">
            <nav class="pt-3">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <li class="nav-item">
                        <a href="#" class="nav-link">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a href="manage" class="nav-link">Manage Articles</a>
                    </li>
                    <li class="nav-item">
                        <a href="addcategory" class="nav-link">Add Category</a>
                    </li>
                    <li class="nav-item">
                        <a href="blockuser" class="nav-link">Manage Blocked users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/news" id="navbarDropdown" role="button">
                            Add News
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">Settings</a>
                    </li>
                    <li class="nav-item">
                        <a href="/logout" class="nav-link">Logout</a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
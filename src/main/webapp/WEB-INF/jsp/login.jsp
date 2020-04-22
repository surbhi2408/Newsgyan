<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- For icons -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Registration form for new user in NEWSGyan</title>
    <style type="text/css">
        .form-control{
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-5" style = "background-color: darkcyan; padding-left: 150px; padding-top: 300px; padding-bottom: 250px;">
            <div class="row">
                <div class="col-2">
                    <i class="fas fa-globe" style="font-size: 40px;"></i>
                </div>
                <div class="col-10">
                    <h3>Know about different happenings around the world</h3>
                </div>
            </div>
            <div class="row pt-5 mt-4">
                <div class="col-2">
                    <i class="fas fa-book-reader" style="font-size: 40px;"></i>
                </div>
                <div class="col-10">
                    <h3>Read according to your interest</h3>
                </div>
            </div>
            <div class="row pt-5 mt-4">
                <div class="col-2">
                    <i class="fas fa-share-alt" style="font-size: 40px;"></i>
                </div>
                <div class="col-10">
                    <h3>Share the new happenings around you</h3>
                </div>
            </div>
        </div>
        <div class="col-lg-7 mt-2">
            <h1 class="ml-5 mb-4 mt-5 pl-5 text-info" style="font-family: 'Times New Roman'; font-size: 45px;"><b>NEWSGyan</b></h1>
            <h2 class="ml-5 mb-4 mt-3 pl-5 text-info" style="font-family: 'Times New Roman'; font-size: 38px;"><b>Login</b></h2>
            <h3 class="ml-5 pl-5" style="font-family: 'Comic Sans MS'; font-size: 35px;">READ...EXPLORE...CONNECT</h3>
            <p class="lead ml-5 mt-2 pl-5 pt-4 pb-4" style="font-size: 20px;"><b>Login for interesting news.....</b></p>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-7 pl-5">
                    <form action="login" method="post">
                        <input type="text" name="username" placeholder="username" class="form-control"><br>
                        <input type="password" name="password" placeholder="password" class="form-control"><br>
                        <button class="btn btn-large btn-info align-center">
                            <i class="fas fa-user">Login</i>
                        </button>
                    </form>
                    ${msg}
                    ${param.msg}
                </div>
                <div class="col-4"></div>
            </div>
            <p class="ml-5 pl-5 mt-4 lead">forgot password?
                <span>
                    <a href="forget" style="font-size: 23px;">reset</a><br>
                </span>
            </p>
            <p class="ml-5 pl-5 mt-4 lead">New User? Register here...</p>
            <a href="reg">
                <button class="btn btn-large btn-info" style="margin-left: 100px;">
                    <i class="fas fa-user">Sign Up</i>
                </button>
            </a>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
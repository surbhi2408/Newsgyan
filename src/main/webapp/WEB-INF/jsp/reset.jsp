<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- For icons -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>reset</title>
    <style type="text/css">
        .form-control{
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <div class="p-5 mb-5 bg-white shadow" style="margin: 90px 0px;">
                <div class="m-5">
                    <h1 class="text-info text-center pt-5" style="font-family: 'Times New Roman'; font-size: 45px"><b>NEWSGyan</b></h1>
                    <h1 class="text-info text-center pt-4 pb-4" style="font-family: 'Times New Roman'; font-size: 25px"><b>reset password</b></h1>
                    <form action="resetpass" method="post">
                        <input type="password" name="pass" placeholder="New Password" class="form-control mb-4">
                        <input type="password" name="pass1" placeholder="Confirm Password" class="form-control mb-4"><br>
                        <button class="btn btn-large btn-info">
                            <i class="fa fa-send">reset</i>
                        </button>
                    </form>
                    ${msg}
                </div>
            </div>
        </div>
        <div class="col-4"></div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
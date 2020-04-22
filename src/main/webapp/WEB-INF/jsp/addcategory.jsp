<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
</head>
<body>
<form action="_addcategory" method="post">
    <label>Category Name</label>
    <input type="text" name="category_name">
    <br>
    <label>Status</label>
    <input type="radio" name="status" value="0">Active
    <input type="radio" name="status" value="1"> Inactive
    <br><input type="submit" value="Submit">
</form>
</body>
</html>
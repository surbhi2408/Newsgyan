# Newsgyan

It is a web application made using Spring Framework as backend where the user can login and can read newspaper according tho the category selected.

The project has followed a 3-Layered Spring Architecture.

#### Controller Layer
The role of the controller is to get request from the web application and behave as a medium of API service between the backend and frontend. In the project, there are two Controllers added, "UserController" and "AdminController" which performs their tasks to provide services to User login and Admin login respectively.

#### Service Layer
The role of the Service layer is to act as a middle man between the Controller and the Repository and manipulate the data between them. It is the business layer of the Project.
The different actions performed by the User/Admin to manipulate the data is handled in the Service layer

#### Repository Layer
It is CRUD service of the project where different tables of the database are stored and are made available to the application.
1. AdminRepos : stores admin specific data
2. CategoryRepos : Different categories available
3. loginRepos : username and password for login credential for different users
4. newsRepos : stores the title of all the news
5. detailsRepos : stores the detailed news of each news

<p align="center">
  <img src="https://github.com/ashishgopalhattimare/Newsgyan/blob/master/src/main/webapp/images/spring-architecture.png" width="40%">
</p>
<p align="center"> <i>Fig 1.0 Spring Architecture Overview</i> </p>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored ="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
 <%@ include file="headerfilefreelancer.jsp" %>
</head>
<body>
<form action="updateProfileFreelancer" method="post" enctype="multipart/form-data">
<div class="container rounded bg-white mt-3 mb-2">
    <div class="row">

     <div class="col-md-3 border-right">
        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <img class="rounded-circle mt-5" width="130px" height="130px" src="./files/serverImgs/${sessionScope.loggedInFreelancer.profile}">
                <span class="font-weight-bold"><%= freelancer.getName() %></span>
                <span class="text-black-50">${freelancer.email}</span>
                <span class="mt-3">
                    <label for="profileImage">Update Profile</label>
                        <input type="file" name="profilef" accept="image/*" class="pl-5 ml-5" />
                </span>
        </div>
     </div>

        <div class="col-md-9 border-right" style="background-color:#4ea8de">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Freelancer Profile</h4><i class="fa-solid fa-user" style=" font-size: 42px;"></i>
                </div>
                
                
                <div class="row mt-2">
                    <div class="col-md-12"><label class="labels">Name of Freelancer</label>
                    <input type="text" class="form-control" placeholder="Enter name" name="name" value="${freelancer.name}"></div>
                </div>
                
                <input type="hidden" class="form-control" placeholder="first name" name="id" value="${freelancer.id}">
                <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Mobile Number</label><input type="text" class="form-control" placeholder="Enter phone number" name="number" value="${freelancer.number}"></div>
                    <div class="col-md-6"><label class="labels">Email Address</label><input type="text" class="form-control" placeholder="Enter email" name="email"  value="${freelancer.email}"></div>
                   <div class="col-md-6"><label class="labels">Linkedin</label><input type="text" class="form-control" placeholder="Enter Linkedin profile" name="linkedin" value="${freelancer.linkedin}"></div>
                    <div class="col-md-6"><label class="labels">Education</label><input type="text" class="form-control" placeholder="eg. B.Tech/BCA" name="education" value="${freelancer.education}"></div>
                     <div class="col-md-6"><label class="labels">Basic Charge for Work</label><input type="text" class="form-control" placeholder="eg. 30/35" name="charge" value="${freelancer.charge}"></div>
                     <div class="col-md-12"><label class="labels">Skills</label><input type="text" class="form-control" placeholder="Enter your skills" name="skills" value="${freelancer.skills}"></div>

                <div class="mt-5 text-center">
                    <button class="btn btn-primary profile-button" type="submit" style="background-color:#1a759f">Save Profile</button>
                </div>
                    &nbsp;
                <div class="mt-5 text-center"><a href="homeFreelancer"><button class="btn btn-primary profile-button" type="button" style="background-color:#1a759f"><i class="fa-solid fa-house"></i> &nbsp;Home</button></a></div>
            </div>
        </div>
       
    </div>
</div>
</div>
</form>
<%@ include file="footerfile.jsp" %>

<style>
body {
    background: rgb(99, 39, 120)
}

.form-control:focus {
    box-shadow: none;
    border-color: #BA68C8
}

.profile-button {
    background: rgb(99, 39, 120);
    box-shadow: none;
    border: none
}

.profile-button:hover {
    background: #682773
}

.profile-button:focus {
    background: #682773;
    box-shadow: none
}

.profile-button:active {
    background: #682773;
    box-shadow: none
}

.back:hover {
    color: #682773;
    cursor: pointer
}

.labels {
    font-size: 13px;
}




.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
}</style>


 
</body>
</html>
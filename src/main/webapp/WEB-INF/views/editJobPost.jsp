<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Edit-jobs details</title>
    
    <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>
       <script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>
    
 <style>
      html, body {
        background: linear-gradient(120deg, #b8c0ff, #83c5be);
        font-family: 'Roboto', sans-serif;
      }
      .navbar {
        padding: 9px 32px;
        box-shadow: 0 2px 8px #7b9adb59;
        padding-left:2rem;
      }
      .custom_nav-container a {
        display: flex;
        align-items: center;
        text-decoration: none;
      }
      .custom_nav-container img {
        height: 36px;
        margin-right: 8px;
      }
      .custom_nav-container span {
        color: #669999;
        font-weight: 700;
        font-size: 1.35rem;
        text-shadow: 0px 1px 2px #fff;
        letter-spacing: 1px;
      }
      .testbox {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        min-height: 100vh;
        padding: 32px 0;
      }
      form {
        width: 100%;
        max-width: 84%;
        margin: auto;
        background: rgba(255,255,255,0.98);
        border-radius: 20px;
        box-shadow: 0 6px 32px #66999949;
        padding: 42px 35px 32px 35px;
        animation: fadeInUp 1s cubic-bezier(.41,.63,.78,.22);
        position: relative;
        z-index: 2;
      }
      @keyframes fadeInUp {
        from {opacity: 0; transform: translateY(50px);}
        to {opacity: 1; transform: translateY(0);}
      }
      .banner {
        position: relative;
        height: 26rem;
        border-radius: 18px;
        overflow: hidden;
        margin-bottom: 34px;
        background-image: url('<c:url value="/files/images/bg.jpg"/>');
        background-size: cover;
        background-position: center;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #fff;
        box-shadow: 0 2px 18px #5e7fa4b7;
      }
      .banner::after {
        content: "";
        background: linear-gradient(to top right, #00000077 40%, #b8c0ff45 100%);
        position: absolute;
        width: 100%; height: 100%;
        left: 0; top: 0; z-index: 1;
      }
      .banner h1 {
        position: relative;
        z-index: 2;
        font-size: 2.1rem;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 16px;
        text-shadow: 1px 4px 15px #24293ad9;
        margin: 0 auto;
        padding: 0;
      }
      .banner i {
        color: #a7ffeb;
        animation: bounce 1.5s infinite alternate;
      }
      @keyframes bounce {
        to { transform: translateY(-6px) scale(1.15);}
        from { transform: translateY(0);}
      }
      .item, .question {
        margin-bottom: 22px;
        position: relative;
      }
      label {
        font-weight: 500;
        color: #385b61;
        margin-bottom: 5px;
        display: block;
        letter-spacing: 0.5px;
      }
      label span {
        color: #e57373;
      }
      input, textarea, select {
        width: 100%;
        padding: 8px 14px;
        border: 1px solid #d1e3e3;
        border-radius: 6px;
        transition: border 0.2s, box-shadow 0.2s;
        box-shadow: 0 1.5px 6px #bfd3d980;
        background: #f5f7ffb0;
        font-size: 16px;
        color: #395454;
        margin-top: 3px;
      }
      input:focus, textarea:focus, select:focus {
        border-color: #699;
        outline: none;
        box-shadow: 0 0 0 3px #b8c0ff55;
        background: #f9fdff;
        color: #253244;
      }
      textarea { min-height: 85px; resize: vertical; }
      .item small {
        font-size: 13px;
        color: #9aabb1;
        display: block;
      }
      .item h6 {
        font-size: 13px;
        color: #6d7b8a;
        margin: 7px 0 0 2px;
        font-style: italic;
      }
      .question-answer {
        display: flex;
        gap: 24px;
        margin-top: 9px;
      }
      .question label, .question-answer label.radio span {
        font-size: 1rem;
        color: #34565c;
        letter-spacing: 0.05em;
      }
      label.radio {
        position: relative;
        display: inline-flex;
        align-items: center;
        padding-left: 24px;
        min-height: 24px;
        cursor: pointer;
        user-select: none;
      }
      label.radio:before {
        content: "";
        position: absolute; left: 0; top: 2px;
        width: 18px; height: 18px;
        border-radius: 50%;
        border: 2px solid #b8c0ff;
        background: #fff;
        transition: border .2s;
      }
      input[type=radio]:checked + label.radio:before {
        border-color: #669999;
        background: #c7fff6;
        box-shadow: 0 0 4px #66999970;
      }
      label.radio span {
        margin-left: 3px;
      }
      .item input[type="radio"], .item input[type="checkbox"], .question input[type="radio"] {
        display: none;
      }
      input[type=radio]:checked + label.radio:after {
        content: "";
        position: absolute; left: 5px; top: 8px;
        width: 8px; height: 8px; border-radius: 50%;
        background: #669999;
        box-shadow: 0 0 8px #bdd7b3a0;
      }
      button[type="submit"] {
        width: 50%;
        margin: 35px auto 0 auto;
        height: 48px;
        border-radius: 48px;
        border: none;
        background: linear-gradient(88deg, #669999 60%, #83c5be 100%);
        color: #fff;
        font-size: 18px;
        font-weight: bold;
        box-shadow: 0 4px 18px #83c5be77;
        letter-spacing: 0.5px;
        transition: background 0.2s, transform 0.16s, box-shadow 0.2s;
        display: block;
      }
      button[type="submit"]:hover {
        background: linear-gradient(80deg,#b8c0ff,#83c5be);
        transform: translateY(-2px) scale(1.03);
        color: #135d63;
        box-shadow: 0 6px 28px #b8c0ff65;
      }
      h4 {
        text-align: center;
        color: #e77777;
        letter-spacing: 0.6px;
        font-size: 1.05rem;
        margin-top: 10px;
        margin-bottom: 0px;
      }
      /* Responsive tweaks */
      @media (max-width: 680px) {
        form {
          padding: 20px 8px 22px 8px;
          max-width: 97vw;
        }
        .banner { font-size: 1.12rem; }
      }
    </style>
    
  </head>
  <body>
  <nav class="navbar navbar-expand-lg custom_nav-container">
        <a class="" href="homeCompany">
          <img src="./files/images/logo.png" alt="" />
          <span>Talent Portal</span>
        </a><br>
      </nav>
    <div class="testbox">

      <form action="/TalentPortal/updateJobPost" method="post">
        <div class="banner">
        <h1>Update Post job <i class="fa-solid fa-briefcase"></i> ,What you need done?</h1>
        </div>
        
        <div class="colums">
          <div class="item">
            <label for="fname">Job description<span>*</span></label>
            <textarea id="myTextArea" name="description" rows="4"  cols="50">${jobPost.description}
          </textarea>
          </div>
          <div class="item">
            <label for="lname">Job Tittle<span>*</span></label>
            <input type="text" id="fileInput" name="title" value=" ${jobPost.title}" placeholder="Software Engineer">
             <br>
          </div>
          <br><br>
          <div class="item">
            <label for="address1">Relevent skills need for this job?<span>*</span></label>
            <br>
            <small>Enter up to 5 skills that best describe your project. Freelancers will use these skills to find projects they are most interested and experienced in.</small>
            <input id="address1" height="50px"  value=" ${jobPost.skills}"   name="skills" required/>
            <h6>Suggested skills:
              MySQL,
              Web Hosting,
              Software Testing,
              Engineering,
              Software Architecture</h6>
          </div>
          <br><br>

        <div class="question">
          <label>How would you like to get it done?</label>
        <div class="question-answer">
          <div>
            <input type="radio" value="Full Time Role" id="radio_1" name="role"
              ${jobPost.role == 'Full Time Role' ? 'checked' : ''} />
            <label for="radio_1" class="radio"><span>Full Time Role</span></label>
          </div>
          <div>
            <input type="radio" value="Freelancing" id="radio_2" name="role"
              ${jobPost.role == 'Freelancing' ? 'checked' : ''} />
            <label for="radio_2" class="radio"><span>Freelancing</span></label>
          </div>
        </div>
        </div>
        <div class="question">
          <label>What is your estimated budget or Salary?</label>
           <input  type="text"  name="salary" value=" ${jobPost.salary}" placeholder="10000,20000"/>

            <input  type="hidden"  name="email" value="${company.email}"/ readonly>
            <input  type="hidden"  name="name" value="${company.name}"/ readonly>
            <input  type="hidden"  name="id" value="${jobPost.id}"/ readonly>

          <br>
        </div>
         
        <button type="submit">Update <i class="fa-solid fa-file-pen"></i></button>
        
        </div>
      </form>
    </div>
  </body>
</html>
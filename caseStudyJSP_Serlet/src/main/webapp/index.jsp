<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 20-Apr-22
  Time: 8:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>home</title>
  <link rel="stylesheet" href="/static/bootstrap413/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/static/css/nav.css">
  <link rel="stylesheet" href="/static/css/home.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container-fluid border-bottom border-dark">
  <div class=" row p-2 container-fluid d-flex justify-content-between ">
    <div class="d-flex align-items-center">
      <a href=""><img src="static/image/logo.png" alt="" width="70px"></a>
    </div>
    <div class="d-flex align-items-center">
      <a href="">Đăng nhập <i class="fa fa-sign-in"></i></a>
    </div>
  </div>
</div>

<div class="container-fluid border-bottom border-dark">
  <div class="row d-flex justify-content-between p-2 bg-light">
    <div class="d-flex align-items-center ">
      <nav class="navbar navbar-expand-sm">

        <!-- Links -->
        <ul class="navbar-nav ">
          <li class="nav-item">
            <a style="background: #3b5998;color: white" class="hover nav-link pr-2 pl-2 border-right border-dark" href="/">Trang chủ</a>
          </li>
          <li class="nav-item">
            <a class="hover nav-link pr-2 pl-2 border-right border-dark" href="/employees">Nhân viên</a>
          </li>
          <li class="nav-item">
            <a class="hover nav-link pr-2 pl-2 border-right border-dark" href="/customers">Khách hàng</a>
          </li>
          <li class="nav-item">
            <a class=" hover nav-link pr-2 pl-2 border-right border-dark" href="/facilitys">Dịch vụ</a>
          </li>
          <li class="nav-item">
            <a class="hover nav-link pr-2 pl-2 " href="#">Hợp đồng</a>
          </li>
        </ul>

      </nav>
    </div>
    <div class="d-flex align-items-center">
      <form action="" class="p-0 border">
        <input type="search" name="search" style="border-radius: 10px" placeholder="input to search">
        <input type="submit">
      </form>
    </div>
  </div>
</div>

<div class="container-fluid border-bottom border-dark">
  <div class="row">
    <div class="col-3 border-right border-dark" id = "container-logIn">
      <br>
      <br>
      <div class="container" id ="log-in">
        <h2>Đăng nhập</h2>
        <form action="/?status=signUp" method="post">
          <div class="form-group">
            <label for="email">Tên người dùng:</label>
            <input type="email" value="${name}" class="form-control" id="email" placeholder="Enter email" name="userName">
          </div>
          <div class="form-group">
            <label for="pwd">Mật khẩu:</label>
            <input type="password" value="${ps}" class="form-control" id="pwd" placeholder="Enter password" name="userPassword">
          </div>
          <div class="form-group form-check">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" name="remember"> Remember me
            </label>
          </div>
          <button type="submit" class="btn btn-primary">Đăng nhập</button>
          <a href="/?status=signIn" class="btn btn-primary">Đăng ký</a>
        </form>
      </div>
    </div>
    <div class="col-9">
      <br>
      <br>
      <div id="demo" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
          <li data-target="#demo" data-slide-to="0" class="active"></li>
          <li data-target="#demo" data-slide-to="1"></li>
          <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="1.jpg" alt="Los Angeles" width="1100" height="500">
            <div class="carousel-caption">
              <h3>Los Angeles</h3>
              <p>We had such a great time in LA!</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="2.jpg" alt="Chicago" width="1100" height="500">
            <div class="carousel-caption">
              <h3>Chicago</h3>
              <p>Thank you, Chicago!</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="3.jpg" alt="New York" width="1100" height="500">
            <div class="carousel-caption">
              <h3>New York</h3>
              <p>We love the Big Apple!</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="/static/image/m_furama-4.jpeg" alt="New York" width="1100" height="500">
            <div class="carousel-caption">
              <h3>New York</h3>
              <p>We love the Big Apple!</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>
    </div>
  </div>
</div>

<div class="container-fluid">
  <div class="row d-flex justify-content-center">
    <div align="center">
      <p>Địa chỉ: xxx</p>
      <p>Số điện thoại khẩn cấp:090-XXX-XXX</p>
      <p>Số điện thoại các phòng ban:0236-XXX-XXX</p>
    </div>
  </div>
</div>


<script src="/static/bootstrap413/js/bootstrap.min.js"></script>
<script src="/static/bootstrap413/js/bootstrap.bundle.js"></script>
<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/bootstrap413/js/popper.min.js"></script>

<script>
  function matrixChar(){
    let login=document.getElementById("container-logIn");
    login.style.position="relative";
    login.style.overflow="none";
    let link =  Math.floor(Math.random()*3);
    let div =  document.createElement("div");
    div.style.position = ""
    let logIn=document.getElementById("log-in");
    logIn.appendChild(div);
    if(link == 0){
      div.innerHTML = "<img src='static/image/snow3.png' width='50%' alt='hoa lá đỏ'>";
    };
    // if(link == 1){
    //     div.innerHTML = "<img src='/static/image/snow.png' alt='hoa lá đỏ'>";
    // };
    // if (link == 2){
    //     div.innerHTML = "<img src='/static/image/snow2.png' alt='hoa lá đỏ'>";
    // };
    var posX =  Math.random()*98;
    div.style.left = posX + "%";
    div.style.top = "0";
    var speed = Math.random()*10;
    div.style.transition = "all "+speed+"s linear 0s";
    div.style.left = div.offsetLeft - 50 + 'px';
    div.style.top = "103vh";
    div.style.opacity = 0;
    div.style.display = "none";
    setTimeout(function(){
      logIn.removeChild(div);
    },500);
  }
  setInterval(matrixChar,200);
</script>
</body>
</html>

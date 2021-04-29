<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="../list/image/small_logo_icon.png">
<link rel="stylesheet" href="../list/css/styles.css"/>
<style>


header{

	background-image: url("../list/image/highway_3.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}

.result_box{
	width: 80%;
	height: 550px;
	display: grid;
	grid-template-columns: 250px 30px auto;
	background-color: rgba(215, 251, 232, 0.6);
	padding: 20px 30px;
	position: relative; /* 위치 이동 */
	top: 20px;
	left: 100px;
	
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);

}

.left_section{
	margin-left: 90px;
}

.left_section ul{
	height: 100px;

}


.left_section ul li{
	list-style:none;
	line-height: 70px;
	
	
}
.left_section ul li a{
	color: hotpink;
	text-decoration: none;
	list-style-type : none;

	
	cursor: pointer;
}

.right_section{
	background-color: rgba(68,114,196, 0.4);
	padding:0;
	margin:0;
}

.right_section p{
	color:white;
	padding: 20px;
	line-height:35px;
}
::-webkit-scrollbar{
	widht:25px;
}
::-webkit-scrollbar-track{
	border:7px solid #232943;
	box-shadow: inset 0 0 2.5px 2px rgba(0,0,0,0.5);
}
::-webkit-scrollbar-thumb{
	background: #f00;
	border-radius: 3px;
}


#vertical{
	width: 5px;
	height: 80%;
	background-color: black;
}

#section1{
    width: 20%;

}

#section2{
    margin: 30px;
    padding: 30px;
    width: 20%;
    
}
#section3{
    margin: 30px;
    padding: 30px;
    width: 60%;
    
}


.main_search_link h1 {
	color: white;
	font-size: 22px;
}
</style>
</head>
<body><!-- block: 사이즈 완전 딱 맞게, 즉 높이랑 넓이 모두 조정 / inline-block: 넓이는 줄고, 높이는 그대로! -->
		<header> <!-- 전체 -->
		<nav class = "menu_section"> <!-- 최상단 ~ 로고 있는 부분 하나 / 메뉴 있는 부분 하나 해서 두 개로 나눔 -->
		  <div class = "logo"><button type="button"><img src="../list/image/logo1.png" alt="로고가 있는 자리" width = "100" height = "44"></button><svg width="102" height="32" fill="currentcolor" style="display:inline-block"></svg></div>
		  <div class = "menu">
		  	<ul class = "login_and_out">
		  	<%
		  		Object user_id = session.getAttribute("user_id");
				if(user_id == null){
			%> 
		  		<li><button class = "button_wrap" type = "button" onclick = "location.href='../user/loginChk'">로그인</button></li>
		  	<%
				} else {
		  	%>
		  		<li><button class = "button_wrap" type = "button" onclick = "location.href='../mypage/MyPage.jsp'">마이페이지</button></li>
		  		<li><button class = "button_wrap" type = "button" onclick = "location.href='logout'">로그아웃</button></li>
		  	<%
				}
		  	%>	
		  	</ul>
		  </div>
		</nav>
	
	
		<section> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
		  <div class = "main_search_link">
		  	<h1>조회 결과</h1>
		  
		  </div>
		</section>
		
		<section class = "result_box">
			<section id="section1"> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
			  <div class = "left_section">
		
					<li><input type="checkbox" name="region" id="region" value="부산"/></li>
					<li><a href="#">cdb</a></li>
					<li><a href="#">efd</a></li>
					<li><a href="#">gwt</a></li>
					<li><a href="#">sdc</a></li>
					<li><a href="#">bzjo</a></li>
				</ul>
			  	
			  </div>
			</section>
			
			<section id = "vertical"></section>
			<section id="section2"> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
			  <div class = "middle_section">
		
					<li><input type="checkbox" name="good" id="good" value="추천순"/></li>
					<li><a href="#">cdb</a></li>
					<li><a href="#">efd</a></li>
					<li><a href="#">gwt</a></li>
					<li><a href="#">sdc</a></li>
					<li><a href="#">bzjo</a></li>
				</ul>
			  	
			  </div>
			</section>
			<section id = "vertical"></section>
			<section id="section3">
			  <div class = "right_section" style="overflow:scroll; width: 800px; height: 400px;">
			 	<h2>검색 결과</h2>
				  <main>
				  <c:forEach var="search" items="${servicesearch}" > 
				  	<div id = result_section>
				  		<p><a href="../detail/selectDetail?area_num=${search.area_num }">휴게소명: ${search.area_name }</a></p>
				  	</div>
				  </c:forEach>
		
				  </main>	  	
			  </div>
			</section>
		</section>
	</header>
	
	
</body>
</html>
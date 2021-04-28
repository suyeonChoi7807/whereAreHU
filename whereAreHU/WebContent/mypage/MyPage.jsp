<%@page import="model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script>

	
	$(function(){
		 tabBtn = document.querySelectorAll(".nav ul li");
		 tab = document.querySelectorAll(".tab");
		 
		 bio = document.querySelector(".bio");
		 bioMore = document.querySelector("#see-more-bio");
		 //bioLength = bio.innerText.length;
		 
		 $(".nav ul li").click(function() { 
			  $(this)
			    .addClass("active")
			    .siblings()
			    .removeClass("active");
		});
		
		 
	});

	

	function tabs(panelIndex) {
		//alert(panelIndex);
		//console.log(tab[panelIndex]);
		/*
	    tab.forEach(function(node) {
	   		node.style.display = "none";
	 
	    }); 
	  tab[panelIndex].style.display = "block";
	*/
	  //bioText();
	  //if (document.querySelector(".alert-message").innerText > 9) {
		//  document.querySelector(".alert-message").style.fontSize = ".7rem";
		//}
	  
	   
	  
	//회원정보 수정 하는 AJAX (0)
	  if(panelIndex==0){
		  $.ajax({
			  url:"changeByUserList",
			 
			  success:function(responseData){
				  alert(responseData);
				  $("#here").html(responseData);
			  }
		  });
	  }
	  
	  //리뷰 조회 리스트 끌어다 오는 AJAX (1)
	  else if(panelIndex==1){
		  $.ajax({
			  url:"reviewByUserList",
			  data: {"user_id":"${user_id}"},
			  success:function(responseData){
				  alert(responseData);
				  $("#here").html(responseData);
			  }
		  });
	  }
	  
	//좋아요 조회 리스트 끌어다 오는 AJAX (2)
	else if(panelIndex==2){
		  $.ajax({
			  url:"GoodByUserList",
			  data: {"user_id":"${user_id}"},
			  success:function(responseData){
				  alert(responseData);
				  $("#here").html(responseData);
			  }
		  });
	  }
	
	//회원탈퇴 하는 AJAX (3)
	else if(panelIndex==3){
		  $.ajax({
			  url:"Deleteuser",
			  data: {"user_id":"${user_id}"},
			  success:function(responseData){
				  alert(responseData);
				  $("#here").html(responseData);
			  }
		  });
	  }
	
	 
	
	
	}
	
	
	
	
	
	
	
 
	

	function bioText() {
	   
	  bio.oldText = bio.innerText;

	  bio.innerText = bio.innerText.substring(0, 100) + "...";
	  bio.innerHTML += `<span onclick='addLength()' id='see-more-bio'>See More</span>`;
	}
//	        console.log(bio.innerText)

	

	function addLength() {
	  bio.innerText = bio.oldText;
	  bio.innerHTML +=
	    "&nbsp;" + `<span onclick='bioText()' id='see-less-bio'>See Less</span>`;
	  document.getElementById("see-less-bio").addEventListener("click", () => {
	    document.getElementById("see-less-bio").style.display = "none";
	  });
	}
	

</script>
	
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</head>
<body>
    
	<div class="container">
		<div class="profile-header">
			<div class="profile-img">
				<img src="./img/login_icon1.png" width="200" alt="Profile Image">
			</div>
			<div class="profile-nav-info">
				<h3 class="user-name">MYPAGE</h3>


			</div>
			<div class="profile-option">
				<div class="notification">
					<i class="fa fa-bell"></i> <span class="alert-message">23</span>
				</div>
			</div>
		</div>
	</div>
	<div class="main-bd">
		<div class="left-side">
			<div class="profile-side">
				<div>
				<p>${username}님 환영합니다</p>
				
				<br>
					<ul id="UserInfo">
						
						<li><label for="user_id">아이디</label> ${user_id}</li>
						<li><label for="user-name">이름</label> ${username}</li>
						<li><label for="mail">이메일</label> ${user_email }</li>
						<li><label for="phone">연락처</label> ${user_phone}</li> 
					</ul>
					<br>
				</div>
				<div class="profile-btn">
					<button class="chatbtn" id="chatBtn" onclick = "location.href='../list/logout'">
						<i class="fa fa-comment"></i> 로그아웃
					</button>

				</div>
				<div class="user-rating">
					<h3 class="rating">4.5</h3>
					<div class="rate">
						<div class="star-outer">
							<div class="star-inner">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</div>
						<span class="no-of-user-rate"><span>123</span>&nbsp;&nbsp;reviews</span>
					</div>

				</div>
			</div>

		</div>
		
		
		
		
		
		<div class="right-side">

			<div class="nav">
				<ul>
					<li onclick="tabs(0)" class="userInfo">회원정보수정</li>
					<li onclick="tabs(1)" class="review">리뷰조회</li>
					<li onclick="tabs(2)" class="starview">좋아요조회</li>
					<li onclick="tabs(3)" class="out">회원탈퇴</li>
				</ul>
			</div>
			
			
			<div class="profile-body" id="here">
			
			 여기
			 
			
			
			
				 <div class="profile-user tab">
					<!--<h1>회원정보 수정</h1>
					<div>
						<ul id="ChangeInfo">
							<li><label for="user_id">아이디</label> <input type="text"
								id="user_id" readonly="readonly"></li>
							<li><label for="user-name">이름</label> <input type="text"
								id="user-name" readonly="readonly"></li>

							<li><label for="mail">이메일</label> <input type="email"
								id="mail" readonly="readonly"></li>
							<li><label for="phone">연락처</label> <input type="tel"
								id="phone" readonly="readonly"></li>
						</ul>
					</div>-->
				</div> 

				<div class="profile-reviews tab">
					<!-- <h1>내가쓴 리뷰 확인하기</h1>
					<table class="reviewCheck">
						<thead>
							<tr>
								<th>리뷰내용</th>
								<th>사진</th>
								<th>별점</th>
								<th>작성일자</th>

							</tr>
						</thead>
					</table> -->

				</div>
				<div class="profile-good tab">
					<!-- <h1>내가누른 좋아요 확인하기</h1>
					<table class="goodCheck">
						<thead>
							<tr>
								<th>휴게소 정보</th>
							</tr>
						</thead>
					</table> -->
				</div>
				<div class="profile-out tab">
					<!-- <h1>만족할만한 서비스 였나요?</h1>
					<textarea rows="13" cols="60"
						style="resize: none; font-size: 20px; border-color: green;"
						placeholder="후기 남겨주세요"></textarea>
					<div>
						<a><button class="outButton1" type="submit">탈퇴하기</button></a>
						<button class="outButton2" type="submit">뒤로가기</button>
					</div> -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon2.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

</head>

<style>
	table { width : 100%; }
	
	td {
		padding : 5px 10px; /* 좌우로는 10px 여백 아래위로는 5px여백 */
		text-align : center;
		&:nth-of-type(1) {
		background : black;
		color : white;
		border : 1px solid white;
		}	
	}
	tr:last-child > td {
		background: white;
		border : 1px solid black;
	}
	
/* 	td:nth-of-type(1) {
		background : black;
		color : white;
		border : 1px solid white;
	} */
	
	input[type=text] { /* 텍스트 박스 크기  */
		width : 100%;
	}
	
	input[type=number] { /* number버튼 크기 */
		width : 100%;
	}
	
	input[type=submit], input[type=button] {
		width : 100px;
	}
</style>
<body>
	<main> 
		<h2>사용자 수정</h2> 
		<form action="/Users/Update" method="post">
			<table>
				<tr>
					<td><span class ="red">*</span>사용자 아이디</td>
					<td><input type="text" name="userid" value="${ user.userid }" readonly /></td><!-- user.userid 앞의 user은 UserDto user = userMapper.getUser(userDto); 정의된 user이다 -->
				</tr>
				<tr>
					<td><span class ="red">*</span>바꿀 비밀번호</td>
					<td><input type="password" id="passwdold"/></td>
				</tr>
				<tr>
					<td><span class ="red">*</span>새 비밀번호</td>
					<td><input type="password" name="passwd" id="passwd" /></td>
				</tr>
				<tr>
					<td><span class ="red">*</span>새 비밀번호 확인</td>
					<td><input type="password" id="passwd2" /></td>
				</tr>
				<tr>
					<td><span class ="red">*</span>이름</td>
					<td><input type="text" name="username" value="${ user.username }" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="${ user.email }" /></td>
				</tr>
				<tr>
					<td>포인트</td>
					<td>${ user.upoint }</td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${ user.regdate }</td>
				</tr>
			
				<tr>
					<td colspan="2">
					<input type="submit" value="수정" />
					<input type="button" value="목록" 
					   onclick="window.location.href='/Menus/List'"/> 
					        <!-- Location은 검색창을 뜻함 -->
					</td>
				</tr>
			</table>
		</form> 
	</main>
		<!-- Javascript 코딩  -->
	<script>
	  const formEl      = document.querySelector('form');
	  const useridEl    = document.querySelector('[name="userid"]');
	  const passwdoldEl = document.querySelector('#passwdold');
	  const passwdEl    = document.querySelector('#passwd');
	  const passwd2El   = document.querySelector('#passwd2');
	  const usernameEl  = document.querySelector('[name="username"]');
	  
	  formEl.addEventListener('submit', function( e ) {
		  
			// 아이디값을 체크  
			if( useridEl.value.trim() == '' ) {
				alert('아이디를 입력하세요');
				useridEl.focus();
				e.preventDefault()   // 이벤트를 취소
				e.stopPropagation()  // 이벤트를 버블링 방지
				return;
			}
			
			// 옛날 비밀번호 입력 체크
			if( passwdoldEl.value.trim() == '' ) {
				alert('옛날 비밀번호를 입력하세요');
				passwdoldEl.focus();
				e.preventDefault()   // 이벤트를 취소
				e.stopPropagation()  // 이벤트를 버블링 방지
				return;
			}
			// 옛날 비밀번호 와 조회된 비밀번호 user.passwd 체크
			if( passwdoldEl.value != '${ user.passwd }' ) {
				alert('옛날 비밀번호가 틀립니다');
				passwd2El.focus();   // passwd는 맞다 생각을 전제하에 passwd2가 일치하는지 확인
				e.preventDefault()   // 이벤트를 취소
				e.stopPropagation()  // 이벤트를 버블링 방지
				return;
			}
			
			// 비밀번호값을 체크  
			if( passwdEl.value.trim() == '' ) {
				alert('비밀번호를 입력하세요');
				passwdEl.focus();
				e.preventDefault()   // 이벤트를 취소
				e.stopPropagation()  // 이벤트를 버블링 방지
				return;
			}
			
			// 비밀번호 확인을 체크  
			if( passwd2El.value.trim() == '' ) {
				alert('비밀번호 확인을 입력하세요');
				passwd2El.focus();
				e.preventDefault()   // 이벤트를 취소
				e.stopPropagation()  // 이벤트를 버블링 방지
				return;
			}
			
			// 비밀번호 == 비밀번호 확인 체크  
			if( passwdEl.value != passwd2El.value ) {
				alert('비밀번호가 일치하지 않습니다');
				passwd2El.focus();   // passwd는 맞다 생각을 전제하에 passwd2가 일치하는지 확인
				e.preventDefault()   // 이벤트를 취소
				e.stopPropagation()  // 이벤트를 버블링 방지
				return;
			}
			
			// 이름값을 체크  
			if( usernameEl.value.trim() == '' ) {
				alert('이름을 입력하세요');
				usernameEl.focus();
				e.preventDefault()   // 이벤트를 취소
				e.stopPropagation()  // 이벤트를 버블링 방지
				return;
			}
			  
	  });
	
	</script>
	
</body>
</html>
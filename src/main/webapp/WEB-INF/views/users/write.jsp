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
	
	input[type=password], input[type=email] { /* number버튼 크기 */
		width : 100%;
	}
	
	input[type=submit], input[type=button] {
		width : 100px;
	}
	
	input[type=date] {
		width : 100%;
		text-align: center;
	}
	
	input[name=userid]{
		width: 70%
	}
</style>
<body>
	<main> 
		<h2>사용자 등록( ${ msg } )</h2> <!-- ${ msg } 는 UserController의 	mv.addObject("msg", "승민이");을 의미 --> 
		<form action="/Users/Write" method="post"> <!-- method = get은 주소의 내용을 모두 보여주지만 method = post는 내용을 숨겨서 보내준다  -->
			<table>
				<tr>
					<td><span class="red">*</span> 사용자 아이디</td>
					<td>
					<input type="text" name="userid" />
					<input type="button" id="dupCheck1" value="중복확인(새창)" /> 
					<input type="button" id="dupCheck2" value="중복확인(Ajax)" /> 
					</td>
					
				</tr>
				<tr>
					<td><span class="red">*</span> 비밀번호</td>
					<td><input type="password" name="passwd" id="passwd" /></td>
				</tr>
				<tr>
					<td><span class="red">*</span> 비밀번호 확인</td>
					<td><input type="password" id="passwd2" /></td>
				</tr>
				<tr>
					<td><span class="red">*</span> 이름</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" /></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="추가" />
					<input type="button" value="목록" 
					   onclick="location.href='/Users/List'"/> 
					        <!-- Location은 검색창을 뜻함 -->
					</td>
				</tr>
			</table>
		</form> 
	</main>
	<!-- Javascript 코딩  -->
	<script>
		
	  var   idDupChecked = false;
	
	  const formEl     = document.querySelector('form');
	  const useridEl   = document.querySelector('[name="userid"]');
	  const passwdEl   = document.querySelector('#passwd');
	  const passwd2El  = document.querySelector('#passwd2');
	  const usernameEl = document.querySelector('[name="username"]');
	  
	  // 아이디중복확인(새 창 열기)
	  
	  // 입력항목체크
	  formEl.addEventListener('submit', function( e ) {
		  
			// 아이디값을 체크  
			if( useridEl.value.trim() == '' ) {
				alert('아이디를 입력하세요');
				useridEl.focus();
				e.preventDefault()   // 이벤트를 취소
				e.stopPropagation()  // 이벤트를 버블링 방지
				return;
			}
			
			// 아이디 중복확인여부 체크
			 if( !idDupChecked ) {
				alert('아이디 중복확인을 하세요')
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
	
	
	<script>
		// 아이디 중복확인1(새 창 열기)
		const btnDup1El = document.querySelector('#dupCheck1')
		btnDup1El.addEventListener('click', function() {
			//alert('ok1')			
		} )
	</script>
	
	<script>
		// 아이디 중복확인2(Ajax)
		const btnDup2El = document.querySelector('#dupCheck2')
		btnDup2El.addEventListener('click', function() {
			if(useridEl.value.trim()==''){
				alert('아이디를 입력하세용')
				useridEl.focus()
				return ;
			}
			
			//alert('ok2')	
			let url = '/Users/IdDupCheck2?userid=' + useridEl.value
			fetch(url)
		      .then(response => response.json())
		      .then( data => {
		    	  console.log(data)
		    	  if(data.userid != null) {
		    		  alert('사용불가능')
		    		  idDupChecked= false;
		    	  }
		    	  else {
		    		  alert('사용가능')
		    		  idDupChecked= true;
		    	  }
		      });
		} )
		
		// userid 의 value 가 바뀌면 idDupChecked = false;
		useridEl.addEventListener('change', function() {  // 하나라도 바뀌면 계속 false나가다가 확인을 받고나서는 true로 change된다
			idDupChecked = false;
		})
		
	</script>
</body>
</html>
















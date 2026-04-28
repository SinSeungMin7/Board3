<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib  prefix="c"  uri="jakarta.tags.core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon2.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

<style>
	table {width : 100%;}
	
	td {
		padding : 5px;
		text-align : center;
	}
	
	tr:first-child{
		background-color: black;
		color : white;
		td {
			border : 1px solid white;
		}
	}
	
	tr:nth-of-type(2) td {
		text-align : right;
		padding-right : 20px;	
	}
	
	main {
		margin-bottom : 150px;
	}
</style>

</head>
<body>
	<main>
	  <h2>회원 목록 ${msg} </h2>
	  <table>
	    <tr>
	      <td>Userid</td>
	      <td>Username</td>
	      <td>Email</td>
	      <td>Upoint</td>
	      <td>Regdate</td>
	      <td>삭제</td>
	      <td>수정</td>
	    </tr>
	     <tr>
	      <td  colspan="7">
	       [<a href="/Users/WriteForm">사용자 등록</a>]&nbsp;&nbsp;&nbsp;  
	       [<a href="/">Home</a>] 
	      </td>
	    </tr>	    
	    <c:forEach  var="user"  items="${ userList }">
	    <tr>
	      <td> ${ user.userid   }  </td> <!-- menu.getMenu_id() 호출하게된다 즉 입력한 값을 기억하는 변수 -->
	      <td> ${ user.username }  </td>
	      <td> ${ user.email    }  </td>
	      <td> ${ user.upoint   }  </td>
	      <td> ${ user.regdate  }  </td>
	      <td> <a href="/Users/Delete?userid=${user.userid}">삭제</a>  </td>
	      <td> <a href="/Users/UpdateForm?userid=${user.userid}">수정</a>  </td>
	    </tr>
	    </c:forEach>
	  </table>	
	</main>
</body>
</html>










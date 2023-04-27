<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>웹사이트</title>
    <style type="text/css">
    * {
    margin: 0px;
}
.head-container{
    background: rgb(216, 216, 216);
    text-align: center;
    padding: 40px;
}

.head-date{
    color: rgb(114, 114, 114);
    font-weight: 100;
    font-size: 13px;
    margin-bottom: 20px;
}
.head-title {
    font-weight: 600;
    font-size: 30px;
    color: rgb(65, 65, 65);
    margin-bottom: 20px;
}
.head-summary{
    color: rgb(114, 114, 114);
    font-weight: 400;
    font-size: 14px;
}

.main-container {
    display: flex;
    justify-content: center;
    flex-direction: column;
    flex-wrap: wrap;
    align-items: center;
}
.main-card{
    display:flex;
    justify-content: center;
    padding: 30px 0px;
    border-bottom: 2px solid rgb(170, 170, 170);

    width: 750px;
    border-width: 30%;
}
.card-photo{
    width: 250px;
    height: 250px;
}
.card-photo-img{
    width: 100%;
}
.card-content{
    padding: 0px 20px;
    width: 460px;
    height: 250px;
    word-wrap: break-word;
}
.card-content-title{
    color:rgb(59, 59, 59);
    font-size: 22px;
}
.card-content-address{
    margin: 7px 0px;
    color:rgb(80, 80, 80);
    font-size: 12px;
}
.card-content-review{
    color:rgb(31, 31, 31);
    font-size: 12px;
    height: 130px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 8;
    -webkit-box-orient: vertical;
}
.card-content-button{
    margin-top: 30px;
    text-align: right;
}
.card-content-button button {
    border: none;
    background-color: transparent;
    font-size: 11px;
    color: rgb(71, 71, 71);
    cursor: pointer;
    transition: 0.2s;
}
.card-content-button button:hover {
    color:red;
    border: 1px solid red;
    border-radius: 15px;
}

.nickname{
    
}
    </style>
</head>
<body>
    <div>
        <div class="head-container">
            <div class="head-date">
                <p><a href="${pageContext.request.contextPath }/food/add.do"><button>맛집등록</button></a> | 2022-08-27</p> 
            </div>
            <div class="head-title">
                <p>분당 맛집 베스트 50곳</p>
            </div>
            <p class="head-summary">
                "이렇게 실력있는 맛집이 많았다고?!"
            </p>
        </div>
        <c:forEach var="vo" items="${list }">
        <div class="main-container">
            <div class="main-card">
                <div class="card-photo">
                    <img class="card-photo-img" src="${vo.pic1 }">
                </div>
                <div class="card-content">
                    <div class="card-content-title">
                        <p>${vo.num }. ${vo.name }</p>
                    </div>
                    <div class="card-content-address">
                        <p>${vo.address }</p>
                    </div>
                    <div class="card-content-review">
                        <p><b class="nickname">[전화번호=> ${vo.phone}]</b> ${vo.content}</p>
                    </div>
                    <div class="card-content-button">
                        <button>${vo.name } 더보기 ></button>
                    </div>
                </div>

            </div>
           	</c:forEach>
            <Container>
                <div>
                    
                </div>
            </Container>
        </div>
    </div>
</body>
</html>
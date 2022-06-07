<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-06-07
  Time: 오전 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>펀키트</title>
    <style>
        .mypage_top{
            width: 100%;
            height: 230px;
            background: #efefef;
            display: flex;
            justify-content: center;
            margin-bottom: 60px;

        }
        .container{
            width:100%;
            display: flex;
            justify-content: center;
            flex-direction: column;
        }
        .mypage_top_content_box{
            width: 780px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .profile_img_box{
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: skyblue;
            margin-right: 16px;
        }
        .profile_box{
            display: flex;
            align-content: center;
            align-items: center;
        }
        .menu_box a{
            font-size: 14px;
            color: #888888;
            text-decoration: none;
        }
        .menu_box a:nth-child(2){
            margin-left: 16px;
        }

        .mypage_bottom{
            width: 100%;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        .mypage_bottom_container {
            width: 780px;
        }

        .user_info_container{
            display: flex;
            justify-content: space-between;
            width: 500px;
            margin: 0 auto;
            align-items: center;
        }
        .user_info_text_box{
            display: flex;
            flex-direction: column;
            align-items: center;
            cursor: pointer;
        }

        .user_info_border{
            border-right: 1px solid #cccccc;
            height: 50px;
        }

    </style>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <div class="container">
        <div class="mypage_top">
            <div class="mypage_top_content_box">
                <div class="profile_box">
                    <div class="profile_img_box"></div>
                    <div>
                        <h1>${member.name}님</h1>
                        <p>개인회원</p>
                    </div>
                </div>
                <div class="menu_box">
                    <a href="">회원정보 수정</a>
                    <a href="">결제정보 설정</a>
                </div>
            </div>
        </div>
        <div class="mypage_bottom">
            <div class="mypage_bottom_container">
                <div class="user_info_container">
                    <a href="/myfunkit/individual/funding">
                        <div class="user_info_text_box">
                            <h1>${orderCount}</h1>
                            <p>펀딩</p>
                        </div>
                    </a>
                    <div class="user_info_border"></div>
                    <div class="user_info_text_box">
                        <h1>0</h1>
                        <p>레시피</p>
                    </div>
                    <div class="user_info_border"></div>
                    <div class="user_info_text_box">
                        <h1>0</h1>
                        <p>구매</p>
                    </div>
                    <div class="user_info_border"></div>
                    <div class="user_info_text_box">
                        <h1>0</h1>
                        <p>찜</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

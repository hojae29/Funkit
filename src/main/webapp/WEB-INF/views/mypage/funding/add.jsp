<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-16
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>펀키트</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        .top_box{
            width: 100%;
            height: 160px;
            background: #efefef;
            display: flex;
            justify-content: center;

        }
        .container{
            width:100%;
            display: flex;
            justify-content: center;
            flex-direction: column;
        }
        .top_content_box{
            width: 780px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .menu_box a{
            font-size: 14px;
            color: #888888;
            text-decoration: none;
        }
        .menu_box a:nth-child(2){
            margin-left: 16px;
        }

        #approval_btn{
            height: 30px;
            width: 110px;
            padding:5px;
            border: none;
            background: #ff7e00;
            color: white;
            border-radius: 5px;
            font-size: 14px;
        }

        .bottom_box{
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .side_menu_box{
            width: 180px;
            margin-right: 20px;
        }
        .form_box{
            width: 580px;
        }

        .form_box form p{
            color: #888888;
            font-size: 14px;
        }

        .form_box form label{
            font-size: 18px;
        }

        #title{
            color: #ff7e00;
            font-size: 26px;
            font-weight: bold;
            margin-top: 50px;
            margin-bottom: 20px;
        }
        .text_input{
            width: 500px;
            height: 30px;
            border: 1px solid #cccccc;
            background: white;
        }
        .date_input{
            width: 100px;
            height: 30px;
            background: white;
            border: 1px solid #cccccc;
        }

        #basic_info_form > div{
            margin-bottom: 20px;
        }

        #title_img_input{
            width: 350px;
            height:250px;
            border: 1px solid #cccccc;
        }

        #story_img_input{
            width: 120px;
            height: 70px;
            border: 1px solid #cccccc;
        }

        #save_btn{
            width: 90px;
            height: 30px;
            color: #ff7e00;
            border: 1px solid #ff7e00;
            background: white;
            border-radius: 5px;
            font-size:14px;
        }

        #next_btn{
            width: 90px;
            height: 30px;
            color: white;
            border: 1px solid #ff7e00;
            background: #ff7e00;
            border-radius: 5px;
            font-size:14px;
        }
    </style>
</head>
<body>
    <jsp:include page="../../header.jsp"/>
    <div class="container">
        <div class="top_box">
            <div class="top_content_box">
                <div>
                    <h1>${member.corporateName}님의 프로젝트</h1>
                </div>
                <div class="menu_box">
                    <button id="approval_btn">승인 요청하기</button>
                </div>
            </div>
        </div>
        <div class="bottom_box">
            <div class="side_menu_box"></div>
            <div class="form_box">
                <div>
                    <div><p id="title">기본정보</p></div>
                    <form id="basic_info_form">
                        <div>
                            <div><label>프로젝트 제목</label></div>
                            <div><p>프로젝트를 표현할 수 있는 제목을 입력해주세요</p></div>
                            <div><input class="text_input" type="text"></div>
                        </div>
                        <div>
                            <div><label>목표 금액</label></div>
                            <div><p>프로젝트의 펀딩 목표금액을 입력해주세요</p></div>
                            <div><input class="text_input" type="text"></div>
                        </div>
                        <div>
                            <div><label>진행기간</label></div>
                            <div><p>프로젝트 진행기간을 설정해주세요</p></div>
                            <div><input class="date_input" type="date"></div>
                        </div>
                        <div>
                            <div><label>대표 이미지</label></div>
                            <div><p>프로젝트의 대표 이미지를 등록해주세요</p></div>
                            <div><div id="title_img_input"></div></div>
                        </div>
                    </form>
                    <form id="story_form">
                        <div>
                            <div><label>이미지 등록</label></div>
                            <div><p>프로젝트의 이미지를 등록해주세요</p></div>
                            <div><div id="story_img_input"></div></div>
                        </div>
                    </form>
                </div>
                <div>
                    <button id="save_btn" style="margin-right: 10px">저장</button>
                    <button id="next_btn">다음</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

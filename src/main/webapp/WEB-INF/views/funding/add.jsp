<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-16
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>펀키트</title>
    <link rel="stylesheet" href="/resources/css/funding/add.css"/>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <div></div>
    <div class="container">
        <div class="top_box">
            <div class="top_content_box">
                <div>
                    <h1>${member.corporateName}님의 프로젝트</h1>
                </div>
                <div class="menu_box">
                    <button id="approval_btn"><a style="font-size: 16px;color: white;" href="${funding.fundingCode}/approval?status=20">승인 요청하기</a></button>
                </div>
            </div>
        </div>
        <div class="bottom_box">
            <div class="side_menu_box">
                <ul id="side_menu">
                    <li style="color:#ff7e00">1. 기본정보</li>
                    <li>2. 스토리</li>
                    <li>3. 리워드 설계</li>
                </ul>
            </div>
            <div class="form_box">
                <div id="form_type" data-form="1">
                    <div><p id="menu_title">기본정보</p></div>
                    <form id="add_form" method="post" enctype="multipart/form-data">
                        <div id="basic_form">
                            <div>
                                <div><label>프로젝트 제목</label></div>
                                <div><p>프로젝트를 표현할 수 있는 제목을 입력해주세요</p></div>
                                <div><input class="text_input" name="title" type="text" value="${funding.title}"></div>
                            </div>
                            <div>
                                <div><label>목표 금액</label></div>
                                <div><p>프로젝트의 펀딩 목표금액을 입력해주세요</p></div>
                                <div><input class="text_input" name="targetAmount" type="text" value="${funding.targetAmount}"></div>
                            </div>
                            <div>
                                <div><label>수익분배율</label></div>
                                <div><p>지분방식으로 투자한 회원에게 돌아갈 수익률을 정해주세요</p></div>
                                <div><input class="text_input" name="distribution" type="text" value="${funding.distribution}"></div>
                            </div>
                            <div>
                                <div><label>리워드 발송일</label></div>
                                <div><p>리워드 발송 예정일을 적어주세요</p></div>
                                <div>
                                    <input class="date_input" name="deliveryDate" type="date" value="<fmt:formatDate value="${funding.deliveryDate}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                            <div>
                                <div><label>진행기간</label></div>
                                <div><p>프로젝트 진행기간을 설정해주세요</p></div>
                                <div>
                                    <input class="date_input" name="startDate" type="date" value="<fmt:formatDate value="${funding.startDate}" pattern="yyyy-MM-dd"/>">
                                     ~
                                    <input class="date_input" name="expDate" type="date" value="<fmt:formatDate value="${funding.expDate}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                            <div>
                                <div><label>태그선택</label></div>
                                <div><p>태그를 선택해주세요</p></div>
                                <div>
                                    <select id="tag_select">
                                        <c:forEach var="tag" items="${tagList}">
                                            <option value="${tag.tagCode}">${tag.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" id="tag_add_btn">추가</button>
                                </div>
                                <div id="tag_list_box">
                                    <c:forEach var="tag" items="${funding.tags}">
                                        <div class="tag_box">${tag.name}
                                            <button type="button" class="tag_delete_btn"><img width="10" src="/resources/img/icon/close_icon_white.svg"></button>
                                            <input type="hidden" name="tagCode" value="${tag.tagCode}">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div>
                                <div><label>대표 이미지</label></div>
                                <div><p>프로젝트의 대표 이미지를 등록해주세요</p></div>
                                <div id="title_img_box" data-uuid="${funding.mainImage.name}" style="background-image: url('${funding.mainImage.location}${funding.mainImage.name}')">
                                    <input type="file" accept="image/jpeg, image/jpg, image/png" style="display: none" onchange="readURL(this);">
                                    <div class="file_upload_box">
                                        <div style="display: none">
                                            <button class="update_icon" type="button">
                                                <img width="15" height="15" src="/resources/img/icon/upload-icon.png"/>변경
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="story_form" style="display: none">
                            <div>
                                <div><label>이미지 등록</label></div>
                                <div><p>프로젝트의 이미지를 등록해주세요</p></div>
                                <div id="info_img_wrap">
                                <c:forEach var="image" items="${funding.infoImage}">
                                    <div data-uuid="${image.name}" class="info_img_box" style="background-image: url('${image.location}${image.name}')">
                                        <input style="display: none"
                                               type="file"
                                               accept="image/jpeg, image/jpg, image/png"
                                               onchange="readURL(this);">
                                        <div class="file_upload_box">
                                            <div style="display: none">
                                                <button class="update_icon" type="button">
                                                    <img width="15" height="15" src="/resources/img/icon/upload-icon.png"/>변경
                                                </button><button class="delete_icon" type="button">
                                                    <img width="15" height="15" src="/resources/img/icon/delete_icon_whtie.png"/>삭제
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                    <div class="info_img_box" style="display: flex;align-items: center;justify-content: center;">
                                        <button type="button" id="add_input" style="background: none;border: none;">
                                            <img src="/resources/img/icon/add_icon.svg">
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div><label>간단 소개글</label></div>
                                <div><p>간단한 소개글을 적어주세요</p></div>
                                <div><input type="text" class="text_input" name="introduction" value="${funding.introduction}"></div>
                            </div>
                            <div>
                                <div><label>스토리 작성</label></div>
                                <div><p>프로젝트의 스토리를 적어주세요</p></div>
                                <div id="editor"></div>
                            </div>
                        </div>
                    </form>
                    <form id="reward_form" style="display: none">
                        <div>
                            <div><label>프로젝트 리워드 구성</label></div>
                            <div><p>프로젝트를 시작하기 위해서 최소 1개 이상의 리워드가 있어야 합니다.</p></div>
                        </div>
                        <div id="reward_form_box">
                            <div>
                                <input type="hidden" id="reward_code">
                            </div>
                            <div>
                                <label>리워드 금액</label>
                                <input class="text_input" type="text" id="amount">
                            </div>
                            <div>
                                <label>리워드 제공 수</label>
                                <input class="text_input" type="text" id="quantity">
                            </div>
                            <div>
                                <label>리워드 제목</label>
                                <input class="text_input" type="text" id="title">
                            </div>
                            <div>
                                <label>리워드 내용</label>
                                <input class="text_input" type="text" id="info">
                            </div>
                            <div>
                                <label>배송비</label>
                                <input class="text_input" type="text" id="delivery">
                            </div>
                            <div>
                                <div id="btn_box1">
                                    <button id="add_reward_btn" type="button">등록</button>
                                    <button id="reset_reward_btn" type="button">초기화</button>
                                </div>
                                <div id="btn_box2" style="display: none">
                                    <button id="reward_modify_submit_btn" type="button">수정</button>
                                    <button id="cancel_btn" type="button">취소</button>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div><label>리워드 보기</label></div>
                            <div><p>등록된 리워드 목록입니다.</p></div>
                        </div>
                        <div class="reward_container">
                            <c:forEach var="reward" items="${funding.reward}">
                                <div data-code="${reward.rewardCode}" class="reward_box">
                                    <div class="amount">${reward.amount}원</div>
                                    <div>
                                        <div>리워드명</div>
                                        <div class="title">${reward.title}</div>
                                    </div>
                                    <div class="info">${reward.info}</div>
                                    <div>
                                        <div>배송비</div>
                                        <div class="delivery">${reward.delivery}원</div>
                                    </div>
                                    <div class="quantity">제한수량 ${reward.quantity}개</div>
                                    <div>
                                        <button type="button" class="reward_btn reward_modify_btn"><img width="15" height="15" src="/resources/img/icon/modify_icon.svg"/> 수정</button>
                                        <button type="button" class="reward_btn reward_delete_btn"><img width="15" height="15" src="/resources/img/icon/delete_icon_red.svg"/> 삭제</button>
                                    </div>
                                </div>
                            </c:forEach>
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
    <script src="/resources/js/mypage/funding/add.js"></script>
</body>
</html>

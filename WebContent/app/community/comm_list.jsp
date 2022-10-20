<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title></title>

    <!-- 영문, 숫자 play 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
    
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/community/comm_list.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/community/subheader.css"/>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
    <!-- subheader -->
    <div class="sub_title">
        <div class="container">
            <div class="inner">
                <div class="title_left_box">
                    <div class="snb_wrap">
                        <nav class="snb">
                            <div class="top" style="display: inline-block">커뮤니티</div>
                            <div class="lgr_snb" style="display: inline-block; margin-left: 20px;">
                                <ul class="lgr_ul" data-level="1">
                                    <li ><a href="/young/board/board04.do" class="active">
                                        <span>공지사항</span>
                                    </a>
                                </li>
                                <li><a href="/young/board/board07.do" class="active">
                                        <span>멘토 홍보 게시판</span>
                                    </a>
                                </li>
                                <li class="nowMenu"><a href="${pageContent.request.contetPath}/community/listOk.cm" class="active">
                                        <span>소통공간</span>
                                    </a>
                                </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <div class="title_right_box">
                    <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=9RfoLYoam0TsoWU0M9CunXVDpRV%2BMYjz%2Fwx9V8vcTVN9PUStsh042e3NWGD7IukskEQAGJfLet60yqWGs%2Bedtw%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
                </div>
            </div>
        </div>
    </div>
    <!-- subheader -->

    <!-- list -->
    <!-- 검색어 입력 폼 -->
<div class="contentfullwrap">
    <div class="contentwrap">
    <form action="" name="searchForm" method="post">
        <div class="search-form">
            <span class="s-form">
                <select name="searchSelect" class="val">
                    <option value="sj">제목</option>
                    <option value="cn">내용</option>
                    <option value="cnsj">제목+내용</option>
                    <option value="nm">작성자</option>
                </select>
            </span>
            <span class="s-f-input">
                <span class="search-input">
                    <input type="text" name="programSearch" placeholder="검색어를 입력하세요">
                </span>
            </span>
            <button type="button" class="">
                <img src="${pageContext.request.contextPath}/assets/images/common/search.png">
            </button>
        </div>
    </form>

    <span class="list-count">총
        <span><c:out value="${total }"/></span>건
    </span>

    <table>
        <thead>
            <tr class="title">
                <th class="number" >번호</th>
                <th class="title" >제목</th>
                <th class="file" >첨부파일</th>
                <th class="registrant" >아이디</th>
                <th class="regist-date" >등록일자</th>
                <th class="viewcount" >조회수</th>
            </tr>
        </thead>
        <!-- ↓ 데이터 출력 -->
        <tbody>
				<c:choose>
					<c:when test="${boards != null and fn:length(boards) > 0}">
						<c:forEach var="board" items="${boards}">
							<tr>
								<td><c:out value="${board.getCommunityNumber()}" /></td>
								<td>
									<a href='${pageContext.request.contextPath}/community/detailOk.cm?communityNumber=${board.getCommunityNumber()}'>
										<c:out value="${board.getCommunityTitle()}" />
									</a>
								</td>
								<td>첨부파일</td>
								<td><c:out value="${board.getMemberId()}" /></td>
								<td><c:out value="${board.getCommunityDate()}" /></td>
								<td><c:out value="${board.getCommunityViewCount()}" /></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
		</tbody>
    </table>
    <div class="te_right mt25">
        <a href="${pageContext.request.contextPath}/community/write.cm" class="btntype01 advice_btn">등록</a>
    </div>
			<!-- 페이징 -->
			<div id="page" class="page_height">
				<div class="page_nation">
					<c:if test="${prev}">
						<!-- 이전 페이지(1칸) -->
						<a class="page-num arrow pprev" href="${pageContext.request.contextPath}/community/listOk.cm?page=1"></a>
						<a class="page-num arrow prev" href="${pageContext.request.contextPath}/community/listOk.cm?page=${startPage - 1}">&lt;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${not (i eq page)}">
								<a class="page-num" href="${pageContext.request.contextPath}/community/listOk.cm?page=${i}"><c:out value="${i}" /></a>
							</c:when>
							<c:otherwise>
								<a class="page-num active" href="${pageContext.request.contextPath}/community/listOk.cm?page=${i}"><c:out value="${i}" /></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${next}">
						<a class="page-num arrow next" href="${pageContext.request.contextPath}/community/listOk.cm?page=${endPage + 1}">&gt;</a>
						<a class="page-num arrow nnext" href="${pageContext.request.contextPath}/community/listOk.cm?page=${realEndPage}"></a>
					</c:if>
				</div>
			</div>
		</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
</html>
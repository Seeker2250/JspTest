<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">Seeker Home</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> list.jsp </xmp>

		<h2>목록 보기</h2>
		<a href="<%=contextPath%>/cstvsboard/write.htm">글쓰기</a> <select
			id="cmbNumberPerPage" name="cmbNumberPerPage">
		</select>
		<script>
        for (var i = 10; i <= 50; i+=5) {
         $("#cmbNumberPerPage").append(`<option>\${i}</opiton>`);
      } // for
      
      $("#cmbNumberPerPage").on("change",function(){
         let npp = $(this).val();
         location.href = `/jspPro/cstvsboard/list.htm?numberPerPage=\${npp}`;
      });
      $("#cmbNumberPerPage").val("${pvo.numberPerPage}");
     </script>



		<table>
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="45%">제목</th>
					<th width="17%">작성자</th>
					<th width="20%">등록일</th>
					<th width="10%">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<%-- 스위치문이라고 생각하면 된다. --%>
					<c:when test="${empty list}">
						<%-- 게시글 목록이 비워있다면 --%>
						<tr>
							<td colspan="5">등록된 게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<%-- 게시글 목록이 비워있는게 아니라면 --%>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.seq}</td>
								<td><a
									href="<%= contextPath %>/cstvsboard/view.htm?seq=${ dto.seq }">${dto.title}</a></td>
								<td>${dto.writer}</td>
								<td>${dto.writedate}</td>
								<td>${dto.readed}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" align="center">
						<!-- prev [1start] 2 3 4 5 6 7 8 9 10 next -->
						<div class="pagination">
							<c:if test="${pvo.prev }">

								<a href="${pvo.start-1}">&lt;</a>
							</c:if>
							${  pvo.currentPage }
							<!-- for(int i = 1; i<=10; i++) -->
							<c:forEach begin="${pvo.start }" end="${pvo.end }" step="1"
								var="i">
								<c:choose>
									<c:when test="${ i eq pvo.currentPage }">
										<a href="#" class="active">${ i }</a>
									</c:when>
									<c:otherwise>
										<a href="${ i }">${ i }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pvo.next }">
								<a href="${pvo.end + 1 }">&gt;</a>
							</c:if>

						</div> <script>
							$(".pagination a:not(.active)").attr("href", function(index, oldHref){
								let npp = ${pvo.numberPerPage};
								let sc = '${param.searchCondition}';
								let sw = '${param.searchWord}';
								return `/jspPro/cstvsboard/list.htm?currentPage=\${oldHref}&numberPerPage=\${npp}&searchCondition=\${sc}&searchWord=\${sw}`;
								
							})
						</script>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<form method="get">
							<select name="searchCondition" id="searchCondition">
								<option value="t">title</option>
								<!-- list.htm 요청 List.Java로 Select하고 paging해서 다시 뿌려야지 -->
								<option value="c">content</option>
								<option value="w">writer</option>
								<option value="tc">title+content</option>
							</select>
							<input type="text" name="searchWord" id="searchWord" />
							<input type="submit" value="search" /><!-- form tag action없어서 submit해도 get이 name속성 가져가 -->
							<input type="hidden" name=numberPerPage value="${pvo.numberPerPage}">
						</form>
					</td>

				</tr>
			</tfoot>
		</table>
		<script>
  	//list.htm?write=success or fail
		if (' <%=request.getParameter("write")%>' == ' success ') {
         alert("글쓰기 완료!!");
      } else if(' <%=request.getParameter("write")%>
			' == ' fail ') {
				alert("글쓰기 실패!!");
			} // if
		</script>
		
		<script>
		/* 검색 조건, 검색어 상태 유지 */
			$("#searchCondition").val('${param.searchCondition}');
			$("#searchWord").val('${param.searchWord}');
		</script>
	
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>캠핑장 리스트</title>
  <link href="style.css" rel="stylesheet"/>
  <style>
  	.listimg {
  		width: 200px;
  		height: 200px;
  	}
  	ul {
  		list-style: none;
  	}
  	li {
  		float: left;
  		margin: 20px;
  	}
  </style>
</head>
<body>
<div>
	<div>
		<h1>캠핑장/글램핑/카라반/펜션 검색&예약</h1>
	</div>
</div>
<div>
	<div>
		<div>
			<div>
				<table>
					<c:forEach items="${list}" var="board">
						<tr>
								<td><a href="/board/get?campnum=${board.campnum}&&startDate=<fmt:formatDate value="${setdate.startDate}" pattern="yyyy-MM-dd"/>&&endDate=<fmt:formatDate value="${setdate.endDate}" pattern="yyyy-MM-dd"/>">${board.facltnm}</a></td>
								<td><img src="<c:out value="${board.firstimageurl}" />" class="listimg"></td>
						</tr>
					</c:forEach>
					
				</table>

				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!--  end Pagination -->
			</div>
			
			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
				<input type='hidden' name='startDate' value='<fmt:formatDate value="${pageMaker.cri.startDate }" pattern="yyyy-MM-dd"/>'>
				<input type='hidden' name='endDate' value='<fmt:formatDate value="${pageMaker.cri.endDate }" pattern="yyyy-MM-dd"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				<input type='hidden' name='category' value='<c:out value="${ pageMaker.cri.category }"/>'>
			</form>
			
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>

<!-- /.row -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>





<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						check(result);

						history.replaceState({}, null, null);

						function check(result) {

							if (result === '' || history.state) {
								return;
							}
						}	
					
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='campnum' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();

										});
					});
</script>
</body>
</html>

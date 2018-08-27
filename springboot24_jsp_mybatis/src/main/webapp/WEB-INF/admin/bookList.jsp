<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书籍列表</title>
<link href="resources/bs/<spring:theme code='bstheme'/>/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="resources/icon/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function useDefaultImg(event) {
		//已经要保证替换的图片存在，否则图片替换会死循环
		$(event.target).attr("src", "resources/img/timg1.jpg");
	}
</script>
</head>
<body>
	<div class="container">
		<!-- 顶部 -->
		<div class="row">
			<div class="col-md-12">
				<%@include file="common/nav.jsp"%>
			</div>
		</div>
		<div class="row   card">
			<div class="col-md-12">
				<div class="card-header">
					<form class="form-inline" action="bookList" id="bookListSearchFrm">
						<!-- 默认看第一页 ,简化点击分页链接时候带表单参数问题-->
						<input name="pageNo" type="hidden" value="1"> <label class="sr-only" for="inlineFormInputName2">名字</label> <input type="text" class="form-control mb-2 mr-sm-2"
							id="inlineFormInputName2" placeholder="书名" name="name" value="${param.name }"> <label class="sr-only" for="inlineFormInputName2">类型</label> <select name="tid"
							class="form-control mb-2 mr-sm-2" id="tid_sel">
							<option value="-1">--请选择--</option>
							<c:forEach items="${types }" var="type">
								<option value="${type.id }">${type.name }</option>
							</c:forEach>
						</select>

						<button type="submit" class="btn btn-primary mb-2">搜索</button>
					</form>

				</div>
				<div class="card-body">
					<table class="table table-bordered table-hover row mx-0">
						<thead class="col-md-12">
							<tr class="row">
								<th class="col-md-1 col-1 text-center">id</th>
								<th class="col-md-1 col-1 text-center">name</th>
								<th class="col-md-2 col-2 text-center">descri</th>
								<th class="col-md-1 col-1 text-center">tid</th>
								<th class="col-md-3 col-3 text-center">photo</th>
								<th class="col-md-1  col-1text-center">price</th>
								<th class="col-md-1 col-1 text-center">author</th>
								<th class="col-md-1 col-1 text-center">pubDate</th>
								<th class="col-md-1 col-1 text-center">操作</th>
							</tr>
						</thead>
						<tbody class="col-md-12">
							<c:choose>
								<c:when test="${ empty   pageInfo.list}">
									<tr class="row">
										<td colspan="9">无数据</td>
									</tr>
								</c:when>
								<c:otherwise>
									<!-- pageInfoList.list返回查询列表数据 -->
									<c:forEach items="${pageInfo.list }" var="book">
										<tr class="row">
											<td class="col-md-1 col-1 text-center">${book.id }</td>
											<td class="col-md-1 col-1 text-center">${book.name }</td>
											<td class="col-md-2 col-2 text-center"><c:out value="${book.descri }" escapeXml="true"></c:out></td>
											<td class="col-md-1 col-1 text-center">${book.tid }</td>
											<td class="col-md-3 col-3 text-center">
												<%-- <c:choose>
											    <c:when test="${book.photo==null }">
											    <img alt="" src="/resources/img/timg.jpg" class="img-thumbnail">
											    </c:when>
											    <c:otherwise>
											    
											    </c:otherwise>
											</c:choose>--%> <img alt="" src="/up/${book.photo }" class="img-thumbnail"  onerror="this.src='/resources/img/timg.jpg'">
																					</td>
											<td class="col-md-1 col-1 text-center">${book.price }</td>
											<td class="col-md-1 col-1 text-center">${book.author}</td>
											<td class="col-md-1 col-1 text-center"><fmt:formatDate value="${book.pubDate}" pattern="yyyy-MM-dd" /></td>
											<td class="col-md-1 col-1 text-center"><a href="bookDel?id=${book.id }" title="删除" style="text-decoration: none;" onclick="delConfirm(event)"> <span
													class="icon-trash-can"></span>
											</a>&nbsp;&nbsp; <a href="toBookEdit?id=${book.id }" title="编辑" style="text-decoration: none;"> <span class="icon-clipboard-edit"></span>
											</a></td>
										</tr>
									</c:forEach>

								</c:otherwise>

							</c:choose>


						</tbody>
					</table>
				</div>
				<div class="card-footer text-muted">
					<nav aria-label="...">
						<ul class="pagination">
							<!-- 前一页 -->
							<c:choose>
								<c:when test="${pageInfo.isFirstPage }">
									<li class="disabled" class="page-item"><a href="javascript:void(0)" class="page-link">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a href="bookList?pageNo=${pageInfo.prePage }" class="page-link">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 最多显示8个链接 -->
							<c:forEach items="${pageInfo.navigatepageNums }" var="pi">
								<li class="page-item
								  <c:if  test="${pi==pageInfo.pageNum }"> active</c:if>
								"><a href="bookList?pageNo=${pi }" class="page-link">${pi }</a></li>
							</c:forEach>
							<c:choose>
								<c:when test="${pageInfo.isLastPage }">
									<!-- javascript:void(0)就是取消超级链接的默认行为方式 -->
									<li class="disabled"><a href="javascript:void(0)" class="page-link">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a href="bookList?pageNo=${pageInfo.nextPage}" class="page-link">&raquo;</a></li>
								</c:otherwise>
							</c:choose>

						</ul>
					</nav>

				</div>

			</div>
		</div>
		<!-- 删除确认框 -->
		<!-- Modal -->
		<div class="modal fade" id="delDlg" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">删除确认</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">你确认要删除?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary    btn_ok">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="row  card">
			<%@include file="common/copyright.jsp"%>
		</div>
	</div>
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.slim.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/bower_components/uri-util/dist/uri-util.min.js"></script>
	<script type="text/javascript" src="resources/js/common.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#themeSel").val("<spring:theme code='bstheme'/>");
			//让tid回填
			$("#tid_sel").val("${empty param.tid?-1:param.tid}");
			//让超级链接追加表单参数，最简单方式阻止超级链接默认行为，为表单添加隐藏字段a['class="page-link"']")
			var prePage = $
			{
				pageInfo.prePage
			}
			;
			var nextPage = $
			{
				pageInfo.nextPage
			}
			;
			$('a[class="page-link"][href^="bookList?pageNo="]').click(function(evt) {
				evt.preventDefault();
				//修改表单中pageNo的值
				if ($(this).text() == "»") {
					$('#bookListSearchFrm  input[name="pageNo"]').val(nextPage);
				} else if ($(this).text() == "«") {
					$('#bookListSearchFrm  input[name="pageNo"]').val(prePage);

				} else {

					$('#bookListSearchFrm  input[name="pageNo"]').val($(this).text());
				}
				$("#bookListSearchFrm").submit();
			});
			//对模态对话框配置
			$("#delDlg").modal({
				backdrop : 'static',//否则你点击对话框外的部分就消失
				show : false
			//默认是显示的
			});

		});
		//该函数不能放置$(function(){})内部，如果放置进去了它就是局部变量了，删除链接点击时候就无法找到
		//同时不用担心它放置位置，因为当你能点击时候只要页面已加载完毕
		function delConfirm(event) {
			//取消超级链接的默认行为
			event.preventDefault();
			//显示模态对话框
			var url = $(event.target).parent("a").attr("href");
			$('#delDlg').modal('show');
			//给确认框绑定一次性事件
			$("#delDlg   button.btn_ok ").one("click", function() {
				window.location.href = url;
			});

		}

		//解决图片找不到问题
		$(function() {
			$("tr td   img.img-thumbnail ").bind("error", function(event) {
				$(event.target).attr("src", "resources/img/timg.jpg");
			})
		});
	</script>

</body>
</html>
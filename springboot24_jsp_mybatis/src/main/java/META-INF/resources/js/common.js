$(function() {
	//$("#themeSel").val("<spring:theme code='bstheme'/>");//这样代码不能写在这里，因为它是jsp标签，只有在jsp文件中才会执行
	$("#themeSel").change(function() {
		// 只需要告诉了选择那个主题给服务器
		var obj=URIUtil.parse(location.search);
		//记住如果查询参数就是修改，木偶就是添加
		  obj.theme=$(this).val();
		  
		  window.location.href=location.pathname+"?"+URIUtil.stringify(obj)+"#"+location.hash;
	});
});
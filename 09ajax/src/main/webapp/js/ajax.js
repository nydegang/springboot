/**
 * 
 */
function AjaxUtil(url) {
	// 1 买手机
	//var xhr = new XMLHttpRequest();
	//兼容
	var  xhr;
	//方法兼容性：1 属性判断法 2 try/catch
	if (window.XMLHttpRequest) {//用属性判断法
		xhr=new XMLHttpRequest();
	} else {//try/catch
         try {
			xhr=new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			xhr=new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	// 2 开机--拨号
	xhr.open("GET", url);
	// 3 拨打
	xhr.send();
	// 4 等对方接了再说话----事件编程
	// 只要readystate发生改变，就调用该函数一次
	xhr.onreadystatechange = function() {
		// 等对方把内容全部传递过来
		if (xhr.readyState == 4) {//
			if (xhr.status == 200) {// 响应可能是成功，也可能失败
				// 根据响应内容不同
				/*
				 * json---Content-Type: application/json 
				 * xml---Content-Type: application/xml 
				 * txt--Content-Type: text/plain
				 * js---Content-Type:application/javascript
				 */
				var mime = xhr.getResponseHeader("Content-Type");
				switch (mime) {
				case "application/json":
					if (window.JSON) {
						var obj = JSON.parse(xhr.responseText);
						fillSel(obj);
					}else{
						var obj =window.eval("("+xhr.responseText+")");
						fillSel(obj);
					}
					
					break;
				case "application/xml":
					var typeNodes = xhr.responseXML.getElementsByTagName("type");
					var arr = new Array();
					for (var i = 0; i < typeNodes.length; i++) {
						var name = typeNodes[i].getElementsByTagName("name")[0].innerHTML;
						// console.dir(name);
						var id = typeNodes[i].id;
						arr.push({
							"name" : name,
							"id" : id
						});
					}
					var obj = {
						vos : arr
					};
					fillSel(obj);
					break;
				case "text/plain":
				case "application/javascript":
					window.eval(xhr.responseText);	
					break;
				default:
					console.log("不晓得如何处理")
					break;
				}
			}
		}
	}
}
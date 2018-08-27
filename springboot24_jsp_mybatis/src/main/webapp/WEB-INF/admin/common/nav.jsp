<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px;">

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="#" style="margin: 0px;"> <img src="resources/img/dgjy.png" />
	</a>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="bookList">书籍列表 <span class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown link</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Separated link</a>
				</div></li>
		</ul>
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="text" />
			<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
		</form>
		<ul class="navbar-nav ml-md-auto">
			<li class="nav-item active"><a class="nav-link" href="#"> 换主题: <select id="themeSel">
						<option>cerulean</option>
						<option>cosmo</option>
						<option>cyborg</option>
						<option>darkly</option>
						<option>flatly</option>
						<option>journal</option>
						<option>litera</option>
						<option>lumen</option>
						<option>lux</option>
						<option>materia</option>
						<option>minty</option>
						<option>pulse</option>
						<option>sandstone</option>
						<option>simplex</option>
						<option>sketchy</option>
						<option>slate</option>
						<option>solar</option>
						<option>spacelab</option>
						<option>superhero</option>
						<option>united</option>
						<option>yeti</option>
				</select>

			</a></li>
			<li class="nav-item "><a class="nav-link "> 欢迎${sessionScope.admin.name }登陆 </a></li>
			<li class="nav-item "><a class="nav-link" href="exit">退出</a></li>
		</ul>
	</div>
</nav>
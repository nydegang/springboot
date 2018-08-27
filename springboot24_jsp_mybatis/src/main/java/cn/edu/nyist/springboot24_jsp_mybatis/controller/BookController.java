package cn.edu.nyist.springboot24_jsp_mybatis.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import cn.edu.nyist.springboot24_jsp_mybatis.model.Book;
import cn.edu.nyist.springboot24_jsp_mybatis.model.Type;
import cn.edu.nyist.springboot24_jsp_mybatis.service.BookService;
import cn.edu.nyist.springboot24_jsp_mybatis.service.TypeService;
/**
 * 
 * @author 南阳德刚版权所有,企鹅号:2855128836<br>
 *2018年8月27日下午6:46:30<br>
 * 说明:书籍Controller
 */
@Controller
public class BookController {
	@Autowired
	private TypeService typeService;
	@Autowired
	private BookService bookService;

	public BookController() {
	}

	@RequestMapping("/toBookAdd")
	public String toBookAdd(Model model) {
		List<Type> ls = typeService.findAllTypes();
		model.addAttribute("types", ls);
		model.addAttribute("book", new Book());
		return "bookAdd";
	}

	@RequestMapping("/bookAdd")
	public String doBookAdd(@Valid @ModelAttribute Book book, BindingResult result, @RequestParam String vcode, @RequestParam MultipartFile photox, HttpServletRequest request) throws Exception {
		// 先验证码
		String serverVcode = (String) request.getSession().getAttribute(ValidateController.serverVcodeName);
		if (!serverVcode.equalsIgnoreCase(vcode)) {
			result.rejectValue("vcode", "vcode.book", "验证码不正确");
		}
		if (result.hasErrors()) {
			List<Type> ls = typeService.findAllTypes();
			request.setAttribute("types", ls);
			return "bookAdd";
		}

		String fileName = photox.getOriginalFilename();
		// 解决IE下路径问题
		fileName = fileName.lastIndexOf("\\") == -1 ? fileName : fileName.substring(fileName.lastIndexOf("\\") + 1);

		// 解决名字重复问题
		String ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		String newFileName = UUID.randomUUID().toString() + "." + ext;
		photox.transferTo(new File(request.getServletContext().getRealPath("WEB-INF/upload/" + newFileName)));
		book.setPhoto(newFileName);
		int ret = bookService.saveBook(book);
		if (ret > 0) {
			return "main";
		} else {
			List<Type> ls = typeService.findAllTypes();
			request.setAttribute("types", ls);
			return "bookAdd";

		}
	}

	@RequestMapping("/bookList")
	public String list(Model model, @RequestParam(defaultValue = "1", required = false) int pageNo, @RequestParam(defaultValue = "", required = false) String name,
			@RequestParam(defaultValue = "-1", required = false) int tid) {
		List<Type> types = typeService.findAllTypes();
		model.addAttribute("types", types);
		PageInfo<Book> pageInfo = bookService.findAllBooks(pageNo, name, tid);
		model.addAttribute("pageInfo", pageInfo);
		return "bookList";
	}

	@RequestMapping("/bookDel")
	public String del(@RequestParam int id) {
		bookService.delBookById(id);
		return "redirect:bookList";
	}

	@RequestMapping("/toBookEdit")
	public String toBookEdit(Model model, @RequestParam int id) {
		List<Type> ls = typeService.findAllTypes();
		model.addAttribute("types", ls);
		Book book = bookService.findBookById(id);
		model.addAttribute("book", book);
		return "bookEdit";
	}

	@RequestMapping("/bookEdit")
	public String doBookEdit(@Valid @ModelAttribute Book book, BindingResult result, @RequestParam String vcode, @RequestParam MultipartFile photox, HttpServletRequest request) throws Exception {
		// 先验证码
		String serverVcode = (String) request.getSession().getAttribute(ValidateController.serverVcodeName);
		if (!serverVcode.equalsIgnoreCase(vcode)) {
			// 添加错误
			result.rejectValue("vcode", "eq.book.vcode", "验证码不正确");
		}
		// 有错就不走了
		if (result.hasErrors()) {
			List<Type> ls = typeService.findAllTypes();
			request.setAttribute("types", ls);
			return "bookEdit";
		}
		String fileName = photox.getOriginalFilename();
		// 用户选择了文件我们再处理文件上传问题
		if (!fileName.equals("")) {
			// 解决IE下路径问题
			fileName = fileName.lastIndexOf("\\") == -1 ? fileName : fileName.substring(fileName.lastIndexOf("\\") + 1);

			// 解决名字重复问题
			String ext = fileName.substring(fileName.lastIndexOf('.') + 1);
			String newFileName = UUID.randomUUID().toString() + "." + ext;
			photox.transferTo(new File(request.getServletContext().getRealPath("WEB-INF/upload/" + newFileName)));
			book.setPhoto(newFileName);
		} else {
			book.setPhoto(null);
		}
		int ret = bookService.updateBook(book);
		if (ret > 0) {
			return "main";
		} else {
			List<Type> ls = typeService.findAllTypes();
			request.setAttribute("types", ls);
			return "bookEdit";

		}
	}
}

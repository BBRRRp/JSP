package com.lec.web.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.web.entity.Notice;
import com.lec.web.service.NoticeService;

@WebServlet("/notice/list")
public class ListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	
		String _field = req.getParameter("f");
		String _query = req.getParameter("q");
		String _page = req.getParameter("p");
		String field = "title";
		String query = "";
		int page = 0;
		
		System.out.println(_query);
		
		if(_field != null && !_field.equals("")) field = _field;
		if(_query != null && !_query.equals("")) query = _query;
		if(_page != null && !_page.equals("")) page = Integer.parseInt(_page);
		
		NoticeService service = new NoticeService();
		List<Notice> list = service.getNoticeList(field, query, page);
		int count = service.getNoticeCount(field, query);
		
		req.setAttribute("list", list);
		req.setAttribute("count", count);
		
		req.getRequestDispatcher("/WEB-INF/view/notice/list.jsp").forward(req, res);

	}
	
}

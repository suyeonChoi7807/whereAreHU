package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;
import model.ReviewVO;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review/reviewList")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDAO dao = new ReviewDAO();
		String area_num = (request.getParameter("area_num"));
		List<ReviewVO> rlist = dao.selectAllReviewsByRestStop(area_num);
		request.setAttribute("revlist", rlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("rev_list.jsp");
		rd.forward(request, response);
	}
}

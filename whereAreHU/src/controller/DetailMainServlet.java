package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
<<<<<<< HEAD

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
=======
import javax.websocket.Session;
>>>>>>> branch 'master' of https://github.com/Choisuyeon-2205/whereAreHU.git

import model.GoodDAO;
import model.ReviewDAO;
import model.ReviewVO;
import model.ServiceAreaDAO;
import model.ServiceAreaVO;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/detail/selectDetail")
public class DetailMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String area_num="000485";
		ServiceAreaDAO saDAO = new ServiceAreaDAO();
		ReviewDAO reDAO = new ReviewDAO();
		GoodDAO goodDAO= new GoodDAO();
		int like_num= goodDAO.selectByAreaNum(area_num);
		
		HttpSession session = request.getSession(true);
		String user_id= (String) session.getAttribute("user_id");
		int like_me= goodDAO.selectByOne(user_id, area_num);
		System.out.println(like_me);
		List<ReviewVO> reviewlist = reDAO.selectAllReviewsByRestStop(area_num);
		
		request.setAttribute("area_num", area_num);
		request.setAttribute("sarea", saDAO.selectOneArea(area_num));
		request.setAttribute("reviewlist", reviewlist);
<<<<<<< HEAD
=======
		request.setAttribute("like_num", like_num);
		request.setAttribute("like_me", like_me);
	
		ReviewDAO dao = new ReviewDAO();
//		String area_num = request.getParameter("area_num");
		List<ReviewVO> rlist = dao.selectAllReviewsByRestStop(area_num);
		request.setAttribute("revlist", rlist);
		System.out.println(rlist);
>>>>>>> branch 'master' of https://github.com/Choisuyeon-2205/whereAreHU.git
		
		RequestDispatcher rd = request.getRequestDispatcher("detailMain.jsp");
		rd.forward(request, response);
<<<<<<< HEAD
=======
		

>>>>>>> branch 'master' of https://github.com/Choisuyeon-2205/whereAreHU.git
	}
}

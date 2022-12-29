package com.example.ancientchineselearning.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.ancientchineselearning.dao.Auther3Dao;
import com.example.ancientchineselearning.domain.Auther;

/**
 * Servlet implementation class AutherServlet
 */
@WebServlet("/AutherServlet")
public class AutherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置请求和响应的编码
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				
				//获取请求参数
				String type = request.getParameter("type");
				if("xiangqing".equals(type)) {
					int atr_rid = Integer.parseInt(request.getParameter("ID")) ; 
					Auther3Dao autherDao = new Auther3Dao(); 
					Auther auther = autherDao.getauther(atr_rid);
					request.setAttribute("auther", auther);
					request.getRequestDispatcher("informationShow/zuozhezhanshi2.jsp").forward(request, response);
				}
				
			}
			
			public Auther request(HttpServletRequest request) {
				Auther auther = null;
				String atr_nam = request.getParameter("atr_nam");
				String atr_dny = request.getParameter("atr_dny");
				String atr_btd = request.getParameter("atr_btd");
				String atr_inf = request.getParameter("atr_inf");
				
				auther = new Auther(0, atr_nam, atr_dny, atr_btd, atr_inf);
				return auther;
			}
}

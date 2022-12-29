package com.example.ancientchineselearning.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.ancientchineselearning.dao.Account1Dao;
import com.example.ancientchineselearning.domain.Account;

/**
 * 登录业务处理
 */
@WebServlet("/AccountLoginServlet")
public class AccountLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String login_name = request.getParameter("login_name");
		String login_pawd = request.getParameter("login_pawd");
		
		String page = request.getParameter("page");
		
		//验证登录
		Account1Dao accDao = new Account1Dao();
		Account accountBean = new Account();
		accountBean = accDao.valiLogin(login_name);
		
		
		if(accountBean.getAcn_rid() > 0) {
			if(login_pawd.equals(accountBean.getAcn_pwd())) {
				session.setAttribute("LoginAccount", accountBean);
				
				out.println("<script type='text/javascript'>");
				out.println("alert('登陆成功！');");
				out.println("window.location = '" + page + ".jsp';");
				out.println("</script>");
			}else {
				out.println("<script type='text/javascript'>");
				out.println("alert('登陆密码不正确！');");
				out.println("window.location = '" + page + ".jsp';");
				out.println("</script>");
			}
		}else {
			out.println("<script type='text/javascript'>");
			out.println("alert('登陆邮箱不存在！');");
			out.println("window.location = '" + page + ".jsp';");
			out.println("</script>");
		}
	}

}

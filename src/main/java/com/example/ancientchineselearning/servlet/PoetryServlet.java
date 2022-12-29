package com.example.ancientchineselearning.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.ancientchineselearning.dao.Poetry2Dao;
import com.example.ancientchineselearning.dao.Poetry3Dao;
import com.example.ancientchineselearning.domain.Poetry;

/**
 * Servlet implementation class PoetryServlet
 */
@WebServlet(name = "PoetryServlet", value = "/PoetryServlet")
public class PoetryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoetryServlet() {
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
		//设置请求和响应的编码方式
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		Poetry2Dao poetryDao = new Poetry2Dao();
		//获取操作类型
		String type = request.getParameter("type");
		//判断操作类型
		if("select".equals(type)) {
			//查看诗词信息
			Poetry poetry = new Poetry();	
			if(request.getParameter("PoetryId") != null) {
				int PoetryId = Integer.valueOf((String)request.getParameter("PoetryId"));
				poetry = poetryDao.selectPoetryById(PoetryId);
				
			}
			//将诗词信息存入request对象属性中
			request.setAttribute("Poetrytext",poetry);
			//使用请求转发到简历展示页面
			request.getRequestDispatcher("informationShow/poetrytext.jsp").forward(request, response);
		}else if ("fabulous".equals(type)) {
			//为诗词点赞
			Poetry poetryInfo = new Poetry();
			if(request.getParameter("PoetryId") != null) {
				int PoetryId = Integer.valueOf((String)request.getParameter("PoetryId"));
				poetryDao.updateselectPoetryById(PoetryId);
				poetryInfo = poetryDao.selectPoetryById(PoetryId);
			}
			//将诗词信息存入request对象属性中
			request.setAttribute("informationShow/Poetrytext",poetryInfo);
			//使用请求转发到简历展示页面
			request.getRequestDispatcher("poetrytext.jsp").forward(request, response);
		}else if ("collection".equals(type)) {
			//加入收藏
			if(request.getParameter("PoetryId") != null) {
				int PoetryId = Integer.valueOf((String)request.getParameter("PoetryId"));
				int userId = Integer.valueOf((String)request.getParameter("userId"));
				String collectionis = request.getParameter("collectionis");
				if("true".equals(collectionis)) {
					poetryDao.Removecollection(PoetryId,userId);
				}else {
					poetryDao.Insertcollection(PoetryId,userId);
				}
				
				request.getRequestDispatcher("PoetryServlet?type=select&PoetryId="+PoetryId).forward(request, response);
			}
		}else if ("press".equals(type)) {
			//发布评论
			if(request.getParameter("PoetryId") != null && request.getParameter("AccountId") != null) {
				int PoetryId = Integer.valueOf((String)request.getParameter("PoetryId"));
				int AccountId = Integer.valueOf((String)request.getParameter("AccountId"));
				String message = request.getParameter("message");
				poetryDao.Insertpress(PoetryId,AccountId,message);
				
				//获取输出对象
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('发布评论成功，等待审核后展示！')");
				//跳转到register.html
				out.println("window.location = 'PoetryServlet?type=select&PoetryId="+PoetryId+"'");
				out.println("</script>");
				
				
			}
		} else if ("update".equals(type)) {
			Poetry poetry = this.requestDateObj(request);
			String pty_atr = request.getParameter("pty_atr");
			Poetry3Dao dao = new Poetry3Dao();
			int num = dao.getID(pty_atr);
			int peortyId = dao.addPoetry(poetry, num);

			System.out.println("成功！！");
			response.sendRedirect("jinju.jsp");
		}
		
	}

	public Poetry requestDateObj(HttpServletRequest request) {
		Poetry poetry = null;
		String pty_ttl = request.getParameter("pty_ttl");
		String pty_cot = request.getParameter("pty_cot");
		String pty_tst = request.getParameter("pty_tst");
		String pty_apt = request.getParameter("pty_apt");
		String pty_not = request.getParameter("pty_not");
		String pty_fam = request.getParameter("pty_fam");
		poetry = new Poetry(0, null, pty_ttl, pty_cot, pty_tst, pty_apt, pty_not, pty_fam, 0);
		return poetry;
	}

}

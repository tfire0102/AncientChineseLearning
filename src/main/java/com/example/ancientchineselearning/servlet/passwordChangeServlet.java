package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.dao.Account1Dao;
import com.example.ancientchineselearning.domain.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "passwordChangeServlet", value = "/passwordChangeServlet")
public class passwordChangeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String email = request.getParameter("eml");
        String oldPwd = request.getParameter("oldPwd");
        String newPwd = request.getParameter("newPwd");
        PrintWriter out = response.getWriter();

        Account1Dao accDao = new Account1Dao();
        Account accountBean = new Account();
        accountBean = accDao.valiLogin(email);

        if (accountBean.getAcn_pwd().equals(oldPwd)) {
            accDao.changPassword(accountBean.getAcn_rid(), newPwd);
            out.println("<script type='text/javascript'>");
            out.println("alert('修改成功！');");
            out.println("window.location = 'personalHoemServlet?acnID=" + accountBean.getAcn_rid() + "';");
            out.println("</script>");
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('密码错误！');");
            out.println("window.location = 'personalHoemServlet?acnID=" + accountBean.getAcn_rid() + "';");
            out.println("</script>");
        }
    }
}

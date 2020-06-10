package form;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.DataBase;
import database.data;
/**
 * Servlet implementation class compleate
 */
@WebServlet("/compleate")
public class compleate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public compleate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String comment = request.getParameter("comment");
		Part part = request.getPart("file");
        String faile = this.getFileName(part);
        part.write("C:\\pleiades\\pleiades\\workspace\\Bulletin_Board\\WebContent\\upload\\" + faile);

		name = name.replace("<", "/");
		name =name.replace(">", "/");
		mail = mail.replace("<", "/");
		mail = mail.replace(">", "/");
		comment = comment.replace("<", "/");
		comment = comment.replace(">", "/");

		System.out.println(name);
		System.out.println(mail);
		System.out.println(comment);



		DataBase DB = new database.DataBase();
		String time = DataBase.insert(name,mail,comment,faile);

		DataBase db = new database.DataBase();

		ArrayList<data> data = db.select();

		request.setAttribute("list", data);

		String view = "/WEB-INF/view/form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	  private String getFileName(Part part) {
	        String name = null;
	        for (String dispotion : part.getHeader("Content-Disposition").split(";")) {
	            if (dispotion.trim().startsWith("filename")) {
	                name = dispotion.substring(dispotion.indexOf("=") + 1).replace("\"", "").trim();
	                name = name.substring(name.lastIndexOf("\\") + 1);
	                break;
	            }
	        }
	        return name;
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

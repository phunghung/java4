package lab2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InputForm
 */
@WebServlet("/InputForm")
public class InputForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final private String CONTENT_TYPE = "text/html";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>InputForm</title></head>");
        out.println("<body>");
        out.println("<h1>Demo tra cuu </h1>");
        out.println("<form action='SearchAccount' method='post'");
        out.println("<br>");
        out.println("Nhap ten thue bao: <INPUT NAME='ttbao'><br>");
        out.println("Nhap SDT: <INPUT NAME='sdt'><br>");
        out.println("nhap dia chi: <INPUT NAME='diachi'><br>");
        out.println("<input type='submit' name='Submit' value='Search'>");
        out.println("</form>");
        out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package lab2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class SearchAccount
 */
@WebServlet("/SearchAccount")
public class SearchAccount extends HttpServlet {
	Connection conn = null;
	private static final long serialVersionUID = 1L;
	static final private String CONTENT_TYPE = "text/html";
	
    private static String DB_URL = "jdbc:mysql://localhost:3306/NorthWind";
    private static String USER_NAME = "hunga";
    private static String PASSWORD = "ABCabc.12";

    public void connectSQL() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
                System.out.println("Ket noi thanh cong");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//response.setContentType(CONTENT_TYPE);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>SearchAccount</title></head>");
		out.println("<body><h1>Ket qua tra cuu SDT </h1>");
		out.println("<table border=1 cellPadding=1 cellSpacing=1>");
        String tentbao = request.getParameter("ttbao");
		
		java.sql.Statement stmt = null;
		ResultSet rs = null;
		try {
            connectSQL();
            String sql = "SELECT * FROM customer";
            System.out.println("Da ket noi CSDL");
            if(tentbao != null && tentbao.length() != 0) {
            	sql = "SELECT * FROM customer where tenthuebao like '%" + tentbao + "%'";
    		}
            out.println("<tr><th>STT</th><th>Ten thue bao</th><th>SDT</th><th>Dia chi</th></tr>\n");
            stmt = conn.createStatement();
    		rs = stmt.executeQuery(sql);
            
            if(rs != null) {
            	while (rs.next()) {
            		out.println("<tr><td>" + rs.getString(1) + "</td>"
            				+ "<td>" + rs.getString(2) + "</td>"
            						+ "<td>" + rs.getString(3) +"</td>"
            						+ "<td>" + rs.getString(4) +"</td></tr>\n");
            	}
            }
            out.println("</table>");
            out.println("</body></html>");
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.err.println("Khong ket noi duoc");
            e.printStackTrace();
        }
		finally{
            if(conn != null) {
                try {
                    conn.close();
                    System.out.println("Dong ket noi");
                }
                catch(Exception e) {
                    
                }
            }
        }
	}
}

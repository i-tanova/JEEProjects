package tanovai.testdb.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestDb
 */
@WebServlet("/TestDb")
public class TestDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	@Resource(name="jdbc/DBTest")
	private DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get print writer
		PrintWriter pw = response.getWriter();
		response.setContentType("text/plain");
		
		//Get connection to DB
		Connection conn = null;
		Statement stm = null;
		ResultSet resSet = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "select * from student";
			stm = conn.createStatement();
			resSet = stm.executeQuery(sql);
			while(resSet.next()) {
				String email = resSet.getString("email");
				pw.println(email);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

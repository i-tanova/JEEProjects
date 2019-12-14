package com.tanovai.servlet;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/StudentsDB")
	DataSource dataSource;

	StudentDBUtil sd;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();

		// Create DB Util
		try {
			sd = new StudentDBUtil(dataSource);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// read the "command" parameter
		String command = request.getParameter("command");
		if (command == null) {
			command = "list";
		}
		switch (command) {
		case "list": {
			// list the students in MVC fashion
			listStudents(request, response);
			break;
		}

		case "ADD": {
			addStudent(request, response);
			break;
		}

		case "LOAD": {
			loadStudent(request, response);
			break;
		}
		
		case "UPDATE": {
			updateStudent(request, response);
			break;
		}
		
		case "DELETE": {
			deleteStudent(request, response);
			break;
		}

		default: {
			listStudents(request, response);
		}
		}
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		sd.deleteStudent(id);

		listStudents(request, response);
		
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		sd.updateStudent(new Student(Integer.parseInt(id), firstName, lastName, email));

		listStudents(request, response);
	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		// 1. get student from DB util
		Student student = sd.loadStudent(id);
		// 2 add student to the request
		request.setAttribute("student", student);
		// 3. send to JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/student-update.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) {
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		sd.addStudent(new Student(firstName, lastName, email));

		listStudents(request, response);
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) {
		// 1. get students from DB util
		List<Student> students = sd.getStuents();
		// 2 add students to the request
		request.setAttribute("STUDENTS", students);
		// 3. send to JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/students-list-jstl.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

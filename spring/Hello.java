import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Hello extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		System.out.println("Hello Servlet!!");

		PrintWriter out = res.getWriter();
		out.println("HELLO~~~ SERVLET~~~");
	}
}
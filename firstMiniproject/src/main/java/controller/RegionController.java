package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.AsyncContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.RegionDAO;

// 비동기 처리를 위한 어노테이션
@WebServlet(value = "/region", asyncSupported = true)
public class RegionController extends HttpServlet {
	private RegionDAO regionDAO;

	public void init() {
		regionDAO = new RegionDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println("RegionControllerOn");
		//비동기 실행
		final AsyncContext asyncContext = request.startAsync();
		asyncContext.start(()->{
			try {
				String act = request.getParameter("act");
				System.out.println("act: " + act);

				if(act.equals("si")) {
					//select si
					String sql = "SELECT si FROM tbl_region GROUP BY si";
					List<String> list = regionDAO.searchRegion(sql);
					
					Gson gson = new Gson();
					String json = gson.toJson(list);
					
					response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");

					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
					
				} else if(act.equals("gu")) {
					//select gu
					String sql = "SELECT gu FROM tbl_region WHERE si = "+str(request.getParameter("si")) + " GROUP BY gu;";
					List<String> list = regionDAO.searchRegion(sql);
					
					Gson gson = new Gson();
					String json = gson.toJson(list);
					
					response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");

					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
					
				} else if(act.equals("dong")) {
					//select dong
					String sql = "SELECT dong FROM tbl_region WHERE si = " + str(request.getParameter("si")) + " and gu = " + str(request.getParameter("gu")) + " GROUP BY dong;";
					List<String> list = regionDAO.searchRegion(sql);
					
					Gson gson = new Gson();
					String json = gson.toJson(list);
					
					response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");

					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
					
					
				}
					
			}	catch(Exception e) {
				e.printStackTrace();
			} finally {
				// 비동기 완료처리 -> 컴플릿되면서 클라이언트에서도 이후 데이터 처리를 한다
				asyncContext.complete();
			}
		});
		
	}

	private String str(String str) {
		return"'" +str+"'";
		
	}

}
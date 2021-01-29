package pizzaOrderForm.csvDL;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet({"/csvDL"})

public class csvDL extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String[] list=(String[])session.getAttribute("csvstr");

		ServletContext context = this.getServletContext();
		File csvtmp = getTempFile(context);//一時ファイル生成
		FileOutputStream csvfos = new FileOutputStream(csvtmp);
		csvfos.write(0xef);
		csvfos.write(0xbb);
		csvfos.write(0xbf);
		exportCSV(list,csvfos);
	    csvfos.close();
	    FileReader filereader = new FileReader(csvtmp);
	    BufferedReader br = new BufferedReader(filereader);
		String str = br.readLine();

		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"Order.csv\"");
		PrintWriter w = response.getWriter();
		w.print(str);
	    w.close();
	    br.close();
	    csvtmp.delete();//一時ファイル削除用
	}

	public static File getTempFile(ServletContext context) throws IOException {
	    File tmpdir = (File) context.getAttribute("javax.servlet.context.tempdir");
	    File newfile=new File(tmpdir+"/test.csv");
	    newfile.createNewFile();
	    return newfile;
	}

	public void exportCSV(String[] list,FileOutputStream fos) {
		int i=1;
		Integer order_int=new Integer(i);
		String order_num=order_int.toString();
		PrintWriter writer = new PrintWriter(new OutputStreamWriter(fos));
		String list_str="\""+order_num+"\",\""+list[0]+"\",\""+list[1]+"\",\""+list[2]+"\",\""+list[3]+"\",\""+list[4]+"\",\""+list[5]+"\",\""+list[6]+"\"";
		writer.print(list_str);
		writer.print(",\n");
		writer.close();
	}

}

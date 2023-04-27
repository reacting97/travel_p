package handler.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import like.LikeService;
import like.LikeVo;

public class UpHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LikeService service = new LikeService();
		String id = request.getParameter("writer");
		int num = Integer.parseInt(request.getParameter("recommandnum"));
		LikeVo vo = service.getVo(num, id);
		//정보가 없으면 uplike
		if(vo==null) {
			service.upLike(new LikeVo(0,id,num));
		//정보가 있으면 downlike
		}else {
			service.downLike(new LikeVo(0,id,num));
		}
		
		
		int likecnt = service.getLike(num);
		
		JSONObject obj = new JSONObject();
		obj.put("cnt", likecnt);
		String txt = obj.toJSONString();
		return "responsebody/"+txt;
	}

}

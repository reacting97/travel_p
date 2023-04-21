package handler.travel;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import food.FoodService;
import food.FoodVO;
import handler.Handler;
import travel.TravelService;
import travel.TravelVO;

public class TravelDetailHandler implements Handler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		TravelService service = new TravelService();
		FoodService foodService = new FoodService();
		TravelVO travel = service.selectByNum(num);
		String[] locs = travel.getAddress().split(" ");
		String loc = null;
		String latitude = null;
		String longitude = null;
		if(locs[0].endsWith("시")) {
			loc = locs[0];
		} else if(locs[0].endsWith("도")) {
			loc = locs[1];
		}
		ArrayList<FoodVO> list = foodService.selectByLoc(loc);
		ArrayList<TravelVO> travelList = service.selectByLoc(loc);
		for(int i=0; i<travelList.size(); i++) {
			if(travelList.get(i).getAddress().equals(travel.getAddress())) {
				travelList.remove(i);
			}
		}
		
		String path = request.getServletContext().getRealPath("/WEB-INF/files/data.xml");
		String urlStr = "http://api.data.go.kr/openapi/tn_pubr_public_trrsrt_api";
				urlStr += "?serviceKey=hqbUzbZx%2BbQR6OgVCNvZDXGGWIVTWAIawDhN2Y9fbW6Pndu%2BrU9e1NaR9UpW7%2BPotKdwoD9cXlkHbSS7tzFRJQ%3D%3D";
				urlStr += "&type=xml";
		try {
			FileInputStream fis = new FileInputStream(path);
//			URL url = new URL(urlStr);
//			URLConnection conn = url.openConnection();
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(fis);
			Element root = doc.getDocumentElement();
			NodeList nodeList = root.getElementsByTagName("record");
			for(int i=0; i<nodeList.getLength(); i++) {
				Element element = (Element) nodeList.item(i);
				String rdnmadr = element.getElementsByTagName("소재지도로명주소").item(0).getTextContent();
				if(rdnmadr.equals(travel.getAddress())) {
					latitude = element.getElementsByTagName("위도").item(0).getTextContent();
					longitude = element.getElementsByTagName("경도").item(0).getTextContent();
				}
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("travel", travel);
		request.setAttribute("foodList", list);
		request.setAttribute("travelList", travelList);
		request.setAttribute("latitude", latitude);
		request.setAttribute("longtitude", longitude);
		return "/travel/travel_detail.jsp";
	}
}

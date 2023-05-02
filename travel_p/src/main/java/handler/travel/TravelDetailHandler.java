package handler.travel;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import handler.Handler;
import travel.TravelService;
import travel.TravelVO;
import weather.Weather;
 
public class TravelDetailHandler implements Handler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		TravelService service = new TravelService();
//		FoodService foodService = new FoodService();
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
		
//		ArrayList<FoodVO> list = foodService.selectByLoc(loc);
		ArrayList<TravelVO> travelList = service.selectByLoc(loc);
		
		Weather weather = null;
		for(int i=0; i<travelList.size(); i++) {
			if(travelList.get(i).getAddress().equals(travel.getAddress())) {
				travelList.remove(i);
			}
		}
		
		Collections.shuffle(travelList);
		if(travelList.size() < 6) {
			ArrayList<TravelVO> tmpList = service.selectByLoc(locs[0]);
			Collections.shuffle(tmpList);
			for(int i = 0; i<tmpList.size(); i++) {
				if(tmpList.get(i).getAddress().equals(travel.getAddress())) {
					tmpList.remove(i);
				}
			}
			
			for(int i = 0; i<tmpList.size(); i++) {
				travelList.add(tmpList.get(i));
			}
			
			for(int i=0; i<travelList.size(); i++) {
				for(int j=0; j<travelList.size(); j++) {
					if(i==j) {
					} else if(travelList.get(i).getAddress().equals(travelList.get(j).getAddress())) {
						travelList.remove(j);
					}
				}
			}
		}
		
		int code = 0;
		if(loc.startsWith("서울")) {
			code = 109;
		} else if(loc.startsWith("인천")) {			
			code = 109;
		} else if(loc.startsWith("대전")) {
			code = 133;
		} else if(loc.startsWith("광주")) {
			code = 156;
		} else if(loc.startsWith("대구")) {
			code = 143;
		} else if(loc.startsWith("울산")) {
			code = 159;
		} else if(loc.startsWith("부산")) {
			code = 159;
		} else if(loc.startsWith("제주") || loc.startsWith("서귀")) {
			code = 184;
		} else {
			if(locs[0].equals("경기도")) {
				code = 109;
			} else if(locs[0].equals("강원도")) {
				code = 105;
			} else if(locs[0].equals("충청북도")) {
				code = 131;
			} else if(locs[0].equals("충청남도")) {
				code = 133;
			} else if(locs[0].equals("전라북도")) {
				code = 146;
			} else if(locs[0].equals("전라남도")) {
				code = 156;
			} else if(locs[0].equals("경상북도")) {
				code = 143;
			} else if(locs[0].equals("경상남도")) {
				code = 159;
			}
		}
		
		String path = request.getServletContext().getRealPath("/WEB-INF/files/data.xml");
		String urlStr = "https://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId="+code;
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
			
			URL url = new URL(urlStr);
			URLConnection conn = url.openConnection();
			DocumentBuilderFactory wFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder wBuilder = wFactory.newDocumentBuilder();
			Document wDoc = wBuilder.parse(conn.getInputStream());
			Element wRoot = wDoc.getDocumentElement();
			NodeList loccations = wRoot.getElementsByTagName("location");
			for(int i=0; i<loccations.getLength(); i++) {
				Element loccation = (Element) loccations.item(i);
				String city = loccation.getElementsByTagName("city").item(0).getTextContent();
				if(city.substring(0, 2).equals(loc.substring(0, 2))) {
					Element data = (Element)loccation.getElementsByTagName("data").item(1);
					String dateTime = data.getElementsByTagName("tmEf").item(0).getTextContent();
					String info = data.getElementsByTagName("wf").item(0).getTextContent();
					if(info.startsWith("맑")) {
						info = "맑음";
					} else if(info.startsWith("흐") || info.startsWith("구름")) {
						info = "흐림";
					} else if(info.startsWith("비") || info.startsWith("흐리고 비")) {
						info = "비";
					}
						
					String tmn = data.getElementsByTagName("tmn").item(0).getTextContent();
					String tmx = data.getElementsByTagName("tmx").item(0).getTextContent();
					String rnst = data.getElementsByTagName("rnSt").item(0).getTextContent();//					NodeList datas = loccation.getElementsByTagName("data");
					weather = new Weather(city, dateTime, info, tmn, tmx, rnst);
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
//		request.setAttribute("foodList", list);
		request.setAttribute("travelList", travelList);
		request.setAttribute("latitude", latitude);
		request.setAttribute("longtitude", longitude);
		request.setAttribute("weather", weather);
		return "/travel/travel_detail.jsp";
	}
}

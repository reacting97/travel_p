package handler.travel;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

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

public class Inserter implements Handler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		TravelService service = new TravelService();
		String path = request.getServletContext().getRealPath("/WEB-INF/files/data.xml");
		try {
			FileInputStream fis = new FileInputStream(path);
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(fis);
			Element root = doc.getDocumentElement();
			NodeList nodeList = root.getElementsByTagName("record");
			System.out.println(nodeList.getLength());
			for(int i=0; i<nodeList.getLength(); i++) {
				Element element = (Element) nodeList.item(i);
				String name = element.getElementsByTagName("관광지명").item(0).getTextContent();
				String address = element.getElementsByTagName("소재지도로명주소").item(0).getTextContent();
				String phone = element.getElementsByTagName("관리기관전화번호").item(0).getTextContent();
				String content = element.getElementsByTagName("관광지소개").item(0).getTextContent();
				TravelVO travel = new TravelVO(0, name, address, phone, content, "", "", "");
				if(address.equals("")) {
					address ="주소";
				} else if(phone.equals("")) {
					phone = "번호";
				} else if(content.equals("")) {
					content = "내용";
				} else if(name.equals("")) {
					name = "이름";
				}
				
				service.insert(travel);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "/travel/index.jsp";
	}
}

package weather;

public class Weather {
	private String city;
	private String dateTime;
	private String info;
	// 최저 온도
	private String tmn;
	// 최고 온도
	private String tmx;
	// 강수 확률
	private String rnst;
	
	public Weather() {}

	public Weather(String city, String dateTime, String info, String tmn, String tmx, String rnst) {
		super();
		this.city = city;
		this.dateTime = dateTime;
		this.info = info;
		this.tmn = tmn;
		this.tmx = tmx;
		this.rnst = rnst;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getTmn() {
		return tmn;
	}

	public void setTmn(String tmin) {
		this.tmn = tmin;
	}

	public String getTmx() {
		return tmx;
	}

	public void setTmx(String tmax) {
		this.tmx = tmax;
	}

	public String getRnst() {
		return rnst;
	}

	public void setRnst(String rnst) {
		this.rnst = rnst;
	}

	@Override
	public String toString() {
		return "Weather [city=" + city + ", dateTime=" + dateTime + ", info=" + info + ", tmn=" + tmn + ", tmx="
				+ tmx + ", rnst=" + rnst + "]";
	}
}

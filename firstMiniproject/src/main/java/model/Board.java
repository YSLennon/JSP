package model;

public class Board {
	  private int boardNo;
	  private String uid;
	    private String organizer;
	    private String title;
	    private String contents;
	    private int distance;
	    private String addr;
	    private String status;
	    private String category;
	    private String map;
	    private String mapCenter;
	    private String datetime;
	    private String cdatetime;


	    // Constructor
	    public Board(int boardNo, String organizer, String title, String contents, int distance, String addr, String status, String category, String map, String mapCenter, String datetime, String cdatetime) {
	        this.boardNo = boardNo;
	        this.organizer = organizer;
	        this.title = title;
	        this.contents = contents;
	        this.distance = distance;
	        this.addr = addr;
	        this.status = status;
	        this.category = category;
	        this.map = map;
	        this.mapCenter = mapCenter;
	        this.datetime = datetime;
	        this.cdatetime = cdatetime;
	    }
	    
	    // listView
	    public Board(int boardNo, String title, String addr, String status, String category, String datetime) {
	        this.boardNo = boardNo;
	        this.title = title;
	        this.addr = addr;
	        this.status = status;
	        this.category = category;
	        this.datetime = datetime;
	    }
	 // Schedule
	    public Board(int boardNo,String uid, String title, String addr, String status, String category, String datetime) {
	        this.boardNo = boardNo;
	        this.uid = uid;
	        this.title = title;
	        this.addr = addr;
	        this.status = status;
	        this.category = category;
	        this.datetime = datetime;
	    }
	 // SideHistory
	    public Board(String title, int distance, String datetime) {
	        this.title = title;
	        this.distance= distance;
	        this.datetime = datetime;
	    }

		public int getBoardNo() {
			return boardNo;
		}

		public void setBoardNo(int boardNo) {
			this.boardNo = boardNo;
		}

		public String getUid() {
			return uid;
		}

		public void setUid(String uid) {
			this.uid = uid;
		}

		public String getOrganizer() {
			return organizer;
		}

		public void setOrganizer(String organizer) {
			this.organizer = organizer;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getContents() {
			return contents;
		}

		public void setContents(String contents) {
			this.contents = contents;
		}

		public int getDistance() {
			return distance;
		}

		public void setDistance(int distance) {
			this.distance = distance;
		}

		public String getAddr() {
			return addr;
		}

		public void setAddr(String addr) {
			this.addr = addr;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public String getMap() {
			return map;
		}

		public void setMap(String map) {
			this.map = map;
		}

		public String getMapCenter() {
			return mapCenter;
		}

		public void setMapCenter(String mapCenter) {
			this.mapCenter = mapCenter;
		}

		public String getDatetime() {
			return datetime;
		}

		public void setDatetime(String datetime) {
			this.datetime = datetime;
		}

		public String getCdatetime() {
			return cdatetime;
		}

		public void setCdatetime(String cdatetime) {
			this.cdatetime = cdatetime;
		}
}

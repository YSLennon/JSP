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
	    private String datetime;
	    private String cdatetime;


	    // Constructor
	    public Board(int boardNo, String organizer, String title, String contents, int distance, String addr, String status, String category, String datetime, String cdatetime) {
	        this.boardNo = boardNo;
	        this.organizer = organizer;
	        this.title = title;
	        this.contents = contents;
	        this.distance = distance;
	        this.addr = addr;
	        this.status = status;
	        this.category = category;
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
}

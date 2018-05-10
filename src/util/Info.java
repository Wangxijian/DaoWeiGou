package util;



import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDAO;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;


public class Info {
	
	public static String tform(HashMap map)
	{
		if(map.get("isgood")!=null){
			map.remove("note");
		}
    	String jscode = "";
    	try{
    	jscode+="<script type=\"text/javascript\">\n";
    	jscode+="function getPvalue()\n";
    	jscode+="{\n";
    	
    	 Set set = map.entrySet();
    	 Iterator it = set.iterator();
    	 while(it.hasNext())
    	 {
    	  String pm=((Object)it.next()).toString();
    	  String str1 = "";
    	  String str2 = "";
    	  String[] strs = pm.split("=");
    	  str1 = strs[0];
    	  if(strs.length==1)str2="";
    	  if(strs.length==2)str2=strs[1];
    	  jscode+=" if(f1."+str1+")\n";
    	  jscode+="{\n";
    	  jscode+="f1."+str1+".value=\""+str2+"\";\n";
    	  jscode+="}\n";
    	  
    	  jscode+="if(document.getElementById(\"txt\"))\n";
    	  jscode+="{\n";
    	  jscode+="document.getElementById(\"txt\").src=\"/daoweigou/upfile/"+map.get("filename")+"\";\n";
    	  jscode+="}\n";
    	 }
    	 jscode+="}\n";
    	 
    jscode+=" getPvalue();\n";
    jscode+="</script>\n";
    	}catch (Exception e) {
			e.printStackTrace();
		}
      return jscode;
	}
	
	
	
	public static String generalFileName(String srcFileName) {
		try{
		   int index=srcFileName.lastIndexOf(".");
		   return StrUtil.generalSrid()+srcFileName.substring(index).toLowerCase();
		}catch(Exception e){
			return StrUtil.generalSrid();
		}
	}

	public synchronized static String getID() {
		Random random = new Random();
		StringBuffer ret = new StringBuffer(20);
		String rand = String.valueOf(Math.abs(random.nextInt()));
		ret.append(getDateStr());
		ret.append(rand.substring(0,6));
		
		return ret.toString();
	} 
	
	public synchronized static String subStr(String source,int length) {
		if(source.length()>length)
		{
			source=source.substring(0,length)+"...";
		}
		
		return source;
	} 
	
	

	public static String getDateStr(){
		String dateString="";
		try{//yyyyMMddHHmmss
		java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date currentTime_1=new java.util.Date();
		dateString=formatter.format(currentTime_1);
		}catch(Exception e){
		     }
		 return dateString;
		 } 
	
	public static String getAutoNo(){
		String dateString="";
		try{//yyyyMMddHHmmss
		java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("MMddHHmmss");
		java.util.Date currentTime_1=new java.util.Date();
		dateString=formatter.format(currentTime_1);
		}catch(Exception e){
		     }
		 return dateString;
		 } 
	
	public static void main(String[] g )
	{
	//System.out.print(Info.getDateStr());
	
	//int a = dayToday("2013-03-25 00:00:00","2013-03-26 00:00:00");
	//System.out.println(a);
		
	}
	


	
	 public static String getUTFStr(String str) {
		 if(str==null){
			 return "";
		 }
		 
		 try {
			str =  new String(str.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	 }
	 
	 public static String getGBKStr(String str) throws UnsupportedEncodingException{
		 if(str==null){
			 return "";
		 }
		 return  new String(str.getBytes("ISO-8859-1"),"GBK");
	 }
	 
	 public static String getGB2312Str(String str) throws UnsupportedEncodingException{
		 if(str==null){
			 return "";
		 }
		 return  new String(str.getBytes("ISO-8859-1"),"gb2312");
	 }

	 
	 /**
		 *得到多少天之后之前的日期��
		 * @param String date
		 * @param int day
		 * @return
		 */
		public static String getDay(String date,int day) {
			String b = date.substring(0,10);
			String c = b.substring(0,4);
			String d = b.substring(5,7);
			String f = b.substring(8,10);
			String aa = c+"/"+d+"/"+f;
			String a = "";
			DateFormat dateFormat =  DateFormat.getDateInstance(DateFormat.MEDIUM);
				GregorianCalendar grc=new GregorianCalendar();
				grc.setTime(new Date(aa));
	            grc.add(GregorianCalendar.DAY_OF_MONTH,day);
	            String resu = dateFormat.format(grc.getTime());
	        String t[]= resu.split("-");
	        String sesuu = "";
	        for(int i=0;i<t.length;i++)
	        {
	        	if(t[i].length()==1)
	        	{
	        		t[i]="0"+t[i];
	        	}
	        	sesuu += t[i]+"-";
	        }
	        
			return sesuu.substring(0,10);
		}
		

	    
	    
	    /**
	 	 * 计算两个时期之间的天数
	 	 * 
	 	 */
	    public static int dayToday(String DATE1, String DATE2) {
	       int i = 0;
	       DATE1 = DATE1.substring(0,DATE1.indexOf(" "));
	       DATE2 = DATE2.substring(0,DATE2.indexOf(" "));
	       
	       String[] d1 = DATE1.split("-");
	       if(d1[1].length()==1)
	       {
	    	   DATE1 = d1[0]+"-0"+d1[1];
	       }else{
	    	   DATE1 = d1[0]+"-"+d1[1];
	       }
	       
	       if(d1[2].length()==1)
	       {
	    	   DATE1 = DATE1+"-0"+d1[2];
	       }else{
	    	   DATE1 = DATE1+"-"+d1[2];
	       }
	       
	       String[] d2 = DATE2.split("-");
	       if(d2[1].length()==1)
	       {
	    	   DATE2 = d2[0]+"-0"+d2[1];
	       }else{
	    	   DATE2 = d2[0]+"-"+d2[1];
	       }
	       
	       if(d2[2].length()==1)
	       {
	    	   DATE2 = DATE2+"-0"+d2[2];
	       }else{
	    	   DATE2 = DATE2+"-"+d2[2];
	       }
	       
	       
	       for(int j=0;j<10000;j++)
	       {
	    	i=j;
	    	String gday = Info.getDay(DATE1, j);
	    	if(gday.equals(DATE2))
	    	{
	    		break;
	    	}
	       }
	        return i;
	    }
	    
	   
	    

	    /**
	 	 * 比较时间大小
	 	 * 
	 	 */
	    public static String compare_datezq(String DATE1, String DATE2) {
	       DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date dt1 = df.parse(DATE1);
	            Date dt2 = df.parse(DATE2);
	            if (dt1.getTime() > dt2.getTime()) {
	               
	                return "big";
	            } else if (dt1.getTime() < dt2.getTime()) {
	              
	                return "small";
	            } else {
	                return "den";
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return "den";
	    }
	    
	    /**
	 	 * 过滤html代码
	 	 * 
	 	 */
	    public static String filterStrIgnoreCase(String source, String from, String to){
	        String sourceLowcase=source.toLowerCase();
	        String sub1,sub2,subLowcase1,subLowcase2;
	        sub1=sub2=subLowcase1=subLowcase2="";
	        int start=0,end;
	        boolean done=true;
	        if(source==null) return null;
	        if(from==null||from.equals("")||to==null||to.equals("")) 
	         return source;
	        while(done){
	         start=sourceLowcase.indexOf(from,start);
	         if(start==-1) {
	          break;
	         }
	         subLowcase1=sourceLowcase.substring(0,start);
	         sub1=source.substring(0,start);
	         end=sourceLowcase.indexOf(to,start);
	         if(end==-1){
	          end=sourceLowcase.indexOf("/>",start); 
	          if(end==-1) {
	           done=false;
	          }
	         }
	         else{
	          end=end+to.length();
	          subLowcase2=sourceLowcase.substring(end,source.length());
	          sub2=source.substring(end,source.length());
	          sourceLowcase=subLowcase1+subLowcase2;
	          source=sub1+sub2;
	         }
	         //System.out.println(start+" "+end);
	        }
	        return source.replaceAll("&nbsp;", "");
	   }
	    
	   
	    public static void delPic(String path,String img)
		{
			 if(img!=null)
			 {
				 if(!img.equals(""))
				 {
			  File file1=new File(path + "/" + img); 
		       if(file1.exists() ) {
		    	file1.deleteOnExit();
		         file1.delete(); 
		       }}}
		}
	    
	    
	    public static void writeExcel(String fileName,String[] pros,java.util.List<HashMap> list,HttpServletRequest request, HttpServletResponse response){    
	        WritableWorkbook  wwb = null;    
	        try {    
	            //首先要使用Workbook类的工厂方法创建一个可写入的工作薄(Workbook)对象    
	            wwb = Workbook.createWorkbook(new File(fileName));    
	        } catch (IOException e) {    
	            e.printStackTrace();    
	        }    
	        if(wwb!=null){    
	            //创建一个可写入的工作表    
	            //Workbook的createSheet方法有两个参数，第一个是工作表的名称，第二个是工作表在工作薄中的位置    
	            WritableSheet ws = wwb.createSheet("sheet1", 0);    
	             
	            try {
	            
	            	
	            for(int i=0;i<pros.length;i++)
	            {
	            Label label1 = new Label(i, 0,"");
	            label1.setString(pros[i]);
	            ws.addCell(label1);
	            }
	            
	            } catch (RowsExceededException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (WriteException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}    
	            
	            
	            
	            //下面开始添加单元格  
				int i=1;
				System.out.println(list);
	            for(HashMap t:list){  
	            	try {
	            		
	            	Iterator it = t.entrySet().iterator();
	            	int jj=0;
	            		while(it.hasNext())
	            		{
	            	Label label1 = new Label(jj, i,"");
	            	String a = it.next().toString().replaceAll("null", " abc  ");
	            	if(a.split("=").length==1)a=a+"abc";
	            	System.out.println(a);
		            label1.setString(a.split("=")[1]);
		            ws.addCell(label1);
		            jj++;
	            		}
		            
		            i++;
	            } catch (RowsExceededException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (WriteException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}    
	            }    
	   
	            try {    
	                //从内存中写入文件中    
	                wwb.write();    
	                //关闭资源，释放内存    
	                wwb.close();    
	            } catch (IOException e) {    
	                e.printStackTrace();    
	            } catch (Exception e) {    
	                e.printStackTrace();    
	            }    
	        }
	        
	     
	    }
	    
	    

		public static String getImgUpInfo2(int height)
		{
			String jscode = "";
			jscode+="<img style=\"cursor: hand\" onclick=\"uploadimg()\" src=\"/daoweigou/js/nopic.jpg\" id=txt height=\""+height+"\"/>";
			jscode+="<input type=hidden name=\"filename\" id=\"filename\" value=\"\" />";
			jscode+="<script type=\"text/javascript\"  src=\"/daoweigou/js/popup.js\"></script>";
			return jscode;
		}
		
		
		public static int getkc(String gid){
			CommDAO dao = new CommDAO();
			int znum = 0;
	    	int innum = 0;
	    	int outnum = 0;
	    	ArrayList<HashMap> inlist = (ArrayList<HashMap>)dao.select("select * from kcrecord where  type='in' and gid='"+gid+"' ");
	    	ArrayList<HashMap> outlist = (ArrayList<HashMap>)dao.select("select * from kcrecord where  type='out' and gid='"+gid+"' ");
	    	if(inlist.size()>0){
	    		for(HashMap inmap:inlist){
	    			innum += Integer.parseInt(inmap.get("happennum").toString());//总入库量
	    		}
	    	}
	    	if(outlist.size()>0){
	    		for(HashMap outmap:outlist){
	    			outnum += Integer.parseInt(outmap.get("happennum").toString());//总出库量
	    		}
	    	}
	    	znum = innum - outnum;//库存量
	    	return znum;
		}
}

		


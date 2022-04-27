
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActPostingSpecCharacters;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;



public class ENActPostingSpecCharacters implements Serializable {

	public static final String ENACTPOSTINGSPECCHARACTERS_z = "[z]";
	public static final String ENACTPOSTINGSPECCHARACTERS_b = "[b]";
	
    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public String  commentGen; 


    public static final String tableName = "ENACTPOSTINGSPCCHRCTRS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTPOSTINGSPCCHRCTRS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENACTPOSTINGSPCCHRCTRS.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENACTPOSTINGSPCCHRCTRS.COMMENTGEN";




    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
    }


} // end of ENActPostingSpecCharactersValueObject


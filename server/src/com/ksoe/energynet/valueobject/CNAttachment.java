
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNAttachment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class CNAttachment implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  soCode = Integer.MIN_VALUE;
    public String  name; 
    public Date date_doc ;
    public String  filename; 
    public String  filelink; 
    public static final String tableName = "CNATTACHMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "CNATTACHMENT.CODE";
    public static final String soCode_Attr = "soCode";
    public static final String soCode_Field = "SOCODE";
    public static final String soCode_QFielld = "CNATTACHMENT.SOCODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "CNATTACHMENT.NAME";
    public static final String date_doc_Attr = "date_doc";
    public static final String date_doc_Field = "DATE_DOC";
    public static final String date_doc_QFielld = "CNATTACHMENT.DATE_DOC";
    public static final String filename_Attr = "filename";
    public static final String filename_Field = "FILENAME";
    public static final String filename_QFielld = "CNATTACHMENT.FILENAME";
    public static final String filelink_Attr = "filelink";
    public static final String filelink_Field = "FILELINK";
    public static final String filelink_QFielld = "CNATTACHMENT.FILELINK";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setSoCode(int aValue){
       soCode = aValue;
    }

    public int getSoCode(){
       return soCode;
    }


    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


    public void setDate_doc(Date aValue){
       date_doc = aValue;
    }

    public Date getDate_doc(){
       return date_doc;
    }


    public void setFilename(String aValue){
       filename = aValue;
    }

    public String getFilename(){
       return filename;
    }


    public void setFilelink(String aValue){
       filelink = aValue;
    }

    public String getFilelink(){
       return filelink;
    }


} // end of CNAttachmentValueObject


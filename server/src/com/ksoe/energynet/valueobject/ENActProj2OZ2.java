
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActProj2OZ2;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENReconstrModernOZRef;

public class ENActProj2OZ2 implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberGen; 
    public Date dateGen ;
    public String  commentGen; 
    public BigDecimal  summaGen; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENReconstrModernOZRef ENReconstrModernOZRef = new ENReconstrModernOZRef();
    public static final String tableName = "ENACTPROJ2OZ2";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTPROJ2OZ2.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENACTPROJ2OZ2.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENACTPROJ2OZ2.DATEGEN";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENACTPROJ2OZ2.COMMENTGEN";
    public static final String summaGen_Attr = "summaGen";
    public static final String summaGen_Field = "SUMMAGEN";
    public static final String summaGen_QFielld = "ENACTPROJ2OZ2.SUMMAGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACTPROJ2OZ2.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACTPROJ2OZ2.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACTPROJ2OZ2.MODIFY_TIME";
    public static final String ENReconstrModernOZRef_Attr = "ENReconstrModernOZRef";
    public static final String ENReconstrModernOZRef_Field = "ENRECONSTRMODERNOZRFCD";
    public static final String  ENReconstrModernOZRef_QFielld = "ENACTPROJ2OZ2.ENRECONSTRMODERNOZRFCD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setSummaGen(BigDecimal aValue){
       summaGen = aValue;
    }

    public BigDecimal getSummaGen(){
       return summaGen;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setENReconstrModernOZRef(ENReconstrModernOZRef aValue){
       ENReconstrModernOZRef = aValue;
    }

    public ENReconstrModernOZRef getENReconstrModernOZRef(){
       return ENReconstrModernOZRef;
    }

} // end of ENActProj2OZ2ValueObject


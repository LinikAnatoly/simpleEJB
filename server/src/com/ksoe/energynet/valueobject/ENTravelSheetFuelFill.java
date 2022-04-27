
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetFuelFill;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTravelSheetRef;

public class ENTravelSheetFuelFill implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  reg_id = Integer.MIN_VALUE; 
    public Date timeGen ;
    public BigDecimal  countGen; 
    public Date timeReceived ;
    public long  modify_time = Long.MIN_VALUE;
    public ENTravelSheetRef travelSheetRef = new ENTravelSheetRef();
    public static final String tableName = "ENTRAVELSHEETFUELFILL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEETFUELFILL.CODE";
    public static final String reg_id_Attr = "reg_id";
    public static final String reg_id_Field = "REG_ID";
    public static final String reg_id_QFielld = "ENTRAVELSHEETFUELFILL.REG_ID";
    public static final String timeGen_Attr = "timeGen";
    public static final String timeGen_Field = "TIMEGEN";
    public static final String timeGen_QFielld = "ENTRAVELSHEETFUELFILL.TIMEGEN";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENTRAVELSHEETFUELFILL.COUNTGEN";
    public static final String timeReceived_Attr = "timeReceived";
    public static final String timeReceived_Field = "TIMERECEIVED";
    public static final String timeReceived_QFielld = "ENTRAVELSHEETFUELFILL.TIMERECEIVED";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRAVELSHEETFUELFILL.MODIFY_TIME";
    public static final String travelSheetRef_Attr = "travelSheetRef";
    public static final String travelSheetRef_Field = "TRAVELSHEETREFCODE";
    public static final String  travelSheetRef_QFielld = "ENTRAVELSHEETFUELFILL.TRAVELSHEETREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setReg_id(int aValue){
       reg_id = aValue;
    }

    public int getReg_id(){
       return reg_id;
    }


    public void setTimeGen(Date aValue){
       timeGen = aValue;
    }

    public Date getTimeGen(){
       return timeGen;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }


    public void setTimeReceived(Date aValue){
       timeReceived = aValue;
    }

    public Date getTimeReceived(){
       return timeReceived;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setTravelSheetRef(ENTravelSheetRef aValue){
       travelSheetRef = aValue;
    }

    public ENTravelSheetRef getTravelSheetRef(){
       return travelSheetRef;
    }

} // end of ENTravelSheetFuelFillValueObject


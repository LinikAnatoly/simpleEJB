
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInputItemOZ2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.SCUsageInputItemOZRef;

public class SCUsageInputItemOZ2Prov implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  partId = Integer.MIN_VALUE; 
    public String  userGen; 
    public Date datePosting ;
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public String  voucher; 
    public SCUsageInputItemOZRef ozRef = new SCUsageInputItemOZRef();
    public static final String tableName = "SCUSAGEINPUTITEMOZ2PRV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUTITEMOZ2PRV.CODE";
    public static final String partId_Attr = "partId";
    public static final String partId_Field = "PARTID";
    public static final String partId_QFielld = "SCUSAGEINPUTITEMOZ2PRV.PARTID";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "SCUSAGEINPUTITEMOZ2PRV.USERGEN";
    public static final String datePosting_Attr = "datePosting";
    public static final String datePosting_Field = "DATEPOSTING";
    public static final String datePosting_QFielld = "SCUSAGEINPUTITEMOZ2PRV.DATEPOSTING";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "SCUSAGEINPUTITEMOZ2PRV.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCUSAGEINPUTITEMOZ2PRV.MODIFY_TIME";
    public static final String voucher_Attr = "voucher";
    public static final String voucher_Field = "VOUCHER";
    public static final String voucher_QFielld = "SCUSAGEINPUTITEMOZ2PRV.VOUCHER";
    public static final String ozRef_Attr = "ozRef";
    public static final String ozRef_Field = "OZREFCODE";
    public static final String  ozRef_QFielld = "SCUSAGEINPUTITEMOZ2PRV.OZREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setPartId(int aValue){
       partId = aValue;
    }

    public int getPartId(){
       return partId;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDatePosting(Date aValue){
       datePosting = aValue;
    }

    public Date getDatePosting(){
       return datePosting;
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


    public void setVoucher(String aValue){
       voucher = aValue;
    }

    public String getVoucher(){
       return voucher;
    }

    public void setOzRef(SCUsageInputItemOZRef aValue){
       ozRef = aValue;
    }

    public SCUsageInputItemOZRef getOzRef(){
       return ozRef;
    }

} // end of SCUsageInputItemOZ2ProvValueObject


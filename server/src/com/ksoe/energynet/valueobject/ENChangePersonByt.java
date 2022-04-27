
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENChangePersonByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENChangePersonByt implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  fio; 
    public String  accountNumber; 
    public int  packCode = Integer.MIN_VALUE; 
    public String  registrationNumber; 
    public Date registrationDate ;
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENCHANGEPERSONBYT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCHANGEPERSONBYT.CODE";
    public static final String fio_Attr = "fio";
    public static final String fio_Field = "FIO";
    public static final String fio_QFielld = "ENCHANGEPERSONBYT.FIO";
    public static final String accountNumber_Attr = "accountNumber";
    public static final String accountNumber_Field = "ACCOUNTNUMBER";
    public static final String accountNumber_QFielld = "ENCHANGEPERSONBYT.ACCOUNTNUMBER";
    public static final String packCode_Attr = "packCode";
    public static final String packCode_Field = "PACKCODE";
    public static final String packCode_QFielld = "ENCHANGEPERSONBYT.PACKCODE";
    public static final String registrationNumber_Attr = "registrationNumber";
    public static final String registrationNumber_Field = "REGISTRATIONNUMBER";
    public static final String registrationNumber_QFielld = "ENCHANGEPERSONBYT.REGISTRATIONNUMBER";
    public static final String registrationDate_Attr = "registrationDate";
    public static final String registrationDate_Field = "REGISTRATIONDATE";
    public static final String registrationDate_QFielld = "ENCHANGEPERSONBYT.REGISTRATIONDATE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCHANGEPERSONBYT.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCHANGEPERSONBYT.PLANREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setFio(String aValue){
       fio = aValue;
    }

    public String getFio(){
       return fio;
    }


    public void setAccountNumber(String aValue){
       accountNumber = aValue;
    }

    public String getAccountNumber(){
       return accountNumber;
    }


    public void setPackCode(int aValue){
       packCode = aValue;
    }

    public int getPackCode(){
       return packCode;
    }


    public void setRegistrationNumber(String aValue){
       registrationNumber = aValue;
    }

    public String getRegistrationNumber(){
       return registrationNumber;
    }


    public void setRegistrationDate(Date aValue){
       registrationDate = aValue;
    }

    public Date getRegistrationDate(){
       return registrationDate;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of ENChangePersonBytValueObject


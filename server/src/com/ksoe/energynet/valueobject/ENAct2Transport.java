
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2Transport;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.techcard.valueobject.references.TKClassificationTypeRef;

public class ENAct2Transport implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  invNumber; 
    public String  name; 
    public BigDecimal  expense; 
    public BigDecimal  depreciationMonth; 
    public BigDecimal  depreciationHours; 
    public BigDecimal  timeWork; 
    public BigDecimal  paysWork; 
    public BigDecimal  repairCostsPerHour; 
    public long  modify_time = Long.MIN_VALUE;
    public ENActRef actRef = new ENActRef();
    public TKClassificationTypeRef classificationTypeRef = new TKClassificationTypeRef();
    public static final String tableName = "ENACT2TRANSPORT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2TRANSPORT.CODE";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENACT2TRANSPORT.INVNUMBER";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENACT2TRANSPORT.NAME";
    public static final String expense_Attr = "expense";
    public static final String expense_Field = "EXPENSE";
    public static final String expense_QFielld = "ENACT2TRANSPORT.EXPENSE";
    public static final String depreciationMonth_Attr = "depreciationMonth";
    public static final String depreciationMonth_Field = "DEPRECIATIONMONTH";
    public static final String depreciationMonth_QFielld = "ENACT2TRANSPORT.DEPRECIATIONMONTH";
    public static final String depreciationHours_Attr = "depreciationHours";
    public static final String depreciationHours_Field = "DEPRECIATIONHOURS";
    public static final String depreciationHours_QFielld = "ENACT2TRANSPORT.DEPRECIATIONHOURS";
    public static final String timeWork_Attr = "timeWork";
    public static final String timeWork_Field = "TIMEWORK";
    public static final String timeWork_QFielld = "ENACT2TRANSPORT.TIMEWORK";
    public static final String paysWork_Attr = "paysWork";
    public static final String paysWork_Field = "PAYSWORK";
    public static final String paysWork_QFielld = "ENACT2TRANSPORT.PAYSWORK";
    public static final String repairCostsPerHour_Attr = "repairCostsPerHour";
    public static final String repairCostsPerHour_Field = "REPAIRCOSTSPERHOUR";
    public static final String repairCostsPerHour_QFielld = "ENACT2TRANSPORT.REPAIRCOSTSPERHOUR";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACT2TRANSPORT.MODIFY_TIME";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2TRANSPORT.ACTREFCODE";
    public static final String classificationTypeRef_Attr = "classificationTypeRef";
    public static final String classificationTypeRef_Field = "CLASSIFICATIONTYPERFCD";
    public static final String  classificationTypeRef_QFielld = "ENACT2TRANSPORT.CLASSIFICATIONTYPERFCD";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }


    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


    public void setExpense(BigDecimal aValue){
       expense = aValue;
    }

    public BigDecimal getExpense(){
       return expense;
    }


    public void setDepreciationMonth(BigDecimal aValue){
       depreciationMonth = aValue;
    }

    public BigDecimal getDepreciationMonth(){
       return depreciationMonth;
    }


    public void setDepreciationHours(BigDecimal aValue){
       depreciationHours = aValue;
    }

    public BigDecimal getDepreciationHours(){
       return depreciationHours;
    }


    public void setTimeWork(BigDecimal aValue){
       timeWork = aValue;
    }

    public BigDecimal getTimeWork(){
       return timeWork;
    }


    public void setPaysWork(BigDecimal aValue){
       paysWork = aValue;
    }

    public BigDecimal getPaysWork(){
       return paysWork;
    }


    public void setRepairCostsPerHour(BigDecimal aValue){
       repairCostsPerHour = aValue;
    }

    public BigDecimal getRepairCostsPerHour(){
       return repairCostsPerHour;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setClassificationTypeRef(TKClassificationTypeRef aValue){
       classificationTypeRef = aValue;
    }

    public TKClassificationTypeRef getClassificationTypeRef(){
       return classificationTypeRef;
    }

} // end of ENAct2TransportValueObject


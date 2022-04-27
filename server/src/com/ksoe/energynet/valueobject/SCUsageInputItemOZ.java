
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInputItemOZ;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.SCUsageInputItemRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class SCUsageInputItemOZ implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public String  numberDoc; 
    public int  numberInt = Integer.MIN_VALUE; 
    public String  counterType; 
    public String  account; 
    public BigDecimal  cost; 
    public int  countGen = Integer.MIN_VALUE; 
    public int  scCode = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public SCUsageInputItemRef usageInputItemRef = new SCUsageInputItemRef();
    public ENDepartmentRef budgetRef = new ENDepartmentRef();
    public static final String tableName = "SCUSAGEINPUTITEMOZ";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUTITEMOZ.CODE";
    public static final String numberDoc_Attr = "numberDoc";
    public static final String numberDoc_Field = "NUMBERDOC";
    public static final String numberDoc_QFielld = "SCUSAGEINPUTITEMOZ.NUMBERDOC";
    public static final String numberInt_Attr = "numberInt";
    public static final String numberInt_Field = "NUMBERINT";
    public static final String numberInt_QFielld = "SCUSAGEINPUTITEMOZ.NUMBERINT";
    public static final String counterType_Attr = "counterType";
    public static final String counterType_Field = "COUNTERTYPE";
    public static final String counterType_QFielld = "SCUSAGEINPUTITEMOZ.COUNTERTYPE";
    public static final String account_Attr = "account";
    public static final String account_Field = "ACCOUNT";
    public static final String account_QFielld = "SCUSAGEINPUTITEMOZ.ACCOUNT";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "SCUSAGEINPUTITEMOZ.COST";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "SCUSAGEINPUTITEMOZ.COUNTGEN";
    public static final String scCode_Attr = "scCode";
    public static final String scCode_Field = "SCCODE";
    public static final String scCode_QFielld = "SCUSAGEINPUTITEMOZ.SCCODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCUSAGEINPUTITEMOZ.MODIFY_TIME";
    public static final String usageInputItemRef_Attr = "usageInputItemRef";
    public static final String usageInputItemRef_Field = "USAGEINPUTITEMREFCODE";
    public static final String  usageInputItemRef_QFielld = "SCUSAGEINPUTITEMOZ.USAGEINPUTITEMREFCODE";
    public static final String budgetRef_Attr = "budgetRef";
    public static final String budgetRef_Field = "BUDGETREFCODE";
    public static final String  budgetRef_QFielld = "SCUSAGEINPUTITEMOZ.BUDGETREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setNumberDoc(String aValue){
       numberDoc = aValue;
    }

    public String getNumberDoc(){
       return numberDoc;
    }


    public void setNumberInt(int aValue){
       numberInt = aValue;
    }

    public int getNumberInt(){
       return numberInt;
    }


    public void setCounterType(String aValue){
       counterType = aValue;
    }

    public String getCounterType(){
       return counterType;
    }


    public void setAccount(String aValue){
       account = aValue;
    }

    public String getAccount(){
       return account;
    }


    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
    }


    public void setCountGen(int aValue){
       countGen = aValue;
    }

    public int getCountGen(){
       return countGen;
    }


    public void setScCode(int aValue){
       scCode = aValue;
    }

    public int getScCode(){
       return scCode;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setUsageInputItemRef(SCUsageInputItemRef aValue){
       usageInputItemRef = aValue;
    }

    public SCUsageInputItemRef getUsageInputItemRef(){
       return usageInputItemRef;
    }
    public void setBudgetRef(ENDepartmentRef aValue){
       budgetRef = aValue;
    }

    public ENDepartmentRef getBudgetRef(){
       return budgetRef;
    }

} // end of SCUsageInputItemOZValueObject


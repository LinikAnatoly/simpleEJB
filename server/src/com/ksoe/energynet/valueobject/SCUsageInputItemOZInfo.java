
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInputItemOZInfo;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.SCUsageInputItemOZRef;

public class SCUsageInputItemOZInfo implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  sourceCode; 
    public String  account; 
    public String  expensesCode; 
    public BigDecimal  sumWithNds; 
    public BigDecimal  sumNds; 
    public BigDecimal  sumGen; 
    public long  modify_time = Long.MIN_VALUE;
    public SCUsageInputItemOZRef usageInputItemOZRef = new SCUsageInputItemOZRef();
    public static final String tableName = "SCUSAGEINPUTITEMOZINFO";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUTITEMOZINFO.CODE";
    public static final String sourceCode_Attr = "sourceCode";
    public static final String sourceCode_Field = "SOURCECODE";
    public static final String sourceCode_QFielld = "SCUSAGEINPUTITEMOZINFO.SOURCECODE";
    public static final String account_Attr = "account";
    public static final String account_Field = "ACCOUNT";
    public static final String account_QFielld = "SCUSAGEINPUTITEMOZINFO.ACCOUNT";
    public static final String expensesCode_Attr = "expensesCode";
    public static final String expensesCode_Field = "EXPENSESCODE";
    public static final String expensesCode_QFielld = "SCUSAGEINPUTITEMOZINFO.EXPENSESCODE";
    public static final String sumWithNds_Attr = "sumWithNds";
    public static final String sumWithNds_Field = "SUMWITHNDS";
    public static final String sumWithNds_QFielld = "SCUSAGEINPUTITEMOZINFO.SUMWITHNDS";
    public static final String sumNds_Attr = "sumNds";
    public static final String sumNds_Field = "SUMNDS";
    public static final String sumNds_QFielld = "SCUSAGEINPUTITEMOZINFO.SUMNDS";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "SCUSAGEINPUTITEMOZINFO.SUMGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCUSAGEINPUTITEMOZINFO.MODIFY_TIME";
    public static final String usageInputItemOZRef_Attr = "usageInputItemOZRef";
    public static final String usageInputItemOZRef_Field = "USAGEINPUTITEMOZREFCOD";
    public static final String  usageInputItemOZRef_QFielld = "SCUSAGEINPUTITEMOZINFO.USAGEINPUTITEMOZREFCOD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setSourceCode(String aValue){
       sourceCode = aValue;
    }

    public String getSourceCode(){
       return sourceCode;
    }

    public void setAccount(String aValue){
       account = aValue;
    }

    public String getAccount(){
       return account;
    }

    public void setExpensesCode(String aValue){
       expensesCode = aValue;
    }

    public String getExpensesCode(){
       return expensesCode;
    }

    public void setSumWithNds(BigDecimal aValue){
       sumWithNds = aValue;
    }

    public BigDecimal getSumWithNds(){
       return sumWithNds;
    }

    public void setSumNds(BigDecimal aValue){
       sumNds = aValue;
    }

    public BigDecimal getSumNds(){
       return sumNds;
    }

    public void setSumGen(BigDecimal aValue){
       sumGen = aValue;
    }

    public BigDecimal getSumGen(){
       return sumGen;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setUsageInputItemOZRef(SCUsageInputItemOZRef aValue){
       usageInputItemOZRef = aValue;
    }

    public SCUsageInputItemOZRef getUsageInputItemOZRef(){
       return usageInputItemOZRef;
    }

} // end of SCUsageInputItemOZInfoValueObject


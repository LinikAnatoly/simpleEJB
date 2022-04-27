
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCUsageInputItemOZInfo;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;


public class SCUsageInputItemOZInfoShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String sourceCode;
    public String account;
    public String expensesCode;
    public BigDecimal sumWithNds;
    public BigDecimal sumNds;
    public BigDecimal sumGen;
    public int usageInputItemOZRefCode = Integer.MIN_VALUE;
    public String usageInputItemOZRefNumberDoc;
    public String usageInputItemOZRefCounterType;
    public String usageInputItemOZRefAccount;
    public BigDecimal usageInputItemOZRefCost;
    public int usageInputItemOZRefCountGen = Integer.MIN_VALUE;
    public int usageInputItemOZRefScCode = Integer.MIN_VALUE;

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


    public void setUsageInputItemOZRefCode(int aValue){
       usageInputItemOZRefCode = aValue;
    }
    public int getUsageInputItemOZRefCode(){
       return usageInputItemOZRefCode;
    }

    public void setUsageInputItemOZRefNumberDoc(String aValue){
       usageInputItemOZRefNumberDoc = aValue;
    }
    public String getUsageInputItemOZRefNumberDoc(){
       return usageInputItemOZRefNumberDoc;
    }

    public void setUsageInputItemOZRefCounterType(String aValue){
       usageInputItemOZRefCounterType = aValue;
    }
    public String getUsageInputItemOZRefCounterType(){
       return usageInputItemOZRefCounterType;
    }

    public void setUsageInputItemOZRefAccount(String aValue){
       usageInputItemOZRefAccount = aValue;
    }
    public String getUsageInputItemOZRefAccount(){
       return usageInputItemOZRefAccount;
    }

    public void setUsageInputItemOZRefCost(BigDecimal aValue){
       usageInputItemOZRefCost = aValue;
    }
    public BigDecimal getUsageInputItemOZRefCost(){
       return usageInputItemOZRefCost;
    }

    public void setUsageInputItemOZRefCountGen(int aValue){
       usageInputItemOZRefCountGen = aValue;
    }
    public int getUsageInputItemOZRefCountGen(){
       return usageInputItemOZRefCountGen;
    }

    public void setUsageInputItemOZRefScCode(int aValue){
       usageInputItemOZRefScCode = aValue;
    }
    public int getUsageInputItemOZRefScCode(){
       return usageInputItemOZRefScCode;
    }



}
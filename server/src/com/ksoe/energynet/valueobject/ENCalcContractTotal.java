
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcContractTotal;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENCalcContractTotal implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  costWithoutVAT; 
    public BigDecimal  costVAT; 
    public BigDecimal  totalCost; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENCALCCONTRACTTOTAL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCCONTRACTTOTAL.CODE";
    public static final String costWithoutVAT_Attr = "costWithoutVAT";
    public static final String costWithoutVAT_Field = "COSTWITHOUTVAT";
    public static final String costWithoutVAT_QFielld = "ENCALCCONTRACTTOTAL.COSTWITHOUTVAT";
    public static final String costVAT_Attr = "costVAT";
    public static final String costVAT_Field = "COSTVAT";
    public static final String costVAT_QFielld = "ENCALCCONTRACTTOTAL.COSTVAT";
    public static final String totalCost_Attr = "totalCost";
    public static final String totalCost_Field = "TOTALCOST";
    public static final String totalCost_QFielld = "ENCALCCONTRACTTOTAL.TOTALCOST";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCCONTRACTTOTAL.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCALCCONTRACTTOTAL.PLANREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCostWithoutVAT(BigDecimal aValue){
       costWithoutVAT = aValue;
    }

    public BigDecimal getCostWithoutVAT(){
       return costWithoutVAT;
    }

    public void setCostVAT(BigDecimal aValue){
       costVAT = aValue;
    }

    public BigDecimal getCostVAT(){
       return costVAT;
    }

    public void setTotalCost(BigDecimal aValue){
       totalCost = aValue;
    }

    public BigDecimal getTotalCost(){
       return totalCost;
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

} // end of ENCalcContractTotalValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesObject2PaymentSchedule;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENServicesObject2PaymentSchedule implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date startDate ;
    public Date endDate ;
    public BigDecimal  paySum; 
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENSERVCSBJCT2PMNTSCHDL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVCSBJCT2PMNTSCHDL.CODE";
    public static final String startDate_Attr = "startDate";
    public static final String startDate_Field = "STARTDATE";
    public static final String startDate_QFielld = "ENSERVCSBJCT2PMNTSCHDL.STARTDATE";
    public static final String endDate_Attr = "endDate";
    public static final String endDate_Field = "ENDDATE";
    public static final String endDate_QFielld = "ENSERVCSBJCT2PMNTSCHDL.ENDDATE";
    public static final String paySum_Attr = "paySum";
    public static final String paySum_Field = "PAYSUM";
    public static final String paySum_QFielld = "ENSERVCSBJCT2PMNTSCHDL.PAYSUM";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSERVCSBJCT2PMNTSCHDL.SERVICESOBJECTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setStartDate(Date aValue){
       startDate = aValue;
    }

    public Date getStartDate(){
       return startDate;
    }


    public void setEndDate(Date aValue){
       endDate = aValue;
    }

    public Date getEndDate(){
       return endDate;
    }

    public void setPaySum(BigDecimal aValue){
       paySum = aValue;
    }

    public BigDecimal getPaySum(){
       return paySum;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }

} // end of ENServicesObject2PaymentScheduleValueObject


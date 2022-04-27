
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENGiveCounter;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENGiveCounter implements Serializable {
	
	/** 0 - счетчик не передается */
	public static final int NOT_GIVE = 0;
	/** 1 - счетчик передается (на забаланс) */
	public static final int IS_GIVE = 1;
	/** 2 - счетчик передается на баланс предприятия*/
	public static final int IS_GIVE_TO_BALANCE = 2;

    public int  code = Integer.MIN_VALUE; 
    public String  counterType; 
    public String  serialNumber; 
    public BigDecimal  cost; 
    public BigDecimal  vat; 
    public String  molCode; 
    public String  molName; 
    public Date dateBuild ;
    public int  phasity = Integer.MIN_VALUE; 
    public String  commentGen; 
    public ENPlanWork2ClassificationTypeRef plan2ClTypeRef = new ENPlanWork2ClassificationTypeRef();
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENGIVECOUNTER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENGIVECOUNTER.CODE";
    public static final String counterType_Attr = "counterType";
    public static final String counterType_Field = "COUNTERTYPE";
    public static final String counterType_QFielld = "ENGIVECOUNTER.COUNTERTYPE";
    public static final String serialNumber_Attr = "serialNumber";
    public static final String serialNumber_Field = "SERIALNUMBER";
    public static final String serialNumber_QFielld = "ENGIVECOUNTER.SERIALNUMBER";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "ENGIVECOUNTER.COST";
    public static final String vat_Attr = "vat";
    public static final String vat_Field = "VAT";
    public static final String vat_QFielld = "ENGIVECOUNTER.VAT";
    public static final String molCode_Attr = "molCode";
    public static final String molCode_Field = "MOLCODE";
    public static final String molCode_QFielld = "ENGIVECOUNTER.MOLCODE";
    public static final String molName_Attr = "molName";
    public static final String molName_Field = "MOLNAME";
    public static final String molName_QFielld = "ENGIVECOUNTER.MOLNAME";
    public static final String dateBuild_Attr = "dateBuild";
    public static final String dateBuild_Field = "DATEBUILD";
    public static final String dateBuild_QFielld = "ENGIVECOUNTER.DATEBUILD";
    public static final String phasity_Attr = "phasity";
    public static final String phasity_Field = "PHASITY";
    public static final String phasity_QFielld = "ENGIVECOUNTER.PHASITY";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENGIVECOUNTER.COMMENTGEN";
    public static final String plan2ClTypeRef_Attr = "plan2ClTypeRef";
    public static final String plan2ClTypeRef_Field = "PLAN2CLTYPEREFCODE";
    public static final String  plan2ClTypeRef_QFielld = "ENGIVECOUNTER.PLAN2CLTYPEREFCODE";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENGIVECOUNTER.SERVICESOBJECTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setCounterType(String aValue){
       counterType = aValue;
    }

    public String getCounterType(){
       return counterType;
    }


    public void setSerialNumber(String aValue){
       serialNumber = aValue;
    }

    public String getSerialNumber(){
       return serialNumber;
    }


    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
    }


    public void setVat(BigDecimal aValue){
       vat = aValue;
    }

    public BigDecimal getVat(){
       return vat;
    }


    public void setMolCode(String aValue){
       molCode = aValue;
    }

    public String getMolCode(){
       return molCode;
    }


    public void setMolName(String aValue){
       molName = aValue;
    }

    public String getMolName(){
       return molName;
    }


    public void setDateBuild(Date aValue){
       dateBuild = aValue;
    }

    public Date getDateBuild(){
       return dateBuild;
    }


    public void setPhasity(int aValue){
       phasity = aValue;
    }

    public int getPhasity(){
       return phasity;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setPlan2ClTypeRef(ENPlanWork2ClassificationTypeRef aValue){
       plan2ClTypeRef = aValue;
    }

    public ENPlanWork2ClassificationTypeRef getPlan2ClTypeRef(){
       return plan2ClTypeRef;
    }
    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }

} // end of ENGiveCounterValueObject


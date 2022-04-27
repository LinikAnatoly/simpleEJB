
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSO2Node;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENSO2NodeTypeRef;

public class ENSO2Node implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  ccNodeCode = Integer.MIN_VALUE;
    public int  ccTowerCode = Integer.MIN_VALUE;
    public BigDecimal  power; 
    public String  description; 
    public int  isCalc = Integer.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesobject = new ENServicesObjectRef();
    public ENSO2NodeTypeRef so2nodeType = new ENSO2NodeTypeRef();
    public static final String tableName = "ENSO2NODE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSO2NODE.CODE";
    public static final String ccNodeCode_Attr = "ccNodeCode";
    public static final String ccNodeCode_Field = "CCNODECODE";
    public static final String ccNodeCode_QFielld = "ENSO2NODE.CCNODECODE";
    public static final String ccTowerCode_Attr = "ccTowerCode";
    public static final String ccTowerCode_Field = "CCTOWERCODE";
    public static final String ccTowerCode_QFielld = "ENSO2NODE.CCTOWERCODE";
    public static final String power_Attr = "power";
    public static final String power_Field = "POWER";
    public static final String power_QFielld = "ENSO2NODE.POWER";
    public static final String description_Attr = "description";
    public static final String description_Field = "DESCRIPTION";
    public static final String description_QFielld = "ENSO2NODE.DESCRIPTION";
    public static final String isCalc_Attr = "isCalc";
    public static final String isCalc_Field = "ISCALC";
    public static final String isCalc_QFielld = "ENSO2NODE.ISCALC";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSO2NODE.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSO2NODE.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSO2NODE.MODIFY_TIME";
    public static final String servicesobject_Attr = "servicesobject";
    public static final String servicesobject_Field = "SERVICESOBJECTCODE";
    public static final String  servicesobject_QFielld = "ENSO2NODE.SERVICESOBJECTCODE";
    public static final String so2nodeType_Attr = "so2nodeType";
    public static final String so2nodeType_Field = "SO2NODETYPECODE";
    public static final String  so2nodeType_QFielld = "ENSO2NODE.SO2NODETYPECODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setCcNodeCode(int aValue){
       ccNodeCode = aValue;
    }

    public int getCcNodeCode(){
       return ccNodeCode;
    }


    public void setCcTowerCode(int aValue){
       ccTowerCode = aValue;
    }

    public int getCcTowerCode(){
       return ccTowerCode;
    }


    public void setPower(BigDecimal aValue){
       power = aValue;
    }

    public BigDecimal getPower(){
       return power;
    }


    public void setDescription(String aValue){
       description = aValue;
    }

    public String getDescription(){
       return description;
    }


    public void setIsCalc(int aValue){
       isCalc = aValue;
    }

    public int getIsCalc(){
       return isCalc;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
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

    public void setServicesobject(ENServicesObjectRef aValue){
       servicesobject = aValue;
    }

    public ENServicesObjectRef getServicesobject(){
       return servicesobject;
    }
    public void setSo2nodeType(ENSO2NodeTypeRef aValue){
       so2nodeType = aValue;
    }

    public ENSO2NodeTypeRef getSo2nodeType(){
       return so2nodeType;
    }

} // end of ENSO2NodeValueObject


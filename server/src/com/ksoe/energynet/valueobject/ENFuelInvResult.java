
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelInvResult;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENFuelInventarizationRef;
    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENFuelInvResultTypeRef;
    import  com.ksoe.rqorder.valueobject.references.RQFKOrderItemRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemRef;

public class ENFuelInvResult implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  deltaCount; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENFuelInventarizationRef inventarizationRef = new ENFuelInventarizationRef();
    public TKFuelTypeRef fuelTypeRef = new TKFuelTypeRef();
    public ENFuelInvResultTypeRef typeRef = new ENFuelInvResultTypeRef();
    public RQFKOrderItemRef fkorderitemRef = new RQFKOrderItemRef();
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public static final String tableName = "ENFUELINVRESULT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELINVRESULT.CODE";
    public static final String deltaCount_Attr = "deltaCount";
    public static final String deltaCount_Field = "DELTACOUNT";
    public static final String deltaCount_QFielld = "ENFUELINVRESULT.DELTACOUNT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENFUELINVRESULT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENFUELINVRESULT.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENFUELINVRESULT.MODIFY_TIME";
    public static final String inventarizationRef_Attr = "inventarizationRef";
    public static final String inventarizationRef_Field = "INVENTARIZATIONREFCODE";
    public static final String  inventarizationRef_QFielld = "ENFUELINVRESULT.INVENTARIZATIONREFCODE";
    public static final String fuelTypeRef_Attr = "fuelTypeRef";
    public static final String fuelTypeRef_Field = "FUELTYPEREFCODE";
    public static final String  fuelTypeRef_QFielld = "ENFUELINVRESULT.FUELTYPEREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENFUELINVRESULT.TYPEREFCODE";
    public static final String fkorderitemRef_Attr = "fkorderitemRef";
    public static final String fkorderitemRef_Field = "FKORDERITEMREFCODE";
    public static final String  fkorderitemRef_QFielld = "ENFUELINVRESULT.FKORDERITEMREFCODE";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String  estimateItemRef_QFielld = "ENFUELINVRESULT.ESTIMATEITEMREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDeltaCount(BigDecimal aValue){
       deltaCount = aValue;
    }

    public BigDecimal getDeltaCount(){
       return deltaCount;
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

    public void setInventarizationRef(ENFuelInventarizationRef aValue){
       inventarizationRef = aValue;
    }

    public ENFuelInventarizationRef getInventarizationRef(){
       return inventarizationRef;
    }
    public void setFuelTypeRef(TKFuelTypeRef aValue){
       fuelTypeRef = aValue;
    }

    public TKFuelTypeRef getFuelTypeRef(){
       return fuelTypeRef;
    }
    public void setTypeRef(ENFuelInvResultTypeRef aValue){
       typeRef = aValue;
    }

    public ENFuelInvResultTypeRef getTypeRef(){
       return typeRef;
    }
    public void setFkorderitemRef(RQFKOrderItemRef aValue){
       fkorderitemRef = aValue;
    }

    public RQFKOrderItemRef getFkorderitemRef(){
       return fkorderitemRef;
    }
    public void setEstimateItemRef(ENEstimateItemRef aValue){
       estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef(){
       return estimateItemRef;
    }

} // end of ENFuelInvResultValueObject


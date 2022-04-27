
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRegForSupplierItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENDisconnectInitiatorRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.energynet.valueobject.references.ENRegForSupplierRef;
import com.ksoe.energynet.valueobject.references.ENRegForSupplierTypeRef;
import com.ksoe.techcard.valueobject.references.TKClassificationTypeRef;

public class ENRegForSupplierItem implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  recordpointEic; 
    public String  customerUid; 
    public Date datePlanned ;
    public Date dateComplete ;
    public String  description; 
    public String  calcNumber; 
    public String  calcName; 
    public BigDecimal  costWithoutVAT; 
    public BigDecimal  costVAT; 
    public BigDecimal  costWithVAT; 
    public int  dhDisconnectionCode = Integer.MIN_VALUE;
    public String  commentGen; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENRegForSupplierRef registryRef = new ENRegForSupplierRef();
    public ENRegForSupplierTypeRef registryTypeRef = new ENRegForSupplierTypeRef();
    public ENDisconnectInitiatorRef initiatorRef = new ENDisconnectInitiatorRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWorkRef factRef = new ENPlanWorkRef();
    public TKClassificationTypeRef classificationTypeRef = new TKClassificationTypeRef();
    public static final String tableName = "ENREGFORSUPPLIERITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENREGFORSUPPLIERITEM.CODE";
    public static final String recordpointEic_Attr = "recordpointEic";
    public static final String recordpointEic_Field = "RECORDPOINTEIC";
    public static final String recordpointEic_QFielld = "ENREGFORSUPPLIERITEM.RECORDPOINTEIC";
    public static final String customerUid_Attr = "customerUid";
    public static final String customerUid_Field = "CUSTOMERUID";
    public static final String customerUid_QFielld = "ENREGFORSUPPLIERITEM.CUSTOMERUID";
    public static final String datePlanned_Attr = "datePlanned";
    public static final String datePlanned_Field = "DATEPLANNED";
    public static final String datePlanned_QFielld = "ENREGFORSUPPLIERITEM.DATEPLANNED";
    public static final String dateComplete_Attr = "dateComplete";
    public static final String dateComplete_Field = "DATECOMPLETE";
    public static final String dateComplete_QFielld = "ENREGFORSUPPLIERITEM.DATECOMPLETE";
    public static final String description_Attr = "description";
    public static final String description_Field = "DESCRIPTION";
    public static final String description_QFielld = "ENREGFORSUPPLIERITEM.DESCRIPTION";
    public static final String calcNumber_Attr = "calcNumber";
    public static final String calcNumber_Field = "CALCNUMBER";
    public static final String calcNumber_QFielld = "ENREGFORSUPPLIERITEM.CALCNUMBER";
    public static final String calcName_Attr = "calcName";
    public static final String calcName_Field = "CALCNAME";
    public static final String calcName_QFielld = "ENREGFORSUPPLIERITEM.CALCNAME";
    public static final String costWithoutVAT_Attr = "costWithoutVAT";
    public static final String costWithoutVAT_Field = "COSTWITHOUTVAT";
    public static final String costWithoutVAT_QFielld = "ENREGFORSUPPLIERITEM.COSTWITHOUTVAT";
    public static final String costVAT_Attr = "costVAT";
    public static final String costVAT_Field = "COSTVAT";
    public static final String costVAT_QFielld = "ENREGFORSUPPLIERITEM.COSTVAT";
    public static final String costWithVAT_Attr = "costWithVAT";
    public static final String costWithVAT_Field = "COSTWITHVAT";
    public static final String costWithVAT_QFielld = "ENREGFORSUPPLIERITEM.COSTWITHVAT";
    public static final String dhDisconnectionCode_Attr = "dhDisconnectionCode";
    public static final String dhDisconnectionCode_Field = "DHDISCONNECTIONCODE";
    public static final String dhDisconnectionCode_QFielld = "ENREGFORSUPPLIERITEM.DHDISCONNECTIONCODE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENREGFORSUPPLIERITEM.COMMENTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENREGFORSUPPLIERITEM.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENREGFORSUPPLIERITEM.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENREGFORSUPPLIERITEM.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENREGFORSUPPLIERITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENREGFORSUPPLIERITEM.DATEEDIT";
    public static final String registryRef_Attr = "registryRef";
    public static final String registryRef_Field = "REGISTRYREFCODE";
    public static final String  registryRef_QFielld = "ENREGFORSUPPLIERITEM.REGISTRYREFCODE";
    public static final String registryTypeRef_Attr = "registryTypeRef";
    public static final String registryTypeRef_Field = "REGISTRYTYPEREFCODE";
    public static final String  registryTypeRef_QFielld = "ENREGFORSUPPLIERITEM.REGISTRYTYPEREFCODE";
    public static final String initiatorRef_Attr = "initiatorRef";
    public static final String initiatorRef_Field = "INITIATORREFCODE";
    public static final String  initiatorRef_QFielld = "ENREGFORSUPPLIERITEM.INITIATORREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENREGFORSUPPLIERITEM.PLANREFCODE";
    public static final String factRef_Attr = "factRef";
    public static final String factRef_Field = "FACTREFCODE";
    public static final String  factRef_QFielld = "ENREGFORSUPPLIERITEM.FACTREFCODE";
    public static final String classificationTypeRef_Attr = "classificationTypeRef";
    public static final String classificationTypeRef_Field = "CLASSIFICATIONTYPERFCD";
    public static final String  classificationTypeRef_QFielld = "ENREGFORSUPPLIERITEM.CLASSIFICATIONTYPERFCD";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setRecordpointEic(String aValue){
       recordpointEic = aValue;
    }

    public String getRecordpointEic(){
       return recordpointEic;
    }


    public void setCustomerUid(String aValue){
       customerUid = aValue;
    }

    public String getCustomerUid(){
       return customerUid;
    }


    public void setDatePlanned(Date aValue){
       datePlanned = aValue;
    }

    public Date getDatePlanned(){
       return datePlanned;
    }


    public void setDateComplete(Date aValue){
       dateComplete = aValue;
    }

    public Date getDateComplete(){
       return dateComplete;
    }


    public void setDescription(String aValue){
       description = aValue;
    }

    public String getDescription(){
       return description;
    }


    public void setCalcNumber(String aValue){
       calcNumber = aValue;
    }

    public String getCalcNumber(){
       return calcNumber;
    }


    public void setCalcName(String aValue){
       calcName = aValue;
    }

    public String getCalcName(){
       return calcName;
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


    public void setCostWithVAT(BigDecimal aValue){
       costWithVAT = aValue;
    }

    public BigDecimal getCostWithVAT(){
       return costWithVAT;
    }


    public void setDhDisconnectionCode(int aValue){
       dhDisconnectionCode = aValue;
    }

    public int getDhDisconnectionCode(){
       return dhDisconnectionCode;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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

    public void setRegistryRef(ENRegForSupplierRef aValue){
       registryRef = aValue;
    }

    public ENRegForSupplierRef getRegistryRef(){
       return registryRef;
    }
    public void setRegistryTypeRef(ENRegForSupplierTypeRef aValue){
       registryTypeRef = aValue;
    }

    public ENRegForSupplierTypeRef getRegistryTypeRef(){
       return registryTypeRef;
    }
    public void setInitiatorRef(ENDisconnectInitiatorRef aValue){
       initiatorRef = aValue;
    }

    public ENDisconnectInitiatorRef getInitiatorRef(){
       return initiatorRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setFactRef(ENPlanWorkRef aValue){
       factRef = aValue;
    }

    public ENPlanWorkRef getFactRef(){
       return factRef;
    }
    public void setClassificationTypeRef(TKClassificationTypeRef aValue){
       classificationTypeRef = aValue;
    }

    public TKClassificationTypeRef getClassificationTypeRef(){
       return classificationTypeRef;
    }

} // end of ENRegForSupplierItemValueObject


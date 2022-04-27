
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimateItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;
    import  com.ksoe.techcard.valueobject.references.TKMaterialsRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemKindRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemStatusRef;
    import  com.ksoe.techcard.valueobject.references.TKAccountingTypeRef;
    import  com.ksoe.rqorder.valueobject.references.RQPurchaseItemRef;

public class ENEstimateItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public BigDecimal  countFact; 
    public BigDecimal  price; 
    public BigDecimal  priceVRTU; 
    public BigDecimal  cost; 
    public int  isUseVAT = Integer.MIN_VALUE; 
    public int  deliveryTime = Integer.MIN_VALUE; 
    public int  useWorkTime = Integer.MIN_VALUE; 
    public String  commentGen; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWorkItemRef planItemRef = new ENPlanWorkItemRef();
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public ENEstimateItemTypeRef typeRef = new ENEstimateItemTypeRef();
    public ENEstimateItemKindRef kindRef = new ENEstimateItemKindRef();
    public ENEstimateItemStatusRef statusRef = new ENEstimateItemStatusRef();
    public ENEstimateItemStatusRef oldStatusRef = new ENEstimateItemStatusRef();
    public TKAccountingTypeRef accountingTypeRef = new TKAccountingTypeRef();
    public RQPurchaseItemRef purchaseItemRef = new RQPurchaseItemRef();
    public static final String tableName = "ENESTIMATEITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEITEM.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENESTIMATEITEM.COUNTGEN";
    public static final String countFact_Attr = "countFact";
    public static final String countFact_Field = "COUNTFACT";
    public static final String countFact_QFielld = "ENESTIMATEITEM.COUNTFACT";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "ENESTIMATEITEM.PRICE";
    public static final String priceVRTU_Attr = "priceVRTU";
    public static final String priceVRTU_Field = "PRICEVRTU";
    public static final String priceVRTU_QFielld = "ENESTIMATEITEM.PRICEVRTU";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "ENESTIMATEITEM.COST";
    public static final String isUseVAT_Attr = "isUseVAT";
    public static final String isUseVAT_Field = "ISUSEVAT";
    public static final String isUseVAT_QFielld = "ENESTIMATEITEM.ISUSEVAT";
    public static final String deliveryTime_Attr = "deliveryTime";
    public static final String deliveryTime_Field = "DELIVERYTIME";
    public static final String deliveryTime_QFielld = "ENESTIMATEITEM.DELIVERYTIME";
    public static final String useWorkTime_Attr = "useWorkTime";
    public static final String useWorkTime_Field = "USEWORKTIME";
    public static final String useWorkTime_QFielld = "ENESTIMATEITEM.USEWORKTIME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENESTIMATEITEM.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENESTIMATEITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENESTIMATEITEM.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENESTIMATEITEM.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENESTIMATEITEM.PLANREFCODE";
    public static final String planItemRef_Attr = "planItemRef";
    public static final String planItemRef_Field = "PLANITEMREFCODE";
    public static final String  planItemRef_QFielld = "ENESTIMATEITEM.PLANITEMREFCODE";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENESTIMATEITEM.MATERIALREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENESTIMATEITEM.TYPEREFCODE";
    public static final String kindRef_Attr = "kindRef";
    public static final String kindRef_Field = "KINDREFCODE";
    public static final String  kindRef_QFielld = "ENESTIMATEITEM.KINDREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENESTIMATEITEM.STATUSREFCODE";
    public static final String oldStatusRef_Attr = "oldStatusRef";
    public static final String oldStatusRef_Field = "OLDSTATUSREFCODE";
    public static final String  oldStatusRef_QFielld = "ENESTIMATEITEM.OLDSTATUSREFCODE";
    public static final String accountingTypeRef_Attr = "accountingTypeRef";
    public static final String accountingTypeRef_Field = "ACCOUNTINGTYPEREFCODE";
    public static final String  accountingTypeRef_QFielld = "ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE";
    public static final String purchaseItemRef_Attr = "purchaseItemRef";
    public static final String purchaseItemRef_Field = "PURCHASEITEMREFCODE";
    public static final String  purchaseItemRef_QFielld = "ENESTIMATEITEM.PURCHASEITEMREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }


    public void setCountFact(BigDecimal aValue){
       countFact = aValue;
    }

    public BigDecimal getCountFact(){
       return countFact;
    }


    public void setPrice(BigDecimal aValue){
       price = aValue;
    }

    public BigDecimal getPrice(){
       return price;
    }


    public void setPriceVRTU(BigDecimal aValue){
       priceVRTU = aValue;
    }

    public BigDecimal getPriceVRTU(){
       return priceVRTU;
    }


    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
    }


    public void setIsUseVAT(int aValue){
       isUseVAT = aValue;
    }

    public int getIsUseVAT(){
       return isUseVAT;
    }


    public void setDeliveryTime(int aValue){
       deliveryTime = aValue;
    }

    public int getDeliveryTime(){
       return deliveryTime;
    }


    public void setUseWorkTime(int aValue){
       useWorkTime = aValue;
    }

    public int getUseWorkTime(){
       return useWorkTime;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setPlanItemRef(ENPlanWorkItemRef aValue){
       planItemRef = aValue;
    }

    public ENPlanWorkItemRef getPlanItemRef(){
       return planItemRef;
    }
    public void setMaterialRef(TKMaterialsRef aValue){
       materialRef = aValue;
    }

    public TKMaterialsRef getMaterialRef(){
       return materialRef;
    }
    public void setTypeRef(ENEstimateItemTypeRef aValue){
       typeRef = aValue;
    }

    public ENEstimateItemTypeRef getTypeRef(){
       return typeRef;
    }
    public void setKindRef(ENEstimateItemKindRef aValue){
       kindRef = aValue;
    }

    public ENEstimateItemKindRef getKindRef(){
       return kindRef;
    }
    public void setStatusRef(ENEstimateItemStatusRef aValue){
       statusRef = aValue;
    }

    public ENEstimateItemStatusRef getStatusRef(){
       return statusRef;
    }
    public void setOldStatusRef(ENEstimateItemStatusRef aValue){
       oldStatusRef = aValue;
    }

    public ENEstimateItemStatusRef getOldStatusRef(){
       return oldStatusRef;
    }
    public void setAccountingTypeRef(TKAccountingTypeRef aValue){
       accountingTypeRef = aValue;
    }

    public TKAccountingTypeRef getAccountingTypeRef(){
       return accountingTypeRef;
    }
    public void setPurchaseItemRef(RQPurchaseItemRef aValue){
       purchaseItemRef = aValue;
    }

    public RQPurchaseItemRef getPurchaseItemRef(){
       return purchaseItemRef;
    }

} // end of ENEstimateItemValueObject


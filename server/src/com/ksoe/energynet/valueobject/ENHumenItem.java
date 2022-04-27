
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENHumenItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;
    import  com.ksoe.techcard.valueobject.TKPosition;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemTypeRef;
    import  com.ksoe.energynet.valueobject.FINWorker;

public class ENHumenItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public BigDecimal  countFact; 
    public BigDecimal  countFactOriginal; 
    public BigDecimal  price; 
    public BigDecimal  cost; 
    public String  commentGen; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWorkItemRef planItemRef = new ENPlanWorkItemRef();
    public TKPosition positionGen = new TKPosition();
    public ENEstimateItemTypeRef typeRef = new ENEstimateItemTypeRef();
    public FINWorker finWorker = new FINWorker();
    public static final String tableName = "ENHUMENITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENHUMENITEM.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENHUMENITEM.COUNTGEN";
    public static final String countFact_Attr = "countFact";
    public static final String countFact_Field = "COUNTFACT";
    public static final String countFact_QFielld = "ENHUMENITEM.COUNTFACT";
    public static final String countFactOriginal_Attr = "countFactOriginal";
    public static final String countFactOriginal_Field = "COUNTFACTORIGINAL";
    public static final String countFactOriginal_QFielld = "ENHUMENITEM.COUNTFACTORIGINAL";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "ENHUMENITEM.PRICE";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "ENHUMENITEM.COST";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENHUMENITEM.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENHUMENITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENHUMENITEM.DATEEDIT";

    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENHUMENITEM.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENHUMENITEM.PLANREFCODE";
    public static final String planItemRef_Attr = "planItemRef";
    public static final String planItemRef_Field = "PLANITEMREFCODE";
    public static final String  planItemRef_QFielld = "ENHUMENITEM.PLANITEMREFCODE";
    public static final String positionGen_Attr = "positionGen";
    public static final String positionGen_Field = "POSITIONGENCODE";
    public static final String  positionGen_QFielld = "ENHUMENITEM.POSITIONGENCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENHUMENITEM.TYPEREFCODE";
    public static final String finWorker_Attr = "finWorker";
    public static final String finWorker_Field = "FINWORKERCODE";
    public static final String  finWorker_QFielld = "ENHUMENITEM.FINWORKERCODE";


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

    public void setCountFactOriginal(BigDecimal aValue){
       countFactOriginal = aValue;
    }

    public BigDecimal getCountFactOriginal(){
       return countFactOriginal;
    }

    public void setPrice(BigDecimal aValue){
       price = aValue;
    }

    public BigDecimal getPrice(){
       return price;
    }

    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
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
    public void setPositionGen(TKPosition aValue){
       positionGen = aValue;
    }

    public TKPosition getPositionGen(){
       return positionGen;
    }
    public void setTypeRef(ENEstimateItemTypeRef aValue){
       typeRef = aValue;
    }

    public ENEstimateItemTypeRef getTypeRef(){
       return typeRef;
    }
    public void setFinWorker(FINWorker aValue){
       finWorker = aValue;
    }

    public FINWorker getFinWorker(){
       return finWorker;
    }

} // end of ENHumenItemValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportItemENTransportItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENEstimateItemTypeRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.techcard.valueobject.TKTransport;
import com.ksoe.techcard.valueobject.TKTransportReal;
import com.ksoe.techcard.valueobject.TKTransportType;
    import  com.ksoe.energynet.valueobject.ENTransportDepartment;

public class ENTransportItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countWorkGen; 
    public BigDecimal  countWorkFact; 
    public BigDecimal  price; 
    public BigDecimal  cost; 
    public String  numberList; 
    public String  commentGen; 
    public String  userGen; 
    public Date  dateEdit; 
    public int  isUseTrailer = Integer.MIN_VALUE; 
    public BigDecimal  distanceNorm; 
    public int  amountOfJourneys = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWorkItemRef planItemRef = new ENPlanWorkItemRef();
    public TKTransportReal transportReal = new TKTransportReal();
    public TKTransportReal trailerTransportReal = new TKTransportReal();
    public TKTransport transport = new TKTransport();
    public ENEstimateItemTypeRef typeRef = new ENEstimateItemTypeRef();
    public TKTransportType tktransportType = new TKTransportType();
    public FINWorker finWorker = new FINWorker();
    public ENTransportDepartment transportDepartment = new ENTransportDepartment();
    public static final String tableName = "ENTRANSPORTITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTITEM.CODE";
    public static final String countWorkGen_Attr = "countWorkGen";
    public static final String countWorkGen_Field = "COUNTWORKGEN";
    public static final String countWorkGen_QFielld = "ENTRANSPORTITEM.COUNTWORKGEN";
    public static final String countWorkFact_Attr = "countWorkFact";
    public static final String countWorkFact_Field = "COUNTWORKFACT";
    public static final String countWorkFact_QFielld = "ENTRANSPORTITEM.COUNTWORKFACT";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "ENTRANSPORTITEM.PRICE";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "ENTRANSPORTITEM.COST";
    public static final String numberList_Attr = "numberList";
    public static final String numberList_Field = "NUMBERLIST";
    public static final String numberList_QFielld = "ENTRANSPORTITEM.NUMBERLIST";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENTRANSPORTITEM.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENTRANSPORTITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENTRANSPORTITEM.DATEEDIT";
    public static final String isUseTrailer_Attr = "isUseTrailer";
    public static final String isUseTrailer_Field = "ISUSETRAILER";
    public static final String isUseTrailer_QFielld = "ENTRANSPORTITEM.ISUSETRAILER";
    public static final String distanceNorm_Attr = "distanceNorm";
    public static final String distanceNorm_Field = "DISTANCENORM";
    public static final String distanceNorm_QFielld = "ENTRANSPORTITEM.DISTANCENORM";
    public static final String amountOfJourneys_Attr = "amountOfJourneys";
    public static final String amountOfJourneys_Field = "AMOUNTOFJOURNEYS";
    public static final String amountOfJourneys_QFielld = "ENTRANSPORTITEM.AMOUNTOFJOURNEYS";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRANSPORTITEM.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENTRANSPORTITEM.PLANREFCODE";
    public static final String planItemRef_Attr = "planItemRef";
    public static final String planItemRef_Field = "PLANITEMREFCODE";
    public static final String  planItemRef_QFielld = "ENTRANSPORTITEM.PLANITEMREFCODE";
    public static final String transportReal_Attr = "transportReal";
    public static final String transportReal_Field = "TRANSPORTREALCODE";
    public static final String  transportReal_QFielld = "ENTRANSPORTITEM.TRANSPORTREALCODE";
    public static final String trailerTransportReal_Attr = "trailerTransportReal";
    public static final String trailerTransportReal_Field = "TRAILERTRANSPORTREALCD";
    public static final String  trailerTransportReal_QFielld = "ENTRANSPORTITEM.TRAILERTRANSPORTREALCD";
    public static final String transport_Attr = "transport";
    public static final String transport_Field = "TRANSPORTCODE";
    public static final String  transport_QFielld = "ENTRANSPORTITEM.TRANSPORTCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENTRANSPORTITEM.TYPEREFCODE";
    public static final String tktransportType_Attr = "tktransportType";
    public static final String tktransportType_Field = "TKTRANSPORTTYPECODE";
    public static final String  tktransportType_QFielld = "ENTRANSPORTITEM.TKTRANSPORTTYPECODE";
    public static final String finWorker_Attr = "finWorker";
    public static final String finWorker_Field = "FINWORKERCODE";
    public static final String  finWorker_QFielld = "ENTRANSPORTITEM.FINWORKERCODE";
    public static final String transportDepartment_Attr = "transportDepartment";
    public static final String transportDepartment_Field = "TRANSPORTDEPARTMENTCOD";
    public static final String  transportDepartment_QFielld = "ENTRANSPORTITEM.TRANSPORTDEPARTMENTCOD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCountWorkGen(BigDecimal aValue){
       countWorkGen = aValue;
    }

    public BigDecimal getCountWorkGen(){
       return countWorkGen;
    }

    public void setCountWorkFact(BigDecimal aValue){
       countWorkFact = aValue;
    }

    public BigDecimal getCountWorkFact(){
       return countWorkFact;
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

    public void setNumberList(String aValue){
       numberList = aValue;
    }

    public String getNumberList(){
       return numberList;
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

 public void setIsUseTrailer(int aValue){
       isUseTrailer = aValue;
    }

    public int getIsUseTrailer(){
       return isUseTrailer;
    }

    public void setDistanceNorm(BigDecimal aValue){
       distanceNorm = aValue;
    }

    public BigDecimal getDistanceNorm(){
       return distanceNorm;
    }

    public void setAmountOfJourneys(int aValue){
       amountOfJourneys = aValue;
    }

    public int getAmountOfJourneys(){
       return amountOfJourneys;
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
    public void setTransportReal(TKTransportReal aValue){
       transportReal = aValue;
    }

    public TKTransportReal getTransportReal(){
       return transportReal;
    }
public void setTrailerTransportReal(TKTransportReal aValue){
       trailerTransportReal = aValue;
    }

    public TKTransportReal getTrailerTransportReal(){
       return trailerTransportReal;
    }
    public void setTransport(TKTransport aValue){
       transport = aValue;
    }

    public TKTransport getTransport(){
       return transport;
    }
    public void setTypeRef(ENEstimateItemTypeRef aValue){
       typeRef = aValue;
    }

    public ENEstimateItemTypeRef getTypeRef(){
       return typeRef;
    }
    public void setTktransportType(TKTransportType aValue){
       tktransportType = aValue;
    }

    public TKTransportType getTktransportType(){
       return tktransportType;
    }
    public void setFinWorker(FINWorker aValue){
       finWorker = aValue;
    }

    public FINWorker getFinWorker(){
       return finWorker;
    }
    public void setTransportDepartment(ENTransportDepartment aValue){
       transportDepartment = aValue;
    }

    public ENTransportDepartment getTransportDepartment(){
       return transportDepartment;
    }

} // end of ENTransportItemValueObject


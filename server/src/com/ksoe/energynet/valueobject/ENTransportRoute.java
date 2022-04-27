
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportRoute;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENDistanceRef;
import com.ksoe.energynet.valueobject.references.ENDistanceTypeRef;
import com.ksoe.energynet.valueobject.references.ENElementRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.energynet.valueobject.references.ENTransportRouteRef;

public class ENTransportRoute implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public BigDecimal  distance;
    public BigDecimal  weight;
    public BigDecimal  distanceNew;
    public BigDecimal  speedometerStart;
    public BigDecimal  speedometerFinal;
    public BigDecimal  fuelCounterStart;
    public BigDecimal  fuelCounterFinal;
    public String  commentGen;
    public Date dateEdit ;
    public String  userGen;
    public long  modify_time = Long.MIN_VALUE;
    public ENElementRef elementInRef = new ENElementRef();
    public ENElementRef elementOutRef = new ENElementRef();
    public ENDistanceRef distanceRef = new ENDistanceRef();
    public ENDistanceTypeRef distanceTypeRef = new ENDistanceTypeRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENTransportRouteRef parentRouteRef = new ENTransportRouteRef();
    public static final String tableName = "ENTRANSPORTROUTE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTROUTE.CODE";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENTRANSPORTROUTE.DISTANCE";
    public static final String weight_Attr = "weight";
    public static final String weight_Field = "WEIGHT";
    public static final String weight_QFielld = "ENTRANSPORTROUTE.WEIGHT";
    public static final String distanceNew_Attr = "distanceNew";
    public static final String distanceNew_Field = "DISTANCENEW";
    public static final String distanceNew_QFielld = "ENTRANSPORTROUTE.DISTANCENEW";
    public static final String speedometerStart_Attr = "speedometerStart";
    public static final String speedometerStart_Field = "SPEEDOMETERSTART";
    public static final String speedometerStart_QFielld = "ENTRANSPORTROUTE.SPEEDOMETERSTART";
    public static final String speedometerFinal_Attr = "speedometerFinal";
    public static final String speedometerFinal_Field = "SPEEDOMETERFINAL";
    public static final String speedometerFinal_QFielld = "ENTRANSPORTROUTE.SPEEDOMETERFINAL";
    public static final String fuelCounterStart_Attr = "fuelCounterStart";
    public static final String fuelCounterStart_Field = "FUELCOUNTERSTART";
    public static final String fuelCounterStart_QFielld = "ENTRANSPORTROUTE.FUELCOUNTERSTART";
    public static final String fuelCounterFinal_Attr = "fuelCounterFinal";
    public static final String fuelCounterFinal_Field = "FUELCOUNTERFINAL";
    public static final String fuelCounterFinal_QFielld = "ENTRANSPORTROUTE.FUELCOUNTERFINAL";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENTRANSPORTROUTE.COMMENTGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENTRANSPORTROUTE.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENTRANSPORTROUTE.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRANSPORTROUTE.MODIFY_TIME";
    public static final String elementInRef_Attr = "elementInRef";
    public static final String elementInRef_Field = "ELEMENTINREFCODE";
    public static final String  elementInRef_QFielld = "ENTRANSPORTROUTE.ELEMENTINREFCODE";
    public static final String elementOutRef_Attr = "elementOutRef";
    public static final String elementOutRef_Field = "ELEMENTOUTREFCODE";
    public static final String  elementOutRef_QFielld = "ENTRANSPORTROUTE.ELEMENTOUTREFCODE";
    public static final String distanceRef_Attr = "distanceRef";
    public static final String distanceRef_Field = "DISTANCEREFCODE";
    public static final String  distanceRef_QFielld = "ENTRANSPORTROUTE.DISTANCEREFCODE";
    public static final String distanceTypeRef_Attr = "distanceTypeRef";
    public static final String distanceTypeRef_Field = "DISTANCETYPEREFCODE";
    public static final String  distanceTypeRef_QFielld = "ENTRANSPORTROUTE.DISTANCETYPEREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENTRANSPORTROUTE.PLANREFCODE";
    public static final String parentRouteRef_Attr = "parentRouteRef";
    public static final String parentRouteRef_Field = "PARENTROUTEREFCODE";
    public static final String  parentRouteRef_QFielld = "ENTRANSPORTROUTE.PARENTROUTEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }

    public BigDecimal getDistance(){
       return distance;
    }

    public void setWeight(BigDecimal aValue){
       weight = aValue;
    }

    public BigDecimal getWeight(){
       return weight;
    }

    public void setDistanceNew(BigDecimal aValue){
       distanceNew = aValue;
    }

    public BigDecimal getDistanceNew(){
       return distanceNew;
    }

    public void setSpeedometerStart(BigDecimal aValue){
       speedometerStart = aValue;
    }

    public BigDecimal getSpeedometerStart(){
       return speedometerStart;
    }

    public void setSpeedometerFinal(BigDecimal aValue){
       speedometerFinal = aValue;
    }

    public BigDecimal getSpeedometerFinal(){
       return speedometerFinal;
    }

    public void setFuelCounterStart(BigDecimal aValue){
       fuelCounterStart = aValue;
    }

    public BigDecimal getFuelCounterStart(){
       return fuelCounterStart;
    }

    public void setFuelCounterFinal(BigDecimal aValue){
       fuelCounterFinal = aValue;
    }

    public BigDecimal getFuelCounterFinal(){
       return fuelCounterFinal;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setElementInRef(ENElementRef aValue){
       elementInRef = aValue;
    }

    public ENElementRef getElementInRef(){
       return elementInRef;
    }
    public void setElementOutRef(ENElementRef aValue){
       elementOutRef = aValue;
    }

    public ENElementRef getElementOutRef(){
       return elementOutRef;
    }
    public void setDistanceRef(ENDistanceRef aValue){
       distanceRef = aValue;
    }

    public ENDistanceRef getDistanceRef(){
       return distanceRef;
    }
    public void setDistanceTypeRef(ENDistanceTypeRef aValue){
       distanceTypeRef = aValue;
    }

    public ENDistanceTypeRef getDistanceTypeRef(){
       return distanceTypeRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setParentRouteRef(ENTransportRouteRef aValue){
       parentRouteRef = aValue;
    }

    public ENTransportRouteRef getParentRouteRef(){
       return parentRouteRef;
    }

} // end of ENTransportRouteValueObject


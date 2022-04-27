
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRouteBytDetail;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import  com.ksoe.energynet.valueobject.ENElement;

public class ENRouteBytDetail implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  numbergen; 
    public int  routeCode = Integer.MIN_VALUE; 
    public int  rpCode = Integer.MIN_VALUE; 
    public String  rpName; 
    public int  entryCode = Integer.MIN_VALUE; 
    public int  statusCode = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENElement element = new ENElement();
    public static final String tableName = "ENROUTEBYTDETAIL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENROUTEBYTDETAIL.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENROUTEBYTDETAIL.NAME";
    public static final String numbergen_Attr = "numbergen";
    public static final String numbergen_Field = "NUMBERGEN";
    public static final String numbergen_QFielld = "ENROUTEBYTDETAIL.NUMBERGEN";
    public static final String routeCode_Attr = "routeCode";
    public static final String routeCode_Field = "ROUTECODE";
    public static final String routeCode_QFielld = "ENROUTEBYTDETAIL.ROUTECODE";
    public static final String rpCode_Attr = "rpCode";
    public static final String rpCode_Field = "RPCODE";
    public static final String rpCode_QFielld = "ENROUTEBYTDETAIL.RPCODE";
    public static final String rpName_Attr = "rpName";
    public static final String rpName_Field = "RPNAME";
    public static final String rpName_QFielld = "ENROUTEBYTDETAIL.RPNAME";
    public static final String entryCode_Attr = "entryCode";
    public static final String entryCode_Field = "ENTRYCODE";
    public static final String entryCode_QFielld = "ENROUTEBYTDETAIL.ENTRYCODE";
    public static final String statusCode_Attr = "statusCode";
    public static final String statusCode_Field = "STATUSCODE";
    public static final String statusCode_QFielld = "ENROUTEBYTDETAIL.STATUSCODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENROUTEBYTDETAIL.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENROUTEBYTDETAIL.PLANREFCODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENROUTEBYTDETAIL.ELEMENTCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setNumbergen(String aValue){
       numbergen = aValue;
    }

    public String getNumbergen(){
       return numbergen;
    }

    public void setRouteCode(int aValue){
       routeCode = aValue;
    }

    public int getRouteCode(){
       return routeCode;
    }

    public void setRpCode(int aValue){
       rpCode = aValue;
    }

    public int getRpCode(){
       return rpCode;
    }

    public void setRpName(String aValue){
       rpName = aValue;
    }

    public String getRpName(){
       return rpName;
    }

    public void setEntryCode(int aValue){
       entryCode = aValue;
    }

    public int getEntryCode(){
       return entryCode;
    }

    public void setStatusCode(int aValue){
       statusCode = aValue;
    }

    public int getStatusCode(){
       return statusCode;
    }

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }
    
    public void setModify_time(long aValue){
        modify_time = aValue;
     }

     public long getModify_time(){
        return modify_time;
     }

} // end of ENRouteBytDetailValueObject


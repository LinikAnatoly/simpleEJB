
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDestinationOrder;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENDestinationOrder implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  numberInOrder = Integer.MIN_VALUE; 
    public String  commentGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENElementRef elementInRef = new ENElementRef();
    public ENElementRef elementOutRef = new ENElementRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENDESTINATIONORDER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDESTINATIONORDER.CODE";
    public static final String numberInOrder_Attr = "numberInOrder";
    public static final String numberInOrder_Field = "NUMBERINORDER";
    public static final String numberInOrder_QFielld = "ENDESTINATIONORDER.NUMBERINORDER";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENDESTINATIONORDER.COMMENTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDESTINATIONORDER.MODIFY_TIME";
    public static final String elementInRef_Attr = "elementInRef";
    public static final String elementInRef_Field = "ELEMENTINREFCODE";
    public static final String  elementInRef_QFielld = "ENDESTINATIONORDER.ELEMENTINREFCODE";
    public static final String elementOutRef_Attr = "elementOutRef";
    public static final String elementOutRef_Field = "ELEMENTOUTREFCODE";
    public static final String  elementOutRef_QFielld = "ENDESTINATIONORDER.ELEMENTOUTREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENDESTINATIONORDER.PLANREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberInOrder(int aValue){
       numberInOrder = aValue;
    }

    public int getNumberInOrder(){
       return numberInOrder;
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
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of ENDestinationOrderValueObject


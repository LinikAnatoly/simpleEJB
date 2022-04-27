
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTimeLine;  	
  */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.techcard.valueobject.TKVirtualBrigade;

public class ENTimeLine implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateGen ;
    public Date timeStart ;
    public Date timeFinal ;
    public Date timeMoveToObject ;
    public Date timeMoveOfObject ;
    public ENServicesObject servicesObjectRef = new ENServicesObject();
    public TKVirtualBrigade virtualBrigadeRef = new TKVirtualBrigade();
    public static final String tableName = "ENTIMELINE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTIMELINE.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENTIMELINE.DATEGEN";
    public static final String timeStart_Attr = "timeStart";
    public static final String timeStart_Field = "TIMESTART";
    public static final String timeStart_QFielld = "ENTIMELINE.TIMESTART";
    public static final String timeFinal_Attr = "timeFinal";
    public static final String timeFinal_Field = "TIMEFINAL";
    public static final String timeFinal_QFielld = "ENTIMELINE.TIMEFINAL";
    public static final String timeMoveToObject_Attr = "timeMoveToObject";
    public static final String timeMoveToObject_Field = "TIMEMOVETOOBJECT";
    public static final String timeMoveToObject_QFielld = "ENTIMELINE.TIMEMOVETOOBJECT";
    public static final String timeMoveOfObject_Attr = "timeMoveOfObject";
    public static final String timeMoveOfObject_Field = "TIMEMOVEOFOBJECT";
    public static final String timeMoveOfObject_QFielld = "ENTIMELINE.TIMEMOVEOFOBJECT";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENTIMELINE.SERVICESOBJECTREFCODE";
    public static final String virtualBrigadeRef_Attr = "virtualBrigadeRef";
    public static final String virtualBrigadeRef_Field = "VIRTUALBRIGADEREFCODE";
    public static final String  virtualBrigadeRef_QFielld = "ENTIMELINE.VIRTUALBRIGADEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }


    public void setTimeStart(Date aValue){
       timeStart = aValue;
    }

    public Date getTimeStart(){
       return timeStart;
    }


    public void setTimeFinal(Date aValue){
       timeFinal = aValue;
    }

    public Date getTimeFinal(){
       return timeFinal;
    }


    public void setTimeMoveToObject(Date aValue){
       timeMoveToObject = aValue;
    }

    public Date getTimeMoveToObject(){
       return timeMoveToObject;
    }


    public void setTimeMoveOfObject(Date aValue){
       timeMoveOfObject = aValue;
    }

    public Date getTimeMoveOfObject(){
       return timeMoveOfObject;
    }

    public void setServicesObjectRef(ENServicesObject aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObject getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setVirtualBrigadeRef(TKVirtualBrigade aValue){
       virtualBrigadeRef = aValue;
    }

    public TKVirtualBrigade getVirtualBrigadeRef(){
       return virtualBrigadeRef;
    }

} // end of ENTimeLineValueObject


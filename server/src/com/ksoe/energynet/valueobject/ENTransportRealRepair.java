
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportRealRepair;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.TKTransportReal;

public class ENTransportRealRepair implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public Date dateStart ;
    public Date dateFinal ;
    public String  userGen; 
    public Date dateEdit ;
    public String  commentGen; 
    public TKTransportReal realTransport = new TKTransportReal();
    public static final String tableName = "ENTRANSPORTREALREPAIR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTREALREPAIR.CODE";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENTRANSPORTREALREPAIR.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENTRANSPORTREALREPAIR.DATEFINAL";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENTRANSPORTREALREPAIR.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENTRANSPORTREALREPAIR.DATEEDIT";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENTRANSPORTREALREPAIR.COMMENTGEN";
    public static final String realTransport_Attr = "realTransport";
    public static final String realTransport_Field = "REALTRANSPORTCODE";
    public static final String  realTransport_QFielld = "ENTRANSPORTREALREPAIR.REALTRANSPORTCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }


    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
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


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setRealTransport(TKTransportReal aValue){
       realTransport = aValue;
    }

    public TKTransportReal getRealTransport(){
       return realTransport;
    }

} // end of ENTransportRealRepairValueObject


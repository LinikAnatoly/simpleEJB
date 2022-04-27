
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENGPSTrackerHistory;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKTransportRealRef;
    import  com.ksoe.energynet.valueobject.references.ENGPSTrackerRef;

public class ENGPSTrackerHistory implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public Date dateStart;
    public Date dateFinal;
    public String  reg_id; 
    public String  phoneNumber; 
    public String  cardNumber; 
    public String  userGen; 
    public Date dateEdit;

    public TKTransportRealRef realTransport = new TKTransportRealRef();
    public ENGPSTrackerRef gpsTracker = new ENGPSTrackerRef();

    public static final String tableName = "ENGPSTRACKERHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENGPSTRACKERHISTORY.CODE";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENGPSTRACKERHISTORY.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENGPSTRACKERHISTORY.DATEFINAL";
    public static final String reg_id_Attr = "reg_id";
    public static final String reg_id_Field = "REG_ID";
    public static final String reg_id_QFielld = "ENGPSTRACKERHISTORY.REG_ID";
    public static final String phoneNumber_Attr = "phoneNumber";
    public static final String phoneNumber_Field = "PHONENUMBER";
    public static final String phoneNumber_QFielld = "ENGPSTRACKERHISTORY.PHONENUMBER";
    public static final String cardNumber_Attr = "cardNumber";
    public static final String cardNumber_Field = "CARDNUMBER";
    public static final String cardNumber_QFielld = "ENGPSTRACKERHISTORY.CARDNUMBER";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENGPSTRACKERHISTORY.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENGPSTRACKERHISTORY.DATEEDIT";

    public static final String realTransport_Attr = "realTransport";
    public static final String realTransport_Field = "REALTRANSPORTCODE";
    public static final String  realTransport_QFielld = "ENGPSTRACKERHISTORY.REALTRANSPORTCODE";
    public static final String gpsTracker_Attr = "gpsTracker";
    public static final String gpsTracker_Field = "GPSTRACKERCODE";
    public static final String  gpsTracker_QFielld = "ENGPSTRACKERHISTORY.GPSTRACKERCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public Date getDateStart(){
       return dateStart;
    }

    public void setDateStart(Date dateStart){
       this.dateStart = dateStart;
    }


    public Date getDateFinal(){
       return dateFinal;
    }

    public void setDateFinal(Date dateFinal){
       this.dateFinal = dateFinal;
    }


    public String getReg_id(){
       return reg_id;
    }
    
    public void setReg_id(String reg_id){
       this.reg_id = reg_id;
    }


    public String getPhoneNumber(){
       return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber){
       this.phoneNumber = phoneNumber;
    }


    public String getCardNumber(){
       return cardNumber;
    }
    
    public void setCardNumber(String cardNumber){
       this.cardNumber = cardNumber;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }

    public TKTransportRealRef getRealTransport(){
       return realTransport;
    }
    
    public void setRealTransport(TKTransportRealRef realTransport){
       this.realTransport = realTransport;
    }
    public ENGPSTrackerRef getGpsTracker(){
       return gpsTracker;
    }
    
    public void setGpsTracker(ENGPSTrackerRef gpsTracker){
       this.gpsTracker = gpsTracker;
    }

} // end of ENGPSTrackerHistoryValueObject


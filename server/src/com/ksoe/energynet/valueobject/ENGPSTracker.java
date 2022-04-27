
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENGPSTracker;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKTransportRealRef;

public class ENGPSTracker implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  reg_id; 
    public String  phoneNumber; 
    public String  cardNumber; 
    public String  userGen; 
    public Date dateEdit;

    public TKTransportRealRef realTransport = new TKTransportRealRef();

    public static final String tableName = "ENGPSTRACKER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENGPSTRACKER.CODE";
    public static final String reg_id_Attr = "reg_id";
    public static final String reg_id_Field = "REG_ID";
    public static final String reg_id_QFielld = "ENGPSTRACKER.REG_ID";
    public static final String phoneNumber_Attr = "phoneNumber";
    public static final String phoneNumber_Field = "PHONENUMBER";
    public static final String phoneNumber_QFielld = "ENGPSTRACKER.PHONENUMBER";
    public static final String cardNumber_Attr = "cardNumber";
    public static final String cardNumber_Field = "CARDNUMBER";
    public static final String cardNumber_QFielld = "ENGPSTRACKER.CARDNUMBER";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENGPSTRACKER.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENGPSTRACKER.DATEEDIT";

    public static final String realTransport_Attr = "realTransport";
    public static final String realTransport_Field = "REALTRANSPORTCODE";
    public static final String  realTransport_QFielld = "ENGPSTRACKER.REALTRANSPORTCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
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

} // end of ENGPSTrackerValueObject


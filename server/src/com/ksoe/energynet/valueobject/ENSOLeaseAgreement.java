
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSOLeaseAgreement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSOLeaseAgreement implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numContract; 
    public Date dateContract;
    public String  namePartner; 
    public int  finDocID = Integer.MIN_VALUE;

    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();

    public static final String tableName = "ENSOLEASEAGREEMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSOLEASEAGREEMENT.CODE";
    public static final String numContract_Attr = "numContract";
    public static final String numContract_Field = "NUMCONTRACT";
    public static final String numContract_QFielld = "ENSOLEASEAGREEMENT.NUMCONTRACT";
    public static final String dateContract_Attr = "dateContract";
    public static final String dateContract_Field = "DATECONTRACT";
    public static final String dateContract_QFielld = "ENSOLEASEAGREEMENT.DATECONTRACT";
    public static final String namePartner_Attr = "namePartner";
    public static final String namePartner_Field = "NAMEPARTNER";
    public static final String namePartner_QFielld = "ENSOLEASEAGREEMENT.NAMEPARTNER";
    public static final String finDocID_Attr = "finDocID";
    public static final String finDocID_Field = "FINDOCID";
    public static final String finDocID_QFielld = "ENSOLEASEAGREEMENT.FINDOCID";

    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSOLEASEAGREEMENT.SERVICESOBJECTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumContract(){
       return numContract;
    }
    
    public void setNumContract(String numContract){
       this.numContract = numContract;
    }


    public Date getDateContract(){
       return dateContract;
    }

    public void setDateContract(Date dateContract){
       this.dateContract = dateContract;
    }


    public String getNamePartner(){
       return namePartner;
    }
    
    public void setNamePartner(String namePartner){
       this.namePartner = namePartner;
    }


    public int getFinDocID(){
       return finDocID;
    }
    
    public void setFinDocID(int finDocID){
       this.finDocID = finDocID;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    
    public void setServicesObjectRef(ENServicesObjectRef servicesObjectRef){
       this.servicesObjectRef = servicesObjectRef;
    }

} // end of ENSOLeaseAgreementValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActIncomServ2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActIncomeServicesRef;

public class ENActIncomServ2Prov implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  partId = Integer.MIN_VALUE; 
    public Date datePosting ;
    public String  voucher; 
    public Date dateEdit ;
    public String  userGen; 
    public ENActIncomeServicesRef actIncomeRef = new ENActIncomeServicesRef();
    public static final String tableName = "ENACTINCOMSERV2PROV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTINCOMSERV2PROV.CODE";
    public static final String partId_Attr = "partId";
    public static final String partId_Field = "PARTID";
    public static final String partId_QFielld = "ENACTINCOMSERV2PROV.PARTID";
    public static final String datePosting_Attr = "datePosting";
    public static final String datePosting_Field = "DATEPOSTING";
    public static final String datePosting_QFielld = "ENACTINCOMSERV2PROV.DATEPOSTING";
    public static final String voucher_Attr = "voucher";
    public static final String voucher_Field = "VOUCHER";
    public static final String voucher_QFielld = "ENACTINCOMSERV2PROV.VOUCHER";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACTINCOMSERV2PROV.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACTINCOMSERV2PROV.USERGEN";
    public static final String actIncomeRef_Attr = "actIncomeRef";
    public static final String actIncomeRef_Field = "ACTINCOMEREFCODE";
    public static final String  actIncomeRef_QFielld = "ENACTINCOMSERV2PROV.ACTINCOMEREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setPartId(int aValue){
       partId = aValue;
    }

    public int getPartId(){
       return partId;
    }


    public void setDatePosting(Date aValue){
       datePosting = aValue;
    }

    public Date getDatePosting(){
       return datePosting;
    }


    public void setVoucher(String aValue){
       voucher = aValue;
    }

    public String getVoucher(){
       return voucher;
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

    public void setActIncomeRef(ENActIncomeServicesRef aValue){
       actIncomeRef = aValue;
    }

    public ENActIncomeServicesRef getActIncomeRef(){
       return actIncomeRef;
    }

} // end of ENActIncomServ2ProvValueObject


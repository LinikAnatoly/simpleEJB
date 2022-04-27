
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActIncome2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActIncomeRef;

public class ENActIncome2Prov implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  partId = Integer.MIN_VALUE;
    public Date datePosting;
    public String  voucher; 
    public Date dateEdit;
    public String  userGen; 

    public ENActIncomeRef actIncomeRef = new ENActIncomeRef();

    public static final String tableName = "ENACTINCOME2PROV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTINCOME2PROV.CODE";
    public static final String partId_Attr = "partId";
    public static final String partId_Field = "PARTID";
    public static final String partId_QFielld = "ENACTINCOME2PROV.PARTID";
    public static final String datePosting_Attr = "datePosting";
    public static final String datePosting_Field = "DATEPOSTING";
    public static final String datePosting_QFielld = "ENACTINCOME2PROV.DATEPOSTING";
    public static final String voucher_Attr = "voucher";
    public static final String voucher_Field = "VOUCHER";
    public static final String voucher_QFielld = "ENACTINCOME2PROV.VOUCHER";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACTINCOME2PROV.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACTINCOME2PROV.USERGEN";

    public static final String actIncomeRef_Attr = "actIncomeRef";
    public static final String actIncomeRef_Field = "ACTINCOMEREFCODE";
    public static final String  actIncomeRef_QFielld = "ENACTINCOME2PROV.ACTINCOMEREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public int getPartId(){
       return partId;
    }
    
    public void setPartId(int partId){
       this.partId = partId;
    }


    public Date getDatePosting(){
       return datePosting;
    }

    public void setDatePosting(Date datePosting){
       this.datePosting = datePosting;
    }


    public String getVoucher(){
       return voucher;
    }
    
    public void setVoucher(String voucher){
       this.voucher = voucher;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }

    public ENActIncomeRef getActIncomeRef(){
       return actIncomeRef;
    }
    
    public void setActIncomeRef(ENActIncomeRef actIncomeRef){
       this.actIncomeRef = actIncomeRef;
    }

} // end of ENActIncome2ProvValueObject


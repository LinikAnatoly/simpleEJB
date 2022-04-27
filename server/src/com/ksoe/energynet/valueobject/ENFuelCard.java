
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelCard;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;
    import  com.ksoe.energynet.valueobject.FINWorker;

public class ENFuelCard implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  reg_id; 
    public String  userGen; 
    public Date dateEdit;
    public Date dateApply;

    public TKFuelTypeRef fuelType = new TKFuelTypeRef();
    public FINWorker finWorker = new FINWorker();

    public static final String tableName = "ENFUELCARD";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELCARD.CODE";
    public static final String reg_id_Attr = "reg_id";
    public static final String reg_id_Field = "REG_ID";
    public static final String reg_id_QFielld = "ENFUELCARD.REG_ID";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENFUELCARD.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENFUELCARD.DATEEDIT";
    public static final String dateApply_Attr = "dateApply";
    public static final String dateApply_Field = "DATEAPPLY";
    public static final String dateApply_QFielld = "ENFUELCARD.DATEAPPLY";

    public static final String fuelType_Attr = "fuelType";
    public static final String fuelType_Field = "FUELTYPECODE";
    public static final String  fuelType_QFielld = "ENFUELCARD.FUELTYPECODE";
    public static final String finWorker_Attr = "finWorker";
    public static final String finWorker_Field = "FINWORKERCODE";
    public static final String  finWorker_QFielld = "ENFUELCARD.FINWORKERCODE";



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


    public Date getDateApply(){
       return dateApply;
    }

    public void setDateApply(Date dateApply){
       this.dateApply = dateApply;
    }

    public TKFuelTypeRef getFuelType(){
       return fuelType;
    }
    
    public void setFuelType(TKFuelTypeRef fuelType){
       this.fuelType = fuelType;
    }
    public FINWorker getFinWorker(){
       return finWorker;
    }
    
    public void setFinWorker(FINWorker finWorker){
       this.finWorker = finWorker;
    }

} // end of ENFuelCardValueObject


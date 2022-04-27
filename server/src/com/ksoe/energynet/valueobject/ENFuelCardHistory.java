
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelCardHistory;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;
    import  com.ksoe.energynet.valueobject.FINWorker;
    import  com.ksoe.energynet.valueobject.ENFuelCard;

public class ENFuelCardHistory implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public Date dateStart;
    public Date dateFinal;
    public String  reg_id; 
    public String  userGen; 
    public Date dateEdit;

    public TKFuelTypeRef fuelType = new TKFuelTypeRef();
    public FINWorker finWorker = new FINWorker();
    public ENFuelCard fuelCard = new ENFuelCard();

    public static final String tableName = "ENFUELCARDHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELCARDHISTORY.CODE";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENFUELCARDHISTORY.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENFUELCARDHISTORY.DATEFINAL";
    public static final String reg_id_Attr = "reg_id";
    public static final String reg_id_Field = "REG_ID";
    public static final String reg_id_QFielld = "ENFUELCARDHISTORY.REG_ID";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENFUELCARDHISTORY.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENFUELCARDHISTORY.DATEEDIT";

    public static final String fuelType_Attr = "fuelType";
    public static final String fuelType_Field = "FUELTYPECODE";
    public static final String  fuelType_QFielld = "ENFUELCARDHISTORY.FUELTYPECODE";
    public static final String finWorker_Attr = "finWorker";
    public static final String finWorker_Field = "FINWORKERCODE";
    public static final String  finWorker_QFielld = "ENFUELCARDHISTORY.FINWORKERCODE";
    public static final String fuelCard_Attr = "fuelCard";
    public static final String fuelCard_Field = "FUELCARDCODE";
    public static final String  fuelCard_QFielld = "ENFUELCARDHISTORY.FUELCARDCODE";



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
    public ENFuelCard getFuelCard(){
       return fuelCard;
    }
    
    public void setFuelCard(ENFuelCard fuelCard){
       this.fuelCard = fuelCard;
    }

} // end of ENFuelCardHistoryValueObject


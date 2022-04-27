
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSOContract;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSOContract implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numContractFinCol; 
    public Date dateContractFinCol;
    public String  namePartnerFinCol; 
    public String  noteContrcatFinCol; 
    public int  finDocID = Integer.MIN_VALUE;

    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();

    public static final String tableName = "ENSOCONTRACT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSOCONTRACT.CODE";
    public static final String numContractFinCol_Attr = "numContractFinCol";
    public static final String numContractFinCol_Field = "NUMCONTRACTFINCOL";
    public static final String numContractFinCol_QFielld = "ENSOCONTRACT.NUMCONTRACTFINCOL";
    public static final String dateContractFinCol_Attr = "dateContractFinCol";
    public static final String dateContractFinCol_Field = "DATECONTRACTFINCOL";
    public static final String dateContractFinCol_QFielld = "ENSOCONTRACT.DATECONTRACTFINCOL";
    public static final String namePartnerFinCol_Attr = "namePartnerFinCol";
    public static final String namePartnerFinCol_Field = "NAMEPARTNERFINCOL";
    public static final String namePartnerFinCol_QFielld = "ENSOCONTRACT.NAMEPARTNERFINCOL";
    public static final String noteContrcatFinCol_Attr = "noteContrcatFinCol";
    public static final String noteContrcatFinCol_Field = "NOTECONTRCATFINCOL";
    public static final String noteContrcatFinCol_QFielld = "ENSOCONTRACT.NOTECONTRCATFINCOL";
    public static final String finDocID_Attr = "finDocID";
    public static final String finDocID_Field = "FINDOCID";
    public static final String finDocID_QFielld = "ENSOCONTRACT.FINDOCID";

    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSOCONTRACT.SERVICESOBJECTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumContractFinCol(){
       return numContractFinCol;
    }
    
    public void setNumContractFinCol(String numContractFinCol){
       this.numContractFinCol = numContractFinCol;
    }


    public Date getDateContractFinCol(){
       return dateContractFinCol;
    }

    public void setDateContractFinCol(Date dateContractFinCol){
       this.dateContractFinCol = dateContractFinCol;
    }


    public String getNamePartnerFinCol(){
       return namePartnerFinCol;
    }
    
    public void setNamePartnerFinCol(String namePartnerFinCol){
       this.namePartnerFinCol = namePartnerFinCol;
    }


    public String getNoteContrcatFinCol(){
       return noteContrcatFinCol;
    }
    
    public void setNoteContrcatFinCol(String noteContrcatFinCol){
       this.noteContrcatFinCol = noteContrcatFinCol;
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

} // end of ENSOContractValueObject


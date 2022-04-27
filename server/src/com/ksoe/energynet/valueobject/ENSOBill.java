
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSOBill;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSOBill implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  numberGen; 
    public Date dateGen;
    public BigDecimal  sumTotal; 
    public BigDecimal  sumGen; 
    public BigDecimal  sumVat; 
    public String  userGen; 
    public Date dateEdit;

    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();

    public static final String tableName = "ENSOBILL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSOBILL.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENSOBILL.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENSOBILL.DATEGEN";
    public static final String sumTotal_Attr = "sumTotal";
    public static final String sumTotal_Field = "SUMTOTAL";
    public static final String sumTotal_QFielld = "ENSOBILL.SUMTOTAL";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENSOBILL.SUMGEN";
    public static final String sumVat_Attr = "sumVat";
    public static final String sumVat_Field = "SUMVAT";
    public static final String sumVat_QFielld = "ENSOBILL.SUMVAT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSOBILL.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSOBILL.DATEEDIT";

    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSOBILL.SERVICESOBJECTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumberGen(){
       return numberGen;
    }
    
    public void setNumberGen(String numberGen){
       this.numberGen = numberGen;
    }


    public Date getDateGen(){
       return dateGen;
    }

    public void setDateGen(Date dateGen){
       this.dateGen = dateGen;
    }


    public BigDecimal getSumTotal(){
       return sumTotal;
    }
    
    public void setSumTotal(BigDecimal sumTotal){
       this.sumTotal = sumTotal;
    }


    public BigDecimal getSumGen(){
       return sumGen;
    }
    
    public void setSumGen(BigDecimal sumGen){
       this.sumGen = sumGen;
    }


    public BigDecimal getSumVat(){
       return sumVat;
    }
    
    public void setSumVat(BigDecimal sumVat){
       this.sumVat = sumVat;
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

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    
    public void setServicesObjectRef(ENServicesObjectRef servicesObjectRef){
       this.servicesObjectRef = servicesObjectRef;
    }

} // end of ENSOBillValueObject


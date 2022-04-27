
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRegForSupplier;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENRegForSupplierTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENRegForSupplierStatusRef;

public class ENRegForSupplier implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numberGen; 
    public Date dateFrom ;
    public Date dateTo ;
    public int  supplierCode = Integer.MIN_VALUE;
    public String  commentGen; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENRegForSupplierTypeRef typeRef = new ENRegForSupplierTypeRef();
    public ENRegForSupplierStatusRef statusRef = new ENRegForSupplierStatusRef();
    public static final String tableName = "ENREGFORSUPPLIER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENREGFORSUPPLIER.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENREGFORSUPPLIER.NUMBERGEN";
    public static final String dateFrom_Attr = "dateFrom";
    public static final String dateFrom_Field = "DATEFROM";
    public static final String dateFrom_QFielld = "ENREGFORSUPPLIER.DATEFROM";
    public static final String dateTo_Attr = "dateTo";
    public static final String dateTo_Field = "DATETO";
    public static final String dateTo_QFielld = "ENREGFORSUPPLIER.DATETO";
    public static final String supplierCode_Attr = "supplierCode";
    public static final String supplierCode_Field = "SUPPLIERCODE";
    public static final String supplierCode_QFielld = "ENREGFORSUPPLIER.SUPPLIERCODE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENREGFORSUPPLIER.COMMENTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENREGFORSUPPLIER.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENREGFORSUPPLIER.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENREGFORSUPPLIER.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENREGFORSUPPLIER.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENREGFORSUPPLIER.DATEEDIT";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENREGFORSUPPLIER.TYPEREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENREGFORSUPPLIER.STATUSREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }


    public void setDateFrom(Date aValue){
       dateFrom = aValue;
    }

    public Date getDateFrom(){
       return dateFrom;
    }


    public void setDateTo(Date aValue){
       dateTo = aValue;
    }

    public Date getDateTo(){
       return dateTo;
    }


    public void setSupplierCode(int aValue){
       supplierCode = aValue;
    }

    public int getSupplierCode(){
       return supplierCode;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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

    public void setTypeRef(ENRegForSupplierTypeRef aValue){
       typeRef = aValue;
    }

    public ENRegForSupplierTypeRef getTypeRef(){
       return typeRef;
    }
    public void setStatusRef(ENRegForSupplierStatusRef aValue){
       statusRef = aValue;
    }

    public ENRegForSupplierStatusRef getStatusRef(){
       return statusRef;
    }

} // end of ENRegForSupplierValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimateItemStatusHistoryENEstimateItemStatusHistory;  	
  */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENEstimateItem2TypeRef;
import com.ksoe.energynet.valueobject.references.ENEstimateItemRef;
import com.ksoe.energynet.valueobject.references.ENEstimateItemStatusRef;

public class ENEstimateItemStatusHistory implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  isLast = Integer.MIN_VALUE; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public ENEstimateItemStatusRef statusRef = new ENEstimateItemStatusRef();
    public ENEstimateItem2TypeRef typeRef = new ENEstimateItem2TypeRef();
    public static final String tableName = "ENESTIMATEITEMSTTSHSTR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEITEMSTTSHSTR.CODE";
    public static final String isLast_Attr = "isLast";
    public static final String isLast_Field = "ISLAST";
    public static final String isLast_QFielld = "ENESTIMATEITEMSTTSHSTR.ISLAST";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENESTIMATEITEMSTTSHSTR.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENESTIMATEITEMSTTSHSTR.MODIFY_TIME";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String  estimateItemRef_QFielld = "ENESTIMATEITEMSTTSHSTR.ESTIMATEITEMREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENESTIMATEITEMSTTSHSTR.STATUSREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENESTIMATEITEMSTTSHSTR.TYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setIsLast(int aValue){
       isLast = aValue;
    }

    public int getIsLast(){
       return isLast;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setEstimateItemRef(ENEstimateItemRef aValue){
       estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef(){
       return estimateItemRef;
    }
    public void setStatusRef(ENEstimateItemStatusRef aValue){
       statusRef = aValue;
    }

    public ENEstimateItemStatusRef getStatusRef(){
       return statusRef;
    }
    public void setTypeRef(ENEstimateItem2TypeRef aValue){
       typeRef = aValue;
    }

    public ENEstimateItem2TypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENEstimateItemStatusHistoryValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSORItems2Post10;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.netobjects.valueobject.references.ENPost10OKSNRef;
    import  com.ksoe.energynet.valueobject.references.ENSORentItemsRef;

public class ENSORItems2Post10 implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENPost10OKSNRef post10Ref = new ENPost10OKSNRef();
    public ENSORentItemsRef sorItemRef = new ENSORentItemsRef();
    public static final String tableName = "ENSORITEMS2POST10";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSORITEMS2POST10.CODE";
    public static final String post10Ref_Attr = "post10Ref";
    public static final String post10Ref_Field = "POST10REFCODE";
    public static final String  post10Ref_QFielld = "ENSORITEMS2POST10.POST10REFCODE";
    public static final String sorItemRef_Attr = "sorItemRef";
    public static final String sorItemRef_Field = "SORITEMREFCODE";
    public static final String  sorItemRef_QFielld = "ENSORITEMS2POST10.SORITEMREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setPost10Ref(ENPost10OKSNRef aValue){
       post10Ref = aValue;
    }

    public ENPost10OKSNRef getPost10Ref(){
       return post10Ref;
    }
    public void setSorItemRef(ENSORentItemsRef aValue){
       sorItemRef = aValue;
    }

    public ENSORentItemsRef getSorItemRef(){
       return sorItemRef;
    }

} // end of ENSORItems2Post10ValueObject


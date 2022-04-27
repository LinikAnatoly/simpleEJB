
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSORItems2Post04;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.netobjects.valueobject.references.ENPost04OKSNRef;
    import  com.ksoe.energynet.valueobject.references.ENSORentItemsRef;

public class ENSORItems2Post04 implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENPost04OKSNRef post04Ref = new ENPost04OKSNRef();
    public ENSORentItemsRef sorItemRef = new ENSORentItemsRef();
    public static final String tableName = "ENSORITEMS2POST04";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSORITEMS2POST04.CODE";
    public static final String post04Ref_Attr = "post04Ref";
    public static final String post04Ref_Field = "POST04REFCODE";
    public static final String  post04Ref_QFielld = "ENSORITEMS2POST04.POST04REFCODE";
    public static final String sorItemRef_Attr = "sorItemRef";
    public static final String sorItemRef_Field = "SORITEMREFCODE";
    public static final String  sorItemRef_QFielld = "ENSORITEMS2POST04.SORITEMREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setPost04Ref(ENPost04OKSNRef aValue){
       post04Ref = aValue;
    }

    public ENPost04OKSNRef getPost04Ref(){
       return post04Ref;
    }
    public void setSorItemRef(ENSORentItemsRef aValue){
       sorItemRef = aValue;
    }

    public ENSORentItemsRef getSorItemRef(){
       return sorItemRef;
    }

} // end of ENSORItems2Post04ValueObject


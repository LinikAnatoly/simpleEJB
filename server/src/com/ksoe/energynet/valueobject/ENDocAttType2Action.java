
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDocAttType2Action;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDocAttachmentTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENDocAttachmentActionRef;

public class ENDocAttType2Action implements Serializable {

    public int  code = Integer.MIN_VALUE;

    public ENDocAttachmentTypeRef typeRef = new ENDocAttachmentTypeRef();
    public ENDocAttachmentActionRef actionRef = new ENDocAttachmentActionRef();

    public static final String tableName = "ENDOCATTTYPE2ACTION";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDOCATTTYPE2ACTION.CODE";

    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENDOCATTTYPE2ACTION.TYPEREFCODE";
    public static final String actionRef_Attr = "actionRef";
    public static final String actionRef_Field = "ACTIONREFCODE";
    public static final String  actionRef_QFielld = "ENDOCATTTYPE2ACTION.ACTIONREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }

    public ENDocAttachmentTypeRef getTypeRef(){
       return typeRef;
    }
    
    public void setTypeRef(ENDocAttachmentTypeRef typeRef){
       this.typeRef = typeRef;
    }
    public ENDocAttachmentActionRef getActionRef(){
       return actionRef;
    }
    
    public void setActionRef(ENDocAttachmentActionRef actionRef){
       this.actionRef = actionRef;
    }

} // end of ENDocAttType2ActionValueObject


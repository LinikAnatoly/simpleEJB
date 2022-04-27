
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDocAttachment2ENElement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDocAttachmentRef;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;

public class ENDocAttachment2ENElement implements Serializable {

    public int  code = Integer.MIN_VALUE;

    public ENDocAttachmentRef docAttachmentRef = new ENDocAttachmentRef();
    public ENElementRef elementRef = new ENElementRef();

    public static final String tableName = "ENDOCATTACHMENT2ENLMNT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDOCATTACHMENT2ENLMNT.CODE";

    public static final String docAttachmentRef_Attr = "docAttachmentRef";
    public static final String docAttachmentRef_Field = "DOCATTACHMENTREFCODE";
    public static final String  docAttachmentRef_QFielld = "ENDOCATTACHMENT2ENLMNT.DOCATTACHMENTREFCODE";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENDOCATTACHMENT2ENLMNT.ELEMENTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }

    public ENDocAttachmentRef getDocAttachmentRef(){
       return docAttachmentRef;
    }
    
    public void setDocAttachmentRef(ENDocAttachmentRef docAttachmentRef){
       this.docAttachmentRef = docAttachmentRef;
    }
    public ENElementRef getElementRef(){
       return elementRef;
    }
    
    public void setElementRef(ENElementRef elementRef){
       this.elementRef = elementRef;
    }

} // end of ENDocAttachment2ENElementValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDocAttachment2TKClassification;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDocAttachmentRef;
    import  com.ksoe.techcard.valueobject.references.TKClassificationTypeRef;

public class ENDocAttachment2TKClassification implements Serializable {

    public int  code = Integer.MIN_VALUE;

    public ENDocAttachmentRef docAttachmentRef = new ENDocAttachmentRef();
    public TKClassificationTypeRef classificationTypeRef = new TKClassificationTypeRef();

    public static final String tableName = "ENDCTTCHMNT2TKCLSSFCTN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDCTTCHMNT2TKCLSSFCTN.CODE";

    public static final String docAttachmentRef_Attr = "docAttachmentRef";
    public static final String docAttachmentRef_Field = "DOCATTACHMENTREFCODE";
    public static final String  docAttachmentRef_QFielld = "ENDCTTCHMNT2TKCLSSFCTN.DOCATTACHMENTREFCODE";
    public static final String classificationTypeRef_Attr = "classificationTypeRef";
    public static final String classificationTypeRef_Field = "CLASSIFICATIONTYPERFCD";
    public static final String  classificationTypeRef_QFielld = "ENDCTTCHMNT2TKCLSSFCTN.CLASSIFICATIONTYPERFCD";



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
    public TKClassificationTypeRef getClassificationTypeRef(){
       return classificationTypeRef;
    }
    
    public void setClassificationTypeRef(TKClassificationTypeRef classificationTypeRef){
       this.classificationTypeRef = classificationTypeRef;
    }

} // end of ENDocAttachment2TKClassificationValueObject


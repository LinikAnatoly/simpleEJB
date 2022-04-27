
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDocAttachment2TKTechCard;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDocAttachmentRef;
    import  com.ksoe.techcard.valueobject.references.TKTechCardRef;

public class ENDocAttachment2TKTechCard implements Serializable {

    public int  code = Integer.MIN_VALUE;

    public ENDocAttachmentRef docAttachmentRef = new ENDocAttachmentRef();
    public TKTechCardRef techCardRef = new TKTechCardRef();

    public static final String tableName = "ENDOCATTCHMNT2TKTCHCRD";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDOCATTCHMNT2TKTCHCRD.CODE";

    public static final String docAttachmentRef_Attr = "docAttachmentRef";
    public static final String docAttachmentRef_Field = "DOCATTACHMENTREFCODE";
    public static final String  docAttachmentRef_QFielld = "ENDOCATTCHMNT2TKTCHCRD.DOCATTACHMENTREFCODE";
    public static final String techCardRef_Attr = "techCardRef";
    public static final String techCardRef_Field = "TECHCARDREFCODE";
    public static final String  techCardRef_QFielld = "ENDOCATTCHMNT2TKTCHCRD.TECHCARDREFCODE";



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
    public TKTechCardRef getTechCardRef(){
       return techCardRef;
    }
    
    public void setTechCardRef(TKTechCardRef techCardRef){
       this.techCardRef = techCardRef;
    }

} // end of ENDocAttachment2TKTechCardValueObject


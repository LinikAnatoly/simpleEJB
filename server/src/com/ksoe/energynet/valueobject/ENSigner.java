
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSigner;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSigner implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  signerPosition; 
    public String  signerFio; 
    public String  signatureImagePath; 
    public String  commentGen; 


    public static final String tableName = "ENSIGNER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSIGNER.CODE";
    public static final String signerPosition_Attr = "signerPosition";
    public static final String signerPosition_Field = "SIGNERPOSITION";
    public static final String signerPosition_QFielld = "ENSIGNER.SIGNERPOSITION";
    public static final String signerFio_Attr = "signerFio";
    public static final String signerFio_Field = "SIGNERFIO";
    public static final String signerFio_QFielld = "ENSIGNER.SIGNERFIO";
    public static final String signatureImagePath_Attr = "signatureImagePath";
    public static final String signatureImagePath_Field = "SIGNATUREIMAGEPATH";
    public static final String signatureImagePath_QFielld = "ENSIGNER.SIGNATUREIMAGEPATH";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENSIGNER.COMMENTGEN";




    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getSignerPosition(){
       return signerPosition;
    }
    
    public void setSignerPosition(String signerPosition){
       this.signerPosition = signerPosition;
    }


    public String getSignerFio(){
       return signerFio;
    }
    
    public void setSignerFio(String signerFio){
       this.signerFio = signerFio;
    }


    public String getSignatureImagePath(){
       return signatureImagePath;
    }
    
    public void setSignatureImagePath(String signatureImagePath){
       this.signatureImagePath = signatureImagePath;
    }


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
    }


} // end of ENSignerValueObject


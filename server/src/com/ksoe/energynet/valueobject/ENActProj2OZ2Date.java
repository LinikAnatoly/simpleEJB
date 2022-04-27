
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActProj2OZ2Date;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActProj2OZ2Ref;

public class ENActProj2OZ2Date implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateGen ;
    public ENActProj2OZ2Ref ENActProjRef = new ENActProj2OZ2Ref();
    public static final String tableName = "ENACTPROJ2OZ2DATE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTPROJ2OZ2DATE.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENACTPROJ2OZ2DATE.DATEGEN";
    public static final String ENActProjRef_Attr = "ENActProjRef";
    public static final String ENActProjRef_Field = "ENACTPROJREFCODE";
    public static final String  ENActProjRef_QFielld = "ENACTPROJ2OZ2DATE.ENACTPROJREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setENActProjRef(ENActProj2OZ2Ref aValue){
       ENActProjRef = aValue;
    }

    public ENActProj2OZ2Ref getENActProjRef(){
       return ENActProjRef;
    }

} // end of ENActProj2OZ2DateValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServices2CalcAdditionalItems;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENCalcAdditionalItemTypeRef;

public class ENServices2CalcAdditionalItems implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  summa; 
    public BigDecimal  countgen; 
    public String  comment; 
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public ENCalcAdditionalItemTypeRef calcAdditionalItemTypeRef = new ENCalcAdditionalItemTypeRef();
    public static final String tableName = "ENSERVICES2CLCDDTNLTMS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICES2CLCDDTNLTMS.CODE";
    public static final String summa_Attr = "summa";
    public static final String summa_Field = "SUMMA";
    public static final String summa_QFielld = "ENSERVICES2CLCDDTNLTMS.SUMMA";
    public static final String countgen_Attr = "countgen";
    public static final String countgen_Field = "COUNTGEN";
    public static final String countgen_QFielld = "ENSERVICES2CLCDDTNLTMS.COUNTGEN";
    public static final String comment_Attr = "comment";
    public static final String comment_Field = "COMMENT";
    public static final String comment_QFielld = "ENSERVICES2CLCDDTNLTMS.COMMENT";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSERVICES2CLCDDTNLTMS.SERVICESOBJECTREFCODE";
    public static final String calcAdditionalItemTypeRef_Attr = "calcAdditionalItemTypeRef";
    public static final String calcAdditionalItemTypeRef_Field = "CALCADDITIONALTMTPRFCD";
    public static final String  calcAdditionalItemTypeRef_QFielld = "ENSERVICES2CLCDDTNLTMS.CALCADDITIONALTMTPRFCD";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setSumma(BigDecimal aValue){
       summa = aValue;
    }

    public BigDecimal getSumma(){
       return summa;
    }


    public void setCountgen(BigDecimal aValue){
       countgen = aValue;
    }

    public BigDecimal getCountgen(){
       return countgen;
    }


    public void setComment(String aValue){
       comment = aValue;
    }

    public String getComment(){
       return comment;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setCalcAdditionalItemTypeRef(ENCalcAdditionalItemTypeRef aValue){
       calcAdditionalItemTypeRef = aValue;
    }

    public ENCalcAdditionalItemTypeRef getCalcAdditionalItemTypeRef(){
       return calcAdditionalItemTypeRef;
    }

} // end of ENServices2CalcAdditionalItemsValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCoefficientQualityStandards;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCoefficientQualityStandards implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public BigDecimal  summa; 
    public BigDecimal  coefficient; 
    public Date dateGen ;
    public int  finPodrCode = Integer.MIN_VALUE;
    public String  axOrgId; 
    public static final String tableName = "ENCOEFFICINTQLTSTNDRDS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCOEFFICINTQLTSTNDRDS.CODE";
    public static final String summa_Attr = "summa";
    public static final String summa_Field = "SUMMA";
    public static final String summa_QFielld = "ENCOEFFICINTQLTSTNDRDS.SUMMA";
    public static final String coefficient_Attr = "coefficient";
    public static final String coefficient_Field = "COEFFICIENT";
    public static final String coefficient_QFielld = "ENCOEFFICINTQLTSTNDRDS.COEFFICIENT";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENCOEFFICINTQLTSTNDRDS.DATEGEN";
    public static final String finPodrCode_Attr = "finPodrCode";
    public static final String finPodrCode_Field = "FINPODRCODE";
    public static final String finPodrCode_QFielld = "ENCOEFFICINTQLTSTNDRDS.FINPODRCODE";
    public static final String axOrgId_Attr = "axOrgId";
    public static final String axOrgId_Field = "AXORGID";
    public static final String axOrgId_QFielld = "ENCOEFFICINTQLTSTNDRDS.AXORGID";



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


    public void setCoefficient(BigDecimal aValue){
       coefficient = aValue;
    }

    public BigDecimal getCoefficient(){
       return coefficient;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }


    public void setFinPodrCode(int aValue){
       finPodrCode = aValue;
    }

    public int getFinPodrCode(){
       return finPodrCode;
    }


    public void setAxOrgId(String aValue){
       axOrgId = aValue;
    }

    public String getAxOrgId(){
       return axOrgId;
    }


} // end of ENCoefficientQualityStandardsValueObject


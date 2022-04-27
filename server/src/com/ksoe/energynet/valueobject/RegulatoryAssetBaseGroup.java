
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for RegulatoryAssetBaseGroup;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseGroupRef;

public class RegulatoryAssetBaseGroup implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  number; 
    public String  name; 
    public int  usefulLife = Integer.MIN_VALUE;

    public RegulatoryAssetBaseGroupRef parentRef = new RegulatoryAssetBaseGroupRef();

    public static final String tableName = "REGULATORYASSETBASEGRP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "REGULATORYASSETBASEGRP.CODE";
    public static final String number_Attr = "number";
    public static final String number_Field = "NUMBER";
    public static final String number_QFielld = "REGULATORYASSETBASEGRP.NUMBER";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "REGULATORYASSETBASEGRP.NAME";
    public static final String usefulLife_Attr = "usefulLife";
    public static final String usefulLife_Field = "USEFULLIFE";
    public static final String usefulLife_QFielld = "REGULATORYASSETBASEGRP.USEFULLIFE";

    public static final String parentRef_Attr = "parentRef";
    public static final String parentRef_Field = "PARENTREFCODE";
    public static final String  parentRef_QFielld = "REGULATORYASSETBASEGRP.PARENTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumber(){
       return number;
    }
    
    public void setNumber(String number){
       this.number = number;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public int getUsefulLife(){
       return usefulLife;
    }
    
    public void setUsefulLife(int usefulLife){
       this.usefulLife = usefulLife;
    }

    public RegulatoryAssetBaseGroupRef getParentRef(){
       return parentRef;
    }
    
    public void setParentRef(RegulatoryAssetBaseGroupRef parentRef){
       this.parentRef = parentRef;
    }

} // end of RegulatoryAssetBaseGroupValueObject


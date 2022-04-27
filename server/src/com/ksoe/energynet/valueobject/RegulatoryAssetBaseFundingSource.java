
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for RegulatoryAssetBaseFundingSource;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class RegulatoryAssetBaseFundingSource implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  name; 


    public static final String tableName = "REGULATORSSTBSFNDNGSRC";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "REGULATORSSTBSFNDNGSRC.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "REGULATORSSTBSFNDNGSRC.NAME";




    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


} // end of RegulatoryAssetBaseFundingSourceValueObject


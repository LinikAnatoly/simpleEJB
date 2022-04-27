
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSealNames;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKMaterialsRef;

public class ENSealNames implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public static final String tableName = "ENSEALNAMES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSEALNAMES.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSEALNAMES.NAME";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENSEALNAMES.MATERIALREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setMaterialRef(TKMaterialsRef aValue){
       materialRef = aValue;
    }

    public TKMaterialsRef getMaterialRef(){
       return materialRef;
    }

} // end of ENSealNamesValueObject


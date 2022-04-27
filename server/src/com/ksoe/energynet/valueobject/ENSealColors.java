
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSealColors;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKMaterialsRef;

public class ENSealColors implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public static final String tableName = "ENSEALCOLORS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSEALCOLORS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSEALCOLORS.NAME";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENSEALCOLORS.MATERIALREFCODE";



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

} // end of ENSealColorsValueObject


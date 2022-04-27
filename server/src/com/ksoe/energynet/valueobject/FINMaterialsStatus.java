
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINMaterialsStatusFINMaterialsStatus;  	
  */

import java.io.Serializable;


public class FINMaterialsStatus implements Serializable {

	public static final int GOOD = 1;
	public static final int CANCELED = 2;
	public static final int MOVED = 3;
	public static final int VIRTUAL = 4;
	public static final int MOVED_TO_OPERATIVE = 5; // 'Перенесено в Net. Оперативний запас'
	public static final int ERASED_BY_MAKET = 6;
	
	
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "FINMATERIALSSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINMATERIALSSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "FINMATERIALSSTATUS.NAME";


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

;

} // end of FINMaterialsStatusValueObject


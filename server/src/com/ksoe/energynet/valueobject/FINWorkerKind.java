
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINWorkerKindFINWorkerKind;  	
  */

import java.io.Serializable;


public class FINWorkerKind implements Serializable {

	public static final int OTHER = 0;
	public static final int PROM = 1;
	public static final int ESBYT = 2;
	
	public static final int FINWORKER_KIND_ESBYT_CONTROLLER = -1; // ƒЋя премии контролеры
	public static final int FINWORKER_KIND_ESBYT_INSPEKTOR = -2; // дл€ премии инспекторы
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "FINWORKERKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINWORKERKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "FINWORKERKIND.NAME";


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

} // end of FINWorkerKindValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTechConditionsServicesType;
  */

import java.io.Serializable;


public class ENTechConditionsServicesType implements Serializable {

	/** тип договора о выполнении ТУ - проектирование */
	public static final int DESIGN = 1;

	/** тип договора о выполнении ТУ - реализация */
	public static final int BUILDING = 2;


    public int  code = Integer.MIN_VALUE;
    public String  name;
    public static final String tableName = "ENTECHCONDITINSSRVCSTP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTECHCONDITINSSRVCSTP.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTECHCONDITINSSRVCSTP.NAME";


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


} // end of ENTechConditionsServicesTypeValueObject


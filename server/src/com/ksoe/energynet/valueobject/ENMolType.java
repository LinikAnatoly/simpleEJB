

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMolType;  	
  */

import java.io.Serializable;


public class ENMolType implements Serializable {

	public static final int MASTER = 1;              // Мастер
	public static final int STOREKEEPER = 2;         // Кладовщик
	public static final int STOREKEEPER_CENTRAL = 3; // Кладовщик Центрального Cклада
	public static final int ORGANIZATION = 4; // Стороня організація
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENMOLTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMOLTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENMOLTYPE.NAME";


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


} // end of ENMolTypeValueObject


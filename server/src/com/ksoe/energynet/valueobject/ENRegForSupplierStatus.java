
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRegForSupplierStatus;  	
  */

import java.io.Serializable;


public class ENRegForSupplierStatus implements Serializable {

	/** Чорновий */
	public static final int DRAFT = 1; 
	/** Складений */
	public static final int CREATED = 2; 
	/** Затверджений */
	public static final int APPROVED = 3; 
	
    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public static final String tableName = "ENREGFORSUPPLIERSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENREGFORSUPPLIERSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENREGFORSUPPLIERSTATUS.NAME";



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


} // end of ENRegForSupplierStatusValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTechContragentForm;
  */

import java.io.Serializable;


public class ENTechContragentForm implements Serializable {

	/** вид контрагента индивидуальный */
	public static final int INDIVIDUAL = 1;

	/** вид контрагента солидарный */
	public static final int SOLIDARY = 2;


    public int  code = Integer.MIN_VALUE;
    public String  name;
    public static final String tableName = "ENTECHCONTRAGENTFORM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTECHCONTRAGENTFORM.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTECHCONTRAGENTFORM.NAME";


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


} // end of ENTechContragentFormValueObject


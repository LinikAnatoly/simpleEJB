
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSOValuesTypeCategory;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSOValuesTypeCategory implements Serializable {

private static final long serialVersionUID = 1L;

	/**
	 * �������� (�������) �������� ��������
	 */
	public static final int HIDDEN = 999;

    public int  code = Integer.MIN_VALUE;
    public String  name; 


    public static final String tableName = "ENSOVALUESTYPECATEGORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSOVALUESTYPECATEGORY.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSOVALUESTYPECATEGORY.NAME";




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


} // end of ENSOValuesTypeCategoryValueObject


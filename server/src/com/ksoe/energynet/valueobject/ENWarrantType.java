
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  import java.io.Serializable;


public class ENWarrantType implements Serializable {

private static final long serialVersionUID = 1L;

	/** Внутрішня довіренність */
	public static final int INNER = 1;
	
	/** Довіренність стороньої організації */
	public static final int FROM_SIDE = 2;
	
	/** Довіренність прихдні ордери */
	public static final int RQFORDER = 4;

    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public static final String tableName = "ENWARRANTTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWARRANTTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENWARRANTTYPE.NAME";



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


} // end of ENWarrantTypeValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENInvestProgramGroups;
  */

import java.io.Serializable;


public class ENInvestProgramGroups implements Serializable {

	/** I группа инвест программы */
	public static final int FIRST = 1;

    public int  code = Integer.MIN_VALUE;
    public String  name;
    public String  commentgen;
    public static final String tableName = "ENINVESTPROGRAMGROUPS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENINVESTPROGRAMGROUPS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENINVESTPROGRAMGROUPS.NAME";
    public static final String commentgen_Attr = "commentgen";
    public static final String commentgen_Field = "COMMENTGEN";
    public static final String commentgen_QFielld = "ENINVESTPROGRAMGROUPS.COMMENTGEN";


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

    public void setCommentgen(String aValue){
       commentgen = aValue;
    }

    public String getCommentgen(){
       return commentgen;
    }


} // end of ENInvestProgramGroupsValueObject


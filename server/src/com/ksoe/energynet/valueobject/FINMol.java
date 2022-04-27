
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINMolFINMol;  	
  */

import java.io.Serializable;

public class FINMol implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String  id ; 
    public String  text; 
    public int  obj_id = Integer.MIN_VALUE; 
    public int  state = Integer.MIN_VALUE; 
    public String  axReceiptBlocking; 
    public String  axIssueBlocking; 
    public static final String tableName = "FINMOL";
    public static final String id_Attr = "id";
    public static final String id_Field = "ID";
    public static final String id_QFielld = "FINMOL.ID";
    public static final String text_Attr = "text";
    public static final String text_Field = "TEXT";
    public static final String text_QFielld = "FINMOL.TEXT";
    public static final String obj_id_Attr = "obj_id";
    public static final String obj_id_Field = "OBJ_ID";
    public static final String obj_id_QFielld = "FINMOL.OBJ_ID";
    public static final String state_Attr = "state";
    public static final String state_Field = "STATE";
    public static final String state_QFielld = "FINMOL.STATE";
    public static final String axReceiptBlocking_Attr = "axReceiptBlocking";
    public static final String axReceiptBlocking_Field = "AXRECEIPTBLOCKING";
    public static final String axReceiptBlocking_QFielld = "FINMOL.AXRECEIPTBLOCKING";
    public static final String axIssueBlocking_Attr = "axIssueBlocking";
    public static final String axIssueBlocking_Field = "AXISSUEBLOCKING";
    public static final String axIssueBlocking_QFielld = "FINMOL.AXISSUEBLOCKING";


    public void setId(String aValue){
       id = aValue;
    }

    public String getId(){
       return id;
    }

    public void setText(String aValue){
       text = aValue;
    }

    public String getText(){
       return text;
    }

    public void setObj_id(int aValue){
       obj_id = aValue;
    }

    public int getObj_id(){
       return obj_id;
    }

    public void setState(int aValue){
       state = aValue;
    }

    public int getState(){
       return state;
    }

    public void setAxReceiptBlocking(String aValue){
       axReceiptBlocking = aValue;
    }

    public String getAxReceiptBlocking(){
       return axReceiptBlocking;
    }


    public void setAxIssueBlocking(String aValue){
       axIssueBlocking = aValue;
    }

    public String getAxIssueBlocking(){
       return axIssueBlocking;
    }
    


} // end of FINMolValueObject


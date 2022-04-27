
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportOrder2Travel;  	
  */

import java.io.Serializable;

public class ENTransportOrder2Travel implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENTransportOrder transportorder = new ENTransportOrder();
    public ENTravelSheet travelsheet = new ENTravelSheet();
    public static final String tableName = "ENTRANSPORTORDER2TRAVL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTORDER2TRAVL.CODE";
    public static final String transportorder_Attr = "transportorder";
    public static final String transportorder_Field = "TRANSPORTORDERCODE";
    public static final String  transportorder_QFielld = "ENTRANSPORTORDER2TRAVL.TRANSPORTORDERCODE";
    public static final String travelsheet_Attr = "travelsheet";
    public static final String travelsheet_Field = "TRAVELSHEETCODE";
    public static final String  travelsheet_QFielld = "ENTRANSPORTORDER2TRAVL.TRAVELSHEETCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTransportorder(ENTransportOrder aValue){
       transportorder = aValue;
    }

    public ENTransportOrder getTransportorder(){
       return transportorder;
    }
    public void setTravelsheet(ENTravelSheet aValue){
       travelsheet = aValue;
    }

    public ENTravelSheet getTravelsheet(){
       return travelsheet;
    }

} // end of ENTransportOrder2TravelValueObject


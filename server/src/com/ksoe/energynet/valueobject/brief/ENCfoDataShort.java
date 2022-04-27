
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCfoData;  	
  */

import java.io.Serializable;


public class ENCfoDataShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String txtCode;
    public int fkID = Integer.MIN_VALUE;
    public int frc_list_id = Integer.MIN_VALUE;
    public String name;


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }

    public void setTxtCode(String aValue){
       txtCode = aValue;
    }
    public String getTxtCode(){
       return txtCode;
    }

    public void setFkID(int aValue){
       fkID = aValue;
    }
    public int getFkID(){
       return fkID;
    }

    public void setFrc_list_id(int aValue){
       frc_list_id = aValue;
    }
    public int getFrc_list_id(){
       return frc_list_id;
    }

    public void setName(String aValue){
       name = aValue;
    }
    public String getName(){
       return name;
    }





}
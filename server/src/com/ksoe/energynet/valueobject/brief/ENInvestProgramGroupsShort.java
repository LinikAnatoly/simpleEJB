
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENInvestProgramGroups;  	
  */

import java.io.Serializable;


public class ENInvestProgramGroupsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String commentgen;

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




}
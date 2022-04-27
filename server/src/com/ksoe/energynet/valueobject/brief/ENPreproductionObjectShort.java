
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPreproductionObject;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENPreproductionObjectShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String commentGen;
    public String buhName;
    public String invNumber;
    public String userGen;
    public Date dateEdit;
    public int elementCode = Integer.MIN_VALUE;


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

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }
    public String getCommentGen(){
       return commentGen;
    }

    public void setBuhName(String aValue){
       buhName = aValue;
    }
    public String getBuhName(){
       return buhName;
    }

    public void setInvNumber(String aValue){
       invNumber = aValue;
    }
    public String getInvNumber(){
       return invNumber;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }
    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }
    public Date getDateEdit(){
       return dateEdit;
    }


    public void setElementCode(int aValue){
       elementCode = aValue;
    }
    public int getElementCode(){
       return elementCode;
    }




}
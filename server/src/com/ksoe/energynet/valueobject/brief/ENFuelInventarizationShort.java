
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENFuelInventarization;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENFuelInventarizationShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numberGen;
    public Date dateGen ;
    public String molCode;
    public String molName;
    public String commentGen;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }
    public void setMolCode(String aValue){
       molCode = aValue;
    }

    public String getMolCode(){
       return molCode;
    }
    public void setMolName(String aValue){
       molName = aValue;
    }

    public String getMolName(){
       return molName;
    }
    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }
    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }

    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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


    public void setStatusRefCode(int aValue){
       statusRefCode = aValue;
    }
    public int getStatusRefCode(){
       return statusRefCode;
    }

    public void setStatusRefName(String aValue){
       statusRefName = aValue;
    }
    public String getStatusRefName(){
       return statusRefName;
    }



}
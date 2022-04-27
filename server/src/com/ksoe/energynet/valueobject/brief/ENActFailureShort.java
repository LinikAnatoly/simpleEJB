
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActFailure;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActFailureShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numberGen;
    public Date dateAct ;
    public String commentGen;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int reasonRefCode = Integer.MIN_VALUE;
    public String reasonRefName;

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

    public void setDateAct(Date aValue){
       dateAct = aValue;
    }

    public Date getDateAct(){
       return dateAct;
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


    public void setReasonRefCode(int aValue){
       reasonRefCode = aValue;
    }
    public int getReasonRefCode(){
       return reasonRefCode;
    }

    public void setReasonRefName(String aValue){
       reasonRefName = aValue;
    }
    public String getReasonRefName(){
       return reasonRefName;
    }



}
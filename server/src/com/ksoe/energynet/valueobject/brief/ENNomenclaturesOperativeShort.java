
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENNomenclaturesOperative;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENNomenclaturesOperativeShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int id = Integer.MIN_VALUE;
    public String nn;
    public String bal_sch;
    public String name;
    public String userGen;
    public Date dateEdit ;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setId(int aValue){
       id = aValue;
    }

    public int getId(){
       return id;
    }
    public void setNn(String aValue){
       nn = aValue;
    }

    public String getNn(){
       return nn;
    }
    public void setBal_sch(String aValue){
       bal_sch = aValue;
    }

    public String getBal_sch(){
       return bal_sch;
    }
    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
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




}
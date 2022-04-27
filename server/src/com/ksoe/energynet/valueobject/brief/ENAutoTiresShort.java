
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAutoTires;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;


public class ENAutoTiresShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String typeName;
    public String garageNumber;
    public String serialNumber;
    public String factory;
    public BigDecimal potencial;
    public BigDecimal distanceAll;
    public String nominal;
    public int materialRefCode = Integer.MIN_VALUE;
    public int departmentRefCode = Integer.MIN_VALUE;
    public int installStatusRefCode = Integer.MIN_VALUE;
    public String installStatusRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setTypeName(String aValue){
       typeName = aValue;
    }

    public String getTypeName(){
       return typeName;
    }
    public void setGarageNumber(String aValue){
       garageNumber = aValue;
    }

    public String getGarageNumber(){
       return garageNumber;
    }
    public void setSerialNumber(String aValue){
       serialNumber = aValue;
    }

    public String getSerialNumber(){
       return serialNumber;
    }
    public void setFactory(String aValue){
       factory = aValue;
    }

    public String getFactory(){
       return factory;
    }
    public void setPotencial(BigDecimal aValue){
       potencial = aValue;
    }

    public BigDecimal getPotencial(){
       return potencial;
    }
    public void setDistanceAll(BigDecimal aValue){
       distanceAll = aValue;
    }

    public BigDecimal getDistanceAll(){
       return distanceAll;
    }
    public void setNominal(String aValue){
       nominal = aValue;
    }

    public String getNominal(){
       return nominal;
    }

    public void setMaterialRefCode(int aValue){
       materialRefCode = aValue;
    }
    public int getMaterialRefCode(){
       return materialRefCode;
    }

    public void setDepartmentRefCode(int aValue){
       departmentRefCode = aValue;
    }
    public int getDepartmentRefCode(){
       return departmentRefCode;
    }


    public void setInstallStatusRefCode(int aValue){
       installStatusRefCode = aValue;
    }
    public int getInstallStatusRefCode(){
       return installStatusRefCode;
    }

    public void setInstallStatusRefName(String aValue){
       installStatusRefName = aValue;
    }
    public String getInstallStatusRefName(){
       return installStatusRefName;
    }



}
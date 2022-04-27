
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENElement2TKMaterials;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENElement2TKMaterialsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int materialRefCode = Integer.MIN_VALUE;
    public String materialRefName;
    public BigDecimal materialRefCost;
    public int materialRefDeliveryDate = Integer.MIN_VALUE;
    public String materialRefNumkatalog;
    public String materialRefIdentid;
    public int elementRefCode = Integer.MIN_VALUE;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setMaterialRefCode(int aValue){
       materialRefCode = aValue;
    }
    public int getMaterialRefCode(){
       return materialRefCode;
    }

    public void setMaterialRefName(String aValue){
       materialRefName = aValue;
    }
    public String getMaterialRefName(){
       return materialRefName;
    }

    public void setMaterialRefCost(BigDecimal aValue){
       materialRefCost = aValue;
    }
    public BigDecimal getMaterialRefCost(){
       return materialRefCost;
    }

    public void setMaterialRefDeliveryDate(int aValue){
       materialRefDeliveryDate = aValue;
    }
    public int getMaterialRefDeliveryDate(){
       return materialRefDeliveryDate;
    }

    public void setMaterialRefNumkatalog(String aValue){
       materialRefNumkatalog = aValue;
    }
    public String getMaterialRefNumkatalog(){
       return materialRefNumkatalog;
    }

    public void setMaterialRefIdentid(String aValue){
       materialRefIdentid = aValue;
    }
    public String getMaterialRefIdentid(){
       return materialRefIdentid;
    }

    public void setElementRefCode(int aValue){
       elementRefCode = aValue;
    }
    public int getElementRefCode(){
       return elementRefCode;
    }

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }

    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }



}
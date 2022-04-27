
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSite;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSiteShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String siteaddress;
    public String sitephone;

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
    public void setSiteaddress(String aValue){
       siteaddress = aValue;
    }

    public String getSiteaddress(){
       return siteaddress;
    }
    public void setSitephone(String aValue){
       sitephone = aValue;
    }

    public String getSitephone(){
       return sitephone;
    }




}
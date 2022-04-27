
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for ENPowerReliabilityCategory;
  */

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "ENPowerReliabilityCategoryRef")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENPowerReliabilityCategoryRef implements Serializable
{
    public int code = Integer.MIN_VALUE;

  public static final String className = "com.ksoe.energynet.valueobject.ENPowerReliabilityCategory";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }




} // end of ENPowerReliabilityCategoryRef


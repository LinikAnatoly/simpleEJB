
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for RegulatoryAssetBase;  	
  */

import java.io.Serializable;

public class RegulatoryAssetBaseRef implements Serializable
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.RegulatoryAssetBase";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
	@Override
    public boolean equals(Object object) {
		if(object == null || object.getClass() != this.getClass()) return false;
		if(this == object) return true;
		RegulatoryAssetBaseRef another = (RegulatoryAssetBaseRef)object;
		return this.code == another.code;
	}


} // end of RegulatoryAssetBaseRef


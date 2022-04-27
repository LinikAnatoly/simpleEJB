
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for RegulatoryAssetBaseFundingSource;  	
  */

import java.io.Serializable;


public class RegulatoryAssetBaseFundingSourceRef implements Serializable
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.RegulatoryAssetBaseFundingSource";

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
		RegulatoryAssetBaseFundingSourceRef another = (RegulatoryAssetBaseFundingSourceRef)object;
		return this.code == another.code;
	}


} // end of RegulatoryAssetBaseFundingSourceRef


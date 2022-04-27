
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPowerReliabilityCategory;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPowerReliabilityCategoryShort;

public class ENPowerReliabilityCategoryShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENPowerReliabilityCategoryShort> list = new Vector<ENPowerReliabilityCategoryShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENPowerReliabilityCategoryShort> getList() {return list;}
	public final void setList(Vector<ENPowerReliabilityCategoryShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENPowerReliabilityCategoryShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENPowerReliabilityCategory


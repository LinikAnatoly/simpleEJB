
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSettings;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSettingsShort;

public class ENSettingsShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENSettingsShort> list = new Vector<ENSettingsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSettingsShort> getList() {return list;}
	public final void setList(Vector<ENSettingsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSettingsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSettings


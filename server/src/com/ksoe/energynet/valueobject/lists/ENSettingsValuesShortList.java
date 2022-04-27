
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSettingsValues;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSettingsValuesShort;

public class ENSettingsValuesShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENSettingsValuesShort> list = new Vector<ENSettingsValuesShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSettingsValuesShort> getList() {return list;}
	public final void setList(Vector<ENSettingsValuesShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSettingsValuesShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSettingsValues


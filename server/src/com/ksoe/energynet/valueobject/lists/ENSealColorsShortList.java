
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSealColors;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSealColorsShort;

public class ENSealColorsShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENSealColorsShort> list = new Vector<ENSealColorsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSealColorsShort> getList() {return list;}
	public final void setList(Vector<ENSealColorsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSealColorsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSealColors



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSealNames;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSealNamesShort;

public class ENSealNamesShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENSealNamesShort> list = new Vector<ENSealNamesShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSealNamesShort> getList() {return list;}
	public final void setList(Vector<ENSealNamesShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSealNamesShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSealNames


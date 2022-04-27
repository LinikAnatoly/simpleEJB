
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENLandSheetsDelays;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENLandSheetsDelaysShort;

public class ENLandSheetsDelaysShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENLandSheetsDelaysShort> list = new Vector<ENLandSheetsDelaysShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENLandSheetsDelaysShort> getList() {return list;}
	public final void setList(Vector<ENLandSheetsDelaysShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENLandSheetsDelaysShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENLandSheetsDelays


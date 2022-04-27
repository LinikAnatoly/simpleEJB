
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for SCUsageInput2DFDoc;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.SCUsageInput2DFDocShort;

public class SCUsageInput2DFDocShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<SCUsageInput2DFDocShort> list = new Vector<SCUsageInput2DFDocShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<SCUsageInput2DFDocShort> getList() {return list;}
	public final void setList(Vector<SCUsageInput2DFDocShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.SCUsageInput2DFDocShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for SCUsageInput2DFDoc


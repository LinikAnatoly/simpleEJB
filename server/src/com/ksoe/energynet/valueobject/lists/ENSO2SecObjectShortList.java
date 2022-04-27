
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSO2SecObject;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSO2SecObjectShort;

public class ENSO2SecObjectShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENSO2SecObjectShort> list = new Vector<ENSO2SecObjectShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSO2SecObjectShort> getList() {return list;}
	public final void setList(Vector<ENSO2SecObjectShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSO2SecObjectShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSO2SecObject


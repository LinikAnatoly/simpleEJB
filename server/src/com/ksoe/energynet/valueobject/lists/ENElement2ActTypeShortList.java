
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENElement2ActType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENElement2ActTypeShort;

public class ENElement2ActTypeShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENElement2ActTypeShort> list = new Vector<ENElement2ActTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENElement2ActTypeShort> getList() {return list;}
	public final void setList(Vector<ENElement2ActTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENElement2ActTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENElement2ActType


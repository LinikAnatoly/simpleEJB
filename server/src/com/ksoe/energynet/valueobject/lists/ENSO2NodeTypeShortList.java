
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSO2NodeType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSO2NodeTypeShort;

public class ENSO2NodeTypeShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENSO2NodeTypeShort> list = new Vector<ENSO2NodeTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSO2NodeTypeShort> getList() {return list;}
	public final void setList(Vector<ENSO2NodeTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSO2NodeTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSO2NodeType


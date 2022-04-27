
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSheets4SOType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOTypeShort;

public class ENSheets4SOTypeShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENSheets4SOTypeShort> list = new Vector<ENSheets4SOTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSheets4SOTypeShort> getList() {return list;}
	public final void setList(Vector<ENSheets4SOTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSheets4SOTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSheets4SOType


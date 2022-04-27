
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENConnectionLocationType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENConnectionLocationTypeShort;

public class ENConnectionLocationTypeShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENConnectionLocationTypeShort> list = new Vector<ENConnectionLocationTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENConnectionLocationTypeShort> getList() {return list;}
	public final void setList(Vector<ENConnectionLocationTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENConnectionLocationTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENConnectionLocationType


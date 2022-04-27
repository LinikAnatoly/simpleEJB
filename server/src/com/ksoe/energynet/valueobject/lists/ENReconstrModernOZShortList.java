
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENReconstrModernOZ;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENReconstrModernOZShort;

public class ENReconstrModernOZShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENReconstrModernOZShort> list = new Vector<ENReconstrModernOZShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENReconstrModernOZShort> getList() {return list;}
	public final void setList(Vector<ENReconstrModernOZShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENReconstrModernOZShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENReconstrModernOZ


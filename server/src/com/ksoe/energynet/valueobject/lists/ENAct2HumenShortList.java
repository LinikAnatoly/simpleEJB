
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAct2Humen;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENAct2HumenShort;

public class ENAct2HumenShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENAct2HumenShort> list = new Vector<ENAct2HumenShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENAct2HumenShort> getList() {return list;}
	public final void setList(Vector<ENAct2HumenShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENAct2HumenShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENAct2Humen


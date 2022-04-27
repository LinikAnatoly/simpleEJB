
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSORItems2Post04;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSORItems2Post04Short;

public class ENSORItems2Post04ShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENSORItems2Post04Short> list = new Vector<ENSORItems2Post04Short>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSORItems2Post04Short> getList() {return list;}
	public final void setList(Vector<ENSORItems2Post04Short> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSORItems2Post04Short get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSORItems2Post04


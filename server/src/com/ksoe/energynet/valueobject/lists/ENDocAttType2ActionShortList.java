
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDocAttType2Action;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENDocAttType2ActionShort;

public class ENDocAttType2ActionShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENDocAttType2ActionShort> list = new Vector<ENDocAttType2ActionShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENDocAttType2ActionShort> getList() {return list;}
	public final void setList(Vector<ENDocAttType2ActionShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENDocAttType2ActionShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENDocAttType2Action


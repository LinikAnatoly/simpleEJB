
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FINCurrency;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.FINCurrencyShort;

public class FINCurrencyShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<FINCurrencyShort> list = new Vector<FINCurrencyShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<FINCurrencyShort> getList() {return list;}
	public final void setList(Vector<FINCurrencyShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.FINCurrencyShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for FINCurrency


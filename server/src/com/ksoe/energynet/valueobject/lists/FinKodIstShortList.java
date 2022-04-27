
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FinKodIst;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.FinKodIstShort;

public class FinKodIstShortList implements Serializable {

	public int totalCount = 0;
	public Vector<FinKodIstShort> list = new Vector<FinKodIstShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<FinKodIstShort> getList() {return list;}
	public final void setList(Vector<FinKodIstShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.FinKodIstShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for FinKodIst


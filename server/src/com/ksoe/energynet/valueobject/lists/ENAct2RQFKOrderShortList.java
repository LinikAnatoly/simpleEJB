
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAct2RQFKOrder;  	
  */

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENAct2RQFKOrderShort;

import java.io.Serializable;

public class ENAct2RQFKOrderShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
  public int totalCount = 0;
  public Vector<ENAct2RQFKOrderShort> list = new Vector<ENAct2RQFKOrderShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENAct2RQFKOrderShort> getList() {return list;}
  public final void setList(Vector<ENAct2RQFKOrderShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENAct2RQFKOrderShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENAct2RQFKOrderShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENAct2RQFKOrder


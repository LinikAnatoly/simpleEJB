
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENServicesObject2RQFKOrder;
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENServicesObject2RQFKOrderShort;

public class ENServicesObject2RQFKOrderShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<ENServicesObject2RQFKOrderShort> list = new Vector<ENServicesObject2RQFKOrderShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENServicesObject2RQFKOrderShort> getList() {return list;}
  public final void setList(Vector<ENServicesObject2RQFKOrderShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENServicesObject2RQFKOrderShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENServicesObject2RQFKOrder


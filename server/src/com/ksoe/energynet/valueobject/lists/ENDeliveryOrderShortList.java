
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDeliveryOrder;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENDeliveryOrderShort;

public class ENDeliveryOrderShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<ENDeliveryOrderShort> list = new Vector<>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENDeliveryOrderShort> getList() {return list;}
  public final void setList(Vector<ENDeliveryOrderShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENDeliveryOrderShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENDeliveryOrderShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENDeliveryOrder


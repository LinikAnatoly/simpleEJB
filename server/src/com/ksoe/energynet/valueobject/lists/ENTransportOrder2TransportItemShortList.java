
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTransportOrder2TransportItem;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENTransportOrder2TransportItemShort;

public class ENTransportOrder2TransportItemShortList implements Serializable {
	
  private static final long serialVersionUID = 1L;
  public int totalCount = 0;
  public Vector<ENTransportOrder2TransportItemShort> list = new Vector<ENTransportOrder2TransportItemShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENTransportOrder2TransportItemShort> getList() {return list;}
  public final void setList(Vector<ENTransportOrder2TransportItemShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENTransportOrder2TransportItemShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENTransportOrder2TransportItemShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENTransportOrder2TransportItem


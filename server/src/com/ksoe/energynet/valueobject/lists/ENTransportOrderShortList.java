
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTransportOrder;  	
  */

import java.io.Serializable;
import java.util.Vector;
import com.ksoe.energynet.valueobject.brief.ENTransportOrderShort;

public class ENTransportOrderShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
public int totalCount = 0;
  public Vector<ENTransportOrderShort> list = new Vector<ENTransportOrderShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENTransportOrderShort>  getList() {return list;}
  public final void setList(Vector<ENTransportOrderShort>  aValue) {list = aValue;}

  public final ENTransportOrderShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENTransportOrder


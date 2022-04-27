
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for SCSeal2WorkOrderBytKind;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.SCSeal2WorkOrderBytKindShort;

public class SCSeal2WorkOrderBytKindShortList implements Serializable {

  public int totalCount = 0;
  public Vector<SCSeal2WorkOrderBytKindShort> list = new Vector<SCSeal2WorkOrderBytKindShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.SCSeal2WorkOrderBytKindShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.SCSeal2WorkOrderBytKindShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for SCSeal2WorkOrderBytKind



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for SCSeal2ENWorkOrderByt;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.SCSeal2ENWorkOrderBytShort;

public class SCSeal2ENWorkOrderBytShortList implements Serializable {

  public int totalCount = 0;
  public Vector<SCSeal2ENWorkOrderBytShort> list = new Vector<SCSeal2ENWorkOrderBytShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.SCSeal2ENWorkOrderBytShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.SCSeal2ENWorkOrderBytShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for SCSeal2ENWorkOrderByt


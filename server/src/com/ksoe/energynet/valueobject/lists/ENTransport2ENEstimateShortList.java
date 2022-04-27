
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTransport2ENEstimate;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENTransport2ENEstimateShort;

public class ENTransport2ENEstimateShortList implements Serializable {

  public int totalCount = 0;
  public Vector<ENTransport2ENEstimateShort> list = new Vector<ENTransport2ENEstimateShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENTransport2ENEstimateShort> getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENTransport2ENEstimateShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENTransport2ENEstimateShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENTransport2ENEstimate


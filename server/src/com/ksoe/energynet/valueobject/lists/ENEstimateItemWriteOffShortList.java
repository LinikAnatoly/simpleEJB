
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENEstimateItem;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENEstimateItemWriteOffShort;

public class ENEstimateItemWriteOffShortList implements Serializable {
	private static final long serialVersionUID = 1L;
public int totalCount = 0;
  public Vector<ENEstimateItemWriteOffShort> list = new Vector<ENEstimateItemWriteOffShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENEstimateItemWriteOffShort> getList() {return list;}
  public final void setList(Vector<ENEstimateItemWriteOffShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENEstimateItemWriteOffShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENEstimateItemWriteOffShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENEstimateItem


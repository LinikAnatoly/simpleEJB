
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENNormVolumeAVZItem;  	
  */

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENNormVolumeAVZItemShort;

import java.io.Serializable;

public class ENNormVolumeAVZItemShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<ENNormVolumeAVZItemShort> list = new Vector<ENNormVolumeAVZItemShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENNormVolumeAVZItemShort> getList() {return list;}
  public final void setList(Vector<ENNormVolumeAVZItemShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENNormVolumeAVZItemShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENNormVolumeAVZItemShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENNormVolumeAVZItem


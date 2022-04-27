package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENEstimateItem2FinShort;

public class ENEstimateItem2FinShortList implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public int totalCount = 0;
	  public Vector<ENEstimateItem2FinShort> list = new Vector<ENEstimateItem2FinShort>();

	  public final int getTotalCount() {return totalCount;}
	  public final void setTotalCount(int aValue) {totalCount = aValue;}

	  public final Vector<ENEstimateItem2FinShort> getList() {return list;}
	  public final void setList(Vector<ENEstimateItem2FinShort> aValue) {list = aValue;}

	  public final ENEstimateItem2FinShort get(int anIndex)
	  {
	    return (ENEstimateItem2FinShort)list.get(anIndex);
	  }

	  public final int size()
	  {
	    return (list == null)?0:list.size();
	  }
	  
}

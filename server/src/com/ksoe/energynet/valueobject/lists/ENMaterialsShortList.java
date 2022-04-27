package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENMaterialsShort;


public class ENMaterialsShortList implements Serializable {

	  public int totalCount = 0;
	  public Vector list = new Vector();

	  public final int getTotalCount() {return totalCount;}
	  public final void setTotalCount(int aValue) {totalCount = aValue;}

	  public final Vector getList() {return list;}
	  public final void setList(Vector aValue) {list = aValue;}

	  public final ENMaterialsShort get(int anIndex)
	  {
	    return (ENMaterialsShort) list.get(anIndex);
	  }

	  public final int size()
	  {
	    return (list == null)?0:list.size();
	  }

	} // end of List for ENManningTable







//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for RegulatoryAssetBaseCalculation;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseCalculationShort;

public class RegulatoryAssetBaseCalculationShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<RegulatoryAssetBaseCalculationShort> list = new Vector<RegulatoryAssetBaseCalculationShort>();

	RegulatoryAssetBaseCalculationShort summaryValues = new RegulatoryAssetBaseCalculationShort();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<RegulatoryAssetBaseCalculationShort> getList() {return list;}
	public final void setList(Vector<RegulatoryAssetBaseCalculationShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseCalculationShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}
	
	public RegulatoryAssetBaseCalculationShort getSummaryValues() {
		return this.summaryValues;
	}
	public void setSummaryValues(RegulatoryAssetBaseCalculationShort summaryValues) {
		this.summaryValues = summaryValues;
	}

} // end of List for RegulatoryAssetBaseCalculation


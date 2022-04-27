package com.ksoe.energynet.valueobject;

import java.util.Vector;

public final class RegulatoryAssetBaseSynchronizationData {
	
	//private Vector<RegulatoryAssetBase> incomeAssets = new Vector<RegulatoryAssetBase>();
	//private Vector<RegulatoryAssetBase> completelyWrittenOffAssets = new Vector<RegulatoryAssetBase>();
	//private Vector<RegulatoryAssetBasePartialWriteOff> partialWriteOffs = new Vector<RegulatoryAssetBasePartialWriteOff>();
	
	private RegulatoryAssetBase[] incomeAssets = null;
	private RegulatoryAssetBase[] completelyWrittenOffAssets = null;
	private RegulatoryAssetBasePartialWriteOff[] partialWriteOffs = null;
	
	/**
	 * ������������� ������
	 */
	public RegulatoryAssetBase[] getIncomeAssets() {
		return incomeAssets;
	}
	
	/**
	 * ������������� ������
	 */
	public void setIncomeAssets(RegulatoryAssetBase[] incomeAssets) {
		this.incomeAssets = incomeAssets;
	}
	
	/**
	 * ��������� ��������� ������
	 */
	public RegulatoryAssetBase[] getCompletelyWrittenOffAssets() {
		return completelyWrittenOffAssets;
	}
	
	/**
	 * ��������� ��������� ������
	 */
	public void setCompletelyWrittenOffAssets(RegulatoryAssetBase[] completelyWrittenOffAssets) {
		this.completelyWrittenOffAssets = completelyWrittenOffAssets;
	}
	
	/**
	 * ��������� �������� �������
	 */
	public RegulatoryAssetBasePartialWriteOff[] getPartialWriteOffs() {
		return partialWriteOffs;
	}
	
	/**
	 * ��������� �������� �������
	 */
	public void setPartialWriteOffs(RegulatoryAssetBasePartialWriteOff[] partialWriteOffs) {
		this.partialWriteOffs = partialWriteOffs;
	}
	
	
	
}

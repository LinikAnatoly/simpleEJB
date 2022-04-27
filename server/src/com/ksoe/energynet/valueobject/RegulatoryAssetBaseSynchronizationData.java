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
	 * Приходованные активы
	 */
	public RegulatoryAssetBase[] getIncomeAssets() {
		return incomeAssets;
	}
	
	/**
	 * Приходованные активы
	 */
	public void setIncomeAssets(RegulatoryAssetBase[] incomeAssets) {
		this.incomeAssets = incomeAssets;
	}
	
	/**
	 * Полностью списанные активы
	 */
	public RegulatoryAssetBase[] getCompletelyWrittenOffAssets() {
		return completelyWrittenOffAssets;
	}
	
	/**
	 * Полностью списанные активы
	 */
	public void setCompletelyWrittenOffAssets(RegulatoryAssetBase[] completelyWrittenOffAssets) {
		this.completelyWrittenOffAssets = completelyWrittenOffAssets;
	}
	
	/**
	 * Частичное списание активов
	 */
	public RegulatoryAssetBasePartialWriteOff[] getPartialWriteOffs() {
		return partialWriteOffs;
	}
	
	/**
	 * Частичное списание активов
	 */
	public void setPartialWriteOffs(RegulatoryAssetBasePartialWriteOff[] partialWriteOffs) {
		this.partialWriteOffs = partialWriteOffs;
	}
	
	
	
}

package com.ksoe.energynet.valueobject;

import java.math.BigDecimal;

/**
 * Класс для хранения информации по довводу ПК СканСчетчики
 */
public class RevisionSotr {
	/**
	 * Табельный номер
	 */
	public String tabNumber;
	/**
	 * ШПЗ
	 */
	public String balans;
	/**
	 * Зарплата
	 */
	public BigDecimal salary;
	/**
	 * Отчислени из зп
	 */
	public BigDecimal tax;
}

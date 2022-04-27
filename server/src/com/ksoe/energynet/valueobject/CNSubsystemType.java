
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNSubsystemTypeCNSubsystemType;
  */

import java.io.Serializable;


public class CNSubsystemType implements Serializable {

	public static final int SS_CONNECTION = 1; //Присоединение
	public static final int SS_SUPPLY = 2; //Поставка э/э
	public static final int SS_TECHTERMS = 3; //Согласование абонентских ТУ
	public static final int SS_PHYSICALPERSON = 4; //Поставка (быт)
	public static final int SS_CONSULTATIVECENTER = 5; //Консультационный Центр
	public static final int SS_PLANTASK = 6; //Планирование ремонтов электросетей
	public static final int SS_PLANSALEELECTRICPOWER = 7; //Планирование задач энергосбыта
	public static final int SS_CONTROLQUALITY = 8; //Контроль качества
	public static final int SS_JOINTSUPPLY = 9; //Совместная поставка
	public static final int SS_REQUESTSLEGALSECTOR = 10; //Обработка заявок юридических лиц
	public static final int SS_LABOURPROTECTIONFIRESAFETY = 11; //Охрана труда и пожарная безопасность
	public static final int SS_MAKEALTERATION = 12; //Внесение изменений в ТУ
	public static final int SS_NEWCONNECTION = 13; //Присоединение с 01.08.2010
	public static final int SS_REALIZATIONPURCHASES = 14; //Осуществление годовых закупок
	public static final int SS_SPECFACILITESMOTORUSE = 15; //Использование специальных средств и автотранспорта
	public static final int SS_ADMITTANCEORGANIZER = 16; //Организатор доступа
	public static final int SS_CHANGEBUSINESSPROCESS = 17; //Изменение бизнес-процессов
	public static final int SS_CONNECTION_20110314 = 18; //Присоединение с 14.03.2011 г.
	public static final int SS_ELECTRICINSTALLATION = 19; //Согласование проектов энергообеспечения электроустановок заказчиков
	public static final int SS_ELECTRICINSTALLACCESSPOWER = 20; //Присоединение с 01.03.2013 г.
	public static final int SS_PREPARATIONOUTPUTDATA = 21; //Подготовка выходных данных для ТЭО - Технико-Экономического Обоснования проекта */
	public static final int SS_ELECTRICITYMETERING = 22; //Установка ЛУСОД и АСКОЭ
	public static final int SS_BUYSOLARENERGY = 23; //Покупка солнечной ЭлектроЭнергии
	public static final int SS_FIBEROPTICCOMJOINTSUSPENS = 24; //Совместный подвес Волоконно-Оптических Линий Связи
	public static final int SS_REIMBURSEMENT = 25; //Вынос электросетей
	public static final int SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER = 26; //Присоединение с 19.04.2018 г.
	public static final int SS_ENERGY_MARKET = 27; //Договора ОАО "ХерсонОблЭнерго" и ГосПредприятия "Энергорынок"
	public static final int SS_ELECTRICITY_METER_EXAMINATION = 31; //Экспертиза счётчиков электроэнергии
	public static final int SS_DISTRIBUTION = 32; // Договора на распределение э/э
	public static final int SS_ACTS = 666; // Акты нарушений ППЭЭ (быт и пром)



	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "CNSUBSYSTEMTYPE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "CNSUBSYSTEMTYPE.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "CNSUBSYSTEMTYPE.NAME";



	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

} // end of CNSubsystemTypeValueObject

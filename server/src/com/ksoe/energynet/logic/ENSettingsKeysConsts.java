package com.ksoe.energynet.logic;

/**
 *
 * ����� � ����������� ������ ��������
 *
 *
 * @author kreschishinma
 * @since 07.11.2016
 *
 */
public class ENSettingsKeysConsts {
	
	/** ������� ��� �������� ����� ����� �� ��������� �� ������� �������������� ���������  */
	public static final String CONDITION_FOR_BIND_FINWORKER = "condition.for.bind.finworker";

	/** ������� ��� ������������� �������� ������ */
	public static final String ACCOUNT_FOR_ASSETS_INCOME = "account.for.assets.income";

	/** ������� ��� ������������� �������� ������ (������������� ������) */
	public static final String ACCOUNT_FOR_ASSETS_INTANGIBLE_INCOME = "account.for.assets.intangible.income";

	/** ������� ��� ������������� �������� ������ */
	public static final String ACCOUNT_FOR_COUNTERS_INCOME_FROM_CUSTOMERS = "account.for.counters.income.from.customers";

	/** ������� ��� ������������ ��������� ��������� �� ������ ���������� */
	public static final String ACCOUNT_FOR_COUNTER_INCOME = "account.for.counter.income";

	/** ���� ��������� �� ����� ��������� � ������������ */
	public static final String ACCOUNTS_FOR_COUNTERS_PUT_IN_SERVICE = "accounts.for.counters.put.in.service";

	/** SUPP-79044 ������� �� �� ����� ������������ �������� ��� ��������*/
	public static final String ACCOUNTS_FOR_MATERIALS_UNMOUNTING = "accounts.for.materials.unmounting";

	/** ������������ ������� ��� ���� ���������-�������� ��������� �� ����������
	 */
	public static final String ACCOUNT_FOR_CUSTOMER_COUNTER_EXPERTISE = "account.for.customer.counter.expertise";

	/** ������������ ������� ��� ���� ���������-�������� ��������� �� ������ */
	public static final String  ACCOUNT_FOR_CUSTOMER_COUNTER_VERIFICATION = "account.for.customer.counter.verification";
	
	/** SUPP-99957 ��������������� ������� ��� ��������� ������ ��������� */
	public static final String  COUNTER_REPAIRING_CORRESPONDING_ACCOUNT = "counter.repairing.corresponding.account";
	
	/** SUPP-99957 ��������������� ��� ��� ��������� ������ ��������� */
	public static final String  COUNTER_REPAIRING_CORRESPONDING_CAA = "counter.repairing.corresponding.CAA";

	/** ������� ��� ������������� ��� */
	public static final String ACCOUNT_FOR_ZKU = "account.for.zku";

	/** ��� ���� - ������ ����� �����������㳿 ��������� ������ */
	public static final String ASSETS_COUNTER_KIND = "assets.counter.kind";

	/** ̳������� ������� ��������� ������ */
	public static final String ASSETS_MINIMAL_COST = "assets.minimal.cost";

	/** ��� ������� ������������� ��������� - ��������� ������ � ���� ����������.*/
	public static final String COUNTERS_KOD_IST_ASSETS_INCOME = "counters.kod.ist.assets.income";

	/** ��� ������� ������������� ��������� - �� �������� */
	public static final String COUNTERS_KOD_IST_INCOME_FROM_CONSUMER = "counters.kod.ist.income.from.consumer";

	/** ��� ������� ��� ����� - ������� �������� ��� ������ ��������� �� */
	public static final String COUNTERS_KOD_IST_SEALS_CONSUMING_WITH_ASSETS_MOUNT = "counters.kod.ist.seals.consuming.with.assets.mount";

	/** ��� ������� ��� ����� - ������� �������� ��� ������ ��������� �������� */
	public static final String COUNTERS_KOD_IST_SEALS_CONSUMING_WITH_CUSTOMER_MOUNT = "counters.kod.ist.seals.consuming.with.customer.mount";

	/**
	 * SUPP-73861 ���� � ������� ���������� ����� ������ ���� � ����� ������ ��� ��� �������� � �����
	 * , ���� ����� �������, �� ������� ����� �������� ������.
	 */
	public static final String DATE_MOUNT_ZKU_WITHOUT_COUNTER = "date.mount.zku.without.counter";
	
	/** 
	 * �������������� ������ ��� ����������� � ������� ������������ ������� ����������
	 * */
	public static final String DISPATCHER_AUTHORIZATION = "dispatcher.authorization";
	
	/**
	 * ������ � URL ���  ����������� � ������� ����������� ������ ����������
	 */
	public static final String DISPATCHER_URL = "dispatcher.url";

	/** ���� ������������� ����� ������ ��������*/
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_SLUJBA_ISOLATED = "tkclassificationtype.codes.works.slujba.isolated";

	/** �������, ������� � ���� �� �������� � ������� ������� (����� ���� � ��������� ������) */
	public static final String ACCOUNTS_NOT_INCLUDE_IN_ALLOCATION = "accounts.not.include.in.allocation";

	/** ���� ������������� ����� �� ������� �� �������� 0,4-35�� */
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_KL04_35KV = "tkclassificationtype.codes.works.kl04.35kv";

	/** ���� ������������� ����� �� ������� �� �������� 0,4-20 �� */
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_VL04_20KV = "tkclassificationtype.codes.works.vl04.20kv";

	/** ���� ������������� ����� �� ������� �� �������� 35-150 �� */
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_VL35_150KV = "tkclassificationtype.codes.works.vl35.150kv";

	/** SUPP-69492 ���� ������������� ����� �� �����*/
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_SZDTU = "tkclassificationtype.codes.works.szdtu";

	/** ���� ������������� ����� �� �������� ������*/
	public static final String TKCLASSIFICATIONTYPE_CODES_BUILDING = "tkclassificationtype.codes.building";

	/** ���, ������� ���� �� �������� � ������� �������� ������� (����� ���� � ���������)*/
	public static final String MOLS_NOT_INCLUDE_IN_ALLOCATION = "mols.not.include.in.allocation";

	/** ��� ���������� (ʳ������ ��������) */
	public static final String RQORG_FINAL_CONSUMER_CODE = "rqorg.final.consumer.code";

	/** � ����������-����������� ���������� ����� ����� ������ "������" ������� ��� �����, �� ���� ������ ��� ��������
		, ������� ������������ ��� ��� ����� (true ��� false). */
	public static final String  RQPACKINGLIST_TRANSIT_ONLY_NATIVE = "rqpackinglist.transit.only.native";

	/** SUPP-107071 ���� ������ ��������� ������� � ����� ����������, ��� ���������� ������� ����� ����������� ����-��� */
	public static final String RQFKORDER_CODES_HUGE_ORDERS = "rqfkorder.codes.huge.orders";

	/** SUPP-108419 ����-�����������, ��� ������� ���������� ��������� ����������� ������ "���������" �������
	 *  (����� ������� ��� �������) */
	public static final String RQFKORDER_MOLS_CHECK_ACCESS_FOR_UNCREATION = "rqfkorder.mols.check.access.for.uncreation";

	/**
	 * �����������, �� ������ �������� ���� ���������� �� �������
	 *    ��� ���� (����� ������� ���������� �������).
	*/
	public static final String USERS_ALLOWED_TO_CHANGE_DATE_POSTINGS_FKORDER_ALL_KINDS = "users.allowed.to.change.date.postings.fkorder.all.kinds";

	/**
	 * �����������, �� ������ �������� ������ ��� ����� �� ����������
	 */
	public static final String USERS_ALLOWED_ADDITION_ANNUAL_PLANS_WHEN_PROHIBITED = "users.allowed.addition.annual.plans.when.prohibited";

	/**
	 * �����������, �� ������ ���������� �������� � �������������  �� �������� ������ (������ ����� ������� � ��� ��������)
	 */
	public static final String USERS_ALLOWED_TO_ADD_CALCULATION_FROM_TEST_SOURCES = "users.allowed.to.add.calculation.from.test.sources";

	/**SUPP-78777 �����������, �� ������ �������� �������� ����������� �� ���� ���������*/
	public static final String USERS_ALLOWED_TO_ADD_ESTIMATES_DESPITE_PURCHASES_PLAN = "users.allowed.to.add.estimates.despite.purchases.plan";

	/** SUPP-40280 ����������� ���� ������ ��������� ���������� ������ �����, ���� 䳺 �������� */
	public static final String USERS_ALLOWED_PLAN_ACCESS_WHEN_PROHIBITED = "users.allowed.plan.access.when.prohibited";

	/** SUPP-85890 ��� ������� �� �������������, �� ��������������� ��� ������ �� �������������� ��������� � ������ IBAN*/
	public static final String IBAN_DEFAULT_COUNTRY_CODE = "iban.default.country.code";


	public static final String EMAIL_ADDRESSES_TO_NOTIFY_ABOUT_RESTOCKING_ORDER_CREATION = "email.addresses.to.notify.about.restocking.order.creation";

	public static final String SERVICES_SHEETS_LAND_DELAY_STANDARD = "services.sheets.land.delay.standard";
	public static final String SERVICES_SHEETS_LAND_DELAY_NONSTANDARD = "services.sheets.land.delay.nonstandard";

	/** SUPP-90063 ���-���� ��� ������ ��������� ���� � �������� �� ����������� ��� ������������ ����������� ���� ���������� �����
	 * , ����� �� ������������� ������ "������ ���������" �� �������� �������������.  */
	public static final String DDS_CODES_TO_EXCLUDE_FROM_CONNECTION_FINISH_WORKS = "dds.codes.to.exclude.from.connection.finish.works";

	/** ��������� ������ �����, ������� ����� ��������� ��������� ������� �� ������ �� ����������� */
	public static final String DOCFLOW_REPAIR_REQUEST_IN_APPROVAL_TABNUMBERS = "docflow.repair.request.in.approval.tabnumbers";

	/** ��������� ������ �����, ��� ������� �� ����� ��������� ���������� � �������/�� ���������� � �.�. ��� ���������� ������� */
	public static final String DOCFLOW_DONT_CHECK_WORKER_ON_HOLIDAYS_TABNUMBERS = "docflow.dont.check.worker.on.holidays.tabnumbers";

	/** ��������� ������ ����������� ��� �������� ���� �� �������� */
	public static final String DOCFLOW_ESTIMATE_REVIEW_TABNUMBERS = "docflow.estimate.review.tabnumbers";
	/** ��������� ������ ����������� ��� ���������� � ����������� ��� ���� */
	public static final String DOCFLOW_ESTIMATE_WATCHERS_TABNUMBERS = "docflow.estimate.watchers.tabnumbers";

	/** (86, E'netobjects.technicalStatus.transferTariff', E'����� �� ������� - 2 ����') */
	public static final String TECHNICALSTATUS_TRANSFERTARIFF = "netobjects.technicalStatus.transferTariff";
	/** (87, E'netobjects.technicalStatus.fine', E'����� � ������������ ������� ����������� ����������� �������� ��� �� ����������� ��������� ��������� SAIDI') */
	public static final String TECHNICALSTATUS_FINE = "netobjects.technicalStatus.fine";
	/** (88, E'netobjects.technicalStatus.distributionTariff', E'Mzap - ������� �������� �� ������� �����������㳿') */
	public static final String TECHNICALSTATUS_DISTRIBUTIONTARIFF = "netobjects.technicalStatus.distributionTariff";
	/** (89, E'netobjects.technicalStatus.bLineCapex', E'���������� �������� ������ �� ������ �� ������� ���������� �������� ������� (��� �� 6-10 ��)') */
	public static final String TECHNICALSTATUS_BLINECAPEX = "netobjects.technicalStatus.bLineCapex";
	/** ���������� �������� ������ �� ������ �� ������� ���������� �������� ������� (��� �� 0,4 ��) */
	public static final String TECHNICALSTATUS_BLINECAPEX_04 = "netobjects.technicalStatus.bLineCapex.04";
	/** ���������� �������� ������ �� ������ �� ������� ���������� �������� ������� (��� �� 35-150 ��) */
	public static final String TECHNICALSTATUS_BLINECAPEX_150 = "netobjects.technicalStatus.bLineCapex.150";

	/** ��'� �� ������� ��������� ��������� */
	public static final String TECH_DIR_NAME_AND_SURNAME = "tech.dir.name.and.surname";
	/** ������������ ������ ��������� ��������� � ������ ����� */
	public static final String TECH_DIR_POSITION_UP = "tech.dir.position.up";

	/** ����, �������� ��� �������� ������� ������ (����� �������) */
	public static final String PLANNING_ALLOWED_YEARS = "planning.allowed.years";
	
	/** ����������� ���������� �������� ������� �� ���� */
	public static final String WORKING_HOURS_STANDARD = "working.hours.standard";
	
	/** SUPP-108330 �������� ��� ��� */
	public static final String TECHKARDS_FOR_ZKU = "techkards.for.zku";

	/** ����������� ������������ �����������. ������������ � �������. */
	public static final String COMPANY_SHORTNAME = "company.shortname";

	public static final String RAB_SYNCHRONIZATION_FIXED_ASSETS_INCOME_LIST_SCRIPT = "rab.synchronization.fixed.assets.income.list.script";
	public static final String RAB_SYNCHRONIZATION_COUNTERS_INCOME_LIST_SCRIPT = "rab.synchronization.counters.income.list.script";
	public static final String RAB_SYNCHRONIZATION_MATERIALS_INCOME_LIST_SCRIPT = "rab.synchronization.materials.income.list.script";
	public static final String RAB_SYNCHRONIZATION_FIXED_ASSETS_WRITTEN_OFF_LIST_SCRIPT = "rab.synchronization.fixed.assets.written.off.list.script";
	public static final String RAB_SYNCHRONIZATION_COUNTERS_WRITTEN_OFF_LIST_SCRIPT = "rab.synchronization.counters.written.off.list.script";
	public static final String RAB_SYNCHRONIZATION_MATERIALS_WRITTEN_OFF_LIST_SCRIPT = "rab.synchronization.materials.written.off.list.script";
	public static final String RAB_SYNCHRONIZATION_ASSETS_PARTIAL_WRITE_OFF_LIST_SCRIPT = "rab.synchronization.assets.partial.write.off.list.script";
	
}

package com.ksoe.energynet.logic;

/**
 *
 * Класс с константами ключей настроек
 *
 *
 * @author kreschishinma
 * @since 07.11.2016
 *
 */
public class ENSettingsKeysConsts {
	
	/** Условие для проверки какие планы не проверять на наличие непривязанного персонала  */
	public static final String CONDITION_FOR_BIND_FINWORKER = "condition.for.bind.finworker";

	/** Рахунок для прибуткування основних засобів */
	public static final String ACCOUNT_FOR_ASSETS_INCOME = "account.for.assets.income";

	/** Рахунок для прибуткування основних засобів (нематеріальних активів) */
	public static final String ACCOUNT_FOR_ASSETS_INTANGIBLE_INCOME = "account.for.assets.intangible.income";

	/** Рахунок для прибуткування основних засобів */
	public static final String ACCOUNT_FOR_COUNTERS_INCOME_FROM_CUSTOMERS = "account.for.counters.income.from.customers";

	/** Рахунок для безоплатного прийняття лічильників на баланс підприємства */
	public static final String ACCOUNT_FOR_COUNTER_INCOME = "account.for.counter.income";

	/** Ключ настройки по вводу счетчиков в эксплуатацию */
	public static final String ACCOUNTS_FOR_COUNTERS_PUT_IN_SERVICE = "accounts.for.counters.put.in.service";

	/** SUPP-79044 Рахунки на які можна прибуткувати матеріали при демонтажі*/
	public static final String ACCOUNTS_FOR_MATERIALS_UNMOUNTING = "accounts.for.materials.unmounting";

	/** Забалансовий рахунок для актів приймання-передачі лічильників на експертизу
	 */
	public static final String ACCOUNT_FOR_CUSTOMER_COUNTER_EXPERTISE = "account.for.customer.counter.expertise";

	/** Забалансовий рахунок для актів приймання-передачі лічильників на повірку */
	public static final String  ACCOUNT_FOR_CUSTOMER_COUNTER_VERIFICATION = "account.for.customer.counter.verification";
	
	/** SUPP-99957 Корреспондуючий рахунок при поточному ремонті лічильників */
	public static final String  COUNTER_REPAIRING_CORRESPONDING_ACCOUNT = "counter.repairing.corresponding.account";
	
	/** SUPP-99957 Корреспондуючий КАУ при поточному ремонті лічильників */
	public static final String  COUNTER_REPAIRING_CORRESPONDING_CAA = "counter.repairing.corresponding.CAA";

	/** Рахунок для прибуткування ЗКУ */
	public static final String ACCOUNT_FOR_ZKU = "account.for.zku";

	/** Код виду - прилад обліку електроенергії основного засобу */
	public static final String ASSETS_COUNTER_KIND = "assets.counter.kind";

	/** Мінімальна вартість основного засобу */
	public static final String ASSETS_MINIMAL_COST = "assets.minimal.cost";

	/** Код джерела прибуткування лічильника - основного засобу у скан лічильниках.*/
	public static final String COUNTERS_KOD_IST_ASSETS_INCOME = "counters.kod.ist.assets.income";

	/** Код джерела прибуткування лічильника - від абонента */
	public static final String COUNTERS_KOD_IST_INCOME_FROM_CONSUMER = "counters.kod.ist.income.from.consumer";

	/** Код джерела для пломб - витрати матеріалів при монтажі лічильників ОЗ */
	public static final String COUNTERS_KOD_IST_SEALS_CONSUMING_WITH_ASSETS_MOUNT = "counters.kod.ist.seals.consuming.with.assets.mount";

	/** Код джерела для пломб - витрати матеріалів при монтажі лічильників абонентів */
	public static final String COUNTERS_KOD_IST_SEALS_CONSUMING_WITH_CUSTOMER_MOUNT = "counters.kod.ist.seals.consuming.with.customer.mount";

	/**
	 * SUPP-73861 Дата с которой необходимо будет делать акты с типом монтаж ЗКУ без счетчика в плане
	 * , если будет счетчик, то система будет выдавать ошибку.
	 */
	public static final String DATE_MOUNT_ZKU_WITHOUT_COUNTER = "date.mount.zku.without.counter";
	
	/** 
	 * Закодированная строка для авторизации к серверу оперативного журнала диспетчера
	 * */
	public static final String DISPATCHER_AUTHORIZATION = "dispatcher.authorization";
	
	/**
	 * Строка с URL для  подключения к серверу оперативный журнал диспетчера
	 */
	public static final String DISPATCHER_URL = "dispatcher.url";

	/** Коды классификаций работ службы изоляции*/
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_SLUJBA_ISOLATED = "tkclassificationtype.codes.works.slujba.isolated";

	/** Рахунки, залишки з яких не беруться у розподіл залишків (через кому у одинарних дужках) */
	public static final String ACCOUNTS_NOT_INCLUDE_IN_ALLOCATION = "accounts.not.include.in.allocation";

	/** Коды классификаций работ по Кабельні лінії напругою 0,4-35кВ */
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_KL04_35KV = "tkclassificationtype.codes.works.kl04.35kv";

	/** Коды классификаций работ по Повітряні лінії напругою 0,4-20 кВ */
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_VL04_20KV = "tkclassificationtype.codes.works.vl04.20kv";

	/** Коды классификаций работ по Повітряні лінії напругою 35-150 кВ */
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_VL35_150KV = "tkclassificationtype.codes.works.vl35.150kv";

	/** SUPP-69492 Коды классификаций работ по СЗДТУ*/
	public static final String TKCLASSIFICATIONTYPE_CODES_WORKS_SZDTU = "tkclassificationtype.codes.works.szdtu";

	/** Коды классификаций работ по Будівельні роботи*/
	public static final String TKCLASSIFICATIONTYPE_CODES_BUILDING = "tkclassificationtype.codes.building";

	/** МВО, залишки яких не беруться у відомості розподілу залишків (через кому у одинарних)*/
	public static final String MOLS_NOT_INCLUDE_IN_ALLOCATION = "mols.not.include.in.allocation";

	/** Код організації (Кінцевий споживач) */
	public static final String RQORG_FINAL_CONSUMER_CODE = "rqorg.final.consumer.code";

	/** В упаковочно-погрузочных ведомостях можно брать только "родной" транзит под планы, то есть только тот материал
		, который приходовался под эти планы (true или false). */
	public static final String  RQPACKINGLIST_TRANSIT_ONLY_NATIVE = "rqpackinglist.transit.only.native";

	/** SUPP-107071 Коды жирных приходных ордеров с кучей материалов, для проведения которых нужен увеличенный тайм-аут */
	public static final String RQFKORDER_CODES_HUGE_ORDERS = "rqfkorder.codes.huge.orders";

	/** SUPP-108419 МОЛы-отправители, для которых необходимо проверять возможность отмены "складання" ордеров
	 *  (через запятую без кавычек) */
	public static final String RQFKORDER_MOLS_CHECK_ACCESS_FOR_UNCREATION = "rqfkorder.mols.check.access.for.uncreation";

	/**
	 * Користувачі, які можуть змінювати дату проведення на ордерах
	 *    всіх видів (через запятую маленькими буквами).
	*/
	public static final String USERS_ALLOWED_TO_CHANGE_DATE_POSTINGS_FKORDER_ALL_KINDS = "users.allowed.to.change.date.postings.fkorder.all.kinds";

	/**
	 * Користувачі, які можуть додавати планові річні плани із запізненням
	 */
	public static final String USERS_ALLOWED_ADDITION_ANNUAL_PLANS_WHEN_PROHIBITED = "users.allowed.addition.annual.plans.when.prohibited";

	/**
	 * Користувачі, які можуть створювати договора з калькуляціями  із тестових джерел (логины через запятую и без пробелов)
	 */
	public static final String USERS_ALLOWED_TO_ADD_CALCULATION_FROM_TEST_SOURCES = "users.allowed.to.add.calculation.from.test.sources";

	/**SUPP-78777 Користувачі, що можуть додавати матеріали незаважаючи на план закупівель*/
	public static final String USERS_ALLOWED_TO_ADD_ESTIMATES_DESPITE_PURCHASES_PLAN = "users.allowed.to.add.estimates.despite.purchases.plan";

	/** SUPP-40280 Користувачі яким надано можливість редагувати планові плани, коли діє заборона */
	public static final String USERS_ALLOWED_PLAN_ACCESS_WHEN_PROHIBITED = "users.allowed.plan.access.when.prohibited";

	/** SUPP-85890 Код держави за замовчуванням, що використовується для роботи із розрахунковими рахунками в форматі IBAN*/
	public static final String IBAN_DEFAULT_COUNTRY_CODE = "iban.default.country.code";


	public static final String EMAIL_ADDRESSES_TO_NOTIFY_ABOUT_RESTOCKING_ORDER_CREATION = "email.addresses.to.notify.about.restocking.order.creation";

	public static final String SERVICES_SHEETS_LAND_DELAY_STANDARD = "services.sheets.land.delay.standard";
	public static final String SERVICES_SHEETS_LAND_DELAY_NONSTANDARD = "services.sheets.land.delay.nonstandard";

	/** SUPP-90063 РГК-коды для планов связанные акты с которыми не учитываются при проставлении фактической даты выполнения работ
	 * , также не проставляется статус "Работы выполнены" на договоре присоединения.  */
	public static final String DDS_CODES_TO_EXCLUDE_FROM_CONNECTION_FINISH_WORKS = "dds.codes.to.exclude.from.connection.finish.works";

	/** Табельные номера людей, которые могут принимать служебные записки на ремонт на утверждение */
	public static final String DOCFLOW_REPAIR_REQUEST_IN_APPROVAL_TABNUMBERS = "docflow.repair.request.in.approval.tabnumbers";

	/** Табельные номера людей, для которых не нужно проверять нахождение в отпуске/на больничном и т.п. при назначении задания */
	public static final String DOCFLOW_DONT_CHECK_WORKER_ON_HOLIDAYS_TABNUMBERS = "docflow.dont.check.worker.on.holidays.tabnumbers";

	/** Табельные номера сотрудников для отправки смет на проверку */
	public static final String DOCFLOW_ESTIMATE_REVIEW_TABNUMBERS = "docflow.estimate.review.tabnumbers";
	/** Табельные номера сотрудников для добавления в наблюдатели для смет */
	public static final String DOCFLOW_ESTIMATE_WATCHERS_TABNUMBERS = "docflow.estimate.watchers.tabnumbers";

	/** (86, E'netobjects.technicalStatus.transferTariff', E'Тариф на розподіл - 2 клас') */
	public static final String TECHNICALSTATUS_TRANSFERTARIFF = "netobjects.technicalStatus.transferTariff";
	/** (87, E'netobjects.technicalStatus.fine', E'Штраф — прогнозована вартість корегування необхідного прибутку ОСР за невиконання цільового показника SAIDI') */
	public static final String TECHNICALSTATUS_FINE = "netobjects.technicalStatus.fine";
	/** (88, E'netobjects.technicalStatus.distributionTariff', E'Mzap - тарифна складова на розподіл електроенергії') */
	public static final String TECHNICALSTATUS_DISTRIBUTIONTARIFF = "netobjects.technicalStatus.distributionTariff";
	/** (89, E'netobjects.technicalStatus.bLineCapex', E'Усереднене значення витрат на ремонт за вартістю будівництва підрядним методом (для ПЛ 6-10 кВ)') */
	public static final String TECHNICALSTATUS_BLINECAPEX = "netobjects.technicalStatus.bLineCapex";
	/** Усереднене значення витрат на ремонт за вартістю будівництва підрядним методом (для ПЛ 0,4 кВ) */
	public static final String TECHNICALSTATUS_BLINECAPEX_04 = "netobjects.technicalStatus.bLineCapex.04";
	/** Усереднене значення витрат на ремонт за вартістю будівництва підрядним методом (для ПЛ 35-150 кВ) */
	public static final String TECHNICALSTATUS_BLINECAPEX_150 = "netobjects.technicalStatus.bLineCapex.150";

	/** Ім'я та прізвище технічного директора */
	public static final String TECH_DIR_NAME_AND_SURNAME = "tech.dir.name.and.surname";
	/** Найменування посади технічного директора з великої літери */
	public static final String TECH_DIR_POSITION_UP = "tech.dir.position.up";

	/** Годы, открытые для создания годовых планов (через запятую) */
	public static final String PLANNING_ALLOWED_YEARS = "planning.allowed.years";
	
	/** Стандартное количество рабочего времени за день */
	public static final String WORKING_HOURS_STANDARD = "working.hours.standard";
	
	/** SUPP-108330 Техкарты для зку */
	public static final String TECHKARDS_FOR_ZKU = "techkards.for.zku";

	/** Сокращенное наименование предприятия. Используется в отчетах. */
	public static final String COMPANY_SHORTNAME = "company.shortname";

	public static final String RAB_SYNCHRONIZATION_FIXED_ASSETS_INCOME_LIST_SCRIPT = "rab.synchronization.fixed.assets.income.list.script";
	public static final String RAB_SYNCHRONIZATION_COUNTERS_INCOME_LIST_SCRIPT = "rab.synchronization.counters.income.list.script";
	public static final String RAB_SYNCHRONIZATION_MATERIALS_INCOME_LIST_SCRIPT = "rab.synchronization.materials.income.list.script";
	public static final String RAB_SYNCHRONIZATION_FIXED_ASSETS_WRITTEN_OFF_LIST_SCRIPT = "rab.synchronization.fixed.assets.written.off.list.script";
	public static final String RAB_SYNCHRONIZATION_COUNTERS_WRITTEN_OFF_LIST_SCRIPT = "rab.synchronization.counters.written.off.list.script";
	public static final String RAB_SYNCHRONIZATION_MATERIALS_WRITTEN_OFF_LIST_SCRIPT = "rab.synchronization.materials.written.off.list.script";
	public static final String RAB_SYNCHRONIZATION_ASSETS_PARTIAL_WRITE_OFF_LIST_SCRIPT = "rab.synchronization.assets.partial.write.off.list.script";
	
}

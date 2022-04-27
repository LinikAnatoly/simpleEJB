unit ENConsts;

interface

//uses SysUtils;

const
//// SYSTEM
LOW_INT = Low(Integer);
//NDS_COEFF = 1.2;

  NO = 0;
  YES = 1;



  //** низковольтное - Листи огляду ( ПЛ 0.4кВ, ПЛ 10кВ, ТП 6-10кВ ) */
  EQUIPMENTKIND_LOW_VOLTAGE = 1;
  //** высоковольтное - Листи огляду ( ПС 35-150 кВ, Лінії 35-150 кВ ) */
  EQUIPMENTKIND_HIGH_VOLTAGE = 2;



  //** (86, E'netobjects.technicalStatus.transferTariff', E'Тариф на розподіл - 2 клас') */
  TECHNICALSTATUS_TRANSFERTARIFF = 86;
  //** (87, E'netobjects.technicalStatus.fine', E'Штраф — прогнозована вартість корегування необхідного прибутку ОСР за невиконання цільового показника SAIDI') */
  TECHNICALSTATUS_FINE = 87;
  //** (88, E'netobjects.technicalStatus.distributionTariff', E'Mzap - тарифна складова на розподіл електроенергії') */
  TECHNICALSTATUS_DISTRIBUTIONTARIFF = 88;
  //** (89, E'netobjects.technicalStatus.bLineCapex', E'Усереднене значення витрат на ремонт за вартістю будівництва підрядним методом') */
  TECHNICALSTATUS_BLINECAPEX = 89;



  //** Вага елементу у структурі обладн. РУ ПС (Yi) */
  ITEM_WEIGHT = 1;
  //** Вага конструкції у структурі оцін. РУ (Yi_ct) */
  STRUCTURE_WEIGHT = 2;


  // ENInspectionSheetStatus
  //** чорновий */
  ENINSPECTIONSHEETSTATUS_DRAFT = 0;
  //** на підписанні */
  ENINSPECTIONSHEETSTATUS_ON_SIGNATURE = 1;
  //** підписаний */
  ENINSPECTIONSHEETSTATUS_SIGNED = 2;

  //** плановий */
  ENINSPECTIONSHEET_KIND_PLANED = 1;
  //** післяаварійний */
  ENINSPECTIONSHEET_KIND_POST_ACCIDENT = 2;
  //** позаплановий */
  ENINSPECTIONSHEET_KIND_NO_PLANED = 3;
  
  {Администраторы}
  GROUP_ADMIN = 1;
  {Ручная привязка счетчиков к договорам услуг на сторону}
  GROUP_BIND_COUNTERS_MANUALLY_TO_SERVICES_OBJECT = 215;
  
  SCUSAGEINPUTITEM_KIND_USAGE_INPUT = 1;


  //Ступінь напруги в точці приєднання
  TENSION_022 = 5; //0,22 кВ
  TENSION_04 		= 1;  //0,4 кВ
  TENSION_6_10 	= 2;  //10 (6) кВ
  TENSION_27_35 	= 3;  //35 (27) кВ
  TENSION_110_154 = 4;  //110 (154) кВ

  //Категорії надійності електропостачання
  CAT1_CITY = 500000004;  // I категорія, місто
  CAT1_LAND = 500000005;  // I категорія, село
  CAT2_CITY = 500000001;  // II категорія, місто
  CAT2_LAND = 500000003;  // II категорія, село
  CAT3_CITY = 500000000;  // IIІ категорія, місто
  CAT3_LAND = 500000002;  // IIІ категорія, село

  //Паспотизация ТП 10 - 6 / 0,4 кВ. Назначения Панелей Низковольтных Щитов
  ENPNL_NOTDEFINED                    = 500000000;	//Не определено
  ENPNL_INTRODUCTION_TRANSFORMER      = 500000001;	//Вводная трансформаторная панель
  ENPNL_SECTION                       = 500000002;	//Секционная панель
  ENPNL_DISTRIBUTIVE                  = 500000003;	//Распределительная панель
  ENPNL_INTRODUCTION_DISTRIBUTIVE     = 500000004;	//Вводно-распределительная панель
  ENPNL_INCLUSION_RESERVES_AUTOMATIC  = 500000005;	//Панель автоматического включения резервов
  ENPNL_NN_KTP_BOARD                  = 500000006;	//Щит НН КТП

  //Тип ввода для строки сметы
  ENESTIMATEITEMTYPE_AUTO   = 1; // Автоматический
  ENESTIMATEITEMTYPE_CORRECTED = 2; // откорректированный нормативный
  ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM = 3;  //ручной на строку плана
  ENESTIMATEITEMTYPE_MANUAL_BY_PLAN = 4;      // ручной на весь план

  // виды материалов : материалы, ГСМ
  ENESTIMATEITEMKIND_MATERIALS = 1;
  ENESTIMATEITEMKIND_GSM = 2;
  ENESTIMATEITEMKIND_DISMOUNT = 3;
  ENESTIMATEITEMKIND_REFINEMENT = 4;
  ENESTIMATEITEMKIND_PRODUCED = 5;
  ENESTIMATEITEMKIND_SERVICES = 6;
  ENESTIMATEITEMKIND_CUSTOMER_MATERIALS =7;


  ENHUMENITEMKIND_ELTEH = 1;
  ENHUMENITEMKIND_DRIVER = 2;

  // статусы у заявок ...
  ENESTIMATEITEMSTATUS_TMP_ = 0;
  ENESTIMATEITEMSTATUS_PLANNED = 1;
  ENESTIMATEITEMSTATUS_ORDERED = 2;
  //ENESTIMATEITEMSTATUS_DELIVERED = 3;
  //ENESTIMATEITEMSTATUS_INSKLAD = 3;
  //ENESTIMATEITEMSTATUS_USING = 4;

  //ENESTIMATEITEMSTATUS_IN_SKLAD_OE  = 3;
  //ENESTIMATEITEMSTATUS_IN_SKLAD_REM = 4;
  //ENESTIMATEITEMSTATUS_IN_MOL = 5;
  //ENESTIMATEITEMSTATUS_USED = 6;
  ENESTIMATEITEMSTATUS_PRESENT = 3;
  ENESTIMATEITEMSTATUS_MOVED = 4;
  ENESTIMATEITEMSTATUS_UNUSED = 5; // "Непотрібно замовляти"
  ENESTIMATEITEMSTATUS_LOADED = 6;
  ENESTIMATEITEMSTATUS_KSOE = 9;   // Матеріал ХОЕ
  ENESTIMATEITEMSTATUS_OWN_PRODUCTION = 10; // Власне виробництво

  // признак применения НДС - (по умолсанию 1 - НДС применяется)
  ENESTIMATEITEM_DONTUSEVAT = 0;
  ENESTIMATEITEM_USEVAT = 1;

  ///// типы расстояний ....
  ENDISTANCETYPE_TO = 1;
  ENDISTANCETYPE_ALONG = 2;
  ENDISTANCETYPE_FROM = 3;

  /// типы ТРАНСПОРТА .. ТК
  TKTRANSPORT_TYPE_BRIGADE = 1;
  TKTRANSPORT_TYPE_MECHANIZM = 7;

  /// Тип коэффициента для расчета топлива
   TKFUELKOEFTYPE_AUTO = 1;    ///   для применения на самом транспорте
   TKFUELKOEFTYPE_TRAVEL = 2;    /// для применения на путевых листах

   TKMATERIALS_SYSTEM_MATERIAL = 500026010; // Системный материал - мусор
   TKMATERIALS_TRANSFORMATORS_GROUP = 500014119; // Трансформаторы (группа)
////////////////////////////////////////////////////////////////////////////////

   //SUPP-61031. Редакторы нагрузок Высоковольтных Станций в режимный день
   ELECTRIC_LOAD_REGIM_DAY_EDITORS_GROUP = 4002054;
   //Ликвидаторы нагрузок Высоковольтных Станций в режимный день
   ELECTRIC_LOAD_REGIM_DAY_DELETERS_GROUP = 4002056;

// статусы планов
  ENPLANWORKSTATUS_GOOD = 1 ; // редактируемые (черновик)
  ENPLANWORKSTATUS_CANCELED_ = 2 ; // отмененные
  ENPLANWORKSTATUS_LOCKED = 3 ; // утвержденные
  ENPLANWORKSTATUS_INCORRECTION = 4 ; // на корректировке
  ENPLANWORKSTATUS_CORRECTED = 5 ;  // утвержденный?? скоректированый
  ENPLANWORKSTATUS_OLDER = 6 ;   // старый после корректировки - история
  ENPLANWORKSTATUS_PRECONFIRMED = 7 ; // типа на утверждении ;)
  ENPLANWORKSTATUS_WORKS_FINISHED = 8 ; // Работы завершены
  ENPLANWORKSTATUS_UNUSED = 9 ; // Непотрібно виконувати



////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////

// типы планов
  ENPLANWORK_YEAR_GOOD = 2016;     //   разрешенный для редактирования год - годовых планов

  ENPLANWORKKIND_YEAR = 1 ; // годовой
  ENPLANWORKKIND_CURRENT = 2 ; // текущий
  ENPLANWORKKIND_NPZ = 3; // НПЗ - ПЛАН
  ENPLANWORKKIND_FACT = 4; // НПЗ-ФАКТ
  ENPLANWORKKIND_CALCULATION = 5; // КАЛЬКУЛЯЦИЯ
  ENPLANWORKKIND_CALCULATION_SINGLE = 6; // КАЛЬКУЛЯЦИЯ ЕДИНИЧНАЯ (только для лицензированых работ утвержденных в НКРЕ)
  ENPLANWORKKIND_SALE_SPECIFICATION = 7; // спецификация на продажу товара

// вид планов ENPLANWORKTYPE - виды работ ;)
  ENPLANWORKTYPE_PLAN = 1;
  ENPLANWORKTYPE_AVR = 2;
  ENPLANWORKTYPE_PRIPIS = 3;
  ENPLANWORKTYPE_INVEST = 5;
  ENPLANWORKTYPE_ESBYT = 6;

  ENPLANWORKTYPE_ESBYT_PZ = 100;
  ENPLANWORKTYPE_ESBYT_PO = 101;
  ENPLANWORKTYPE_ESBYT_NPZ = 102;
  ENPLANWORKTYPE_ESBYT_NU = 103;
  ENPLANWORKTYPE_ESBYT_NS = 104;
  ENPLANWORKTYPE_ESBYT_TP = 105;

  ENPLANWORKTYPE_ESBYT_ZKO_106 = 106;
  ENPLANWORKTYPE_ESBYT_ZKO_111 = 111;
  ENPLANWORKTYPE_ESBYT_ZKO_112 = 112;
  ENPLANWORKTYPE_ESBYT_PO_113  = 113; // ЕЗ - Плановий обхід проблемних споживачів
  ENPLANWORKTYPE_ESBYT_RAID    = 114; // ЕЗ - Рейд

  ENPLANWORKTYPE_CN = 7;

  ENPLANWORKTYPE_SIDEWORKS = 8; //Роботи на сторону

  ENPLANWORKTYPE_NOT_PLANNED = 10;

  ENPLANWORKTYPE_TRANSPORT = 11;   // перевезення

  ENPLANWORKTYPE_WRITING_OFF = 12;   // Списание

  ENPLANWORKTYPE_SIZ = 13;   // средства защиты

  ENPLANWORKTYPE_TMC_TRANSFER = 14; // перемещение ТМЦ для договоров подряда

  ENPLANWORKTYPE_RESTOCKING = 16;  // ПВЗ

  ENPLANWORKTYPE_REFINEMENT_BY_CONTRACT = 17; // доробка по дого. подряда ...

  ENPLANWORKTYPE_WRITEOFF_PROTECTION = 18;// Списання засобів захисту

  ENPLANWORKTYPE_SERVICES_FROM_SIDE = 19; //Роботи со стороны
  ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST = 20;  //Роботи со стороны (Инвестпрограмма)

	// 21-й тип плана "Обеспечение транспорта" (для закупки шин, аккумуляторов)
	ENPLANWORKTYPE_TRANSPORT_SERVICES = 21;
  ENPLANWORKTYPE_VRTUVD_PROJECT = 22;

  // 24-й тип плана "Реализация товаров"
  ENPLANWORKTYPE_SALE_PRODUCTS = 24;

    // 25-й тип плана "Благодійна допомога"
  ENPLANWORKTYPE_GIFT = 25;

  ENPLANWORKTYPE_WRITEOFF_OS = 26; // Списание ОС


  // класификация ПЛАНОВ и АКТОВ
  {
  ENPLANWORKSTATE_CAPITALREPAIR = 1;
  ENPLANWORKSTATE_RECONSTRUCTION = 2;
  ENPLANWORKSTATE_TECHNICALSERVICE = 3;
  ENPLANWORKSTATE_CAPITALBUILDER = 4;
  }


  ENPLANWORKSTATE_CAPITALREPAIR = 1;    // Капітальний ремонт
  ENPLANWORKSTATE_RECONSTRUCTION = 2;   // Реконструкція і модернізація
  ENPLANWORKSTATE_TECHNICALSERVICE = 3; // Технічне обслуговування
  ENPLANWORKSTATE_CAPITALBUILDER = 4;   // Капітальне будівництво
  ENPLANWORKSTATE_CURRENTREPAIR = 5;    // Поточний ремонт
  ENPLANWORKSTATE_MEDIUMREPAIR = 6;     // Середній ремонт
  ENPLANWORKSTATE_SIDEWORKS = 7;        // Роботи на сторону
  ENPLANWORKSTATE_REFINEMENT = 8;       // Доробка

  ENPLANWORKSTATE_PRODUCTION = 10;      // Виготовлення
  ENPLANWORKSTATE_MEASUREMENT = 11;     // Вимірювання та випробування
  ENPLANWORKSTATE_GSM = 12;             // Списання ГСМ

  ENPLANWORKSTATE_MATERIALS_TMC = 13;             // Списання материалов ТМЦ
  ENPLANWORKSTATE_TMC_TRANSFER = 20;  // (акт приема-передачи) Акт виконаних робіт договорів підряду

  ENPLANWORKSTATE_MATERIALS_MNMA = 23;             //  Списання малоценки  МНМА
  ENPLANWORKSTATE_MATERIALS_MBP = 15;             //  Списання малоценки МБП
  ENPLANWORKSTATE_WRITINGS_OS = 16;             // Списання ОС

	ENPLANWORKSTATE_BUFET_REALIZATION = 25; // Списання ТМЦ (Реалізація, Буфет) - нал
	ENPLANWORKSTATE_BUFET_NONEREALIZATION = 26; // Списання ТМЦ (Нереалізація, Буфет)
 	ENPLANWORKSTATE_BUFET_REALIZATION_BEZNAL = 33; // Списання ТМЦ (Реалізація, Буфет) - безнал
  ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS = 34; // Списання МБП (Інструменти)

  ENPLANWORKSTATE_SIZ = 17;   // индивидуальные средства защиты
  ENPLANWORKSTATE_BSZ = 18;   // бригадные средства защиты

  ENPLANWORKSTATE_DISMANTLING = 19; // Демонтаж

  ENPLANWORKSTATE_RECEPT_TRANSMISSION = 20; // прием передача материалов

  ENPLANWORKSTATE_REFINEMENT_BY_CONTRACT = 22; // доробка по дого. подряда ...

  ENPLANWORKSTATE_SERVICES_FROM_OUT = 24;

  ENPLANWORKSTATE_INSTALLATION_REINSTALLATION = 27;   // 27 тип акта - "Монтаж, переустановлення

  ENPLANWORKSTATE_TRANSPORT_SERVICES_4_SIDE = 30; // 30-й тип акта - "Транспортні послуги"

  // 31-й тип акта - "Реализация товаров"
  ENPLANWORKSTATE_SALE_PRODUCTS = 31;

  // 35-й тип акта - Списание счетчиков
  ENPLANWORKSTATE_COUNTERS_WRITEOFF = 35;

  // Акт дефектации счетчиков
  ENPLANWORKSTATE_COUNTERS_ACT_DEFECT = 36;

  // Госповерка счетчиков
  ENPLANWORKSTATE_COUNTERS_STATE_VERIFICATION = 37;

  // энергозбыт ....

	ENPLANWORKSTATE_EZ_PLANED_CHANGE_COUNTER = 100;
	ENPLANWORKSTATE_EZ_PLANED_ROUND = 101;
	ENPLANWORKSTATE_EZ_NOPLANED_CHANGE_COUNTER = 102;
	ENPLANWORKSTATE_EZ_NOPLANED_SETUP_COUNTER = 103;
	ENPLANWORKSTATE_EZ_NOPLANED_UNSETUP_COUNTER = 104;
	ENPLANWORKSTATE_EZ_TECH_VALIDATE = 105;
	ENPLANWORKSTATE_EZ_SETUP_ZKU = 106;
	ENPLANWORKSTATE_EZ_OFF_ONN = 107;

  ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION = 38;
  ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE = 39;
  ENPLANWORKSTATE_DESIGNING = 29;    // Проектирование

  ENPLANWORKSTATE_COUNTERS_EXPERTISE = 41;

  ENPLANWORKFORM_PLANNED = 1;
  ENPLANWORKFORM_NOPLANNED = 2;


////////////////////////////////////////////////////////////////////////////////


// типы подразделений
  ENDEPARTMENTTYPE_DEPARTMENT = 1;
  ENDEPARTMENTTYPE_RESPOSIBILITY = 100;//1;
  ENDEPARTMENTTYPE_BUDGET = 200;//2;
  ENDEPARTMENTTYPE_OTHER = 7;//3;
  ENDEPARTMENTTYPE_BRIGADA = 4;
  ENDEPARTMENTTYPE_UCHASTOK = 5;
  // Департамент
  ENDEPARTMENTTYPE_DIVISION = 400;
  

  // коды подразделений
  ENDEPARTMENT_CODE_OE_TRANSPORT = 102;

  ENDEPARTMENT_CO   = 3;         // Апарат управління
  ENDEPARTMENT_KSOE = 500000019; // ПАТ ЕК "Херсонобленерго"
  ENDEPARTMENT_HGES = 481;       // ХМЕМ
  ENDEPARTMENT_BUDGET = 1002; // Бюджетодержатели
  ENDEPARTMENT_REM = 731; // РЭСы

  ENDEPARTMENT_DATA_MANAGEMENT_CENTER = 500002000;
  ENDEPARTMENT_DISTRIBUTION_NETWORKS = 500000052;
  ENDEPARTMENT_OF_CLIENT_OPERATIONS = 500000053;

  {Константы региональных управлений RM - аббр. Regional Management}
  REN_RM_NORTH = 103;
  REN_RM_EAST = 104;
  REN_RM_SOUTH = 101;
  REN_RM_WEST = 102;
  REN_RM_CENTER = 105;

  // бюджетодержатели ...
  ENBUDGET_METROLOGY = 75000020;
  ENBUDGET_ENERGOSBYT = 240000001;
  ENBUDGET_VPTU = 500000000;
  ENBUDGET_SIT = 75000025;
  ENBUDGET_VRTUVD = 75000011;
  ENBUDGET_TRANSPORT = 75000016;
  ENBUDGET_SOT = 500000003;
  ENBUDGET_AGV = 500000009;
  ENBUDGET_OKS = 75000009;

  
  ///  Для планов-авр  Бюджетодержатель - Центр ответственности - Итем из RadioGroup
  ENBUDGET_ODG = 500000040;   ENRESPONSIBILITY_ODG = 500000041;    // 0
  ENBUDGET_SRM = 75000001;    ENRESPONSIBILITY_SRM = 75000002;     // 1
  ENBUDGET_SPS = 75000006;    ENRESPONSIBILITY_SPS = 75000004;     // 2
  ENBUDGET_SKEM = 500000007;  ENRESPONSIBILITY_SKEM = 500000006;   // 3
  ENBUDGET_SIZPI = 75000023;  ENRESPONSIBILITY_SIZPI = 75000022;   // 4
  ENBUDGET_SVEM = 75000005;   ENRESPONSIBILITY_SVEM = 75000003;    // 5
  ENBUDGET_RZA = 75000012;    ENRESPONSIBILITY_RZA = 75000013;     // 6

  // центры ответственности
  ENRESPONSIBILITY_VRTUVD = 75000010;
  ENRESPONSIBILITY_SOT = 500000002;
  ENRESPONSIBILITY_METROLOGY = 75000021;
  ENRESPONSIBILITY_ENERGOSBYT = 240000002;
  ENRESPONSIBILITY_OKS = 75000008;


  // 1 - Техническая Дирекция
  ENMANAGEMENT_TYPE_TECHNICAL = 1;
  // 3 Коммерческая Дирекция
  ENMANAGEMENT_TYPE_ENERGOSBYT = 3;


  // типы обьектов энергоситемы
  EN_LINE10 = 1;
  EN_LINE04 = 2;
  EN_SUBSTATION04 = 3;
  EN_TRANSFORMER04 = 4; // не для планов ...
  EN_LINE150 = 5;

  EN_SUBSTATION150 = 6; //Подстанция 150 / 35 / 10 - 6 кВ
  //NET-3975. EnergyWorkFlow. Вкладка ПЕРЕЧЕНЬ ТУ ВЫБРАННЫХ ОБЪЕКТОВ СЕТИ:
  EN_SS150 = 1006; //Подстанция 150 / 35 кВ.

  EN_BYT = 7;
  EN_PROM = 8;
  EN_RZA = 9;
  EN_SDTU = 10;

  EN_LINE_CABLE = 11; //Кабельная линия 0,4 кВ
  //NET-3975. EnergyWorkFlow. Вкладка ПЕРЕЧЕНЬ ТУ ВЫБРАННЫХ ОБЪЕКТОВ СЕТИ:
  EN_LC10 = 1011; //Кабельная линия 6 - 10 кВ
  EN_LC150 = 1511; //Кабельная линия 35 - 150 кВ

  EN_TRANSPORT = 12;
  EN_METROLOGY_COUNTER = 13;
  EN_METROLOGY_DEVICE = 14;
  EN_BUILDER = 15;
  EN_SIT = 16;
  EN_ISOLATION = 17;
  EN_METROLOGY_OBJECT = 18;
  EN_PURCHASES_OBJECT = 19;
  EN_PURCHASES_NO_OBJECT = 20;

  EN_TRANSFORMER_OBJECT = 21; //Трансформатор в ремонте
  EN_OPERATIVE_OBJECT = 22;
  EN_SERVICES_OBJECT = 23;
  EN_PREPRODUCTION_OBJECT = 24; //Объекты ЦПП

  EN_TRUCKING = 25; //типа Грузоперевозки ;)

  EN_ABSTRACT_INV_NUMBER = 28;

  EN_METROLOGY_SUBSTATION = 26;
  EN_EB_OBJECT = 27;

  EN_WRITING_NO_OBJECT = 29;
  EN_GIFT_NO_OBJECT = 73; // Благодійна допомога
  EN_AVR16_NO_OBJECT = 76;

  EN_SIZ_OBJECT = 30;   // индивидуальные средства защиты
  EN_SZ_BRIGADE = 31;   // бригадные средства защиты

  ENSZBRIGADE_WORKING = 0;
  ENSZBRIGADE_CLOSED = 1;

  EN_EQUIPMENT = 32;
  EN_EQUIPMENT_REPAIR = 33;

  EN_TRANSFER = 34;

  EN_WRITING_NO_OBJECT_RESTOCKING = 35;  // поповнення запасів

  EN_SERVICES_FROM_SIDE_OBJECT = 48;  //  об'єкти договорів (сторонні послуги)

  EN_ROUTE_BYT = 53; // Маршрут быт

  EN_POST = 55; //Опора
  EN_BRANCH10 = 60; //Воздушное ответвление (отпайка) от ВЛ 6 - 10 кВ
  EN_CABELOUT10 = 61; //Кабельный выход из / Кабельная вставка в ВЛ 6 - 10 кВ
  EN_DISCONNECTOR = 37; //Разъединитель
  EN_LOADSWITCH = 38; //Выключатель нагрузки
  EN_INSULATOR = 40; //Изолятор
  EN_ARRESTER = 41; //Разрядник
  EN_FUSE = 39; //Предохранитель

  EN_INVEST_COUNTERS = 77; // Інвестпрограма ПЗЛ-100,ЗКО-106,ЗКО-111,ЗКО-112
  EN_CALLCENTER_OBJECT = 78; // Виртуальные объекты CallCenter'а


  //** Тип акумуляторної батареї */
  ENSUBST150_BATTERY_TYPE = 81;
  //** Тип підзарядного пристрою акум. батареї */
  ENSUBST150_BATTERY_CHARGER_TYPE = 82;
  //** Тип відокремлювача */
  ENSUBST150_SEPARATOR_TYPE = 83;
  //** Тип короткозамикача */
	SUBST150_CIRCUITER_TYPE = 84;
  //** Тип розрядника */
	SUBST150_DISCHARGER_TYPE = 85;
  //** Тип роз'єднувача */
	SUBST150_DISCONNECTOR_TYPE = 86;
  //** Тип трансформатора струму */
	SUBST150_CURRENTTRANS_TYPE = 87;
  //** Тип вимикача */
	SUBST150_SWITCH_TYPE = 88;
  //** Тип трансформатора напруги */
	SUBST150_VOLTTRANS_TYPE = 89;
  //** Тип трансформатора власн. потреб */
	SUBST150_OWNTRANS_TYPE = 90;
  //** Тип силового трансформатора */
	SUBST150_POWERTRANS_TYPE = 91;
  //** Тип ТН */
  ENSUBST150_TN_TYPE = 92;
  //** Тип РЗА */
  ENSUBST150_RZA_TYPE = 93;
  //** Тип ТВП */
  ENSUBST150_TVP_TYPE = 94;
  //** Тип ДГК */
  ENSUBST150_DGK_TYPE = 95;
  //** Тип Выкатной элемент */
  ENSUBST150_PULL_OUT_ELEMENT_TYPE = 96;
  //** Тип Секция шин */
  ENSUBST150_TIRE_SECTION_TYPE = 97;
  //** Тип Контрольно-вимірювальні кабелі */
  ENSUBST150_CONTROL_CABLE_TYPE = 98;

  //** опора дерев'яна */
  WOOD_POST = 99;
  //** опора залізобетонна */
  ARMORED_POST = 100;


  //** Грозозахист ПС та контур заземлення */
  ENSUBST150_GROUNDING = 111;

  //*тип вру 150*/
  ENSUBST150VRUZRUTYPE_VRU150 = 1;

  //*тип вру зру 35*/
  ENSUBST150VRUZRUTYPE_VRUZRU35 = 2;

  //*тип вру зру 6_10*/
  ENSUBST150VRUZRUTYPE_VRUZRU6_10 = 3;
  //**тип Грозозахист ПС та контур заземлення */
  ENSUBST150_GROUNDING_TYPE = 112;
  //**тип кабельного каналу */
  ENSUBST150_CABLECHANNEL_TYPE = 113;
  //**кабельний канал */
  ENSUBST150_CABLECHANNEL = 114;

  //**тип Будівлі ЗРУ */
  ENSUBST150_BUILDZRU_TYPE = 115;
  //**Будівлі ЗРУ */
  ENSUBST150_BUILDZRU = 116;

  //** тип Дополнительные здания */
  ENSUBST150_BUILDINGADDITIONAL_TYPE = 117;
  //** Дополнительные здания */
  ENSUBST150_BUILDINGADDITIONAL = 118;

    //** тип Маслосборные конструкции */
  ENSUBST150_OILCOLLECTING_TYPE = 119;
  //** Маслосборные конструкции */
  ENSUBST150_OILCOLLECTING = 120;

  //** тип Внешнее ограждение */
  ENSUBST150_EXTERNALFENC_TYPE = 121;
  //** Внешнее ограждение */
  ENSUBST150_EXTERNALFENC = 122;

    //** тип Измерительные трансформаторы */
  ENSUBST150_TRANSFORMERMEASURE_TYPE = 123;
  //** Измерительные трансформаторы */
  ENSUBST150_TRANSFORMERMEASURE = 124;



  //  23.11.2011  +++  окрім "високовольтних ланок" і таке інше
  SQL_NO_SELECTED_ELEMENT_TYPE = 'code not in (4, 28, 34, 36, 37, 38, 39, 40, '
    + '41, 42, 43, 44, 45, 46, 47, 49, 50, 51, 52, 54, 55, 56, 57, 58, 59, 60, 61, '
    + '62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 77, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91,92,93,94,95,96,97,98, '
    + ' 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111 , 112 , 113 , 114 ,115,116,117,118,119,120,121,122,123,124 )';


  // коды типов объектов для которых не обрабатывать признак возможности генерить планы / акты .
  SQL_NO_SELECTED_ELEMENT_TYPE_FOR_ACCESS = '4,7,8,13,18,19,20,23,27,28,29,30,31,34,35,36,37,38,39,40,' +
    '41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,' +
    '74,75,76,77,78,79, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91,92,93,94,95,96,97,98, 99, 100,' +
    '101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114,' +
    '115,116,117,118,119,120,121,122,123,124 ';



  ENSDTUOBJECT_TYPE_SMART_IMS = 1000000010;

  ABSTRACT_TYPE_METROLOGY = 1;
  ABSTRACT_TYPE_EB = 2;
  ABSTRACT_TYPE_EQUIPMENT = 3;
  ABSTRACT_TYPE_EQUIPMENT_REPAIR = 4;


  NO_OBJECT_PURCHASES = 1;
  NO_OBJECT_WRITING = 2;
  
  NO_OBJECT_RESTOCKING = 4;  // поповнення запасів
  NO_OBJECT_GIFT = 6; // благодійна допомога (тип безобъектных закупивель)
  NO_OBJECT_AVR16 = 7; // поповнення АВР16
  NO_OBJECT_AVZ = 8; // поповнення фонду АВЗ

  // статусы АКТв выполненых работ ...
  ENACT_GOOD = 1;
  ENACT_CANCELED = 2;
  ENACT_CLOSED = 3;
  ENACT_SIGNATURE = 4;
  ENACT_REVERSED = 5;

  // виды НВЗ у лбдей из кадров ...
  FINWORKER_KIND_OTHER = 0;
  FINWORKER_KIND_PROM = 1;
  FINWORKER_KIND_ESBYT = 2;

  FINWORKER_KIND_ESBYT_CONTROLLER = -1; // ДЛЯ премии контролеры
  FINWORKER_KIND_ESBYT_INSPEKTOR = -2; // для премии инспекторы

  FINMOLTYPE_MASTER = 1;
  FINMOLTYPE_MECHANIC = 2;


  FINDOCTYPE_302 = 1;
  FINDOCTYPE_28_302 = 2;
  FINDOCTYPE_304 = 3;
  FINDOCTYPE_300 = 4;
  FINDOCTYPE_28_300 = 5;
  // бух Ордеры ...
  FINDOCTYPE_10_ = 6;
	FINDOCTYPE_310_ = 7;
	FINDOCTYPE_28_310_ = 8;

	FINDOCTYPE_312 = 11;
	FINDOCTYPE_28_312 = 12;

  FINDOCTYPE_320 = 25; // 320 - ввод в эксплуатацию 22сч (МБП)
  FINDOCTYPE_321 = 27; // 321 - ввод в эксплуатацию 15сч (МНМА
  FINDOCTYPE_322 = 29; // 322 - резервирование для ввода в эксплуатацию
  FINDOCTYPE_28_322 = 30; // 322 - резервирование для ввода в эксплуатацию 28 в/о для 322
  FINDOCTYPE_324 = 31; // 324 - вывод из резерва для ввода в эксплуатацию

  FINDOCTYPE_332 = 36; // 332 - Перенос средств защиты в резерв при списании

  ///// Буфет
  FINDOCTYPE_340    = 44;
  FINDOCTYPE_342    = 46;
  FINDOCTYPE_28_342 = 47;
  FINDOCTYPE_344    = 48;
  FINDOCTYPE_28_344 = 49;

  FINDOCTYPE_292    = 50;
  FINDOCTYPE_28_292 = 51;
  FINDOCTYPE_294    = 52;
  FINDOCTYPE_28_294 = 53;
  FINDOCTYPE_290    = 54;
  FINDOCTYPE_291    = 55;
  /////

  // 10.04.2012 +++ акты возврата товара
  FINDOCTYPE_350    = 56;
  FINDOCTYPE_28_350 = 57;
  FINDOCTYPE_352    = 58;
  FINDOCTYPE_28_352 = 59;
  FINDOCTYPE_354    = 60;
  //FINDOCTYPE_28_354 = 61;

  // реализация товаров

  FINDOCTYPE_362 = 61;
  FINDOCTYPE_28_362 = 62;


  // статусы ФИНМатериалов ... которые храняться в ЕН
  FINMATERIALSSTATUS_GOOD = 1;
  FINMATERIALSSTATUS_CANCELED = 2;
  FINMATERIALSSTATUS_MOVED = 3;
  FINMATERIALSSTATUS_VIRTUAL = 4;
  FINMATERIALSSTATUS_MOVED_TO_OPERATIVE = 5;



	CORRECTREASON_CHANGE_WORKS = 1;
	CORRECTREASON_CHANGE_MATERIALS = 2;
	CORRECTREASON_MOVE_TO_CURRENT = 3;
	CORRECTREASON_MOVE_TO_NPW = 4;
	CORRECTREASON_MOVE_TO_FACT = 5;
  CORRECTREASON_PURCHASES_BINDING = 11; //Прив'язка планів для закупівлі

  // типы связей между Материалами на планах ...
  ENESTIMATEITEM2ENESTIMATEITEM_TYPE_PLAN_MOVED = 1;
  ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED = 2;

  ENESTIMATEITEM2ENESTIMATEITEM_TYPE_COUNTER_MOVED = 5;
  ENESTIMATEITEM2ENESTIMATEITEM_TYPE_UNMOUNT_WRITE_OFF = 7; // Связка приходываемого материала с материалом который списывается (списание средств защиты)
  
  ENELEMENT2TKMATERIALS_TYPE_PRODUCTION = 1;

  // З'вязок між договорами аренди (ОКСН допуск та ОКСН видача ТУ)
  ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_ACCESS_WITH_OKSN_TU = 1;
  // З'вязок між договорами аренди (ОКСН узгодження проекту та ОКСН видача ТУ)
  ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_AGREEMENT_WITH_OKSN_TU = 2;
  // З'вязок між договорами аренди (ОКСН відшкодування  та ОКСН видача ТУ)
  ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_WORK_WITH_OKSN_TU = 3;
  // З'вязок між договорами аренди (ОКСН внесення змін до ТУта ОКСН видача ТУ)
  ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU = 4;

  ENACT2RQFKORDER_TYPE_SERVICES = 1;
  ENACT2RQFKORDER_TYPE_PRODUCTION = 2;
  ACT_REFINEMENT_AND_SERVICES = 3; // звязок актів по Доробка з актами вик робіт по  послугам зі сторони

  MonthesNames: array [1..12] of String =
        (
          'січень',
          'лютий',
          'березень',
          'квітень',
          'травень',
          'червень',
          'липень',
          'серпень',
          'вересень',
          'жовтень',
          'листопад',
          'грудень'
        );

///////////////////////
// RQ subsystem
/////////////////////////
  RQOrderExportPath = 'Export\'; // Путь для экспорта заявок
  AnnexOkExportPath = 'Export\'; // Путь для экспорта додатка ОК
  PlanPayExportPath = 'Export\'; // Путь для экспорта платежных ведомостей
  BonusExportPath = 'Export\'; // Путь для экспорта ведомостей по премии
  RQ_KE_OKPO = '31515435'; // Значение ОКПО для поставщика по умолчанию: ДП "КОМПЛЕКТЭНЕРГО"

  //RQORDER_STATUS_GOOD = 1;
  //RQORDER_STATUS_CLOSED = 2;
  //RQORDER_STATUS_CREATED = 3; // для бюджетной идет 1-3-2

  RQORDER_STATUS_GOOD = 1; // коригування планів в ХОЕ
  RQORDER_STATUS_WORK_IN_MTS = 2; // в роботі у вМТП (МТС)
  RQORDER_STATUS_CREATED = 3; // Предварительная - попередня


  RQORDERITM2NSTMTTMSTTS_GOOD = 1;
  RQORDERITM2NSTMTTMSTTS_CANCELED_BY_BUDGET = 2;
  RQORDERITM2NSTMTTMSTTS_CANCELED_BY_OE = 3;
  RQORDERITM2NSTMTTMSTTS_CANCELED_BY_DEPARTMENT = 4;

  RQORDERITEM2ENESTIMATEITEMTYPE_AUTO   = 1; // "Автоматично створена позиція"
  RQORDERITEM2ENESTIMATEITEMTYPE_MANUAL = 2; // "Позиція, створена вручну"

  RQORDER_KIND_DEPARTMENT_ = 1;
  RQORDER_KIND_BUDGET_ = 2;
  RQORDER_KIND_OE_ = 3;
  RQORDER_KIND_OE_PLANNED_AUTO = 4;
  RQORDER_KIND_OE_NOPLANNED = 5;
  RQORDER_KIND_PRODUCTION = 6;

  RQORDER_KIND_OE_PLANNED_SERVICES = 7;
  RQORDER_KIND_OE_NOPLANNED_SERVICES = 8;

  RQORDER_CREATION_METHOD_MANUAL = 1;
  RQORDER_CREATION_METHOD_AUTO_AVZ = 2;
  RQORDER_CREATION_METHOD_AUTO_COUNTERS_SERVICES = 3;

  RQORDER_FORM_PLANNED = 1;    // Плановая заявка
  RQORDER_FORM_NOTPLANNED = 2; // Внеплановая заявка

  RQORDER_TYPE_BUDGET = 1; // Бюджетная
  RQORDER_TYPE_INVEST = 2; // Инвестпрограмма

  // Типы связок ордеров
  RQFKORDER2FKORDERTYPE_E2E_TRANZIT2OPERATIVE = 3;  // Зв'язок з автоматичним ордером для зміни призначення залишку з Транзита в Опер. запас
  RQFKORDER2FKORDERTYPE_DP_2_SERVICESFROMSIDE = 4;  // Зв'язок видаткових ордерів для ДП з актами з послуг зі сторони

  // Ордеры для ФК
  RQFKORDER_KIND_PRIHOD_POSTAVKA = 1;
  //RQFKORDER_KIND_RASHOD_PEREMESCHENIE = 2;
  RQFKORDER_KIND_RASHOD_OE2REM = 2;
  RQFKORDER_KIND_RASHOD_REM2MOL = 3;
  RQFKORDER_KIND_RASHOD_OE2OUT = 4;
  RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT = 5; // Переміщення у Транзит (з Опер. запасу)
  RQFKORDER_KIND_RASHOD_E2E = 6; // Перенесення матеріалів у Транзиті між об'єктами
  RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE = 7; // Автоматичне переміщення з Транзиту в Опер. запас
  RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE = 10; // Акт переведення одиниці виміру
  RQFKORDER_KIND_LOADEXPL_MBP = 8; // Введення в експлуатацію спецодягу (МБП)    22 счет (мелкое все )
  RQFKORDER_KIND_LOADEXPL_MNMA = 9; // Введення в експлуатацію спецодягу (МНМА)    15 счет (покрупнее).
  RQFKORDER_KIND_MBP  = 11; // Введення в експлуатацію МБП
  RQFKORDER_KIND_MNMA = 12; // Введення в експлуатацію МНМА
  RQFKORDER_KIND_RASHOD_MNMA = 13; // Переміщення МНМА
  RQFKORDER_KIND_SERVICES_FROM_SIDE = 14;  // Акт виконання послуги
  RQFKORDER_KIND_PRIHOD_BUFET = 15; // Приход (Буфет)
  RQFKORDER_KIND_RASHOD_BUFET = 16; // Внутр. перемещение (Буфет)
  RQFKORDER_KIND_WRITEOFFCOUNTERS = 17; // Акт на списание счетчиков
  RQFKORDER_KIND_RASHOD_RETURN_PRODUCT = 18; // Акт возврата товара
  RQFKORDER_KIND_SALE_PRODUCTS = 19;  // Реализация товаров
  RQFKORDER_KIND_RASHOD_GIFT = 20;  // Благодійна допомога
  RQFKORDER_KIND_OS_EXPL = 21;  // Введення в експлуатацію ОЗ
  RQFKORDER_KIND_OS_MOVEMENT = 22;  // Внутрішнє переміщення ОЗ
  RQFKORDER_KIND_RASHOD_TO_STORAGE = 28; // Внутрішнє переміщення (на Центральний склад)
  RQFKORDER_KIND_ZONE_CHANGING = 29; // Зміна місць зберігання
  RQFKORDER_KIND_PACKING_ORDER = 30; // Резервирование для упаковочно-погрузочных ведомостей
  RQFKORDER_KIND_OUT_FUEL = 31; // Ордер на перемещения топлива
  RQFKORDER_KIND_AVAR_OUT = 33; // Вывод материалов из аварийного запаса
  RQFKORDER_KIND_AVAR_IN = 34; // Ввод материалов в аварийный запас

  RQFKORDER_TYPE_ZVT = 1;

  RQFKORDER_ISPALLETIZED_TRUE = 1;
  RQFKORDER_ISPALLETIZED_FALSE = 0;

  // Признак "Згідно наказу" (для расходных ордеров по ДП)
  RQFKORDER_ISBYORDER_TRUE = 1;
  RQFKORDER_ISBYORDER_FALSE = 0;

  // Признак "Відправлено виконавцю" на расходных ордерах
  RQFKORDER_ISMATERIALSSENT_TRUE = 1;
  RQFKORDER_ISMATERIALSSENT_FALSE = 0;


  // типа кайнд для транспортной накладной
  RQTRANSPORT_INVOICE_KIND = 777;


  RQBILL_STATUS_NEW = 1;
  RQBILL_STATUS_CONFIRMED = 3;

  RQBILL_TYPE_TMC = 1;
  RQBILL_TYPE_SERVICES = 2;

  RQORDER_RESOURCE_TMC = 1;
  RQORDER_RESOURCE_SERVICES = 2;
  RQORDER_RESOURCE_PRODUCTION = 3;

  RQFKORDER_STATUS_GOOD = 1;
  RQFKORDER_STATUS_CREATED = 2;
  RQFKORDER_STATUS_IN_FK = 3;
  RQFKORDER_STATUS_OS_IN_FK = 4;
  RQFKORDER_STATUS_COUNTER_IN_FK = 5;
  RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE = 6;

  RQORDERITEM_STATUS_GOOD = 1;
  RQORDERITEM_STATUS_CANCELED = 2;

  RQINVOICE_STATUS_NEW = 1; // новая
  RQINVOICE_STATUS_WORK_IN_MTS = 2;
  RQINVOICE_STATUS_CONFIRMED = 3; // принята в работу

  // типа статусы свзяки Прихода и Естимайтов ...
  RQFKORDERTM2STMTTMSTTS_IN_INVOICE = 0;
  RQFKORDERTM2STMTTMSTTS_PARTIAL = 1;

  // Статусы упаковочной ведомости
  RQPACKINGLIST_STATUS_GOOD = 1; // Черновой
  RQPACKINGLIST_STATUS_RESERVED = 2; // Материалы по строкам ведомости зарезервированны
  RQPACKINGLIST_STATUS_MAKE_PALLET = 3; // Разнесено количество по палетам
  RQPACKINGLIST_STATUS_CREATED_ORDERS = 4; // Ордера сформированны

  // Признак на кого относить затраты (0 - Подразделение, 1 - Управление)
  RQFKORDER_INCLUDECOSTS_NO = 0;
  RQFKORDER_INCLUDECOSTS_YES = 1;

  // FIN назнечение остатка
  REST_PURPOSE_ID_TRANZIT = 4533;
	REST_PURPOSE_ID_RESERVE = 2075;
	REST_PURPOSE_ID_OPERATIVE_ = 0;
  REST_PURPOSE_ID_NET_OPERATIVE = 4994;   //  net.oper

  // Типы назначений остатка
  REST_PURPOSE_TYPE_ID_TRANZIT = 5;        // Транзит
	REST_PURPOSE_TYPE_ID_RESERVE = 3;        // Резерв
  REST_PURPOSE_TYPE_ID_NET_OPERATIVE = 25; // Net.Оперативный запас
  REST_PURPOSE_TYPE_ID_OPERATIVE = 0; // Оперативный запас
  REST_PURPOSE_TYPE_ID_PVZ = 45;           // ПВЗ
  REST_PURPOSE_TYPE_ID_AVR16 = 66;         // АВР-16
  REST_PURPOSE_TYPE_ID_AVAR = 1;           // Аварійний запас
  REST_PURPOSE_TYPE_ID_FUELTANK = 86;      // Бак

  // Статусы платежных ведомостей
  RQPLANPAYSTATUS_GOOD = 1; // Черновой
  RQPLANPAYSTATUS_CREATED = 2; // Складений
  RQPLANPAYSTATUS_CLOSED = 3; // Утвержденный
  RQPLANPAYSTATUS_PAYMENTS_DONE = 4; // Оплаты разнесены

  // виды платежных ведомостей
  RQPLANPAYKIND_TMC = 1; // ведомость  по материалам
  RQPLANPAYKIND_SERVICE = 2; // ведомость по услугам

  /// Ціна постачальника
  RQAPPROVEDCOST_GOOD = 1;
  RQAPPROVEDCOST_APPROVED = 2;
  RQAPPROVEDCOST_APPROVED_NO_CONTROL = 3;

  // SUPP-70367 Методи розрахунку
  {Безготівковий} RQPAYMENTMETHOD_PROVISIONING = 1;
  {Готівковий} RQPAYMENTMETHOD_EXCHANGING = 2;

  /////////////////////////////////////////
  // ПУТЕВЫЕ ЛИСТЫ ..............
  //////////////////////////////////////////
  TRAVEL_STATUS_GOOD = 1;
  TRAVEL_STATUS_PLAN = 2;
  TRAVEL_STATUS_FACT = 3;
  TRAVEL_STATUS_CLOSED = 4;
  TRAVEL_STATUS_WRITINGOFF_GSM = 5;

  TRAVEL_TYPE_KRAN = 3;
  TRAVEL_TYPE_TRACTOR = 6;

  TRAVELITEM_KIND_PLAN = 1;
  TRAVELITEM_KIND_FACT = 2;

  TRAVELITEM_STATUS_GOOD = 1;
  TRAVELITEM_STATUS_CLOSED = 2;
  TRAVELITEM_STATUS_CALCULATED = 3;
  TRAVELITEM_STATUS_DELETED = 4;

  TKFUELTYPECALC_BY_NORM = 1;
  TKFUELTYPECALC_BY_COUNTER = 2;

  FKVODILA_POST_ID = '(650, 1409, 619, 622, 623, 624, 626, 1999, 635, 636, 641, 650, 642, 643, 178, 179, 274, 182, 186, 982, 985, 1021, 983, 628, 647, 259, 260, 284, 297, 624 , 633, 2246)';

  // Тип топлива - ДИЗТОПЛИВО
  TKFUELTYPE_DIESEL = 75000003;

  // тип топлива - бензин 92
  TKFUELTYPE_92 = 75000001;
  // тип топлива - бензин 95
  TKFUELTYPE_95 = 75000000;

  TK_KARTA_CODE_POGRUZKA_RAZGRUZKA = 500004877;


  // признак создания ОЗ
  SC_USAGE_INPUT_AUTO_CREATED_NO = 0;
  SC_USAGE_INPUT_AUTO_CREATED_YES = 1;

  //////////////////////////////////////////////////////////////////////////////
  // Ввод счетчиков в эксплуатацию
  //////////////////////////////////////////////////////////////////////////////
  SC_USAGE_INPUT_EMPTY  = 1;  // Пустой (без строк)
  SC_USAGE_INPUT_FILLED = 2;  // Сформированный (есть строки)
  SC_USAGE_INPUT_CLOSED = 3;  // Утвержденный

  SC_USAGE_INPUT_ITEM_KIND_IN = 1; // введенные в экспл.
  SC_USAGE_INPUT_ITEM_KIND_OUT = 2; // выведенные из экспл. ОЕ
  SC_USAGE_INPUT_ITEM_KIND_OUT_USING = 3; // выведенные из экспл. АБОНОВСКИЕ
  //////////////////////////////////////////////////////////////////////////////

  // Виды привязки счетчиков
  SCCOUNTERKIND_FOR_MOVE = 1; // для перемещений
  SCCOUNTERKIND_WORK_FROM_BILLING = 2; // работы из биллинга
  SCCOUNTERKIND_FOR_WRITINGOFF = 3; // для списания
  SCCOUNTERKIND_FOR_PRIHOD = 4; // для прихода
  SCCOUNTERKIND_FOR_WORKORDERBYT = 5; // для сменного задания Энергосбыта
  SCCOUNTERKIND_FOR_ZONECHANGING = 6; // для изменения места хранения

  // Статусы привязки счетчиков
  SCCOUNTERSTATUS_GOOD = 1; // Дійсний
  SCCOUNTERSTATUS_IN_ACTS = 2; // в Акті (ОЗ-1 і інш.)
  SCCOUNTERSTATUS_CANCELED = 100; // Відмінений

  SCORDERKIND_FOR_PRIHOD = 1; // Вид разнарядки для счетчиков для прихода
  SCORDERKIND_FOR_MOVE = 2; // Вид разнарядки для счетчиков для внутреннего перемещения

  // типы учета мат-лов
  TK_ACCOUNTINGTYPE_TMC = 1;
  TK_ACCOUNTINGTYPE_COUNTER = 2;
  TK_ACCOUNTINGTYPE_OS = 3;
  TK_ACCOUNTINGTYPE_SERVICES = 4;
  // для пломб
  TK_ACCOUNTINGTYPE_SEAL = 5;
  TK_ACCOUNTINGTYPE_IMP = 6;
  TK_ACCOUNTINGTYPE_HOLO = 7;

  TK_ACCOUNTINGTYPE_ALL_SEALS = '5, 6, 7';
  TK_ACCOUNTINGTYPE_FUEL_CARD = 8;


  // автопокрышки установлена\нет
  ENTIRESINSTALLSTATUS_NO = 0;
  ENTIRESINSTALLSTATUS_YES = 1;

  // аккумулятор установлен\нет
  ENACCUMULATORSSTATUS_NO = 0;
  ENACCUMULATORSSTATUS_YES = 1;

  // типы блокировок счечтиков (energy_lock ) в СК
  SC_COUNTER_LOCK_NEW_COUNTERS_LOCK = 4;
  SC_COUNTER_LOCK_SERVICES_COUNTERS_LOCK = 7; // Лок для услуг на сторону

  // коды маркеров для Мат-лов
  ENMARK_MAIN4REFINEMENT = 10;


  // статусы договоров работ или услуг на сторону
  ENSERVICESOBJECTSTATUS_DRAFT = 1;	           // Чорновий
  ENSERVICESOBJECTSTATUS_CANCELED = 2;	       // Відмінений
  ENSERVICESOBJECTSTATUS_BUDGETAPPROVED = 3;	 // Кошторис затверджений
  ENSERVICESOBJECTSTATUS_SIGNED = 4;	         // Підписаний
  ENSERVICESOBJECTSTATUS_PAID = 5;	           // Сплачений
  ENSERVICESOBJECTSTATUS_ACT_SIGNED = 6;      // акт приема-передачи счетчиков - подписан
  ENSERVICESOBJECTSTATUS_COMPLETED = 7;       // статус договора о присоединении - "Работы выполнены"
  ENSERVICESOBJECTSTATUS_TERMINATED = 8;      // статус договора о присоединении - расторгнут
  ENSERVICESOBJECTSTATUS_PREPAID = 9;         // статус договора о присоединении - "Оплачен предварительный счет"
	ENSERVICESOBJECTSTATUS_DISCLAIMER = 10;     // "Відмова замовника від послуг"
	ENSERVICESOBJECTSTATUS_CLOSE = 11;     // Договор Закрыт все сошлось все нормально


  // типы договоров по работам на сторону
  ENSERVICESOBJECTTYPE_TU    = 1;	// ТУ
  ENSERVICESOBJECTTYPE_OTHER = 2;	// Інші
  ENSERVICESOBJECTTYPE_SALE = 3;  //  продажа
  ENSERVICESOBJECTTYPE_SALE_PAYMENT_SCHEDULE = 4;  //  продажа  (график платежей)
  ENSERVICESOBJECTTYPE_CONNECTION = 5; //Приєднання

  //** Вид договора на услуги - оздоровление (отдых в пансионате) */
  ENSERVICESOBJECTTYPE_RELAXATION = 6;
  // Договора по совместному подвесу
  ENSERVICESOBJECTTYPE_OKSN = 7;
    // Договора на проектирование
  ENSERVICESOBJECTTYPE_PROJECT = 8;
    // Договора на вынос электросетей
  ENSERVICESOBJECTTYPE_SHIFT_LINES = 9;
    // Договора по оказанию охранных услуг
  ENSERVICESOBJECTTYPE_OHRINA = 10;


  // виды договоров по работам на сторону
  SERVICES_CONTRACT_KIND_SERVICES = 1;	  // услуги
  SERVICES_CONTRACT_KIND_SALES = 2;	      // продажа
  //** Вид договора на услуги - оздоровление (отдых в пансионате) */
  SERVICES_CONTRACT_KIND_RELAXATION = 3;
  // Договори аренди (ОКСН)
  SERVICES_CONTRACT_KIND_OKSN_RENT = 4;
  // Договори відшкодування витрат (ОКСН)
  SERVICES_CONTRACT_KIND_OKSN_WORK = 5;
  // Договори на видачу умов (ОКСН)
  SERVICES_CONTRACT_KIND_OKSN_TU = 6;
  //  Договори на узгодження проекту (ОКСН)
  SERVICES_CONTRACT_KIND_OKSN_AGREEMENT = 7;
  // Договори на допуск (ОКСН)
  SERVICES_CONTRACT_KIND_OKSN_ACCESS = 8;
  // Договори на проектування
  SERVICES_CONTRACT_KIND_PROJECT = 10;
  // Договори на внесення змін до ТУ (ОКСН)
  SERVICES_CONTRACT_KIND_OKSN_TU_MODIFY = 9;
  // Договори на охранні послуги
  SERVICES_CONTRACT_KIND_OHRINA = 13;
  // Договори на відшкодування витрат з постачальниками е/е
  SERVICES_CONTRACT_KIND_SUPPLIER = 14;
  
  SERVICES_CONTRACT_KIND_COMPANY_OBJ = 11;
  SERVICES_CONTRACT_KIND_CUSTOMER_OBJ = 12;
  SERVICES_CONTRACT_KIND_INFORMATIONAL = 15;
  SERVICES_CONTRACT_KIND_OTHER_NOT_LICENSED = 16;
  SERVICES_CONTRACT_KIND_REMOVAL_LINE_RM_KB = 17;
  SERVICES_CONTRACT_KIND_SERVICES_LUZOD_ASKOE = 18;


  // типы контрагентов для договоров по работам на сторону
  ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL            = 1; // Фізична особа
  ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET    = 2; // Юр. особа (бюджет)
  ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET = 3; // Юр. особа (не бюджет)
  ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT = 4; // Фізична особа - нерезидент
  ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT = 5; // Юридична особа - нерезидент


  // бух. статусы для договоров по работам на сторону
  ENSERVICESOBJECT_FINSTATUS_GOOD   = 1; // Чорновий
  ENSERVICESOBJECT_FINSTATUS_CLOSED = 2; // Проведений
  ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED = 3; // Матеріали Замовника оприбутковано
  ENSERVICESOBJECT_FINSTATUS_CLOSED_BY_BUH = 4; // Проведений згідно бухдовідки

  // Платные или безоплатные услуги на сторону
  ENSERVICESOBJECT_ISNOPAY = 1; // Безоплатные услуги

  // Используются ли в работах на сторону материалы Заказчика (0 - нет, 1 - да)
  ENSERVICESOBJECT_ISCUSTOMERMATERIALS = 1;

  ///// 16.05.13 NET-4235 Тип расчета стоимости для договоров на сторону
  ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION = 1; // Розрахунок вартості згідно кошторису (старий метод)
  ENSERVICESOBJECT_CALCTYPE_BY_FACT        = 2; // Розрахунок вартості на підставі фактичних витрат (новий метод)
  /////

  // метод формирования доходгого акта
  //** закрытие работ по договору одним доходным актом */
	ENACTINCOME_CREAT_METOD_SINGLE = 1;
	//** закрытие работ по договору несколькими доходными актами */
	ENACTINCOME_CREAT_METOD_MORE_ONE = 2;


  // Источники нормативов
  TKTECHCARDSOURCE_TRANSPORT    = 500000024; // Перевозки
  TKTECHCARDSOURCE_SIZ          = 500000035; // Средства защиты
  TKTECHCARDSOURCE_CALCULATIONS = 500000039; // Калькуляции
  TKTECHCARDSOURCE_TEST_CALCULATIONS = 1000000003; // Калькуляции (тест)
  TKTECHCARDSOURCE_CALCULATIONS_20141201 = 1000000004; // Калькуляции (тест)
  TKTECHCARDSOURCE_SERVICES_FROM_SIDE = 1000000002;  // Услуги со стороны
  TKTECHCARDSOURCE_CLASSIFICATION_DEFECTS = 75000050; // Класифікація дефектів об''єктів енергетики

  // Типы элементов техкарт
  TKELEMENTTYPE_WORKERS   = 240000001; // Должности
  TKELEMENTTYPE_MATERIALS = 240000004; // Материалы
  TKELEMENTTYPE_TRANSPORT = 240000002; // Транспорт

  // статусы доверенности
  WARRANT_VALID = 0;
  WARRANT_INVALID = 1;

  // тип местности для выполнения работ
  SERVICESOBJECT_REGIONAL_TYPE_CITY = 1;
  SERVICESOBJECT_REGIONAL_TYPE_VILLAGE = 2;

  // признак повторного подключения абонента
  SERVICESOBJECT_RECONNECTIONTU = 1;
  // признак нового подключения абонента
  SERVICESOBJECT_NEWCONNECTIONTU = 0;

  AGREES_GROUPS_IDS = '205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338, 44, 135, 330, 43, 344, 264, 350, 351, 352, 353, 365, 368';

  // работа перевозка админ.персонала
  ADMIN_TRUCKING = 500004875;


  //////////////////////////////////////////////////////////////////////////////
  //// коды типов нормативного транспорта //////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  AVTOTYPE_CARTOWER = 2; // АВТОВЫШКА
  AVTOTYPE_CRANE = 3; // АВТОКРАН
  AVTOTYPE_BKU = 4 ; // БКУ
  AVTOTYPE_EXCAVATOR = 6; // ЭКСКАВАТОР
  AVTOTYPE_BOARD = 75000004; // ГРУЗО БОРТОВОЙ
  AVTOTYPE_TRUCK = 75000007; // САМОСВАЛ
  AVTOTYPE_TRACTORTRAILER = 500000000; // СЕДЕЛЬНЫЙ ТЯГАЧ 


  //  вид деятельности для классификаций
  ISNOTLICENSEDACTIVITY_NKRE = 0;                // Лицензионная НКРЕ
  ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT = 1;   // Нелицензионная (услуги транспорта)
  ISNOTLICENSEDACTIVITY_SERVICE_OTHERS = 2;      // Нелицензионная (другие)
  ISNOTLICENSEDACTIVITY_COSTWORKSCONTRACTOR = 3; // Нелицензионная (с привлечением стороннего подрядчика)

  /////// Справочник МОЛов ///////
  // типы МОЛов
  ENMOLTYPE_MASTER = 1;      // Мастер
  ENMOLTYPE_STOREKEEPER = 2; // Кладовщик
  ENMOLTYPE_STOREKEEPER_CENTRAL = 3; // Кладовщик Центрального Склада

  // статусы МОЛов
  ENMOLSTATUS_ACTIVE = 1;   // Активный
  ENMOLSTATUS_INACTIVE = 2; // Неактивный
  ////////////////////////////////


  /////  Статусы заявок транспорта ///
  ENTRANSPORTORDERSTATUS_GOOD = 1;
  ENTRANSPORTORDERSTATUS_IN_WORK = 2;
  ENTRANSPORTORDERSTATUS_CLOSED = 3;
  ///////////////////////////////////

  //// Признак командировки заявки на транспорт ///
  ENTRANSPORTORDER_ISASSIGNMENT_TRUE = 1;
  ENTRANSPORTORDER_ISASSIGNMENT_FALSE = 0;
  ///////////////////////////////////

  /// Статус транспорта ///
  TKTRANSPORTSTATUS_WORK = 75000000;
  TKTRANSPORTSTATUS_REPAIR = 75000001;
  TKTRANSPORTSTATUS_FROM_SIDE = 75000002;
  ///

  TKTRANSPORTREAL_ISVERIFIED = 1;
  TKTRANSPORTREAL_ISVERIFIED_FALSE = 0;

  // Запретить использовать транспорт
  TKTRANSPORTREAL_ISNOTUSED = 1;
  TKTRANSPORTREAL_ISNOTUSED_FALSE = 0;

  // Дежурный транспорт
  TKTRANSPORTREAL_ISONDUTY = 1;
  TKTRANSPORTREAL_ISONDUTY_FALSE = 0;

    // Транспорт з пусковим двигуном
  TKTRANSPORTREAL_HASSTARTER = 1;
  TKTRANSPORTREAL_HASSTARTER_FALSE = 0;

  // Тип топлива(Основной или для пускового двигателя и пр.)
  ENTRAVELSHEETFUELTYPE_MAIN = 1;
  ENTRAVELSHEETFUELTYPE_FOR_STARTER = 2;

  // Транспорт ОВБ
  TKTRANSPORTREAL_ISOVB = 1;
  TKTRANSPORTREAL_ISOVB_FALSE = 0;

  // Типы для коэффициентов расчета топлива
  TKFUELKOEFTYPE_TRANSPORT = 1;
  TKFUELKOEFTYPE_TRAVELSHEETITEM = 2;

  //
  ENTRAVELSHEETKIND_FACT = 2;
  ENTRAVELSHEETITEMSTATUS_GOOD = 1;

  ENELEMENTCODE_COUNTERS_WRITE_OFF = 500007381; // ОБЩИЙ ЕЛЕМЕНТ С ПЛАНОВ ДЛЯ СПИСАНИЙ СЧЕТЧИКОВ
  ENELEMENTCODE_FUEL_INVENTARIZATION_WRITE_OFF = 500009000; // элемент для списания по инвентаризации
  ENELEMENTCODE_RECYCLABLE_MATERIALS = 1017547431; // элемент для актов на перевод материалов во вторсырье

  // тип элемента - 50 - Вантаж для перевезення
  ENELEMENT_TYPE_CARGO_OBJECT = 50;
  // элемент - 1017002423 - Вантаж для перевезення
  CARGO_OBJECT = 1017002423;


  MIN_TIME_FOR_REZERVED_CALCULATION = '8:30:00'; // МИНИМАЛЬНОЕ ВРЕМЯ С КОТОРОГО НАЧИНАЕТСЯ РАСЧЕТ РЕЗЕРВИРОВАНИЯ ВРЕМЕНИ ПО ВРЕМЕННЫМ КАЛЬКУЛЯЦИЯМ .
  TIME_LUNCH_START = '12:12:00'; // ВРЕМЯ НАЧАЛА ОБЕДЕННОГО ПЕРЕРЫВА
  TIME_LUNCH_FINAL = '13:00:00'; // ВРЕМЯ ОКОНЧАНИЯ ОБЕДЕННОГО ПЕРЕРЫВА
  TIME_END_WORKING_DAY = '16:00:00'; // ВРЕМЯ ОКОНЧАНИЯ резервирования времени для віполнения услуг
  TIME_END_FRIDAY_DAY = '15:00:00'; // ВРЕМЯ ОКОНЧАНИЯ резервирования времени для віполнения услуг для пятницы



  //////////////////////////////////////////////////////////////////////////////
  //// Услуги на сторону (ПРИЄДНАННЯ) //////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  // 0Ц8Щ -- ПРИВАТНЕ ПІДПРИЄМСТВО "БРІЛЮКС-ПРОЕКТ"
  FK_PARTNERCODE_BRІLYUKS = '0Ц8Щ';

  // Типы договоров
  ENTECHCONDITIONSSERVICES_TYPE_PROJECT = 1;       // Проектирование
  ENTECHCONDITIONSSERVICES_TYPE_REALIZATION = 2;   // Реализация

  // Основания, согласно которым действуют доверенные лица Заказчика
  ENTECHCONDITIONSSERVICES_BASISTYPE_WARRANT = 3; // Доверенность

  // Статусы договоров
  ENTECHCONDITIONSSERVICES_STATUS_DRAFT = 1; // чорновой
  ENTECHCONDITIONSSERVICES_STATUS_SIGNED = 2; // Подписаный
  ENTECHCONDITIONSSERVICES_STATUS_COMPLETED = 3; // Завершённый

  // Виды договоров
  ENTECHCONDITIONSSERVICES_FORM_INDIVIDUAL = 1; // Индивидуальный
  ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY = 2; // Солидарный

  // Типы контрагентов
  ENTECHCONTRAGENT_TYPE_PHYSICAL  = 1; // Физ. лицо
  ENTECHCONTRAGENT_TYPE_JURIDICAL = 2; // Юр. лицо

  // Тип договора о присоединении
  ENCONNECTIONKIND_GENERAL_CONNECTION = 0;       // загальні договори на приєднання
  ENCONNECTIONKIND_STANDART = 1;                 // стандартне приєднання
  ENCONNECTIONKIND_NO_STANDART = 2;              // нестандартне приєднання
  ENCONNECTIONKIND_UNDEFINED = 3;                // тип приєднання не визначено
  ENCONNECTIONKIND_NO_STANDART_READY_MADE = 4;   // нестандартне приєднання (под ключ)

  // Степень (уровень, этап ...:::))) ставки платы за стандартное присоединение....
  ENCONNECTIONLEVEL_FIRST = 1; // І ступінь (до 16 кВт)
  ENCONNECTIONLEVEL_SECOND = 2; // IІ ступінь (від 16 кВт до 50 кВт)
	ENCONNECTIONLEVEL_THIRD = 3;  //** IІI ступінь (від 50 кВт до 160 кВт) */

  // огранияения мощности для стандартного подключения....
  STANDART_CONNECTIONS_POWER_16 = 16;
  STANDART_CONNECTIONS_POWER_50 = 50;
  STANDART_CONNECTIONS_POWER_160 = 160;

  // Признак расчета по двум тарифам
  ENTECHCONDITIONS_ISUSE2TARIFFS_NO = 0;
  ENTECHCONDITIONS_ISUSE2TARIFFS_YES = 1;

  // Признаки строительной площадки, базовой станции, малой архитектурной формы
  // на договоре о присоединении
  ENTECHCONDITIONS_BUILDERSAREA_NO = 0;
  ENTECHCONDITIONS_BUILDERSAREA_YES = 1;  // строительная площадка

  ENTECHCONDITIONS_BASESTATION_NO = 0;
  ENTECHCONDITIONS_BASESTATION_YES = 1;  // Базова станція

  ENTECHCONDITIONS_SMALLARCHFRM_NO = 0;
  ENTECHCONDITIONS_SMALLARCHFRM_YES = 1;  // Мала архітектурна форма

  ENTECHCONDITIONSOBJECT_SECURITYZONE_NO = 0;
  ENTECHCONDITIONSOBJECT_SECURITYZONE_YES = 1;  //Охоронна зона

  // виды работ по присоединению...  1 - включая стоимость работ */
  CONNECTIONWORKTYPE_NOT_INCLUDECOST = 0;
  CONNECTIONWORKTYPE_INCLUDECOST = 1;

   // тип расчета стоимости присоединения
   CONNECTIONCALCTYPE_NOT_ABOVE_RESERVE = 1;   // Потужність за ТУ не перевищує резерв
   CONNECTIONCALCTYPE_ABOVE_RESERVE = 2;       // Потужність за ТУ перевищує резерв

   // признаки основного и резервного источников питания
   PRIMARY_SUBSTATION = 1;       // основной
   SECONDARY_SUBSTATION = 2;     // резервный

  //////////////////////////////////////////////////////////////////////////////


  // Виды ответственных лиц
  ENRESPONSIBLESKIND_OMTS = 1; // Відповідальна особа ВМТП


  // статус транспортной накладной
  RQTRANSPORTINVOICESTATUS_NEW = 1;

  // статус ОЗ-2 рекострукция модернизация
  ENRECONSTRMODERNIZACSTATUS_DRAFT = 1; // ЧЕРНОВОЙ
  ENRECONSTRMODERNIZACSTATUS_SEGNED = 2; // НА ПОДПИСАНИИ
  ENRECONSTRMODERNIZACSTATUS_CLOSE = 3; // ПРОВЕДЕННЫЙ

  
  ///////////////////////////
  //// Классы напряжений ////
  ENVOLTAGECLASS_150 = 1;
  ENVOLTAGECLASS_35  = 2;
  ENVOLTAGECLASS_10  = 3;
  ENVOLTAGECLASS_6   = 4;
  ///////////////////////////


  ENRECONSTRMODERNOZ_STATUS_DRAFT = 1 ;
  ENRECONSTRMODERNOZ_STATUS_SIGNED = 2;
  ENRECONSTRMODERNOZ_STATUS_CLOSE = 3;

  // Тип виконавця плану
	FINEXECUTOR_TYPE_PRIMARY = 1;     // основний
	FINEXECUTOR_TYPE_ADDITIONAL = 2;  // додатковий
	// период осмотра подстанции 04
	ENSUBSTATION04_PERIODINSPECT_2 = 2; // не меньше чем два раза в  год
  ENSUBSTATION04_PERIODINSPECT_4 = 4; // не меньше одного раза в  квартал


  // ВИД ПЛАНОВ
  PLANWORKSHOW_STANDART = 1;  // Розгорнутий вигляд
  PLANWORKSHOW_LIGHT = 2;     // Спрощений вигляд


	ENPAYMENT2SOTYPE_PREPAYMENT = 1; // ПРЕДОПЛАТА 
	ENPAYMENT2SOTYPE_REPAYMENT = 2; // ПОГАШЕНИЕ ЗАДОЛЖЕННОСТИ 
	ENPAYMENT2SOTYPE_BACK_MONEY = 3; // ВОЗВРАТ ДЕНЕГ ЗАКАЗЧИКУ
                                 

  // статусы доходных актов
  ENACTINCOMESTATUS_GOOD = 1;        // Чорновий
	ENACTINCOMESTATUS_CANCELED = 2;    // Відмінений
	ENACTINCOMESTATUS_CLOSED = 3;      // Проведений в ФінКол
	ENACTINCOMESTATUS_SIGNATURE = 4;   // На підписанні

  RQORDERITEM_STATE_PAID = 1;

  // статусы ведомости распределения остатков
  RQALLOCATIONLISTSTATUS_NEW = 1;                  //  Чорнова
  RQALLOCATIONLISTSTATUS_MATERIALS_RESERVED = 2;   //  Матеріали зарезервовано
  RQALLOCATIONLISTSTATUS_CONFIRMED = 3;            //  Затверджена

  RQALLOCATIONLISTFORM_NOPLANNED = 2; // Позапланова відомість розподілу залишків

  ENELEMENTTYPE_PL6_10 = 1;  // Повітряна лінія 6-10 кВ
  ENELEMENTTYPE_PL04 = 2;  // Повітряна лінія 0.4 кВ
  ENELEMENTTYPE_ENSUBSTATION04 = 3; // ТП 0.4 кВ
  ENELEMENTTYPE_PL35_150 = 5;  // Повітряна лінія 35-150 кВ
  ENELEMENTTYPE_ENSUBSTATION150 = 6; // Подстанция 35-150 кВ

	// 52 - Договор о выполнении Тех.Условий
 	ENELEMENTTYPE_TECHCONDITIONSSERVICES = 52;

  ENELEMENTTYPE_RECORDPOINT_BYT = 7;
  ENELEMENTTYPE_RECORDPOINT_PROM = 8;

  // Типы объектов Инвестпрограммы
  ENINVESTOBJECTTYPE_OBJECT = 1; // Об'єкт
  ENINVESTOBJECTTYPE_PURCHASES_NO_OBJECT = 2; // Інші Закупівлі (разворачиваются по материалам)

  ////////  СТАНДАРТНЫЕ ВЕЛИЧИНЫ ТИПЫ //////////////////
  ///  /** ПДВ */
	ENSTANDARDCONST_PDV = 1;
  { ПДВ знижена ставка }
  ENSTANDARDCONST_PDV_LOW = 8;
	{ ЕСВ загальний }
	ENSTANDARDCONST_ESV_ALL = 2;
	{ ЕСВ інвалідн.}
	ENSTANDARDCONST_ESV_INV = 3;
	{ премії }
	ENSTANDARDCONST_PERCENT_BONUS = 4;
	{загальновиробн}
	ENSTANDARDCONST_PERCENT_COMPANY = 5;

  // Статусы Инвестпрограммы
	ENINVESTPROGRAMSTATUS_DRAFT = 1; // Черновая
	ENINVESTPROGRAMSTATUS_APPROVED = 2; // Утвержденная
	ENINVESTPROGRAMSTATUS_IN_PROGRESS = 3; // Выполняется
	ENINVESTPROGRAMSTATUS_FINANCING_COMPLETED = 4; // Финансирование завершено
	ENINVESTPROGRAMSTATUS_COMPLETED = 5; // Выполнена

  // Виды закупок
  ENTENDERPURCHASEKIND_ZCP = 1; // ЗЦП

  ENFUELDISTRIBUTIONSHEETITEM_CONFIRMED = 1;
  ENFUELDISTRIBUTIONSHEETITEM_NOT_CONFIRMED = 0;
  //--------------------------------> шифр типовые проекты (калькуляции)
  TKCLTYPE2CODEPROJECT_VOLTAGE_220 = 1; // Напруга споживача що приєднується 220 В
  TKCLTYPE2CODEPROJECT_VOLTAGE_380 = 3; // Напруга споживача що приєднується 380 В

  // Необхідність встановлення підставної опори
  TKCLTYPE2CODEPROJECT_WITHOUT_USEPILLAR  = 0;   // без підставної опори
  TKCLTYPE2CODEPROJECT_WITH_USEPILLAR  = 1; // з підставною опорою

  // Тип встановлення ЗКОЕ
  TKCLTYPE2CODEPROJECT_TYPEZKOE_0 = 0; // без трубстійки
  TKCLTYPE2CODEPROJECT_TYPEZKOE_1 = 1; // з трубстійкою
  TKCLTYPE2CODEPROJECT_TYPEZKOE_2 = 2; // на опорі

  // Тип дроту від якого споруджується відгалудження
  TKCLTYPE2CODEPROJECT_TYPECABLE_0 = 0; // неізольований
  TKCLTYPE2CODEPROJECT_TYPECABLE_1 = 1; // ізольований

  TKTECHCARDSOURCE_TYPE_PROJECT = 500000044;  // типовые проекты ВРТУВД
  //--------------------------------<
  CALL_CENTER_URL = 'http://10.77.11.180:18880/soap/servlet/rpcrouter';
  CALL_CENTER_DEFAULT_USER = 'callcenter';
  CALL_CENTER_DEFAULT_PASSWRD = 'callcenter_1';

  CCCALL_TYPE_T3 = 3;


  ENIPITEM_ISPROJECTDOCUMENT_TRUE = 1; // ПУНКТ інвест програми , проектная документация присутствует
  ENIPITEM_ISPROJECTDOCUMENT_FALSE = 0; // ПУНКТ інвест програми , проектная документация отсутствует

  // Статусы Инвестпрограммы new
	ENIPSTATUS_DRAFT = 1; // Черновая
	ENIPSTATUS_CREATED = 2; // СКЛАДЕНА
	ENIPSTATUS_APPROVED = 3; // УТВЕРЖДЕНА

  CONFIG_CHKPAYMENTBYBUDGET = 21; //Параметр из таблицы auth.config,
    //обозначающий, выполнять проверку оплат относительно бюджета или нет
  CONFIG_ENERGYNET_CLIENT_VERSION = 22;       //Версия клиента EnergyNet
  CONFIG_ENERGYWORKFLOW_CLIENT_VERSION = 23;  //Версия клиента EnergyWorkFlow
  CONFIG_ENERGYPRO_CLIENT_VERSION = 17;       //Версия клиента EnergyPro
  CONFIG_ENERGY_CLIENT_VERSION = 24;          //Версия клиента Energy
  CONFIG_CALLCENTER_CLIENT_VERSION = 25;      //Версия клиента CallCenter
  CONFIG_ADMIN_CLIENT_VERSION = 26;           //Версия клиента AdminClient
  CONFIG_TECHCARD_CLIENT_VERSION = 27;        //Версия клиента TechCard2
  CONFIG_PLOTTER_CLIENT_VERSION = 28;  //Версия Графического редактора Plotter
  CONFIG_SUPCHART_CLIENT_VERSION = 29; //Версия Графического редактора SupChart

  //Версия выделенных файлами exe подсистем комплекса EnergyWorkFlow
  CONFIG_ADMITORG_CLIENT_VERSION = 351; //AdmitOrg - Организатор доступа
  CONFIG_ACTFLOW_CLIENT_VERSION = 352; //ActFlow - Акты нарушений ППЭЭ
  CONFIG_JOINSPL_CLIENT_VERSION = 353; //JoinSPL - CОВМЕСТНАЯ ПОСТАВКА
  CONFIG_BUYSOEN_CLIENT_VERSION = 354; //BuySoEn - ПОКУПКА СОЛНЕЧНОЙ ЭНЕРГИИ
  CONFIG_MARKETE_CLIENT_VERSION = 355; //MarketE - Договора ХОЭ с ГосЭнергоРынком
  CONFIG_FIBEROPT_CLIENT_VERSION = 356; //FiberOpt - Совместный подвес ВОЛС
  CONFIG_CRIMPRM_CLIENT_VERSION = 357; //CrimPrM - Криминальное производство ХОЭ
  CONFIG_SUPPEWF_CLIENT_VERSION = 358; //SuppEWF - Поддердка рабочих запросов WorkFlow

  CONFIG_ENERGYNET_USESMDAXDATA = 30;       // Используется ли Axapta основным сервером
  CONFIG_ENERGYNETREPORT_USESMDAXDATA = 31; // Используется ли Axapta отчетным сервером
  //** Выборка списка контрагентов */
	CONFIG_USES_MDAX_CUSTOMER = 32;
	//** Выборка списка договоров */
	CONFIG_USES_MDAX_CONTRACT = 33;
	//** Выборка списка счетов контрагентов */
	CONFIG_USES_MDAX_CUSTOMERBANKACCOUNT = 34;
  //** Выборка списка номенклатур */
  CONFIG_USES_MDAX_ITEM = 35;
  //** Выборка остатков материалов */
  CONFIG_USES_MDAX_INVENTORYONHAND = 36;
  //** Приходные ордера */
  CONFIG_USES_MDAX_PURCHASEORDER = 37;
  //** Расходные ордера */
  CONFIG_USES_MDAX_TRANSFERJOURNAL = 38;
  //** Выборка МОЛов */
  CONFIG_USES_MDAX_INVENTLOCATION = 39;

  AX_CONTRAGENT_TYPE_CUSTOMER = 0;
  AX_CONTRAGENT_TYPE_VENDOR = 1;

  RQBUDGET_STATUS_DRAFT = 1; // черновой
  RQBUDGET_STATUS_APPROVED= 2;  // утвержден

  TEMPNOMENCLATURESTYPE_ETALON = 1; // эталон
  TEMPNOMENCLATURESTYPE_CHILD = 2; // чайлд

  TKCLASSIFICATIONTYPE_DEFAULT_PERCENTPROFITRATE = 10; // процент нормы прибыли по умолчанию для калькуляций

  TKCALCKIND_OLD = 1;
  TKCALCKIND_NEW = 2;
  TKCALCKIND_NEW2 = 3;

  ENPLANWORK_CAUSE_DISCONNECTION = 1; // для проведения работ необходимо отключение потребителей

  COUNTERS_INV_NUMBER_LENGTH_MIN = 6; // Минимальная длина инвентарного номера счетчика
  COUNTERS_INV_NUMBER_LENGTH_MAX = 7; // Максимальная длина инвентарного номера счетчика

  OS_INV_NUMBER_LENGTH = 6; // Длина инвентарного номера основного средства

  // Классификации работ Энергосбыта
  // Енергозбут
  TKCLASSIFICATIONTYPE_EZ = 1040002288;
  // Перевірка одно- і трифазного обліку електричної енергії
  TKCLASSIFICATIONTYPE_EZ_TO = 2140014414;
  // Ремонт, повірка, експертиза засобу обліку
  TKCLASSIFICATIONTYPE_EZ_COUNTER_EXPERTISE = 2140014419;

  TKCLASSIFICATIONTYPE_EZ_CONNECT_NEW = 2140012116;
  // Підключення юридичних (побутових) споживачів від (до) електромережі на опорі ПЛ до 1000В та понад 1000В
  TKCLASSIFICATIONTYPE_EZ_CONNECT = 2140011709;//2140010874; //2140009903; ///2140008888;  //2140008166;  //2140006125;//1040002339;
  // Підключення юридичних (побутових) споживачів від (до) електромережі у ВРП до 1000В та понад 1000В
  TKCLASSIFICATIONTYPE_EZ_CONNECT_VRP = 2140011718;//2140010875; //2140009904; //2140008889;  //1040002343;

  // Електронні лічильники
  // Повторне підключення електронного лічильника у складі автоматизованої системи обліку електроенергії
  TKCLASSIFICATIONTYPE_EZ_CONNECT_SMART = 2140011705;  //2140010873; //2140009902; ///2140008887;  //2140006122;  //1040002336;

  // Параметризація приладу обліку, що входить до складу автоматизованої системи обліку електроенергії без виїзду на об’єкт
  TKCLASSIFICATIONTYPE_PARAMETRIZATION_WITHOUT_LEAVING = 2140011805;  //2140010968; //2140010062;//2140009001;  //2140008476;
  // Встановлення однофазного лічильника типу NP-06 v.7 для проведення розрахунків за спожиту електроенергію за тарифами, диференційованими за зонами доби, у приміщенні з підвищеною небезпекою ураження електричним струмом за заявою побутового споживача
  TKCLASSIFICATIONTYPE_MOUNT_SMARTCOUNTER_V7 = 2140013149;  //2140011788;//2140010955;//2140010051;//2140008990;  //2140008101;
  // Встановлення однофазного лічильника для проведення розрахунків за спожиту електроенергію за тарифами, диференційованими за зонами доби, із монтажем в ЗКОЕЕ у багатоповерховому будинку, обладнаному електролічильниками NP-06  версії 3.0 в приміщенні з підвищеною небезпекою ураження електричним струмом за заявою побутового споживача (без заміни існуючого приладу обліку)
  TKCLASSIFICATIONTYPE_MOUNT_SMARTCOUNTER_V3 = 2140013150;  //2140011789;//2140010956;//2140010052;//2140008991;  //2140008103;

  // Програмування електронного лічильника електроенергії в умовах метрологічної служби
  // ??? некоторые типы счетчиков с возможностью программирования...
  TKCLASSIFICATIONTYPE_ISPROGRAM_COUNTER = 2140011664; //2140010831; //2140009985; //2140008901;//2140008095;

  // Проведення експертизи однофазного лічильника електричної енергії
  TKCLASSIFICATIONTYPE_PARAMETRIZATION_1F = 2140014747;
  // Проведення експертизи трифазного лічильника електричної енергії
  TKCLASSIFICATIONTYPE_PARAMETRIZATION_3F = 2140014750;

  {*************************************************
    Тип зв'язку матеріалу і підрозділу
    матеріал не повинен ділитись при розподілі для
    заданного бюджетотримача
  **************************************************}
  TKMATERIALS2ENDEPARTMENTTYPE_NOT_DIVIDE_IN_ALLOCATION = 1;

  //** Класифікації для договір підряду для розробки ПКД */
  TKCLASSIFICATIONTYPE_PKD = 80000001;


  ///////////////////////////////
  // Послуги сідельного тягача //
  ///////////////////////////////
  TKCLASSIFICATIONTYPE_TRANSIT_SERVICE = 1040002503;


  ENBANKINGDETAILS_MFO_RUSSBERBANK = 320627; // мфо сбербанк россии
  ENBANKINGDETAILS_MFO_UASBERBANK = 352457; // мфо сбербанк украина
  ENBANKINGDETAILS_MFO_PIB = 300506; // мфо первый инвестиционный банк
  ENBANKINGDETAILS_MFO_OBU = 352457; // мфо ощадбанк

  ENBANKINGDETAILS_MFO_OBU_300465 = 300465; // мфо ощадбанк  херсонский



  ENCHECKPOINTEVENTTYPE_OUT = 1; // регистрация на кпп выезд
  ENCHECKPOINTEVENTTYPE_IN = 2;  // регистрация на кпп въезд

  ENCHECKPOINT_MOTORCADE = 500000002; // КПП Кіндійське шосе 1
  ENCHECKPOINT_CPP = 500000023;  // КПП ЦПП
  ENCHECKPOINT_VYS = 500000012;  // КПП Високопілля
  ENCHECKPOINT_HGES = 500000003; //	КПП ХМЕМ
  ENCHECKPOINT_NKAH = 500000006; // КПП Н.Каховка
  ENCHECKPOINT_KAH = 500000008; //	КПП Каховка
  ENCHECKPOINT_IVA = 500000009;	// КПП Іванівка
  ENCHECKPOINT_GPR = 500000013; //	КПП Гопри
  ENCHECKPOINT_CUR = 500000016; //	КПП Олешки
  ENCHECKPOINT_LEP = 500000017;	// КПП Лепетиха
  ENCHECKPOINT_GEN = 500000018; //	КПП Генічеськ
  ENCHECKPOINT_GEN2 = 500000026; //	КПП Генічеськ (Гараж)
  ENCHECKPOINT_CHA = 500000020; //	КПП Чаплинка
  ENCHECKPOINT_NTR = 500000021; //	КПП Новотроїцьке
  ENCHECKPOINT_SKA = 500000015;	// КПП Скадовськ
  ENCHECKPOINT_NVOR = 500000024;	// КПП Воронцовка
  ENCHECKPOINT_VAL = 500000025;	// КПП В.Александровка
  ENCHECKPOINT_SER = 500000010; // КПП Серогози
  ENCHECKPOINT_BER = 500000005; // КПП Берислав
  ENCHECKPOINT_ROG = 500000022; // КПП Рогачик
  ENCHECKPOINT_KAL = 500000019; // КПП Каланчак
  ENCHECKPOINT_GOR = 500000007; // КПП Горностаївка

  TKMATERIALS2TECHCARD_TYPE_PRODUCTION = 1; // Связь тех.карт и изготовляемого материала

  // Типы связок эстимейтов с планами
  ENESTIMATEITEM2PLANTYPE_OWN_PRODUCTION = 1; // Зв'язок матеріалу з плану із планом на виготовлення

  // Статусы вложений
  ENDOCATTACHMENTSTATUS_ACTIVE = 0;
  ENDOCATTACHMENTSTATUS_DELETE = 1;

  // Тип вложения
  ENDOCATTACHMENTTYPE_DEFAULT = 1;

  //** общий документ */
  ENATTACHMENT2SERVICESKIND_GENERAL_DOC = 1;
  //** ini-файл для договора о присоединении */
  ENATTACHMENT2SERVICESKIND_SYSTEM_DOC = 2;


  // Типы сменных заданий для Энергосбыта
  ENWORKORDERBYTTYPE_BY_ENERGYNET = 1;    // Змінні завдання, сформовані в EnergyNet
  ENWORKORDERBYTTYPE_RAID_BY_BILLING = 2; // Змінні завдання для рейдових бригад, сформовані з білінгу
  ENWORKORDERBYTTYPE_CONTROL = 3;         // Змінні завдання для зняття контрольних показників згідно заяв побутових споживачів

  // Статусы сменных заданий для Энергосбыта
  ENWORKORDERBYTSTATUS_DRAFT     = 1; // Чорнове
  ENWORKORDERBYTSTATUS_FORMED    = 2; // Складене
  ENWORKORDERBYTSTATUS_APPROVED  = 3; // Затверджене
  ENWORKORDERBYTSTATUS_COMPLETED = 4; // Виконане
  ENWORKORDERBYTSTATUS_CLOSED    = 5; // Завершене

  // Типы связок пломб со сменными заданиями (План/Факт)
  SCSEAL2WORKORDERBYTKIND_PLAN = 1;
  SCSEAL2WORKORDERBYTKIND_FACT = 2;

  // Статусы пломб
  SCSEALSTATUS_GOOD = 1; // Дійсна
  SCSEALSTATUS_SPOILED = 2; // Зіпсована
  SCSEALSTATUS_INSTALLED = 3; // Встановлена на особовому рахунку
  SCSEALSTATUS_UNINSTALLED = 4; // Знята з особового рахунку (демонтована)

  // Типы пломбообразных объектов :)
  SCSEALTYPE_SEAL = 2; // Пломба
  SCSEALTYPE_IMP  = 3; // Индикатор
  SCSEALTYPE_HOLO = 4; // Голограмма

  // Статусы плановой ведомости выдачи ГСМ
  ENFUELSHEETVOLUMESSTATUS_DRAFT = 1; // Черновая
  ENFUELSHEETVOLUMESSTATUS_APPROVED = 2; // Утвержденная

  TKMATERIALS_COUNTER_1FService = 2000001969;
  TKMATERIALS_COUNTER_3FService = 2000001970;

  //Инвентаризация топлива
  ENFUELINVENTARIZATION_STATUS_DRAFT = 1;
  ENFUELINVENTARIZATION_STATUS_ITEMS_GENERATED = 2;
  ENFUELINVENTARIZATION_STATUS_FUEL_RESERVED = 4;
  ENFUELINVENTARIZATION_STATUS_FACT_QUANTITY_INSERTED = 3;
  ENFUELINVENTARIZATION_STATUS_CLOSED = 5;

  // замена счетчика */
	TKREPLACECOUNTERKIND_REPLACE_COUNTER = 1;
	// параметризация счетчика */
	TKREPLACECOUNTERKIND_PARAMETERIZATION_COUNTER = 2;


  //Акты возмещения ущерба
  ENDAMAGERECOVERY_STATUS_DRAFT = 1;
  ENDAMAGERECOVERY_STATUS_SUM_CALCULATED = 2;
  ENDAMAGERECOVERY_STATUS_CLOSED = 3;

  // Определение перенесено в DMReports - функции UsesMDAXData и UsesMDAXDataForReport
  //UsesMDAXDataForReport : Boolean = False; // использовать данные по штатному , подразд из аксапты


  ENBONUSLIST_STATUS_DRAFT = 1;
  ENBONUSLIST_STATUS_APPROVED = 2;


  ENBONUSLISTITEM_STATUS_VALID = 1;
  ENBONUSLISTITEM_STATUS_INVALID = 2;

  RQPLANPURCHASE_KIND_PLAN_PURCHASE = 1;
  RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN = 2;

  PURCHASE_ITEM_TYPE_MATERIALS = 1;
	PURCHASE_ITEM_TYPE_SERVICES = 2;
	PURCHASE_ITEM_TYPE_WORKS = 3;

  RQPLANPURCHASE_STATUS_DRAFT = 1;
  RQPLANPURCHASE_STATUS_APPROVED = 2;

  // количество с естимейта учитывается и в количестве с планов и для утвержденного количества для закупки
	RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_AND_FORPURCHASE = 1;
	//количество с естимейта учитывается только в количестве с планов при формировании плана закупок или змын до них - значит что при формировании естимейт был привязан к договору  */
	RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_ONLY = 2;
	// статус высвобождено ставится во время когда естимейт удаляется из плана , или план в котором этот эстимейт сидит передвигается в следущий год */
	RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FREED = 3;
	// т.е объем изменен за счет освобожденных позиций ( в изменения попало все кол -во а в закупку количество не считается ) */
	RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_REPLACEMENT = 4;

  // замещение было от строки источника которое определили как строку с виртуальной суммой - какая то забитая с начала года величина
	//  что бы потом при возникновении потребности/заявок мы могли обнулять в змынах например кол-во для публикации .
  //  Т.к эта сумма - которая находится в строке источнике(признак  на ней isabstractsum ) была заложена при формировании плана закупок на год
   RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_REPLACEMENT_SUM_ABSTRACT = 5;


  //
  ENCONTRACTTYPE_AGREE = 1; // ДОГОВОР
  ENCONTRACTTYPE_PROJECT_AGREE = 2;    // ПРОЕКТ ДОГОВОРУ



  // статус основного axapta
  MDAX_ASSET_STATUS_NOACQUISITION = 'NoAcquisition';//'NO_ACQUISITION'; // 6 NoAcquisition


  // списание тмц
  //USESMDAXWRITEOFF_TMC = 1;

  //** Тип договору про надання послуг до договору про приєднання */
  //** Технічний нагляд */
  ENTECHAGRKIND_TA = 1;
  //** Земля */
  ENTECHAGRKIND_GL = 2;
  //** Договір підряду для розробки ПКД */
  ENTECHAGRKIND_PKD = 3;

  // Вирт. объект для списания пломб и сейф-пакетов при проведении экспертизы счетчиков
  EN_METROLOGY_OBJECT_WRITEOFF = 1012000070;
  ENELEMENT_METROLOGY_OBJECT_WRITEOFF = 1017652632;

  // Константы для встроенного фильтра в гриде
  const GRID_FILTER_CONDITION_ALL = '(Усі)';
  const GRID_FILTER_CONDITION_DEFINE = '(Задати фільтр)';

  ENELEMENTTYPE_EQUIPMENT_OBJECTS = 32; // устаткування
  ENELEMENTTYPE_EQUIPMENT_REPAIR_OBJECTS = 33; // устаткування в ремонте

  ENELEMENT_ABSTRACT_RECORDPOINT = -1; // абстрактная точка учета


  SQL_SELECTED_ELEMENT_TYPE_FOR_REPORT_WORK_SCHEDULE = 'code in (1,2,3,5,6,11,9 )';

  ENSO2NODETYPE_STANDART = 1;
  ENSO2NODETYPE_RESERV = 2;

  TKREPORTITEMPURPOSE_PHYS_VOLUMES = 1;
  TKREPORTITEMPURPOSE_WORK_ESBYT_EN_PROM = 2;
  TKREPORTITEMPURPOSE_WORK_ESBYT_EN_BYT = 3;

  // Статусы реестров для Поставщиков
  ENREGFORSUPPLIERSTATUS_DRAFT    = 1; // Чорновий
  ENREGFORSUPPLIERSTATUS_CREATED  = 2; // Складений
  ENREGFORSUPPLIERSTATUS_APPROVED = 3; // Затверджений

  // Тип связи элементов и актов

  //Зв''язок договору на виконання робіт із актом виконанних робіт
  ENELEMENT2ACTTYPE_SERVICES_WORKS = 1;

  // Тип довіреності

  // внутрішня довіреність підприємства
  ENWARRANT_TYPE_INNER = 1;
  // довіреність стороньої організації
  ENWARRANT_TYPE_FROM_SIDE = 2;
  // відповідальна особа для розпоряджень
  ENWARRANT_TYPE_DECREE_RESPONS = 3;
  // довіреність для приходних ордерів
  ENWARRANT_TYPE_RQFKORDER = 4;

  //Дата та номер реєстрації заяви
  ENDATE_NUMBER_REGISTRATION_STATEMENT = 12;
  //Договор 20 стандартне приєднання
  ENCONNECTIONKIND_STANDART_20 = 13;
  //Договор 100 стандартне приєднання
  ENCONNECTIONKIND_STANDART_100 = 14;
  //рахунок 50% за потужність (нестандартне)
  ENCONNECTIONKIND_NO_STANDART_ACCOUNT_POWER_50 = 30;

  // Типи листів для договорів
  ENSHEETS4SOTYPE_LAND_SHEET = 1;
  ENSHEETS4SOTYPE_ACCOMPANYINGSHEET1 = 2;
  ENSHEETS4SOTYPE_DISTRIBUTION_CONTRACT = 12;
  ENSHEETS4SOTYPE_DISTRIBUTION_ADDAGREEMENT = 13;
  ENSHEETS4SOTYPE_PETITION = 21; //Супровідний лист до розпорядників земельних ділянок
  ENSHEETS4SOTYPE_ISSUE = 25;

  // ***** ENSOVALUESTYPE
  // Номер стадії відведення земельної ділянки
  ENSOVALUESTYPE_LAND_SHEET_STAGE_NUMBER = 26;
  ENSOVALUESTYPE_NAME_LAND_MANAGER = 31;//Найменування розпорядника земельної ділянки
  ENSOVALUESTYPE_POST_ADDRESS_LAND_MANAGER = 32;//Поштова адреса розпорядника земельної ділянки
  // дата заяви на приэднання
  ENSOVALUES_CONTRACT_REGISTRATION_DATE = 12;

  // Статуси ОЗ-1 новое строительство
  ENBUILDING_STATUS_DRAFT = 1 ;
  ENBUILDING_STATUS_SIGNED = 2;
  ENBUILDING_STATUS_CLOSE = 3;


  type
  TContractType = record
    code: Integer;
    name: String;
  end;

    type
  TRenFromCN = record
    code: Integer;
    name: String;
  end;

const
  // Тип договора - "Укладання договору на квартиру в новобудові" (для физ. лиц)
  CONTRACTTYPES_PHYS_NEW_APARTMENT = 11;
  // Тип договора - "Укладання договору на квартиру в новобудові" (для юр. лиц)
  CONTRACTTYPES_JUR_NEW_APARTMENT = 11;

const
  // Типы договоров на распределение э/э для физ. лиц
  CONTRACTTYPES_PHYS: array[1..8] of TContractType =
  (
     (code: 0; name: 'Зміна власника'),
     (code: 8; name: 'Укладання договору після виконання робіт з приєднання'),
     (code: 2; name: 'Розірвання договору'),
     (code: 4; name: 'Зміна призвища / місця проживання'),
     (code: 6; name: 'Зменшення потужності'),
     (code: 9; name: 'Замовлення підписаного паспорта точки розподілу'),
     (code: 10; name: 'Замовлення паперового примірника укладеного договору з розподілу'),
     (code: CONTRACTTYPES_PHYS_NEW_APARTMENT; name: 'Укладання договору на квартиру в новобудові')
  );

  // Типы договоров на распределение э/э для юр. лиц
  CONTRACTTYPES_JUR: array[1..11] of TContractType =
  (
     (code: 0; name: 'Зміна власника'),
     (code: 8; name: 'Укладання договору після виконання робіт з приєднання'),
     (code: 2; name: 'Розірвання договору'),
     (code: 5; name: 'Подовження дії договору'),
     (code: 4; name: 'Зміна назви / реквізитів / юр. адреси'),
     (code: 3; name: 'Доповнення існуючого договору об''єктом'),
     (code: 1; name: 'Виключення з договору одного з об''єктів'),
     (code: 6; name: 'Зменшення потужності'),
     //(code: 7; name: 'Розподіл потужності'),
     (code: 9; name: 'Замовлення підписаного паспорта точки розподілу'),
     (code: 10; name: 'Замовлення паперового примірника укладеного договору з розподілу'),
     (code: CONTRACTTYPES_JUR_NEW_APARTMENT; name: 'Укладання договору на квартиру в новобудові')
  );

  // Типы договоров на распределение э/э для юр. лиц, для которых не нужен EIC код точки учета
  CONTRACTTYPES_JUR_NO_EIC: array[1..4] of Integer = (2, 5, 4, 10);

  // Тип договора - "Новий власник" (для физ. лиц)
  CONTRACTTYPES_PHYS_NEW_OWNER: Integer = 8;
  //Додаток 4
  COMOFFER_UNIVERSAL = 1;           //пропозиція
  COMOFFER_UNIVERSAL_ONLINE = 2;    //пропозиція онлайн
  COMOFFER_FREE = 3;                //пропозиція
  COMOFFER_FREE_ONLINE = 4;         //пропозиція онлайн


    // Список Цеэновских Рэсов
  RENS_FROM_CN: array[1..12] of TRenFromCN =
  (
     (code: 5; name: 'Голопристанський'),
     (code: 17; name: 'Новокаховський'),
     (code: 4; name: 'Високопільський'),
     (code: 9; name: 'Херсонський'),
     (code: 16; name: 'Каховський'),
     (code: 19; name: 'Новотроїцький'),
     (code: 12; name: 'Генічеський'),
     (code: 14; name: 'Іванівський'),
     (code: 10; name: 'Великолепетиський'),
     (code: 20; name: 'Чаплинський'),
     (code: 7; name: 'Скадовський'),
     (code: 8; name: 'Олешківський')
  );


  ENSERVICESFROMSIDEOBJECTSTATUS_DRAFT = 1;
	ENSERVICESFROMSIDEOBJECTSTATUS_SIGNED = 2;
	ENSERVICESFROMSIDEOBJECTSTATUS_PAY = 3;
	ENSERVICESFROMSIDEOBJECTSTATUS_WORK_EXECUTE = 4;
	ENSERVICESFROMSIDEOBJECTSTATUS_WORK_COMPLETED= 5;

  ENACTPOSTINGFORM_EXPENDITURE_ACT = 1;
  ENACTPOSTINGFORM_INCOME_ACT = 2;

  //  додатки которые не показывать для РУКОЕЕ
  SQL_NOT_IN_SELECTED_ENREPORTADDITNZBTMTRLG_FOR_RUKOEE = '184,79,80,91,306,302,311,303,312,304,313,305,314,39,322,52,332,346,349,350,351,353,218,354,355,365,366,367,368,375,386,387';

  implementation
end.


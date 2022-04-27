package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENPlanWorkState;

public class ENConsts {

	public static final int NO = 0;
	public static final int YES = 1;


  //Підрозділи
  public static final int ENDEPARTMENT_INSPECTION = 96;        //Енергоінспекція
  public static final int ENDEPARTMENT_CO         = 3;         //Апарат управління
  public static final int ENDEPARTMENT_KSOE       = 500000019; //ПАТ ЕК "Херсонобленерго"
  public static final int ENDEPARTMENT_VRTU       = 745;       //Відділ реалізації Технічних Умов

  //Підрозіли з позначенням відповідальних особи по договорам Приєднання
  //з потужністю понад 16 кВт та напругою поднад 1000 В:
  //начальник ВРТУ Кічіянц В.А.
  public static final int ENDEPARTMENT_GP = 8; //Г.Пристанський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_SK = 10; //Скадовський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_GN = 14;    //Генічеський РЕЗ і ЕМ

  //заступник начальника ВРТУ Дідик О.М.
  public static final int ENDEPARTMENT_BER = 5; //Бериславський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_ALE = 6; //В.Олександрівський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_VSP = 7; //Високопільський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_VAR = 9; //Н.Воронцовський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_HGES = 481; //ХМЕМ

  //провідний інженер ВРТУ Дмитраков О.В.
  public static final int ENDEPARTMENT_CR = 11; //Олешківський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_LEP = 12; //В.Лепетиський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_KAH = 17; //Каховський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_IVA = 18; //Іванівський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_NT = 478; //Н.Троїцький РЕЗ і ЕМ
  public static final int ENDEPARTMENT_CHA = 479; //Чаплинський РЕЗ і ЕМ
  public static final int ENDEPARTMENT_NKAH = 480; //Н.Каховський РЕЗ і ЕМ

  public static final int ENDEPARTMENT_VMTP          = 45; // ВМТП
  public static final int ENDEPARTMENT_TRANSPORT  = 102; // Служба транспорта
  public static final int ENDEPARTMENT_CPP = 105; // ЦПП

  /** Метрологічна служба */
  public static final int ENDEPARTMENT_METROLOGY = 665;

  ///// Бюджетотримачі
  public static final int ENBUDGET_METROLOGY = 75000020; // Метрологія
  public static final int ENBUDGET_IZOLATION = 75000023; // Изоляция
  public static final int ENBUDGET_OKS = 75000009; // ОКС
  public static final int ENBUDGET_RBS = 75000018; // РБС
  public static final int ENBUDGET_TRANSPORT = 75000016; // служба транспорта
  public static final int ENBUDGET_SOT = 500000003; // бюджет СОТ
  public static final int ENBUDGET_ENERGOSBYT = 240000001; // Энергосбыт
  public static final int ENBUDGET_VRTU = 75000011; // ВРТУВД
  public static final int ENBUDGET_VPTU = 500000000; // ВПТУ
  public static final int ENBUDGET_SIT = 75000025; // СИТ
  public static final int ENBUDGET_SVES = 75000005; // СВЭС
  public static final int ENBUDGET_SKEM = 500000007; // СКЕМ
  public static final int ENBUDGET_RZA = 75000012; // РЗА
  public static final int ENBUDGET_SPS = 75000006; // СПС
  public static final int ENBUDGET_SRS = 75000001; // СРС
  public static final int ENBUDGET_ODG = 500000040; // ОДГ
  public static final int ENBUDGET_CPP = 500000005; // ЦПП
  public static final int ENBUDGET_SDTU = 75000014; // СДТУ
  public static final int ENBUDGET_VMTP = 500000015; // ВМТП
  public static final int ENBUDGET_AGV = 500000009; // АГВ


  ///// Центри відповідальності
  public static final int ENRESPONSIBILITY_ENERGOSBYT = 240000002; // Энергосбыт
  public static final int ENRESPONSIBILITY_ODG = 500000041;        // ОДГ
  public static final int ENRESPONSIBILITY_SRS = 75000002;         // СРС
  public static final int ENRESPONSIBILITY_SPS = 75000004;         // СПС
  public static final int ENRESPONSIBILITY_SKEM = 500000006;       // СКЕМ
  public static final int ENRESPONSIBILITY_IZOLATION = 75000022;   // СИЗПИ
  public static final int ENRESPONSIBILITY_SVES = 75000003;        // СВЭС
  public static final int ENRESPONSIBILITY_RZA = 75000013;         // СРЗА
  public static final int ENRESPONSIBILITY_VRTUVD = 75000010;      // ВРТУВД
  public static final int ENRESPONSIBILITY_CPP = 500000004;        // ЦПП
  public static final int ENRESPONSIBILITY_TRANSPORT = 75000017;   // служба транспорта
  public static final int ENRESPONSIBILITY_METROLOGY = 75000021;   // метрология
  public static final int ENRESPONSIBILITY_VMTP = 500000014;       // ВМТП
  public static final int ENRESPONSIBILITY_SDTU = 75000015;        // СДТУ
  public static final int ENRESPONSIBILITY_AGV = 500000008;        // АГВ


  public static final int[][] ENBUDGET_2_RESPONSIBILITIES =
		{{ENBUDGET_SRS,  ENRESPONSIBILITY_SRS},
         {ENBUDGET_SVES,  ENRESPONSIBILITY_SVES},
         {ENBUDGET_SPS, ENRESPONSIBILITY_SPS},
         {ENBUDGET_SKEM, ENRESPONSIBILITY_SKEM},
         {ENBUDGET_IZOLATION, ENRESPONSIBILITY_IZOLATION},
         {ENBUDGET_RZA, ENRESPONSIBILITY_RZA},
         {ENBUDGET_ODG, ENRESPONSIBILITY_ODG},
         {ENBUDGET_ENERGOSBYT, ENRESPONSIBILITY_ENERGOSBYT},
         {ENBUDGET_CPP, ENRESPONSIBILITY_CPP},
         {ENBUDGET_METROLOGY, ENRESPONSIBILITY_METROLOGY},
         {ENBUDGET_VMTP, ENRESPONSIBILITY_VMTP},
         {ENBUDGET_SDTU, ENRESPONSIBILITY_SDTU},
         {ENBUDGET_VRTU, ENRESPONSIBILITY_VRTUVD},
         {ENBUDGET_AGV, ENRESPONSIBILITY_AGV }};

  // Типы топлива
  public static final int FUEL_TYPE_A80 = 75000002;
  public static final int FUEL_TYPE_A92 = 75000001;
  public static final int FUEL_TYPE_A95 = 75000000;
  public static final int FUEL_TYPE_DT = 75000003;

  /** Безоплатные договора  **/public static final int ENSERVICES_OBJECT_ISNOPAY = 1;
  /** Платные договора  **/public static final int ENSERVICES_OBJECT_ISPAY = 0;

  /** признак создания договора с сайта */
  public static final int CREATED_FROM_SITE_NO = 0;
  public static final int CREATED_FROM_SITE_YES = 1;


  public static final int ENSERVICES_OBJECT_ETL_LABORATORY = 75000026;

  /** Є потреба у припиненні електропостачання користувачів мережі при підключенні контрагента**/
  public static final int ENTECHCONDITIONSSERVICES_ISDISCONNECTIONNEEDED = 1;

  // Должности водителей
  public static final int[] DRIVERS_POSITIONS = {650, 1409, 619, 622, 623, 624, 626, 1999, 635, 636, 641, 650, 642, 643, 178, 179, 274, 182, 186, 982, 985, 1021, 983, 628, 647, 259, 260, 284, 297, 625, 633, 646};

  public static final String[] AX_DRIVERS_POSITIONS = {"водій", "машиніст", "тракторист"};


  public static final int isClient_CLIENT = 1;
  public static final int isClient_SERVER = 0;
  public static final int isClient_SCCOUNTER = 100;

  // public static final BigDecimal SOCIAL_CHARGE = new BigDecimal(0.3706);
  public static final BigDecimal VAT_PERCENT = new BigDecimal(0.2);

  public static final BigDecimal BONUS_PERCENT = new BigDecimal(50.0);

  public static final int ADMIN_TRUCKING = 500004875;  // перевезення адмін.персоналу
  public static final int HUMEN_TRUCKING = 500004876;  // перевезення заг.в. персоналу

  public static final int BKU_MARK = 75000032; // БКУ, тип транспорта для перевозки грузов
  public static final int MATERIALS_TRUCKING = 500004873;  // перевезення вантажу
  public static final int MATERIALS_LOADS = 500004877;  // Завантажувально - розвантажувальні роботи

  public static final int BKU = 75000002; // БКУ  tktransporttype
  public static final int TRAKTOR = 75000001; // Трактор  tktransporttype

  public static final int TRANSPORT_REAL_ISNOTUSED = 1;
  public static final int TRANSPORT_REAL_ISONDUTY = 1;

  public static final BigDecimal HEATING_TIME_FUEL_RATE_PERCENT = new BigDecimal(5);

  // Временные константы
  public static final int AMOUNT_OF_MILLISECONDS_IN_SECOND = 1000;
  public static final int AMOUNT_OF_SECONDS_IN_MINUTE = 60;
  public static final int AMOUNT_OF_MINUTES_IN_HOURS = 60;

    /////// ****************************************************************************************************
    // 01.02.13 NET-4061 Константа для включения функционала по ограничению списания
    // из опер. запаса (если = true, ограничение работает)
    public static final boolean IS_OPERATIVE_STOCK_RESTRICTION = false; //true;
    /////// ****************************************************************************************************

    // 16.05.13 NET-4235 Процент предоплаты для договоров по услугам на сторону
    public static final BigDecimal SERVICES_PREPAYMENT_PERCENT = new BigDecimal(70); // 70%

    /** Процент для расчету топлива необходимого пусковым двигателям*/
    public static final BigDecimal PERCENT_OF_FUEL_FOR_STARTER = new BigDecimal(3.00);

    /**  Тип финансирования для строк прихода
     *   1,2 - типа ссылка на RQOrderType
     *   1 - бюджет
     *   2 - инвестпрограмма
     *   3 - присоединение
     */
    public static final int FUNDINGTYPE_BUDGET = 1;
    public static final int FUNDINGTYPE_INVEST = 2;
    public static final int FUNDINGTYPE_PRICONNECTION = 3;

    /** признак нового абонента на договоре */
    public static final int SERVICESOBJECT_NEWCONNECTIONTU = 0;
    /** признак повторного подключения абонента на договоре */
    public static final int SERVICESOBJECT_RECONNECTIONTU = 1;

    // признак применения НДС - (по умолчанию 1 - НДС применяется)
    public static final int ENESTIMATEITEM_DONTUSEVAT = 0;
    public static final int ENESTIMATEITEM_USEVAT = 1;

    public static final int ENESTIMATEITEM_COUNTERS_PHASITY_1 = 1017008126;
    public static final int ENESTIMATEITEM_COUNTERS_PHASITY_3 = 1017008127;

    /** Список допустимых бух. счетов для счетчиков, включаемых в акт дефектации */
    public static final String[] COUNTERS_ALLOWED_ACCOUNTS_FOR_ACT_DEFECT = {"1126", "2096"};

    public static final int ENFUELDISTRIBUTIONSHEET_SERVICES = 1; // для услуг на сторону
    public static final int ENFUELDISTRIBUTIONSHEET_GENERAL_WORK = 2; // по работам КР , ПР ,ТО , енергосбыт , прочее
    public static final int ENFUELDISTRIBUTIONSHEET_VKB_IP = 3; // вкб инвестпрограмма
    public static final int ENFUELDISTRIBUTIONSHEET_VKB_OTHER = 4; // вкб по остальным работам
    public static final int ENFUELDISTRIBUTIONSHEET_VRTU = 5; // по работам вртувд
    public static final int ENFUELDISTRIBUTIONSHEET_AVAR = 6; // Аварійний запас
    public static final int ENFUELDISTRIBUTIONSHEET_OVB = 7; // Оперативно-виїздна бригада

    public static final BigDecimal MAXWORKTIMEFORREALTRANSPORTBYDAY = new BigDecimal(8.00); // SUPP-25730 п.2 - макс кол-во часов в день для реального транспорта

    /* ЗОННОСТЬ СЧЕТЧИКОВ */
    public static final int COUNTERS_ZONE_TYPE_1 =1;
    public static final int COUNTERS_ZONE_TYPE_2 =2;
    public static final int COUNTERS_ZONE_TYPE_3 =3;

    /** Константа для работ по ЗКУ SUPP-71297*/
    public static final String TECHCARDS_CONSTS_ZKU = "2017041444, 500020889,500020891,75001323,75001324,500002960,500002961,500012213"
    		+ ",500012214,500012846,500012847,500012870,500019964,500019965,500019966,500020183,500020189,2017041444,2017041499"
    		+ ",2017018186,2017018187,2017018534,2017018535,2017032215, 2017041473";

    /**
     *
     * Функция для использования константы в отчетах JasperReports
     *
     * @return TECHCARDS_CONSTS_ZKU
     */
    public static final String getForReportsTECHCARDS_CONSTS_ZKU() { return TECHCARDS_CONSTS_ZKU;}


    /*статусы ведомости на премию*/
    public static final int ENBONUSLIST_STATUS_DRAFT = 1;
    public static final int ENBONUSLIST_STATUS_APPROVED = 2;


    /* Типы объектов в СканСчетчиках */
    /*
		Добавлены поля в OSTABLE
		type_object number - Тип картотеки (1 - счетчик, 2 - пломба, 3 - индикатор, 4 - голограмма)
    */
    /** Счетчик */
    public static final int SCANCOUNTERS_TYPEOBJECT_COUNTER = 1;
    /** Пломба */
    public static final int SCANCOUNTERS_TYPEOBJECT_SEAL = 2;
    /** Индикатор */
    public static final int SCANCOUNTERS_TYPEOBJECT_INDICATOR = 3;
    /** Голограмма */
    public static final int SCANCOUNTERS_TYPEOBJECT_HOLOGRAM = 4;
    /** Типы объектов - пломбы */
    public static final String SCANCOUNTERS_TYPEOBJECT_ALL_SEALS =
    		SCANCOUNTERS_TYPEOBJECT_SEAL + ", " +
    		SCANCOUNTERS_TYPEOBJECT_INDICATOR + ", " +
    		SCANCOUNTERS_TYPEOBJECT_HOLOGRAM;

    /* Константы для материалов */
    /*
     * Записи в tkmaterials (code, name, accontingtype):
    -- 500008911 ПЛОМБА НОМЕРНА (5)
    -- 500023786 ІНДИКАТОР ДІЇ ВПЛИВУ ПОСТІЙНОГО МАГНІТНОГО ПОЛЯ (6)
    -- 500006795 ПЛОМБИ ГАЛОГРАМА (7)
    */
    /** Пломба */
    public static final int TKMATERIALS_SEAL = 500008911;
    /** Индикатор */
    public static final int TKMATERIALS_INDICATOR = 500023786;
    /** Голограмма */
    public static final int TKMATERIALS_HOLOGRAM = 500006795;

    /*остатки*/
    public static final String SOURCE_SELECTION_RESTS_FK = "FK";
    public static final String SOURCE_SELECTION_RESTS_AX = "AX";
    public static final String SOURCE_SELECTION_RESTS_AUTO = "AUTO";

    /** Вирт. объект для списания пломб и сейф-пакетов при проведении экспертизы счетчиков */
    public static final int EN_METROLOGY_OBJECT_WRITEOFF = 1012000070;
    public static final int ENELEMENT_METROLOGY_OBJECT_WRITEOFF = 1017652632;

    /** Инициаторы отключений */
    public static enum DisconnectionInitiator {
    	/** Поставщик */
    	SUPPLIER,
    	/** Потребитель */    	
    	CUSTOMER,
    	/** ОСР */    	
    	OSR
    }

    /** Типы местности */
    public static enum RegionType {
    	/** Городская местность */
    	CITY,
    	/** Сельская местность */
    	COUNTRYSIDE
    }
    
    public static final int SERVICEPAYMENTKIND_INDEFINITE = 0; // неопределено
    public static final int SERVICEPAYMENTKIND_PAID = 1; // платно
    public static final int SERVICEPAYMENTKIND_FREE_WORK = 2; // безоплатно 
    
	
	/** Типы актов учавствующих в расчете фактической даты выполнения работ по присоединению */
	public static final List<Integer> ACT_TYPES_FOR_CALCULATION_OF_CONNECTION_WORK_TERM 
		= Arrays.asList(ENPlanWorkState.TO, ENPlanWorkState.RECONSTRUCTION_MODERNIZATION
				, ENPlanWorkState.CAPITAL_BUILDER, ENPlanWorkState.TMC_TRANSFER);
	
	
	public static final int EPVOLTAGENOMINAL_022 = 10;
	public static final int EPVOLTAGENOMINAL_038 = 9; 
	public static final int EPVOLTAGENOMINAL_1 = 8;
	public static final int EPVOLTAGENOMINAL_3 = 7;
	public static final int EPVOLTAGENOMINAL_6 = 6;
	public static final int EPVOLTAGENOMINAL_10 = 5;
	public static final int EPVOLTAGENOMINAL_27 = 4;
	public static final int EPVOLTAGENOMINAL_35 = 3;
	public static final int EPVOLTAGENOMINAL_110 = 2;
	public static final int EPVOLTAGENOMINAL_154 = 1;
	public static final int EPVOLTAGENOMINAL_330 = 11;

	/**
	 * Дата, начиная с которой при расчете актов не будем пересчитывать связанные акты
	 */
	public static final Date ENACT_SIMPLE_CALC_START_DATE = Tools.localDateToDate(LocalDate.of(2021, 10, 1));

	public static final String SCUSAGEINPUT_CHECK_MOL_ERROR_MESSAGE = 
			"\n\nSUPP-106296 Згідно вимог Центральної бухгалтерії лічильники, " +
			"що підлягають введенню, виведенню з експлуатації та оприбуткуванню від абонентів,\n" +
			"повинні обліковуватись на одній МВО!\n\n";

}

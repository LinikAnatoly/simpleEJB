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


  //ϳ�������
  public static final int ENDEPARTMENT_INSPECTION = 96;        //��������������
  public static final int ENDEPARTMENT_CO         = 3;         //������ ���������
  public static final int ENDEPARTMENT_KSOE       = 500000019; //��� �� "���������������"
  public static final int ENDEPARTMENT_VRTU       = 745;       //³��� ��������� �������� ����

  //ϳ������ � ����������� ������������ ����� �� ��������� ���������
  //� ��������� ����� 16 ��� �� �������� ������ 1000 �:
  //��������� ���� ʳ����� �.�.
  public static final int ENDEPARTMENT_GP = 8; //�.������������ ��� � ��
  public static final int ENDEPARTMENT_SK = 10; //����������� ��� � ��
  public static final int ENDEPARTMENT_GN = 14;    //���������� ��� � ��

  //��������� ���������� ���� ĳ��� �.�.
  public static final int ENDEPARTMENT_BER = 5; //������������� ��� � ��
  public static final int ENDEPARTMENT_ALE = 6; //�.��������������� ��� � ��
  public static final int ENDEPARTMENT_VSP = 7; //�������������� ��� � ��
  public static final int ENDEPARTMENT_VAR = 9; //�.������������� ��� � ��
  public static final int ENDEPARTMENT_HGES = 481; //����

  //�������� ������� ���� ��������� �.�.
  public static final int ENDEPARTMENT_CR = 11; //����������� ��� � ��
  public static final int ENDEPARTMENT_LEP = 12; //�.����������� ��� � ��
  public static final int ENDEPARTMENT_KAH = 17; //���������� ��� � ��
  public static final int ENDEPARTMENT_IVA = 18; //���������� ��� � ��
  public static final int ENDEPARTMENT_NT = 478; //�.�������� ��� � ��
  public static final int ENDEPARTMENT_CHA = 479; //����������� ��� � ��
  public static final int ENDEPARTMENT_NKAH = 480; //�.���������� ��� � ��

  public static final int ENDEPARTMENT_VMTP          = 45; // ����
  public static final int ENDEPARTMENT_TRANSPORT  = 102; // ������ ����������
  public static final int ENDEPARTMENT_CPP = 105; // ���

  /** ����������� ������ */
  public static final int ENDEPARTMENT_METROLOGY = 665;

  ///// ��������������
  public static final int ENBUDGET_METROLOGY = 75000020; // ���������
  public static final int ENBUDGET_IZOLATION = 75000023; // ��������
  public static final int ENBUDGET_OKS = 75000009; // ���
  public static final int ENBUDGET_RBS = 75000018; // ���
  public static final int ENBUDGET_TRANSPORT = 75000016; // ������ ����������
  public static final int ENBUDGET_SOT = 500000003; // ������ ���
  public static final int ENBUDGET_ENERGOSBYT = 240000001; // ����������
  public static final int ENBUDGET_VRTU = 75000011; // ������
  public static final int ENBUDGET_VPTU = 500000000; // ����
  public static final int ENBUDGET_SIT = 75000025; // ���
  public static final int ENBUDGET_SVES = 75000005; // ����
  public static final int ENBUDGET_SKEM = 500000007; // ����
  public static final int ENBUDGET_RZA = 75000012; // ���
  public static final int ENBUDGET_SPS = 75000006; // ���
  public static final int ENBUDGET_SRS = 75000001; // ���
  public static final int ENBUDGET_ODG = 500000040; // ���
  public static final int ENBUDGET_CPP = 500000005; // ���
  public static final int ENBUDGET_SDTU = 75000014; // ����
  public static final int ENBUDGET_VMTP = 500000015; // ����
  public static final int ENBUDGET_AGV = 500000009; // ���


  ///// ������ �������������
  public static final int ENRESPONSIBILITY_ENERGOSBYT = 240000002; // ����������
  public static final int ENRESPONSIBILITY_ODG = 500000041;        // ���
  public static final int ENRESPONSIBILITY_SRS = 75000002;         // ���
  public static final int ENRESPONSIBILITY_SPS = 75000004;         // ���
  public static final int ENRESPONSIBILITY_SKEM = 500000006;       // ����
  public static final int ENRESPONSIBILITY_IZOLATION = 75000022;   // �����
  public static final int ENRESPONSIBILITY_SVES = 75000003;        // ����
  public static final int ENRESPONSIBILITY_RZA = 75000013;         // ����
  public static final int ENRESPONSIBILITY_VRTUVD = 75000010;      // ������
  public static final int ENRESPONSIBILITY_CPP = 500000004;        // ���
  public static final int ENRESPONSIBILITY_TRANSPORT = 75000017;   // ������ ����������
  public static final int ENRESPONSIBILITY_METROLOGY = 75000021;   // ����������
  public static final int ENRESPONSIBILITY_VMTP = 500000014;       // ����
  public static final int ENRESPONSIBILITY_SDTU = 75000015;        // ����
  public static final int ENRESPONSIBILITY_AGV = 500000008;        // ���


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

  // ���� �������
  public static final int FUEL_TYPE_A80 = 75000002;
  public static final int FUEL_TYPE_A92 = 75000001;
  public static final int FUEL_TYPE_A95 = 75000000;
  public static final int FUEL_TYPE_DT = 75000003;

  /** ����������� ��������  **/public static final int ENSERVICES_OBJECT_ISNOPAY = 1;
  /** ������� ��������  **/public static final int ENSERVICES_OBJECT_ISPAY = 0;

  /** ������� �������� �������� � ����� */
  public static final int CREATED_FROM_SITE_NO = 0;
  public static final int CREATED_FROM_SITE_YES = 1;


  public static final int ENSERVICES_OBJECT_ETL_LABORATORY = 75000026;

  /** � ������� � ��������� ����������������� ������������ ����� ��� ��������� �����������**/
  public static final int ENTECHCONDITIONSSERVICES_ISDISCONNECTIONNEEDED = 1;

  // ��������� ���������
  public static final int[] DRIVERS_POSITIONS = {650, 1409, 619, 622, 623, 624, 626, 1999, 635, 636, 641, 650, 642, 643, 178, 179, 274, 182, 186, 982, 985, 1021, 983, 628, 647, 259, 260, 284, 297, 625, 633, 646};

  public static final String[] AX_DRIVERS_POSITIONS = {"����", "�������", "����������"};


  public static final int isClient_CLIENT = 1;
  public static final int isClient_SERVER = 0;
  public static final int isClient_SCCOUNTER = 100;

  // public static final BigDecimal SOCIAL_CHARGE = new BigDecimal(0.3706);
  public static final BigDecimal VAT_PERCENT = new BigDecimal(0.2);

  public static final BigDecimal BONUS_PERCENT = new BigDecimal(50.0);

  public static final int ADMIN_TRUCKING = 500004875;  // ����������� ����.���������
  public static final int HUMEN_TRUCKING = 500004876;  // ����������� ���.�. ���������

  public static final int BKU_MARK = 75000032; // ���, ��� ���������� ��� ��������� ������
  public static final int MATERIALS_TRUCKING = 500004873;  // ����������� �������
  public static final int MATERIALS_LOADS = 500004877;  // ��������������� - ��������������� ������

  public static final int BKU = 75000002; // ���  tktransporttype
  public static final int TRAKTOR = 75000001; // �������  tktransporttype

  public static final int TRANSPORT_REAL_ISNOTUSED = 1;
  public static final int TRANSPORT_REAL_ISONDUTY = 1;

  public static final BigDecimal HEATING_TIME_FUEL_RATE_PERCENT = new BigDecimal(5);

  // ��������� ���������
  public static final int AMOUNT_OF_MILLISECONDS_IN_SECOND = 1000;
  public static final int AMOUNT_OF_SECONDS_IN_MINUTE = 60;
  public static final int AMOUNT_OF_MINUTES_IN_HOURS = 60;

    /////// ****************************************************************************************************
    // 01.02.13 NET-4061 ��������� ��� ��������� ����������� �� ����������� ��������
    // �� ����. ������ (���� = true, ����������� ��������)
    public static final boolean IS_OPERATIVE_STOCK_RESTRICTION = false; //true;
    /////// ****************************************************************************************************

    // 16.05.13 NET-4235 ������� ���������� ��� ��������� �� ������� �� �������
    public static final BigDecimal SERVICES_PREPAYMENT_PERCENT = new BigDecimal(70); // 70%

    /** ������� ��� ������� ������� ������������ �������� ����������*/
    public static final BigDecimal PERCENT_OF_FUEL_FOR_STARTER = new BigDecimal(3.00);

    /**  ��� �������������� ��� ����� �������
     *   1,2 - ���� ������ �� RQOrderType
     *   1 - ������
     *   2 - ���������������
     *   3 - �������������
     */
    public static final int FUNDINGTYPE_BUDGET = 1;
    public static final int FUNDINGTYPE_INVEST = 2;
    public static final int FUNDINGTYPE_PRICONNECTION = 3;

    /** ������� ������ �������� �� �������� */
    public static final int SERVICESOBJECT_NEWCONNECTIONTU = 0;
    /** ������� ���������� ����������� �������� �� �������� */
    public static final int SERVICESOBJECT_RECONNECTIONTU = 1;

    // ������� ���������� ��� - (�� ��������� 1 - ��� �����������)
    public static final int ENESTIMATEITEM_DONTUSEVAT = 0;
    public static final int ENESTIMATEITEM_USEVAT = 1;

    public static final int ENESTIMATEITEM_COUNTERS_PHASITY_1 = 1017008126;
    public static final int ENESTIMATEITEM_COUNTERS_PHASITY_3 = 1017008127;

    /** ������ ���������� ���. ������ ��� ���������, ���������� � ��� ���������� */
    public static final String[] COUNTERS_ALLOWED_ACCOUNTS_FOR_ACT_DEFECT = {"1126", "2096"};

    public static final int ENFUELDISTRIBUTIONSHEET_SERVICES = 1; // ��� ����� �� �������
    public static final int ENFUELDISTRIBUTIONSHEET_GENERAL_WORK = 2; // �� ������� �� , �� ,�� , ���������� , ������
    public static final int ENFUELDISTRIBUTIONSHEET_VKB_IP = 3; // ��� ���������������
    public static final int ENFUELDISTRIBUTIONSHEET_VKB_OTHER = 4; // ��� �� ��������� �������
    public static final int ENFUELDISTRIBUTIONSHEET_VRTU = 5; // �� ������� ������
    public static final int ENFUELDISTRIBUTIONSHEET_AVAR = 6; // �������� �����
    public static final int ENFUELDISTRIBUTIONSHEET_OVB = 7; // ����������-������ �������

    public static final BigDecimal MAXWORKTIMEFORREALTRANSPORTBYDAY = new BigDecimal(8.00); // SUPP-25730 �.2 - ���� ���-�� ����� � ���� ��� ��������� ����������

    /* �������� ��������� */
    public static final int COUNTERS_ZONE_TYPE_1 =1;
    public static final int COUNTERS_ZONE_TYPE_2 =2;
    public static final int COUNTERS_ZONE_TYPE_3 =3;

    /** ��������� ��� ����� �� ��� SUPP-71297*/
    public static final String TECHCARDS_CONSTS_ZKU = "2017041444, 500020889,500020891,75001323,75001324,500002960,500002961,500012213"
    		+ ",500012214,500012846,500012847,500012870,500019964,500019965,500019966,500020183,500020189,2017041444,2017041499"
    		+ ",2017018186,2017018187,2017018534,2017018535,2017032215, 2017041473";

    /**
     *
     * ������� ��� ������������� ��������� � ������� JasperReports
     *
     * @return TECHCARDS_CONSTS_ZKU
     */
    public static final String getForReportsTECHCARDS_CONSTS_ZKU() { return TECHCARDS_CONSTS_ZKU;}


    /*������� ��������� �� ������*/
    public static final int ENBONUSLIST_STATUS_DRAFT = 1;
    public static final int ENBONUSLIST_STATUS_APPROVED = 2;


    /* ���� �������� � ������������� */
    /*
		��������� ���� � OSTABLE
		type_object number - ��� ��������� (1 - �������, 2 - ������, 3 - ���������, 4 - ����������)
    */
    /** ������� */
    public static final int SCANCOUNTERS_TYPEOBJECT_COUNTER = 1;
    /** ������ */
    public static final int SCANCOUNTERS_TYPEOBJECT_SEAL = 2;
    /** ��������� */
    public static final int SCANCOUNTERS_TYPEOBJECT_INDICATOR = 3;
    /** ���������� */
    public static final int SCANCOUNTERS_TYPEOBJECT_HOLOGRAM = 4;
    /** ���� �������� - ������ */
    public static final String SCANCOUNTERS_TYPEOBJECT_ALL_SEALS =
    		SCANCOUNTERS_TYPEOBJECT_SEAL + ", " +
    		SCANCOUNTERS_TYPEOBJECT_INDICATOR + ", " +
    		SCANCOUNTERS_TYPEOBJECT_HOLOGRAM;

    /* ��������� ��� ���������� */
    /*
     * ������ � tkmaterials (code, name, accontingtype):
    -- 500008911 ������ ������� (5)
    -- 500023786 ��������� Ĳ� ������ ���Ҳ����� ���Ͳ����� ���� (6)
    -- 500006795 ������ ��������� (7)
    */
    /** ������ */
    public static final int TKMATERIALS_SEAL = 500008911;
    /** ��������� */
    public static final int TKMATERIALS_INDICATOR = 500023786;
    /** ���������� */
    public static final int TKMATERIALS_HOLOGRAM = 500006795;

    /*�������*/
    public static final String SOURCE_SELECTION_RESTS_FK = "FK";
    public static final String SOURCE_SELECTION_RESTS_AX = "AX";
    public static final String SOURCE_SELECTION_RESTS_AUTO = "AUTO";

    /** ����. ������ ��� �������� ����� � ����-������� ��� ���������� ���������� ��������� */
    public static final int EN_METROLOGY_OBJECT_WRITEOFF = 1012000070;
    public static final int ENELEMENT_METROLOGY_OBJECT_WRITEOFF = 1017652632;

    /** ���������� ���������� */
    public static enum DisconnectionInitiator {
    	/** ��������� */
    	SUPPLIER,
    	/** ����������� */    	
    	CUSTOMER,
    	/** ��� */    	
    	OSR
    }

    /** ���� ��������� */
    public static enum RegionType {
    	/** ��������� ��������� */
    	CITY,
    	/** �������� ��������� */
    	COUNTRYSIDE
    }
    
    public static final int SERVICEPAYMENTKIND_INDEFINITE = 0; // ������������
    public static final int SERVICEPAYMENTKIND_PAID = 1; // ������
    public static final int SERVICEPAYMENTKIND_FREE_WORK = 2; // ���������� 
    
	
	/** ���� ����� ������������ � ������� ����������� ���� ���������� ����� �� ������������� */
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
	 * ����, ������� � ������� ��� ������� ����� �� ����� ������������� ��������� ����
	 */
	public static final Date ENACT_SIMPLE_CALC_START_DATE = Tools.localDateToDate(LocalDate.of(2021, 10, 1));

	public static final String SCUSAGEINPUT_CHECK_MOL_ERROR_MESSAGE = 
			"\n\nSUPP-106296 ����� ����� ���������� ��������� ���������, " +
			"�� ��������� ��������, ��������� � ������������ �� �������������� �� ��������,\n" +
			"������ ������������� �� ���� ���!\n\n";

}

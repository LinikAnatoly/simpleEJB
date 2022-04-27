unit ENConsts;

interface

//uses SysUtils;

const
//// SYSTEM
LOW_INT = Low(Integer);
//NDS_COEFF = 1.2;

  NO = 0;
  YES = 1;



  //** ������������� - ����� ������ ( �� 0.4��, �� 10��, �� 6-10�� ) */
  EQUIPMENTKIND_LOW_VOLTAGE = 1;
  //** �������������� - ����� ������ ( �� 35-150 ��, ˳� 35-150 �� ) */
  EQUIPMENTKIND_HIGH_VOLTAGE = 2;



  //** (86, E'netobjects.technicalStatus.transferTariff', E'����� �� ������� - 2 ����') */
  TECHNICALSTATUS_TRANSFERTARIFF = 86;
  //** (87, E'netobjects.technicalStatus.fine', E'����� � ������������ ������� ����������� ����������� �������� ��� �� ����������� ��������� ��������� SAIDI') */
  TECHNICALSTATUS_FINE = 87;
  //** (88, E'netobjects.technicalStatus.distributionTariff', E'Mzap - ������� �������� �� ������� �����������㳿') */
  TECHNICALSTATUS_DISTRIBUTIONTARIFF = 88;
  //** (89, E'netobjects.technicalStatus.bLineCapex', E'���������� �������� ������ �� ������ �� ������� ���������� �������� �������') */
  TECHNICALSTATUS_BLINECAPEX = 89;



  //** ���� �������� � �������� ������. �� �� (Yi) */
  ITEM_WEIGHT = 1;
  //** ���� ����������� � �������� ����. �� (Yi_ct) */
  STRUCTURE_WEIGHT = 2;


  // ENInspectionSheetStatus
  //** �������� */
  ENINSPECTIONSHEETSTATUS_DRAFT = 0;
  //** �� �������� */
  ENINSPECTIONSHEETSTATUS_ON_SIGNATURE = 1;
  //** ��������� */
  ENINSPECTIONSHEETSTATUS_SIGNED = 2;

  //** �������� */
  ENINSPECTIONSHEET_KIND_PLANED = 1;
  //** ������������ */
  ENINSPECTIONSHEET_KIND_POST_ACCIDENT = 2;
  //** ������������ */
  ENINSPECTIONSHEET_KIND_NO_PLANED = 3;
  
  {��������������}
  GROUP_ADMIN = 1;
  {������ �������� ��������� � ��������� ����� �� �������}
  GROUP_BIND_COUNTERS_MANUALLY_TO_SERVICES_OBJECT = 215;
  
  SCUSAGEINPUTITEM_KIND_USAGE_INPUT = 1;


  //������ ������� � ����� ���������
  TENSION_022 = 5; //0,22 ��
  TENSION_04 		= 1;  //0,4 ��
  TENSION_6_10 	= 2;  //10 (6) ��
  TENSION_27_35 	= 3;  //35 (27) ��
  TENSION_110_154 = 4;  //110 (154) ��

  //������� �������� �����������������
  CAT1_CITY = 500000004;  // I ��������, ����
  CAT1_LAND = 500000005;  // I ��������, ����
  CAT2_CITY = 500000001;  // II ��������, ����
  CAT2_LAND = 500000003;  // II ��������, ����
  CAT3_CITY = 500000000;  // II� ��������, ����
  CAT3_LAND = 500000002;  // II� ��������, ����

  //������������ �� 10 - 6 / 0,4 ��. ���������� ������� ������������� �����
  ENPNL_NOTDEFINED                    = 500000000;	//�� ����������
  ENPNL_INTRODUCTION_TRANSFORMER      = 500000001;	//������� ���������������� ������
  ENPNL_SECTION                       = 500000002;	//���������� ������
  ENPNL_DISTRIBUTIVE                  = 500000003;	//����������������� ������
  ENPNL_INTRODUCTION_DISTRIBUTIVE     = 500000004;	//������-����������������� ������
  ENPNL_INCLUSION_RESERVES_AUTOMATIC  = 500000005;	//������ ��������������� ��������� ��������
  ENPNL_NN_KTP_BOARD                  = 500000006;	//��� �� ���

  //��� ����� ��� ������ �����
  ENESTIMATEITEMTYPE_AUTO   = 1; // ��������������
  ENESTIMATEITEMTYPE_CORRECTED = 2; // ������������������ �����������
  ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM = 3;  //������ �� ������ �����
  ENESTIMATEITEMTYPE_MANUAL_BY_PLAN = 4;      // ������ �� ���� ����

  // ���� ���������� : ���������, ���
  ENESTIMATEITEMKIND_MATERIALS = 1;
  ENESTIMATEITEMKIND_GSM = 2;
  ENESTIMATEITEMKIND_DISMOUNT = 3;
  ENESTIMATEITEMKIND_REFINEMENT = 4;
  ENESTIMATEITEMKIND_PRODUCED = 5;
  ENESTIMATEITEMKIND_SERVICES = 6;
  ENESTIMATEITEMKIND_CUSTOMER_MATERIALS =7;


  ENHUMENITEMKIND_ELTEH = 1;
  ENHUMENITEMKIND_DRIVER = 2;

  // ������� � ������ ...
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
  ENESTIMATEITEMSTATUS_UNUSED = 5; // "��������� ���������"
  ENESTIMATEITEMSTATUS_LOADED = 6;
  ENESTIMATEITEMSTATUS_KSOE = 9;   // ������� ���
  ENESTIMATEITEMSTATUS_OWN_PRODUCTION = 10; // ������ �����������

  // ������� ���������� ��� - (�� ��������� 1 - ��� �����������)
  ENESTIMATEITEM_DONTUSEVAT = 0;
  ENESTIMATEITEM_USEVAT = 1;

  ///// ���� ���������� ....
  ENDISTANCETYPE_TO = 1;
  ENDISTANCETYPE_ALONG = 2;
  ENDISTANCETYPE_FROM = 3;

  /// ���� ���������� .. ��
  TKTRANSPORT_TYPE_BRIGADE = 1;
  TKTRANSPORT_TYPE_MECHANIZM = 7;

  /// ��� ������������ ��� ������� �������
   TKFUELKOEFTYPE_AUTO = 1;    ///   ��� ���������� �� ����� ����������
   TKFUELKOEFTYPE_TRAVEL = 2;    /// ��� ���������� �� ������� ������

   TKMATERIALS_SYSTEM_MATERIAL = 500026010; // ��������� �������� - �����
   TKMATERIALS_TRANSFORMATORS_GROUP = 500014119; // �������������� (������)
////////////////////////////////////////////////////////////////////////////////

   //SUPP-61031. ��������� �������� �������������� ������� � �������� ����
   ELECTRIC_LOAD_REGIM_DAY_EDITORS_GROUP = 4002054;
   //����������� �������� �������������� ������� � �������� ����
   ELECTRIC_LOAD_REGIM_DAY_DELETERS_GROUP = 4002056;

// ������� ������
  ENPLANWORKSTATUS_GOOD = 1 ; // ������������� (��������)
  ENPLANWORKSTATUS_CANCELED_ = 2 ; // ����������
  ENPLANWORKSTATUS_LOCKED = 3 ; // ������������
  ENPLANWORKSTATUS_INCORRECTION = 4 ; // �� �������������
  ENPLANWORKSTATUS_CORRECTED = 5 ;  // ������������?? ���������������
  ENPLANWORKSTATUS_OLDER = 6 ;   // ������ ����� ������������� - �������
  ENPLANWORKSTATUS_PRECONFIRMED = 7 ; // ���� �� ����������� ;)
  ENPLANWORKSTATUS_WORKS_FINISHED = 8 ; // ������ ���������
  ENPLANWORKSTATUS_UNUSED = 9 ; // ��������� ����������



////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////

// ���� ������
  ENPLANWORK_YEAR_GOOD = 2016;     //   ����������� ��� �������������� ��� - ������� ������

  ENPLANWORKKIND_YEAR = 1 ; // �������
  ENPLANWORKKIND_CURRENT = 2 ; // �������
  ENPLANWORKKIND_NPZ = 3; // ��� - ����
  ENPLANWORKKIND_FACT = 4; // ���-����
  ENPLANWORKKIND_CALCULATION = 5; // �����������
  ENPLANWORKKIND_CALCULATION_SINGLE = 6; // ����������� ��������� (������ ��� �������������� ����� ������������ � ����)
  ENPLANWORKKIND_SALE_SPECIFICATION = 7; // ������������ �� ������� ������

// ��� ������ ENPLANWORKTYPE - ���� ����� ;)
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
  ENPLANWORKTYPE_ESBYT_PO_113  = 113; // �� - �������� ����� ���������� ����������
  ENPLANWORKTYPE_ESBYT_RAID    = 114; // �� - ����

  ENPLANWORKTYPE_CN = 7;

  ENPLANWORKTYPE_SIDEWORKS = 8; //������ �� �������

  ENPLANWORKTYPE_NOT_PLANNED = 10;

  ENPLANWORKTYPE_TRANSPORT = 11;   // �����������

  ENPLANWORKTYPE_WRITING_OFF = 12;   // ��������

  ENPLANWORKTYPE_SIZ = 13;   // �������� ������

  ENPLANWORKTYPE_TMC_TRANSFER = 14; // ����������� ��� ��� ��������� �������

  ENPLANWORKTYPE_RESTOCKING = 16;  // ���

  ENPLANWORKTYPE_REFINEMENT_BY_CONTRACT = 17; // ������� �� ����. ������� ...

  ENPLANWORKTYPE_WRITEOFF_PROTECTION = 18;// �������� ������ �������

  ENPLANWORKTYPE_SERVICES_FROM_SIDE = 19; //������ �� �������
  ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST = 20;  //������ �� ������� (���������������)

	// 21-� ��� ����� "����������� ����������" (��� ������� ���, �������������)
	ENPLANWORKTYPE_TRANSPORT_SERVICES = 21;
  ENPLANWORKTYPE_VRTUVD_PROJECT = 22;

  // 24-� ��� ����� "���������� �������"
  ENPLANWORKTYPE_SALE_PRODUCTS = 24;

    // 25-� ��� ����� "��������� ��������"
  ENPLANWORKTYPE_GIFT = 25;

  ENPLANWORKTYPE_WRITEOFF_OS = 26; // �������� ��


  // ������������ ������ � �����
  {
  ENPLANWORKSTATE_CAPITALREPAIR = 1;
  ENPLANWORKSTATE_RECONSTRUCTION = 2;
  ENPLANWORKSTATE_TECHNICALSERVICE = 3;
  ENPLANWORKSTATE_CAPITALBUILDER = 4;
  }


  ENPLANWORKSTATE_CAPITALREPAIR = 1;    // ���������� ������
  ENPLANWORKSTATE_RECONSTRUCTION = 2;   // ������������� � �����������
  ENPLANWORKSTATE_TECHNICALSERVICE = 3; // ������� ��������������
  ENPLANWORKSTATE_CAPITALBUILDER = 4;   // ��������� ����������
  ENPLANWORKSTATE_CURRENTREPAIR = 5;    // �������� ������
  ENPLANWORKSTATE_MEDIUMREPAIR = 6;     // ������� ������
  ENPLANWORKSTATE_SIDEWORKS = 7;        // ������ �� �������
  ENPLANWORKSTATE_REFINEMENT = 8;       // �������

  ENPLANWORKSTATE_PRODUCTION = 10;      // ������������
  ENPLANWORKSTATE_MEASUREMENT = 11;     // ���������� �� ������������
  ENPLANWORKSTATE_GSM = 12;             // �������� ���

  ENPLANWORKSTATE_MATERIALS_TMC = 13;             // �������� ���������� ���
  ENPLANWORKSTATE_TMC_TRANSFER = 20;  // (��� ������-��������) ��� ��������� ���� �������� ������

  ENPLANWORKSTATE_MATERIALS_MNMA = 23;             //  �������� ���������  ����
  ENPLANWORKSTATE_MATERIALS_MBP = 15;             //  �������� ��������� ���
  ENPLANWORKSTATE_WRITINGS_OS = 16;             // �������� ��

	ENPLANWORKSTATE_BUFET_REALIZATION = 25; // �������� ��� (���������, �����) - ���
	ENPLANWORKSTATE_BUFET_NONEREALIZATION = 26; // �������� ��� (�����������, �����)
 	ENPLANWORKSTATE_BUFET_REALIZATION_BEZNAL = 33; // �������� ��� (���������, �����) - ������
  ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS = 34; // �������� ��� (�����������)

  ENPLANWORKSTATE_SIZ = 17;   // �������������� �������� ������
  ENPLANWORKSTATE_BSZ = 18;   // ��������� �������� ������

  ENPLANWORKSTATE_DISMANTLING = 19; // ��������

  ENPLANWORKSTATE_RECEPT_TRANSMISSION = 20; // ����� �������� ����������

  ENPLANWORKSTATE_REFINEMENT_BY_CONTRACT = 22; // ������� �� ����. ������� ...

  ENPLANWORKSTATE_SERVICES_FROM_OUT = 24;

  ENPLANWORKSTATE_INSTALLATION_REINSTALLATION = 27;   // 27 ��� ���� - "������, ����������������

  ENPLANWORKSTATE_TRANSPORT_SERVICES_4_SIDE = 30; // 30-� ��� ���� - "���������� �������"

  // 31-� ��� ���� - "���������� �������"
  ENPLANWORKSTATE_SALE_PRODUCTS = 31;

  // 35-� ��� ���� - �������� ���������
  ENPLANWORKSTATE_COUNTERS_WRITEOFF = 35;

  // ��� ���������� ���������
  ENPLANWORKSTATE_COUNTERS_ACT_DEFECT = 36;

  // ���������� ���������
  ENPLANWORKSTATE_COUNTERS_STATE_VERIFICATION = 37;

  // ���������� ....

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
  ENPLANWORKSTATE_DESIGNING = 29;    // ��������������

  ENPLANWORKSTATE_COUNTERS_EXPERTISE = 41;

  ENPLANWORKFORM_PLANNED = 1;
  ENPLANWORKFORM_NOPLANNED = 2;


////////////////////////////////////////////////////////////////////////////////


// ���� �������������
  ENDEPARTMENTTYPE_DEPARTMENT = 1;
  ENDEPARTMENTTYPE_RESPOSIBILITY = 100;//1;
  ENDEPARTMENTTYPE_BUDGET = 200;//2;
  ENDEPARTMENTTYPE_OTHER = 7;//3;
  ENDEPARTMENTTYPE_BRIGADA = 4;
  ENDEPARTMENTTYPE_UCHASTOK = 5;
  // �����������
  ENDEPARTMENTTYPE_DIVISION = 400;
  

  // ���� �������������
  ENDEPARTMENT_CODE_OE_TRANSPORT = 102;

  ENDEPARTMENT_CO   = 3;         // ������ ���������
  ENDEPARTMENT_KSOE = 500000019; // ��� �� "���������������"
  ENDEPARTMENT_HGES = 481;       // ����
  ENDEPARTMENT_BUDGET = 1002; // ����������������
  ENDEPARTMENT_REM = 731; // ����

  ENDEPARTMENT_DATA_MANAGEMENT_CENTER = 500002000;
  ENDEPARTMENT_DISTRIBUTION_NETWORKS = 500000052;
  ENDEPARTMENT_OF_CLIENT_OPERATIONS = 500000053;

  {��������� ������������ ���������� RM - ����. Regional Management}
  REN_RM_NORTH = 103;
  REN_RM_EAST = 104;
  REN_RM_SOUTH = 101;
  REN_RM_WEST = 102;
  REN_RM_CENTER = 105;

  // ���������������� ...
  ENBUDGET_METROLOGY = 75000020;
  ENBUDGET_ENERGOSBYT = 240000001;
  ENBUDGET_VPTU = 500000000;
  ENBUDGET_SIT = 75000025;
  ENBUDGET_VRTUVD = 75000011;
  ENBUDGET_TRANSPORT = 75000016;
  ENBUDGET_SOT = 500000003;
  ENBUDGET_AGV = 500000009;
  ENBUDGET_OKS = 75000009;

  
  ///  ��� ������-���  ���������������� - ����� ��������������� - ���� �� RadioGroup
  ENBUDGET_ODG = 500000040;   ENRESPONSIBILITY_ODG = 500000041;    // 0
  ENBUDGET_SRM = 75000001;    ENRESPONSIBILITY_SRM = 75000002;     // 1
  ENBUDGET_SPS = 75000006;    ENRESPONSIBILITY_SPS = 75000004;     // 2
  ENBUDGET_SKEM = 500000007;  ENRESPONSIBILITY_SKEM = 500000006;   // 3
  ENBUDGET_SIZPI = 75000023;  ENRESPONSIBILITY_SIZPI = 75000022;   // 4
  ENBUDGET_SVEM = 75000005;   ENRESPONSIBILITY_SVEM = 75000003;    // 5
  ENBUDGET_RZA = 75000012;    ENRESPONSIBILITY_RZA = 75000013;     // 6

  // ������ ���������������
  ENRESPONSIBILITY_VRTUVD = 75000010;
  ENRESPONSIBILITY_SOT = 500000002;
  ENRESPONSIBILITY_METROLOGY = 75000021;
  ENRESPONSIBILITY_ENERGOSBYT = 240000002;
  ENRESPONSIBILITY_OKS = 75000008;


  // 1 - ����������� ��������
  ENMANAGEMENT_TYPE_TECHNICAL = 1;
  // 3 ������������ ��������
  ENMANAGEMENT_TYPE_ENERGOSBYT = 3;


  // ���� �������� ������������
  EN_LINE10 = 1;
  EN_LINE04 = 2;
  EN_SUBSTATION04 = 3;
  EN_TRANSFORMER04 = 4; // �� ��� ������ ...
  EN_LINE150 = 5;

  EN_SUBSTATION150 = 6; //���������� 150 / 35 / 10 - 6 ��
  //NET-3975. EnergyWorkFlow. ������� �������� �� ��������� �������� ����:
  EN_SS150 = 1006; //���������� 150 / 35 ��.

  EN_BYT = 7;
  EN_PROM = 8;
  EN_RZA = 9;
  EN_SDTU = 10;

  EN_LINE_CABLE = 11; //��������� ����� 0,4 ��
  //NET-3975. EnergyWorkFlow. ������� �������� �� ��������� �������� ����:
  EN_LC10 = 1011; //��������� ����� 6 - 10 ��
  EN_LC150 = 1511; //��������� ����� 35 - 150 ��

  EN_TRANSPORT = 12;
  EN_METROLOGY_COUNTER = 13;
  EN_METROLOGY_DEVICE = 14;
  EN_BUILDER = 15;
  EN_SIT = 16;
  EN_ISOLATION = 17;
  EN_METROLOGY_OBJECT = 18;
  EN_PURCHASES_OBJECT = 19;
  EN_PURCHASES_NO_OBJECT = 20;

  EN_TRANSFORMER_OBJECT = 21; //������������� � �������
  EN_OPERATIVE_OBJECT = 22;
  EN_SERVICES_OBJECT = 23;
  EN_PREPRODUCTION_OBJECT = 24; //������� ���

  EN_TRUCKING = 25; //���� �������������� ;)

  EN_ABSTRACT_INV_NUMBER = 28;

  EN_METROLOGY_SUBSTATION = 26;
  EN_EB_OBJECT = 27;

  EN_WRITING_NO_OBJECT = 29;
  EN_GIFT_NO_OBJECT = 73; // ��������� ��������
  EN_AVR16_NO_OBJECT = 76;

  EN_SIZ_OBJECT = 30;   // �������������� �������� ������
  EN_SZ_BRIGADE = 31;   // ��������� �������� ������

  ENSZBRIGADE_WORKING = 0;
  ENSZBRIGADE_CLOSED = 1;

  EN_EQUIPMENT = 32;
  EN_EQUIPMENT_REPAIR = 33;

  EN_TRANSFER = 34;

  EN_WRITING_NO_OBJECT_RESTOCKING = 35;  // ���������� ������

  EN_SERVICES_FROM_SIDE_OBJECT = 48;  //  ��'���� �������� (������� �������)

  EN_ROUTE_BYT = 53; // ������� ���

  EN_POST = 55; //�����
  EN_BRANCH10 = 60; //��������� ����������� (�������) �� �� 6 - 10 ��
  EN_CABELOUT10 = 61; //��������� ����� �� / ��������� ������� � �� 6 - 10 ��
  EN_DISCONNECTOR = 37; //�������������
  EN_LOADSWITCH = 38; //����������� ��������
  EN_INSULATOR = 40; //��������
  EN_ARRESTER = 41; //���������
  EN_FUSE = 39; //��������������

  EN_INVEST_COUNTERS = 77; // �������������� ���-100,���-106,���-111,���-112
  EN_CALLCENTER_OBJECT = 78; // ����������� ������� CallCenter'�


  //** ��� ������������ ������ */
  ENSUBST150_BATTERY_TYPE = 81;
  //** ��� ����������� �������� ����. ������ */
  ENSUBST150_BATTERY_CHARGER_TYPE = 82;
  //** ��� ������������� */
  ENSUBST150_SEPARATOR_TYPE = 83;
  //** ��� ��������������� */
	SUBST150_CIRCUITER_TYPE = 84;
  //** ��� ���������� */
	SUBST150_DISCHARGER_TYPE = 85;
  //** ��� ���'�������� */
	SUBST150_DISCONNECTOR_TYPE = 86;
  //** ��� �������������� ������ */
	SUBST150_CURRENTTRANS_TYPE = 87;
  //** ��� �������� */
	SUBST150_SWITCH_TYPE = 88;
  //** ��� �������������� ������� */
	SUBST150_VOLTTRANS_TYPE = 89;
  //** ��� �������������� �����. ������ */
	SUBST150_OWNTRANS_TYPE = 90;
  //** ��� �������� �������������� */
	SUBST150_POWERTRANS_TYPE = 91;
  //** ��� �� */
  ENSUBST150_TN_TYPE = 92;
  //** ��� ��� */
  ENSUBST150_RZA_TYPE = 93;
  //** ��� ��� */
  ENSUBST150_TVP_TYPE = 94;
  //** ��� ��� */
  ENSUBST150_DGK_TYPE = 95;
  //** ��� �������� ������� */
  ENSUBST150_PULL_OUT_ELEMENT_TYPE = 96;
  //** ��� ������ ��� */
  ENSUBST150_TIRE_SECTION_TYPE = 97;
  //** ��� ����������-���������� ����� */
  ENSUBST150_CONTROL_CABLE_TYPE = 98;

  //** ����� �����'��� */
  WOOD_POST = 99;
  //** ����� ������������ */
  ARMORED_POST = 100;


  //** ����������� �� �� ������ ���������� */
  ENSUBST150_GROUNDING = 111;

  //*��� ��� 150*/
  ENSUBST150VRUZRUTYPE_VRU150 = 1;

  //*��� ��� ��� 35*/
  ENSUBST150VRUZRUTYPE_VRUZRU35 = 2;

  //*��� ��� ��� 6_10*/
  ENSUBST150VRUZRUTYPE_VRUZRU6_10 = 3;
  //**��� ����������� �� �� ������ ���������� */
  ENSUBST150_GROUNDING_TYPE = 112;
  //**��� ���������� ������ */
  ENSUBST150_CABLECHANNEL_TYPE = 113;
  //**��������� ����� */
  ENSUBST150_CABLECHANNEL = 114;

  //**��� ����� ��� */
  ENSUBST150_BUILDZRU_TYPE = 115;
  //**����� ��� */
  ENSUBST150_BUILDZRU = 116;

  //** ��� �������������� ������ */
  ENSUBST150_BUILDINGADDITIONAL_TYPE = 117;
  //** �������������� ������ */
  ENSUBST150_BUILDINGADDITIONAL = 118;

    //** ��� ������������ ����������� */
  ENSUBST150_OILCOLLECTING_TYPE = 119;
  //** ������������ ����������� */
  ENSUBST150_OILCOLLECTING = 120;

  //** ��� ������� ���������� */
  ENSUBST150_EXTERNALFENC_TYPE = 121;
  //** ������� ���������� */
  ENSUBST150_EXTERNALFENC = 122;

    //** ��� ������������� �������������� */
  ENSUBST150_TRANSFORMERMEASURE_TYPE = 123;
  //** ������������� �������������� */
  ENSUBST150_TRANSFORMERMEASURE = 124;



  //  23.11.2011  +++  ���� "�������������� �����" � ���� ����
  SQL_NO_SELECTED_ELEMENT_TYPE = 'code not in (4, 28, 34, 36, 37, 38, 39, 40, '
    + '41, 42, 43, 44, 45, 46, 47, 49, 50, 51, 52, 54, 55, 56, 57, 58, 59, 60, 61, '
    + '62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 77, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91,92,93,94,95,96,97,98, '
    + ' 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111 , 112 , 113 , 114 ,115,116,117,118,119,120,121,122,123,124 )';


  // ���� ����� �������� ��� ������� �� ������������ ������� ����������� �������� ����� / ���� .
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
  
  NO_OBJECT_RESTOCKING = 4;  // ���������� ������
  NO_OBJECT_GIFT = 6; // ��������� �������� (��� ������������ ����������)
  NO_OBJECT_AVR16 = 7; // ���������� ���16
  NO_OBJECT_AVZ = 8; // ���������� ����� ���

  // ������� ���� ���������� ����� ...
  ENACT_GOOD = 1;
  ENACT_CANCELED = 2;
  ENACT_CLOSED = 3;
  ENACT_SIGNATURE = 4;
  ENACT_REVERSED = 5;

  // ���� ��� � ����� �� ������ ...
  FINWORKER_KIND_OTHER = 0;
  FINWORKER_KIND_PROM = 1;
  FINWORKER_KIND_ESBYT = 2;

  FINWORKER_KIND_ESBYT_CONTROLLER = -1; // ��� ������ ����������
  FINWORKER_KIND_ESBYT_INSPEKTOR = -2; // ��� ������ ����������

  FINMOLTYPE_MASTER = 1;
  FINMOLTYPE_MECHANIC = 2;


  FINDOCTYPE_302 = 1;
  FINDOCTYPE_28_302 = 2;
  FINDOCTYPE_304 = 3;
  FINDOCTYPE_300 = 4;
  FINDOCTYPE_28_300 = 5;
  // ��� ������ ...
  FINDOCTYPE_10_ = 6;
	FINDOCTYPE_310_ = 7;
	FINDOCTYPE_28_310_ = 8;

	FINDOCTYPE_312 = 11;
	FINDOCTYPE_28_312 = 12;

  FINDOCTYPE_320 = 25; // 320 - ���� � ������������ 22�� (���)
  FINDOCTYPE_321 = 27; // 321 - ���� � ������������ 15�� (����
  FINDOCTYPE_322 = 29; // 322 - �������������� ��� ����� � ������������
  FINDOCTYPE_28_322 = 30; // 322 - �������������� ��� ����� � ������������ 28 �/� ��� 322
  FINDOCTYPE_324 = 31; // 324 - ����� �� ������� ��� ����� � ������������

  FINDOCTYPE_332 = 36; // 332 - ������� ������� ������ � ������ ��� ��������

  ///// �����
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

  // 10.04.2012 +++ ���� �������� ������
  FINDOCTYPE_350    = 56;
  FINDOCTYPE_28_350 = 57;
  FINDOCTYPE_352    = 58;
  FINDOCTYPE_28_352 = 59;
  FINDOCTYPE_354    = 60;
  //FINDOCTYPE_28_354 = 61;

  // ���������� �������

  FINDOCTYPE_362 = 61;
  FINDOCTYPE_28_362 = 62;


  // ������� ������������� ... ������� ��������� � ��
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
  CORRECTREASON_PURCHASES_BINDING = 11; //����'���� ����� ��� �������

  // ���� ������ ����� ����������� �� ������ ...
  ENESTIMATEITEM2ENESTIMATEITEM_TYPE_PLAN_MOVED = 1;
  ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED = 2;

  ENESTIMATEITEM2ENESTIMATEITEM_TYPE_COUNTER_MOVED = 5;
  ENESTIMATEITEM2ENESTIMATEITEM_TYPE_UNMOUNT_WRITE_OFF = 7; // ������ �������������� ��������� � ���������� ������� ����������� (�������� ������� ������)
  
  ENELEMENT2TKMATERIALS_TYPE_PRODUCTION = 1;

  // �'����� �� ���������� ������ (���� ������ �� ���� ������ ��)
  ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_ACCESS_WITH_OKSN_TU = 1;
  // �'����� �� ���������� ������ (���� ���������� ������� �� ���� ������ ��)
  ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_AGREEMENT_WITH_OKSN_TU = 2;
  // �'����� �� ���������� ������ (���� ������������  �� ���� ������ ��)
  ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_WORK_WITH_OKSN_TU = 3;
  // �'����� �� ���������� ������ (���� �������� ��� �� ���� ���� ������ ��)
  ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU = 4;

  ENACT2RQFKORDER_TYPE_SERVICES = 1;
  ENACT2RQFKORDER_TYPE_PRODUCTION = 2;
  ACT_REFINEMENT_AND_SERVICES = 3; // ������ ���� �� ������� � ������ ��� ���� ��  �������� � �������

  MonthesNames: array [1..12] of String =
        (
          '�����',
          '�����',
          '��������',
          '������',
          '�������',
          '�������',
          '������',
          '�������',
          '��������',
          '�������',
          '��������',
          '�������'
        );

///////////////////////
// RQ subsystem
/////////////////////////
  RQOrderExportPath = 'Export\'; // ���� ��� �������� ������
  AnnexOkExportPath = 'Export\'; // ���� ��� �������� ������� ��
  PlanPayExportPath = 'Export\'; // ���� ��� �������� ��������� ����������
  BonusExportPath = 'Export\'; // ���� ��� �������� ���������� �� ������
  RQ_KE_OKPO = '31515435'; // �������� ���� ��� ���������� �� ���������: �� "��������������"

  //RQORDER_STATUS_GOOD = 1;
  //RQORDER_STATUS_CLOSED = 2;
  //RQORDER_STATUS_CREATED = 3; // ��� ��������� ���� 1-3-2

  RQORDER_STATUS_GOOD = 1; // ����������� ����� � ���
  RQORDER_STATUS_WORK_IN_MTS = 2; // � ����� � ���� (���)
  RQORDER_STATUS_CREATED = 3; // ��������������� - ���������


  RQORDERITM2NSTMTTMSTTS_GOOD = 1;
  RQORDERITM2NSTMTTMSTTS_CANCELED_BY_BUDGET = 2;
  RQORDERITM2NSTMTTMSTTS_CANCELED_BY_OE = 3;
  RQORDERITM2NSTMTTMSTTS_CANCELED_BY_DEPARTMENT = 4;

  RQORDERITEM2ENESTIMATEITEMTYPE_AUTO   = 1; // "����������� �������� �������"
  RQORDERITEM2ENESTIMATEITEMTYPE_MANUAL = 2; // "�������, �������� ������"

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

  RQORDER_FORM_PLANNED = 1;    // �������� ������
  RQORDER_FORM_NOTPLANNED = 2; // ����������� ������

  RQORDER_TYPE_BUDGET = 1; // ���������
  RQORDER_TYPE_INVEST = 2; // ���������������

  // ���� ������ �������
  RQFKORDER2FKORDERTYPE_E2E_TRANZIT2OPERATIVE = 3;  // ��'���� � ������������ ������� ��� ���� ����������� ������� � �������� � ����. �����
  RQFKORDER2FKORDERTYPE_DP_2_SERVICESFROMSIDE = 4;  // ��'���� ���������� ������ ��� �� � ������ � ������ � �������

  // ������ ��� ��
  RQFKORDER_KIND_PRIHOD_POSTAVKA = 1;
  //RQFKORDER_KIND_RASHOD_PEREMESCHENIE = 2;
  RQFKORDER_KIND_RASHOD_OE2REM = 2;
  RQFKORDER_KIND_RASHOD_REM2MOL = 3;
  RQFKORDER_KIND_RASHOD_OE2OUT = 4;
  RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT = 5; // ���������� � ������� (� ����. ������)
  RQFKORDER_KIND_RASHOD_E2E = 6; // ����������� �������� � ������� �� ��'������
  RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE = 7; // ����������� ���������� � �������� � ����. �����
  RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE = 10; // ��� ����������� ������� �����
  RQFKORDER_KIND_LOADEXPL_MBP = 8; // �������� � ������������ ��������� (���)    22 ���� (������ ��� )
  RQFKORDER_KIND_LOADEXPL_MNMA = 9; // �������� � ������������ ��������� (����)    15 ���� (���������).
  RQFKORDER_KIND_MBP  = 11; // �������� � ������������ ���
  RQFKORDER_KIND_MNMA = 12; // �������� � ������������ ����
  RQFKORDER_KIND_RASHOD_MNMA = 13; // ���������� ����
  RQFKORDER_KIND_SERVICES_FROM_SIDE = 14;  // ��� ��������� �������
  RQFKORDER_KIND_PRIHOD_BUFET = 15; // ������ (�����)
  RQFKORDER_KIND_RASHOD_BUFET = 16; // �����. ����������� (�����)
  RQFKORDER_KIND_WRITEOFFCOUNTERS = 17; // ��� �� �������� ���������
  RQFKORDER_KIND_RASHOD_RETURN_PRODUCT = 18; // ��� �������� ������
  RQFKORDER_KIND_SALE_PRODUCTS = 19;  // ���������� �������
  RQFKORDER_KIND_RASHOD_GIFT = 20;  // ��������� ��������
  RQFKORDER_KIND_OS_EXPL = 21;  // �������� � ������������ ��
  RQFKORDER_KIND_OS_MOVEMENT = 22;  // ������� ���������� ��
  RQFKORDER_KIND_RASHOD_TO_STORAGE = 28; // ������� ���������� (�� ����������� �����)
  RQFKORDER_KIND_ZONE_CHANGING = 29; // ���� ���� ���������
  RQFKORDER_KIND_PACKING_ORDER = 30; // �������������� ��� ����������-����������� ����������
  RQFKORDER_KIND_OUT_FUEL = 31; // ����� �� ����������� �������
  RQFKORDER_KIND_AVAR_OUT = 33; // ����� ���������� �� ���������� ������
  RQFKORDER_KIND_AVAR_IN = 34; // ���� ���������� � ��������� �����

  RQFKORDER_TYPE_ZVT = 1;

  RQFKORDER_ISPALLETIZED_TRUE = 1;
  RQFKORDER_ISPALLETIZED_FALSE = 0;

  // ������� "����� ������" (��� ��������� ������� �� ��)
  RQFKORDER_ISBYORDER_TRUE = 1;
  RQFKORDER_ISBYORDER_FALSE = 0;

  // ������� "³��������� ���������" �� ��������� �������
  RQFKORDER_ISMATERIALSSENT_TRUE = 1;
  RQFKORDER_ISMATERIALSSENT_FALSE = 0;


  // ���� ����� ��� ������������ ���������
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

  RQINVOICE_STATUS_NEW = 1; // �����
  RQINVOICE_STATUS_WORK_IN_MTS = 2;
  RQINVOICE_STATUS_CONFIRMED = 3; // ������� � ������

  // ���� ������� ������ ������� � ���������� ...
  RQFKORDERTM2STMTTMSTTS_IN_INVOICE = 0;
  RQFKORDERTM2STMTTMSTTS_PARTIAL = 1;

  // ������� ����������� ���������
  RQPACKINGLIST_STATUS_GOOD = 1; // ��������
  RQPACKINGLIST_STATUS_RESERVED = 2; // ��������� �� ������� ��������� ����������������
  RQPACKINGLIST_STATUS_MAKE_PALLET = 3; // ��������� ���������� �� �������
  RQPACKINGLIST_STATUS_CREATED_ORDERS = 4; // ������ �������������

  // ������� �� ���� �������� ������� (0 - �������������, 1 - ����������)
  RQFKORDER_INCLUDECOSTS_NO = 0;
  RQFKORDER_INCLUDECOSTS_YES = 1;

  // FIN ���������� �������
  REST_PURPOSE_ID_TRANZIT = 4533;
	REST_PURPOSE_ID_RESERVE = 2075;
	REST_PURPOSE_ID_OPERATIVE_ = 0;
  REST_PURPOSE_ID_NET_OPERATIVE = 4994;   //  net.oper

  // ���� ���������� �������
  REST_PURPOSE_TYPE_ID_TRANZIT = 5;        // �������
	REST_PURPOSE_TYPE_ID_RESERVE = 3;        // ������
  REST_PURPOSE_TYPE_ID_NET_OPERATIVE = 25; // Net.����������� �����
  REST_PURPOSE_TYPE_ID_OPERATIVE = 0; // ����������� �����
  REST_PURPOSE_TYPE_ID_PVZ = 45;           // ���
  REST_PURPOSE_TYPE_ID_AVR16 = 66;         // ���-16
  REST_PURPOSE_TYPE_ID_AVAR = 1;           // �������� �����
  REST_PURPOSE_TYPE_ID_FUELTANK = 86;      // ���

  // ������� ��������� ����������
  RQPLANPAYSTATUS_GOOD = 1; // ��������
  RQPLANPAYSTATUS_CREATED = 2; // ���������
  RQPLANPAYSTATUS_CLOSED = 3; // ������������
  RQPLANPAYSTATUS_PAYMENTS_DONE = 4; // ������ ���������

  // ���� ��������� ����������
  RQPLANPAYKIND_TMC = 1; // ���������  �� ����������
  RQPLANPAYKIND_SERVICE = 2; // ��������� �� �������

  /// ֳ�� �������������
  RQAPPROVEDCOST_GOOD = 1;
  RQAPPROVEDCOST_APPROVED = 2;
  RQAPPROVEDCOST_APPROVED_NO_CONTROL = 3;

  // SUPP-70367 ������ ����������
  {������������} RQPAYMENTMETHOD_PROVISIONING = 1;
  {���������} RQPAYMENTMETHOD_EXCHANGING = 2;

  /////////////////////////////////////////
  // ������� ����� ..............
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

  // ��� ������� - ����������
  TKFUELTYPE_DIESEL = 75000003;

  // ��� ������� - ������ 92
  TKFUELTYPE_92 = 75000001;
  // ��� ������� - ������ 95
  TKFUELTYPE_95 = 75000000;

  TK_KARTA_CODE_POGRUZKA_RAZGRUZKA = 500004877;


  // ������� �������� ��
  SC_USAGE_INPUT_AUTO_CREATED_NO = 0;
  SC_USAGE_INPUT_AUTO_CREATED_YES = 1;

  //////////////////////////////////////////////////////////////////////////////
  // ���� ��������� � ������������
  //////////////////////////////////////////////////////////////////////////////
  SC_USAGE_INPUT_EMPTY  = 1;  // ������ (��� �����)
  SC_USAGE_INPUT_FILLED = 2;  // �������������� (���� ������)
  SC_USAGE_INPUT_CLOSED = 3;  // ������������

  SC_USAGE_INPUT_ITEM_KIND_IN = 1; // ��������� � �����.
  SC_USAGE_INPUT_ITEM_KIND_OUT = 2; // ���������� �� �����. ��
  SC_USAGE_INPUT_ITEM_KIND_OUT_USING = 3; // ���������� �� �����. ����������
  //////////////////////////////////////////////////////////////////////////////

  // ���� �������� ���������
  SCCOUNTERKIND_FOR_MOVE = 1; // ��� �����������
  SCCOUNTERKIND_WORK_FROM_BILLING = 2; // ������ �� ��������
  SCCOUNTERKIND_FOR_WRITINGOFF = 3; // ��� ��������
  SCCOUNTERKIND_FOR_PRIHOD = 4; // ��� �������
  SCCOUNTERKIND_FOR_WORKORDERBYT = 5; // ��� �������� ������� �����������
  SCCOUNTERKIND_FOR_ZONECHANGING = 6; // ��� ��������� ����� ��������

  // ������� �������� ���������
  SCCOUNTERSTATUS_GOOD = 1; // ĳ�����
  SCCOUNTERSTATUS_IN_ACTS = 2; // � ��� (��-1 � ���.)
  SCCOUNTERSTATUS_CANCELED = 100; // ³�������

  SCORDERKIND_FOR_PRIHOD = 1; // ��� ���������� ��� ��������� ��� �������
  SCORDERKIND_FOR_MOVE = 2; // ��� ���������� ��� ��������� ��� ����������� �����������

  // ���� ����� ���-���
  TK_ACCOUNTINGTYPE_TMC = 1;
  TK_ACCOUNTINGTYPE_COUNTER = 2;
  TK_ACCOUNTINGTYPE_OS = 3;
  TK_ACCOUNTINGTYPE_SERVICES = 4;
  // ��� �����
  TK_ACCOUNTINGTYPE_SEAL = 5;
  TK_ACCOUNTINGTYPE_IMP = 6;
  TK_ACCOUNTINGTYPE_HOLO = 7;

  TK_ACCOUNTINGTYPE_ALL_SEALS = '5, 6, 7';
  TK_ACCOUNTINGTYPE_FUEL_CARD = 8;


  // ������������ �����������\���
  ENTIRESINSTALLSTATUS_NO = 0;
  ENTIRESINSTALLSTATUS_YES = 1;

  // ����������� ����������\���
  ENACCUMULATORSSTATUS_NO = 0;
  ENACCUMULATORSSTATUS_YES = 1;

  // ���� ���������� ��������� (energy_lock ) � ��
  SC_COUNTER_LOCK_NEW_COUNTERS_LOCK = 4;
  SC_COUNTER_LOCK_SERVICES_COUNTERS_LOCK = 7; // ��� ��� ����� �� �������

  // ���� �������� ��� ���-���
  ENMARK_MAIN4REFINEMENT = 10;


  // ������� ��������� ����� ��� ����� �� �������
  ENSERVICESOBJECTSTATUS_DRAFT = 1;	           // ��������
  ENSERVICESOBJECTSTATUS_CANCELED = 2;	       // ³�������
  ENSERVICESOBJECTSTATUS_BUDGETAPPROVED = 3;	 // �������� ������������
  ENSERVICESOBJECTSTATUS_SIGNED = 4;	         // ϳ��������
  ENSERVICESOBJECTSTATUS_PAID = 5;	           // ���������
  ENSERVICESOBJECTSTATUS_ACT_SIGNED = 6;      // ��� ������-�������� ��������� - ��������
  ENSERVICESOBJECTSTATUS_COMPLETED = 7;       // ������ �������� � ������������� - "������ ���������"
  ENSERVICESOBJECTSTATUS_TERMINATED = 8;      // ������ �������� � ������������� - ����������
  ENSERVICESOBJECTSTATUS_PREPAID = 9;         // ������ �������� � ������������� - "������� ��������������� ����"
	ENSERVICESOBJECTSTATUS_DISCLAIMER = 10;     // "³����� ��������� �� ������"
	ENSERVICESOBJECTSTATUS_CLOSE = 11;     // ������� ������ ��� ������� ��� ���������


  // ���� ��������� �� ������� �� �������
  ENSERVICESOBJECTTYPE_TU    = 1;	// ��
  ENSERVICESOBJECTTYPE_OTHER = 2;	// ����
  ENSERVICESOBJECTTYPE_SALE = 3;  //  �������
  ENSERVICESOBJECTTYPE_SALE_PAYMENT_SCHEDULE = 4;  //  �������  (������ ��������)
  ENSERVICESOBJECTTYPE_CONNECTION = 5; //���������

  //** ��� �������� �� ������ - ������������ (����� � ����������) */
  ENSERVICESOBJECTTYPE_RELAXATION = 6;
  // �������� �� ����������� �������
  ENSERVICESOBJECTTYPE_OKSN = 7;
    // �������� �� ��������������
  ENSERVICESOBJECTTYPE_PROJECT = 8;
    // �������� �� ����� ������������
  ENSERVICESOBJECTTYPE_SHIFT_LINES = 9;
    // �������� �� �������� �������� �����
  ENSERVICESOBJECTTYPE_OHRINA = 10;


  // ���� ��������� �� ������� �� �������
  SERVICES_CONTRACT_KIND_SERVICES = 1;	  // ������
  SERVICES_CONTRACT_KIND_SALES = 2;	      // �������
  //** ��� �������� �� ������ - ������������ (����� � ����������) */
  SERVICES_CONTRACT_KIND_RELAXATION = 3;
  // �������� ������ (����)
  SERVICES_CONTRACT_KIND_OKSN_RENT = 4;
  // �������� ������������ ������ (����)
  SERVICES_CONTRACT_KIND_OKSN_WORK = 5;
  // �������� �� ������ ���� (����)
  SERVICES_CONTRACT_KIND_OKSN_TU = 6;
  //  �������� �� ���������� ������� (����)
  SERVICES_CONTRACT_KIND_OKSN_AGREEMENT = 7;
  // �������� �� ������ (����)
  SERVICES_CONTRACT_KIND_OKSN_ACCESS = 8;
  // �������� �� ������������
  SERVICES_CONTRACT_KIND_PROJECT = 10;
  // �������� �� �������� ��� �� �� (����)
  SERVICES_CONTRACT_KIND_OKSN_TU_MODIFY = 9;
  // �������� �� ������ �������
  SERVICES_CONTRACT_KIND_OHRINA = 13;
  // �������� �� ������������ ������ � ��������������� �/�
  SERVICES_CONTRACT_KIND_SUPPLIER = 14;
  
  SERVICES_CONTRACT_KIND_COMPANY_OBJ = 11;
  SERVICES_CONTRACT_KIND_CUSTOMER_OBJ = 12;
  SERVICES_CONTRACT_KIND_INFORMATIONAL = 15;
  SERVICES_CONTRACT_KIND_OTHER_NOT_LICENSED = 16;
  SERVICES_CONTRACT_KIND_REMOVAL_LINE_RM_KB = 17;
  SERVICES_CONTRACT_KIND_SERVICES_LUZOD_ASKOE = 18;


  // ���� ������������ ��� ��������� �� ������� �� �������
  ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL            = 1; // Գ����� �����
  ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET    = 2; // ��. ����� (������)
  ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET = 3; // ��. ����� (�� ������)
  ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT = 4; // Գ����� ����� - ����������
  ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT = 5; // �������� ����� - ����������


  // ���. ������� ��� ��������� �� ������� �� �������
  ENSERVICESOBJECT_FINSTATUS_GOOD   = 1; // ��������
  ENSERVICESOBJECT_FINSTATUS_CLOSED = 2; // ����������
  ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED = 3; // �������� ��������� �������������
  ENSERVICESOBJECT_FINSTATUS_CLOSED_BY_BUH = 4; // ���������� ����� ���������

  // ������� ��� ����������� ������ �� �������
  ENSERVICESOBJECT_ISNOPAY = 1; // ����������� ������

  // ������������ �� � ������� �� ������� ��������� ��������� (0 - ���, 1 - ��)
  ENSERVICESOBJECT_ISCUSTOMERMATERIALS = 1;

  ///// 16.05.13 NET-4235 ��� ������� ��������� ��� ��������� �� �������
  ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION = 1; // ���������� ������� ����� ��������� (������ �����)
  ENSERVICESOBJECT_CALCTYPE_BY_FACT        = 2; // ���������� ������� �� ������ ��������� ������ (����� �����)
  /////

  // ����� ������������ ��������� ����
  //** �������� ����� �� �������� ����� �������� ����� */
	ENACTINCOME_CREAT_METOD_SINGLE = 1;
	//** �������� ����� �� �������� ����������� ��������� ������ */
	ENACTINCOME_CREAT_METOD_MORE_ONE = 2;


  // ��������� ����������
  TKTECHCARDSOURCE_TRANSPORT    = 500000024; // ���������
  TKTECHCARDSOURCE_SIZ          = 500000035; // �������� ������
  TKTECHCARDSOURCE_CALCULATIONS = 500000039; // �����������
  TKTECHCARDSOURCE_TEST_CALCULATIONS = 1000000003; // ����������� (����)
  TKTECHCARDSOURCE_CALCULATIONS_20141201 = 1000000004; // ����������� (����)
  TKTECHCARDSOURCE_SERVICES_FROM_SIDE = 1000000002;  // ������ �� �������
  TKTECHCARDSOURCE_CLASSIFICATION_DEFECTS = 75000050; // ������������ ������� ��''���� ����������

  // ���� ��������� �������
  TKELEMENTTYPE_WORKERS   = 240000001; // ���������
  TKELEMENTTYPE_MATERIALS = 240000004; // ���������
  TKELEMENTTYPE_TRANSPORT = 240000002; // ���������

  // ������� ������������
  WARRANT_VALID = 0;
  WARRANT_INVALID = 1;

  // ��� ��������� ��� ���������� �����
  SERVICESOBJECT_REGIONAL_TYPE_CITY = 1;
  SERVICESOBJECT_REGIONAL_TYPE_VILLAGE = 2;

  // ������� ���������� ����������� ��������
  SERVICESOBJECT_RECONNECTIONTU = 1;
  // ������� ������ ����������� ��������
  SERVICESOBJECT_NEWCONNECTIONTU = 0;

  AGREES_GROUPS_IDS = '205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338, 44, 135, 330, 43, 344, 264, 350, 351, 352, 353, 365, 368';

  // ������ ��������� �����.���������
  ADMIN_TRUCKING = 500004875;


  //////////////////////////////////////////////////////////////////////////////
  //// ���� ����� ������������ ���������� //////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  AVTOTYPE_CARTOWER = 2; // ���������
  AVTOTYPE_CRANE = 3; // ��������
  AVTOTYPE_BKU = 4 ; // ���
  AVTOTYPE_EXCAVATOR = 6; // ����������
  AVTOTYPE_BOARD = 75000004; // ����� ��������
  AVTOTYPE_TRUCK = 75000007; // ��������
  AVTOTYPE_TRACTORTRAILER = 500000000; // ��������� ����� 


  //  ��� ������������ ��� �������������
  ISNOTLICENSEDACTIVITY_NKRE = 0;                // ������������ ����
  ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT = 1;   // �������������� (������ ����������)
  ISNOTLICENSEDACTIVITY_SERVICE_OTHERS = 2;      // �������������� (������)
  ISNOTLICENSEDACTIVITY_COSTWORKSCONTRACTOR = 3; // �������������� (� ������������ ���������� ����������)

  /////// ���������� ����� ///////
  // ���� �����
  ENMOLTYPE_MASTER = 1;      // ������
  ENMOLTYPE_STOREKEEPER = 2; // ���������
  ENMOLTYPE_STOREKEEPER_CENTRAL = 3; // ��������� ������������ ������

  // ������� �����
  ENMOLSTATUS_ACTIVE = 1;   // ��������
  ENMOLSTATUS_INACTIVE = 2; // ����������
  ////////////////////////////////


  /////  ������� ������ ���������� ///
  ENTRANSPORTORDERSTATUS_GOOD = 1;
  ENTRANSPORTORDERSTATUS_IN_WORK = 2;
  ENTRANSPORTORDERSTATUS_CLOSED = 3;
  ///////////////////////////////////

  //// ������� ������������ ������ �� ��������� ///
  ENTRANSPORTORDER_ISASSIGNMENT_TRUE = 1;
  ENTRANSPORTORDER_ISASSIGNMENT_FALSE = 0;
  ///////////////////////////////////

  /// ������ ���������� ///
  TKTRANSPORTSTATUS_WORK = 75000000;
  TKTRANSPORTSTATUS_REPAIR = 75000001;
  TKTRANSPORTSTATUS_FROM_SIDE = 75000002;
  ///

  TKTRANSPORTREAL_ISVERIFIED = 1;
  TKTRANSPORTREAL_ISVERIFIED_FALSE = 0;

  // ��������� ������������ ���������
  TKTRANSPORTREAL_ISNOTUSED = 1;
  TKTRANSPORTREAL_ISNOTUSED_FALSE = 0;

  // �������� ���������
  TKTRANSPORTREAL_ISONDUTY = 1;
  TKTRANSPORTREAL_ISONDUTY_FALSE = 0;

    // ��������� � �������� ��������
  TKTRANSPORTREAL_HASSTARTER = 1;
  TKTRANSPORTREAL_HASSTARTER_FALSE = 0;

  // ��� �������(�������� ��� ��� ��������� ��������� � ��.)
  ENTRAVELSHEETFUELTYPE_MAIN = 1;
  ENTRAVELSHEETFUELTYPE_FOR_STARTER = 2;

  // ��������� ���
  TKTRANSPORTREAL_ISOVB = 1;
  TKTRANSPORTREAL_ISOVB_FALSE = 0;

  // ���� ��� ������������� ������� �������
  TKFUELKOEFTYPE_TRANSPORT = 1;
  TKFUELKOEFTYPE_TRAVELSHEETITEM = 2;

  //
  ENTRAVELSHEETKIND_FACT = 2;
  ENTRAVELSHEETITEMSTATUS_GOOD = 1;

  ENELEMENTCODE_COUNTERS_WRITE_OFF = 500007381; // ����� ������� � ������ ��� �������� ���������
  ENELEMENTCODE_FUEL_INVENTARIZATION_WRITE_OFF = 500009000; // ������� ��� �������� �� ��������������
  ENELEMENTCODE_RECYCLABLE_MATERIALS = 1017547431; // ������� ��� ����� �� ������� ���������� �� ���������

  // ��� �������� - 50 - ������ ��� �����������
  ENELEMENT_TYPE_CARGO_OBJECT = 50;
  // ������� - 1017002423 - ������ ��� �����������
  CARGO_OBJECT = 1017002423;


  MIN_TIME_FOR_REZERVED_CALCULATION = '8:30:00'; // ����������� ����� � �������� ���������� ������ �������������� ������� �� ��������� ������������ .
  TIME_LUNCH_START = '12:12:00'; // ����� ������ ���������� ��������
  TIME_LUNCH_FINAL = '13:00:00'; // ����� ��������� ���������� ��������
  TIME_END_WORKING_DAY = '16:00:00'; // ����� ��������� �������������� ������� ��� ��������� �����
  TIME_END_FRIDAY_DAY = '15:00:00'; // ����� ��������� �������������� ������� ��� ��������� ����� ��� �������



  //////////////////////////////////////////////////////////////////////////////
  //// ������ �� ������� (��Ȫ������) //////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  // 0�8� -- �������� ϲ���Ȫ����� "�в����-������"
  FK_PARTNERCODE_BR�LYUKS = '0�8�';

  // ���� ���������
  ENTECHCONDITIONSSERVICES_TYPE_PROJECT = 1;       // ��������������
  ENTECHCONDITIONSSERVICES_TYPE_REALIZATION = 2;   // ����������

  // ���������, �������� ������� ��������� ���������� ���� ���������
  ENTECHCONDITIONSSERVICES_BASISTYPE_WARRANT = 3; // ������������

  // ������� ���������
  ENTECHCONDITIONSSERVICES_STATUS_DRAFT = 1; // ��������
  ENTECHCONDITIONSSERVICES_STATUS_SIGNED = 2; // ����������
  ENTECHCONDITIONSSERVICES_STATUS_COMPLETED = 3; // �����������

  // ���� ���������
  ENTECHCONDITIONSSERVICES_FORM_INDIVIDUAL = 1; // ��������������
  ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY = 2; // ����������

  // ���� ������������
  ENTECHCONTRAGENT_TYPE_PHYSICAL  = 1; // ���. ����
  ENTECHCONTRAGENT_TYPE_JURIDICAL = 2; // ��. ����

  // ��� �������� � �������������
  ENCONNECTIONKIND_GENERAL_CONNECTION = 0;       // ������� �������� �� ���������
  ENCONNECTIONKIND_STANDART = 1;                 // ���������� ���������
  ENCONNECTIONKIND_NO_STANDART = 2;              // ������������ ���������
  ENCONNECTIONKIND_UNDEFINED = 3;                // ��� ��������� �� ���������
  ENCONNECTIONKIND_NO_STANDART_READY_MADE = 4;   // ������������ ��������� (��� ����)

  // ������� (�������, ���� ...:::))) ������ ����� �� ����������� �������������....
  ENCONNECTIONLEVEL_FIRST = 1; // � ������ (�� 16 ���)
  ENCONNECTIONLEVEL_SECOND = 2; // I� ������ (�� 16 ��� �� 50 ���)
	ENCONNECTIONLEVEL_THIRD = 3;  //** I�I ������ (�� 50 ��� �� 160 ���) */

  // ����������� �������� ��� ������������ �����������....
  STANDART_CONNECTIONS_POWER_16 = 16;
  STANDART_CONNECTIONS_POWER_50 = 50;
  STANDART_CONNECTIONS_POWER_160 = 160;

  // ������� ������� �� ���� �������
  ENTECHCONDITIONS_ISUSE2TARIFFS_NO = 0;
  ENTECHCONDITIONS_ISUSE2TARIFFS_YES = 1;

  // �������� ������������ ��������, ������� �������, ����� ������������� �����
  // �� �������� � �������������
  ENTECHCONDITIONS_BUILDERSAREA_NO = 0;
  ENTECHCONDITIONS_BUILDERSAREA_YES = 1;  // ������������ ��������

  ENTECHCONDITIONS_BASESTATION_NO = 0;
  ENTECHCONDITIONS_BASESTATION_YES = 1;  // ������ �������

  ENTECHCONDITIONS_SMALLARCHFRM_NO = 0;
  ENTECHCONDITIONS_SMALLARCHFRM_YES = 1;  // ���� ������������ �����

  ENTECHCONDITIONSOBJECT_SECURITYZONE_NO = 0;
  ENTECHCONDITIONSOBJECT_SECURITYZONE_YES = 1;  //�������� ����

  // ���� ����� �� �������������...  1 - ������� ��������� ����� */
  CONNECTIONWORKTYPE_NOT_INCLUDECOST = 0;
  CONNECTIONWORKTYPE_INCLUDECOST = 1;

   // ��� ������� ��������� �������������
   CONNECTIONCALCTYPE_NOT_ABOVE_RESERVE = 1;   // ��������� �� �� �� �������� ������
   CONNECTIONCALCTYPE_ABOVE_RESERVE = 2;       // ��������� �� �� �������� ������

   // �������� ��������� � ���������� ���������� �������
   PRIMARY_SUBSTATION = 1;       // ��������
   SECONDARY_SUBSTATION = 2;     // ���������

  //////////////////////////////////////////////////////////////////////////////


  // ���� ������������� ���
  ENRESPONSIBLESKIND_OMTS = 1; // ³���������� ����� ����


  // ������ ������������ ���������
  RQTRANSPORTINVOICESTATUS_NEW = 1;

  // ������ ��-2 ������������ ������������
  ENRECONSTRMODERNIZACSTATUS_DRAFT = 1; // ��������
  ENRECONSTRMODERNIZACSTATUS_SEGNED = 2; // �� ����������
  ENRECONSTRMODERNIZACSTATUS_CLOSE = 3; // �����������

  
  ///////////////////////////
  //// ������ ���������� ////
  ENVOLTAGECLASS_150 = 1;
  ENVOLTAGECLASS_35  = 2;
  ENVOLTAGECLASS_10  = 3;
  ENVOLTAGECLASS_6   = 4;
  ///////////////////////////


  ENRECONSTRMODERNOZ_STATUS_DRAFT = 1 ;
  ENRECONSTRMODERNOZ_STATUS_SIGNED = 2;
  ENRECONSTRMODERNOZ_STATUS_CLOSE = 3;

  // ��� ��������� �����
	FINEXECUTOR_TYPE_PRIMARY = 1;     // ��������
	FINEXECUTOR_TYPE_ADDITIONAL = 2;  // ����������
	// ������ ������� ���������� 04
	ENSUBSTATION04_PERIODINSPECT_2 = 2; // �� ������ ��� ��� ���� �  ���
  ENSUBSTATION04_PERIODINSPECT_4 = 4; // �� ������ ������ ���� �  �������


  // ��� ������
  PLANWORKSHOW_STANDART = 1;  // ����������� ������
  PLANWORKSHOW_LIGHT = 2;     // ��������� ������


	ENPAYMENT2SOTYPE_PREPAYMENT = 1; // ���������� 
	ENPAYMENT2SOTYPE_REPAYMENT = 2; // ��������� ������������� 
	ENPAYMENT2SOTYPE_BACK_MONEY = 3; // ������� ����� ���������
                                 

  // ������� �������� �����
  ENACTINCOMESTATUS_GOOD = 1;        // ��������
	ENACTINCOMESTATUS_CANCELED = 2;    // ³�������
	ENACTINCOMESTATUS_CLOSED = 3;      // ���������� � Գ����
	ENACTINCOMESTATUS_SIGNATURE = 4;   // �� ��������

  RQORDERITEM_STATE_PAID = 1;

  // ������� ��������� ������������� ��������
  RQALLOCATIONLISTSTATUS_NEW = 1;                  //  �������
  RQALLOCATIONLISTSTATUS_MATERIALS_RESERVED = 2;   //  �������� �������������
  RQALLOCATIONLISTSTATUS_CONFIRMED = 3;            //  �����������

  RQALLOCATIONLISTFORM_NOPLANNED = 2; // ����������� ������� �������� �������

  ENELEMENTTYPE_PL6_10 = 1;  // �������� ��� 6-10 ��
  ENELEMENTTYPE_PL04 = 2;  // �������� ��� 0.4 ��
  ENELEMENTTYPE_ENSUBSTATION04 = 3; // �� 0.4 ��
  ENELEMENTTYPE_PL35_150 = 5;  // �������� ��� 35-150 ��
  ENELEMENTTYPE_ENSUBSTATION150 = 6; // ���������� 35-150 ��

	// 52 - ������� � ���������� ���.�������
 	ENELEMENTTYPE_TECHCONDITIONSSERVICES = 52;

  ENELEMENTTYPE_RECORDPOINT_BYT = 7;
  ENELEMENTTYPE_RECORDPOINT_PROM = 8;

  // ���� �������� ���������������
  ENINVESTOBJECTTYPE_OBJECT = 1; // ��'���
  ENINVESTOBJECTTYPE_PURCHASES_NO_OBJECT = 2; // ���� ������� (��������������� �� ����������)

  ////////  ����������� �������� ���� //////////////////
  ///  /** ��� */
	ENSTANDARDCONST_PDV = 1;
  { ��� ������� ������ }
  ENSTANDARDCONST_PDV_LOW = 8;
	{ ��� ��������� }
	ENSTANDARDCONST_ESV_ALL = 2;
	{ ��� �������.}
	ENSTANDARDCONST_ESV_INV = 3;
	{ ���쳿 }
	ENSTANDARDCONST_PERCENT_BONUS = 4;
	{��������������}
	ENSTANDARDCONST_PERCENT_COMPANY = 5;

  // ������� ���������������
	ENINVESTPROGRAMSTATUS_DRAFT = 1; // ��������
	ENINVESTPROGRAMSTATUS_APPROVED = 2; // ������������
	ENINVESTPROGRAMSTATUS_IN_PROGRESS = 3; // �����������
	ENINVESTPROGRAMSTATUS_FINANCING_COMPLETED = 4; // �������������� ���������
	ENINVESTPROGRAMSTATUS_COMPLETED = 5; // ���������

  // ���� �������
  ENTENDERPURCHASEKIND_ZCP = 1; // ���

  ENFUELDISTRIBUTIONSHEETITEM_CONFIRMED = 1;
  ENFUELDISTRIBUTIONSHEETITEM_NOT_CONFIRMED = 0;
  //--------------------------------> ���� ������� ������� (�����������)
  TKCLTYPE2CODEPROJECT_VOLTAGE_220 = 1; // ������� ��������� �� ���������� 220 �
  TKCLTYPE2CODEPROJECT_VOLTAGE_380 = 3; // ������� ��������� �� ���������� 380 �

  // ����������� ������������ �������� �����
  TKCLTYPE2CODEPROJECT_WITHOUT_USEPILLAR  = 0;   // ��� �������� �����
  TKCLTYPE2CODEPROJECT_WITH_USEPILLAR  = 1; // � ��������� ������

  // ��� ������������ ����
  TKCLTYPE2CODEPROJECT_TYPEZKOE_0 = 0; // ��� ���������
  TKCLTYPE2CODEPROJECT_TYPEZKOE_1 = 1; // � ����������
  TKCLTYPE2CODEPROJECT_TYPEZKOE_2 = 2; // �� ����

  // ��� ����� �� ����� ������������ ������������
  TKCLTYPE2CODEPROJECT_TYPECABLE_0 = 0; // ������������
  TKCLTYPE2CODEPROJECT_TYPECABLE_1 = 1; // �����������

  TKTECHCARDSOURCE_TYPE_PROJECT = 500000044;  // ������� ������� ������
  //--------------------------------<
  CALL_CENTER_URL = 'http://10.77.11.180:18880/soap/servlet/rpcrouter';
  CALL_CENTER_DEFAULT_USER = 'callcenter';
  CALL_CENTER_DEFAULT_PASSWRD = 'callcenter_1';

  CCCALL_TYPE_T3 = 3;


  ENIPITEM_ISPROJECTDOCUMENT_TRUE = 1; // ����� ������ �������� , ��������� ������������ ������������
  ENIPITEM_ISPROJECTDOCUMENT_FALSE = 0; // ����� ������ �������� , ��������� ������������ �����������

  // ������� ��������������� new
	ENIPSTATUS_DRAFT = 1; // ��������
	ENIPSTATUS_CREATED = 2; // ��������
	ENIPSTATUS_APPROVED = 3; // ����������

  CONFIG_CHKPAYMENTBYBUDGET = 21; //�������� �� ������� auth.config,
    //������������, ��������� �������� ����� ������������ ������� ��� ���
  CONFIG_ENERGYNET_CLIENT_VERSION = 22;       //������ ������� EnergyNet
  CONFIG_ENERGYWORKFLOW_CLIENT_VERSION = 23;  //������ ������� EnergyWorkFlow
  CONFIG_ENERGYPRO_CLIENT_VERSION = 17;       //������ ������� EnergyPro
  CONFIG_ENERGY_CLIENT_VERSION = 24;          //������ ������� Energy
  CONFIG_CALLCENTER_CLIENT_VERSION = 25;      //������ ������� CallCenter
  CONFIG_ADMIN_CLIENT_VERSION = 26;           //������ ������� AdminClient
  CONFIG_TECHCARD_CLIENT_VERSION = 27;        //������ ������� TechCard2
  CONFIG_PLOTTER_CLIENT_VERSION = 28;  //������ ������������ ��������� Plotter
  CONFIG_SUPCHART_CLIENT_VERSION = 29; //������ ������������ ��������� SupChart

  //������ ���������� ������� exe ��������� ��������� EnergyWorkFlow
  CONFIG_ADMITORG_CLIENT_VERSION = 351; //AdmitOrg - ����������� �������
  CONFIG_ACTFLOW_CLIENT_VERSION = 352; //ActFlow - ���� ��������� ����
  CONFIG_JOINSPL_CLIENT_VERSION = 353; //JoinSPL - C��������� ��������
  CONFIG_BUYSOEN_CLIENT_VERSION = 354; //BuySoEn - ������� ��������� �������
  CONFIG_MARKETE_CLIENT_VERSION = 355; //MarketE - �������� ��� � ���������������
  CONFIG_FIBEROPT_CLIENT_VERSION = 356; //FiberOpt - ���������� ������ ����
  CONFIG_CRIMPRM_CLIENT_VERSION = 357; //CrimPrM - ������������ ������������ ���
  CONFIG_SUPPEWF_CLIENT_VERSION = 358; //SuppEWF - ��������� ������� �������� WorkFlow

  CONFIG_ENERGYNET_USESMDAXDATA = 30;       // ������������ �� Axapta �������� ��������
  CONFIG_ENERGYNETREPORT_USESMDAXDATA = 31; // ������������ �� Axapta �������� ��������
  //** ������� ������ ������������ */
	CONFIG_USES_MDAX_CUSTOMER = 32;
	//** ������� ������ ��������� */
	CONFIG_USES_MDAX_CONTRACT = 33;
	//** ������� ������ ������ ������������ */
	CONFIG_USES_MDAX_CUSTOMERBANKACCOUNT = 34;
  //** ������� ������ ����������� */
  CONFIG_USES_MDAX_ITEM = 35;
  //** ������� �������� ���������� */
  CONFIG_USES_MDAX_INVENTORYONHAND = 36;
  //** ��������� ������ */
  CONFIG_USES_MDAX_PURCHASEORDER = 37;
  //** ��������� ������ */
  CONFIG_USES_MDAX_TRANSFERJOURNAL = 38;
  //** ������� ����� */
  CONFIG_USES_MDAX_INVENTLOCATION = 39;

  AX_CONTRAGENT_TYPE_CUSTOMER = 0;
  AX_CONTRAGENT_TYPE_VENDOR = 1;

  RQBUDGET_STATUS_DRAFT = 1; // ��������
  RQBUDGET_STATUS_APPROVED= 2;  // ���������

  TEMPNOMENCLATURESTYPE_ETALON = 1; // ������
  TEMPNOMENCLATURESTYPE_CHILD = 2; // �����

  TKCLASSIFICATIONTYPE_DEFAULT_PERCENTPROFITRATE = 10; // ������� ����� ������� �� ��������� ��� �����������

  TKCALCKIND_OLD = 1;
  TKCALCKIND_NEW = 2;
  TKCALCKIND_NEW2 = 3;

  ENPLANWORK_CAUSE_DISCONNECTION = 1; // ��� ���������� ����� ���������� ���������� ������������

  COUNTERS_INV_NUMBER_LENGTH_MIN = 6; // ����������� ����� ������������ ������ ��������
  COUNTERS_INV_NUMBER_LENGTH_MAX = 7; // ������������ ����� ������������ ������ ��������

  OS_INV_NUMBER_LENGTH = 6; // ����� ������������ ������ ��������� ��������

  // ������������� ����� �����������
  // ����������
  TKCLASSIFICATIONTYPE_EZ = 1040002288;
  // �������� ����- � ���������� ����� ���������� ����㳿
  TKCLASSIFICATIONTYPE_EZ_TO = 2140014414;
  // ������, ������, ���������� ������ �����
  TKCLASSIFICATIONTYPE_EZ_COUNTER_EXPERTISE = 2140014419;

  TKCLASSIFICATIONTYPE_EZ_CONNECT_NEW = 2140012116;
  // ϳ��������� ��������� (���������) ���������� �� (��) ������������ �� ���� �� �� 1000� �� ����� 1000�
  TKCLASSIFICATIONTYPE_EZ_CONNECT = 2140011709;//2140010874; //2140009903; ///2140008888;  //2140008166;  //2140006125;//1040002339;
  // ϳ��������� ��������� (���������) ���������� �� (��) ������������ � ��� �� 1000� �� ����� 1000�
  TKCLASSIFICATIONTYPE_EZ_CONNECT_VRP = 2140011718;//2140010875; //2140009904; //2140008889;  //1040002343;

  // ��������� ���������
  // �������� ���������� ������������ ��������� � ����� �������������� ������� ����� �����������㳿
  TKCLASSIFICATIONTYPE_EZ_CONNECT_SMART = 2140011705;  //2140010873; //2140009902; ///2140008887;  //2140006122;  //1040002336;

  // �������������� ������� �����, �� ������� �� ������ �������������� ������� ����� �����������㳿 ��� ����� �� �ᒺ��
  TKCLASSIFICATIONTYPE_PARAMETRIZATION_WITHOUT_LEAVING = 2140011805;  //2140010968; //2140010062;//2140009001;  //2140008476;
  // ������������ ����������� ��������� ���� NP-06 v.7 ��� ���������� ���������� �� ������� ������������� �� ��������, ����������������� �� ������ ����, � �������� � ��������� ���������� �������� ����������� ������� �� ������ ���������� ���������
  TKCLASSIFICATIONTYPE_MOUNT_SMARTCOUNTER_V7 = 2140013149;  //2140011788;//2140010955;//2140010051;//2140008990;  //2140008101;
  // ������������ ����������� ��������� ��� ���������� ���������� �� ������� ������������� �� ��������, ����������������� �� ������ ����, �� �������� � ����� � ����������������� �������, ����������� ������������������ NP-06  ���� 3.0 � �������� � ��������� ���������� �������� ����������� ������� �� ������ ���������� ��������� (��� ����� ��������� ������� �����)
  TKCLASSIFICATIONTYPE_MOUNT_SMARTCOUNTER_V3 = 2140013150;  //2140011789;//2140010956;//2140010052;//2140008991;  //2140008103;

  // ������������� ������������ ��������� �����������㳿 � ������ ����������� ������
  // ??? ��������� ���� ��������� � ������������ ����������������...
  TKCLASSIFICATIONTYPE_ISPROGRAM_COUNTER = 2140011664; //2140010831; //2140009985; //2140008901;//2140008095;

  // ���������� ���������� ����������� ��������� ���������� ����㳿
  TKCLASSIFICATIONTYPE_PARAMETRIZATION_1F = 2140014747;
  // ���������� ���������� ���������� ��������� ���������� ����㳿
  TKCLASSIFICATIONTYPE_PARAMETRIZATION_3F = 2140014750;

  {*************************************************
    ��� ��'���� �������� � ��������
    ������� �� ������� ������� ��� ������� ���
    ��������� ��������������
  **************************************************}
  TKMATERIALS2ENDEPARTMENTTYPE_NOT_DIVIDE_IN_ALLOCATION = 1;

  //** ������������ ��� ������ ������ ��� �������� ��� */
  TKCLASSIFICATIONTYPE_PKD = 80000001;


  ///////////////////////////////
  // ������� ��������� ������ //
  ///////////////////////////////
  TKCLASSIFICATIONTYPE_TRANSIT_SERVICE = 1040002503;


  ENBANKINGDETAILS_MFO_RUSSBERBANK = 320627; // ��� �������� ������
  ENBANKINGDETAILS_MFO_UASBERBANK = 352457; // ��� �������� �������
  ENBANKINGDETAILS_MFO_PIB = 300506; // ��� ������ �������������� ����
  ENBANKINGDETAILS_MFO_OBU = 352457; // ��� ��������

  ENBANKINGDETAILS_MFO_OBU_300465 = 300465; // ��� ��������  ����������



  ENCHECKPOINTEVENTTYPE_OUT = 1; // ����������� �� ��� �����
  ENCHECKPOINTEVENTTYPE_IN = 2;  // ����������� �� ��� �����

  ENCHECKPOINT_MOTORCADE = 500000002; // ��� ʳ������� ���� 1
  ENCHECKPOINT_CPP = 500000023;  // ��� ���
  ENCHECKPOINT_VYS = 500000012;  // ��� ����������
  ENCHECKPOINT_HGES = 500000003; //	��� ����
  ENCHECKPOINT_NKAH = 500000006; // ��� �.�������
  ENCHECKPOINT_KAH = 500000008; //	��� �������
  ENCHECKPOINT_IVA = 500000009;	// ��� �������
  ENCHECKPOINT_GPR = 500000013; //	��� �����
  ENCHECKPOINT_CUR = 500000016; //	��� ������
  ENCHECKPOINT_LEP = 500000017;	// ��� ��������
  ENCHECKPOINT_GEN = 500000018; //	��� ��������
  ENCHECKPOINT_GEN2 = 500000026; //	��� �������� (�����)
  ENCHECKPOINT_CHA = 500000020; //	��� ��������
  ENCHECKPOINT_NTR = 500000021; //	��� �����������
  ENCHECKPOINT_SKA = 500000015;	// ��� ���������
  ENCHECKPOINT_NVOR = 500000024;	// ��� ����������
  ENCHECKPOINT_VAL = 500000025;	// ��� �.�������������
  ENCHECKPOINT_SER = 500000010; // ��� ��������
  ENCHECKPOINT_BER = 500000005; // ��� ��������
  ENCHECKPOINT_ROG = 500000022; // ��� �������
  ENCHECKPOINT_KAL = 500000019; // ��� ��������
  ENCHECKPOINT_GOR = 500000007; // ��� �����������

  TKMATERIALS2TECHCARD_TYPE_PRODUCTION = 1; // ����� ���.���� � �������������� ���������

  // ���� ������ ���������� � �������
  ENESTIMATEITEM2PLANTYPE_OWN_PRODUCTION = 1; // ��'���� �������� � ����� �� ������ �� ������������

  // ������� ��������
  ENDOCATTACHMENTSTATUS_ACTIVE = 0;
  ENDOCATTACHMENTSTATUS_DELETE = 1;

  // ��� ��������
  ENDOCATTACHMENTTYPE_DEFAULT = 1;

  //** ����� �������� */
  ENATTACHMENT2SERVICESKIND_GENERAL_DOC = 1;
  //** ini-���� ��� �������� � ������������� */
  ENATTACHMENT2SERVICESKIND_SYSTEM_DOC = 2;


  // ���� ������� ������� ��� �����������
  ENWORKORDERBYTTYPE_BY_ENERGYNET = 1;    // ���� ��������, ��������� � EnergyNet
  ENWORKORDERBYTTYPE_RAID_BY_BILLING = 2; // ���� �������� ��� �������� ������, ��������� � �����
  ENWORKORDERBYTTYPE_CONTROL = 3;         // ���� �������� ��� ������ ����������� ��������� ����� ���� ��������� ����������

  // ������� ������� ������� ��� �����������
  ENWORKORDERBYTSTATUS_DRAFT     = 1; // �������
  ENWORKORDERBYTSTATUS_FORMED    = 2; // ��������
  ENWORKORDERBYTSTATUS_APPROVED  = 3; // �����������
  ENWORKORDERBYTSTATUS_COMPLETED = 4; // ��������
  ENWORKORDERBYTSTATUS_CLOSED    = 5; // ���������

  // ���� ������ ����� �� �������� ��������� (����/����)
  SCSEAL2WORKORDERBYTKIND_PLAN = 1;
  SCSEAL2WORKORDERBYTKIND_FACT = 2;

  // ������� �����
  SCSEALSTATUS_GOOD = 1; // ĳ����
  SCSEALSTATUS_SPOILED = 2; // ǳ�������
  SCSEALSTATUS_INSTALLED = 3; // ����������� �� ��������� �������
  SCSEALSTATUS_UNINSTALLED = 4; // ����� � ��������� ������� (�����������)

  // ���� �������������� �������� :)
  SCSEALTYPE_SEAL = 2; // ������
  SCSEALTYPE_IMP  = 3; // ���������
  SCSEALTYPE_HOLO = 4; // ����������

  // ������� �������� ��������� ������ ���
  ENFUELSHEETVOLUMESSTATUS_DRAFT = 1; // ��������
  ENFUELSHEETVOLUMESSTATUS_APPROVED = 2; // ������������

  TKMATERIALS_COUNTER_1FService = 2000001969;
  TKMATERIALS_COUNTER_3FService = 2000001970;

  //�������������� �������
  ENFUELINVENTARIZATION_STATUS_DRAFT = 1;
  ENFUELINVENTARIZATION_STATUS_ITEMS_GENERATED = 2;
  ENFUELINVENTARIZATION_STATUS_FUEL_RESERVED = 4;
  ENFUELINVENTARIZATION_STATUS_FACT_QUANTITY_INSERTED = 3;
  ENFUELINVENTARIZATION_STATUS_CLOSED = 5;

  // ������ �������� */
	TKREPLACECOUNTERKIND_REPLACE_COUNTER = 1;
	// �������������� �������� */
	TKREPLACECOUNTERKIND_PARAMETERIZATION_COUNTER = 2;


  //���� ���������� ������
  ENDAMAGERECOVERY_STATUS_DRAFT = 1;
  ENDAMAGERECOVERY_STATUS_SUM_CALCULATED = 2;
  ENDAMAGERECOVERY_STATUS_CLOSED = 3;

  // ����������� ���������� � DMReports - ������� UsesMDAXData � UsesMDAXDataForReport
  //UsesMDAXDataForReport : Boolean = False; // ������������ ������ �� �������� , ������� �� �������


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

  // ���������� � ��������� ����������� � � ���������� � ������ � ��� ������������� ���������� ��� �������
	RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_AND_FORPURCHASE = 1;
	//���������� � ��������� ����������� ������ � ���������� � ������ ��� ������������ ����� ������� ��� ���� �� ��� - ������ ��� ��� ������������ �������� ��� �������� � ��������  */
	RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_ONLY = 2;
	// ������ ������������ �������� �� ����� ����� �������� ��������� �� ����� , ��� ���� � ������� ���� �������� ����� ������������� � �������� ��� */
	RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FREED = 3;
	// �.� ����� ������� �� ���� ������������� ������� ( � ��������� ������ ��� ��� -�� � � ������� ���������� �� ��������� ) */
	RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_REPLACEMENT = 4;

  // ��������� ���� �� ������ ��������� ������� ���������� ��� ������ � ����������� ������ - ����� �� ������� � ������ ���� ��������
	//  ��� �� ����� ��� ������������� �����������/������ �� ����� �������� � ������ �������� ���-�� ��� ���������� .
  //  �.� ��� ����� - ������� ��������� � ������ ���������(�������  �� ��� isabstractsum ) ���� �������� ��� ������������ ����� ������� �� ���
   RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_REPLACEMENT_SUM_ABSTRACT = 5;


  //
  ENCONTRACTTYPE_AGREE = 1; // �������
  ENCONTRACTTYPE_PROJECT_AGREE = 2;    // ������ ��������



  // ������ ��������� axapta
  MDAX_ASSET_STATUS_NOACQUISITION = 'NoAcquisition';//'NO_ACQUISITION'; // 6 NoAcquisition


  // �������� ���
  //USESMDAXWRITEOFF_TMC = 1;

  //** ��� �������� ��� ������� ������ �� �������� ��� ��������� */
  //** �������� ������ */
  ENTECHAGRKIND_TA = 1;
  //** ����� */
  ENTECHAGRKIND_GL = 2;
  //** ������ ������ ��� �������� ��� */
  ENTECHAGRKIND_PKD = 3;

  // ����. ������ ��� �������� ����� � ����-������� ��� ���������� ���������� ���������
  EN_METROLOGY_OBJECT_WRITEOFF = 1012000070;
  ENELEMENT_METROLOGY_OBJECT_WRITEOFF = 1017652632;

  // ��������� ��� ����������� ������� � �����
  const GRID_FILTER_CONDITION_ALL = '(��)';
  const GRID_FILTER_CONDITION_DEFINE = '(������ ������)';

  ENELEMENTTYPE_EQUIPMENT_OBJECTS = 32; // ������������
  ENELEMENTTYPE_EQUIPMENT_REPAIR_OBJECTS = 33; // ������������ � �������

  ENELEMENT_ABSTRACT_RECORDPOINT = -1; // ����������� ����� �����


  SQL_SELECTED_ELEMENT_TYPE_FOR_REPORT_WORK_SCHEDULE = 'code in (1,2,3,5,6,11,9 )';

  ENSO2NODETYPE_STANDART = 1;
  ENSO2NODETYPE_RESERV = 2;

  TKREPORTITEMPURPOSE_PHYS_VOLUMES = 1;
  TKREPORTITEMPURPOSE_WORK_ESBYT_EN_PROM = 2;
  TKREPORTITEMPURPOSE_WORK_ESBYT_EN_BYT = 3;

  // ������� �������� ��� �����������
  ENREGFORSUPPLIERSTATUS_DRAFT    = 1; // ��������
  ENREGFORSUPPLIERSTATUS_CREATED  = 2; // ���������
  ENREGFORSUPPLIERSTATUS_APPROVED = 3; // ������������

  // ��� ����� ��������� � �����

  //��''���� �������� �� ��������� ���� �� ����� ���������� ����
  ENELEMENT2ACTTYPE_SERVICES_WORKS = 1;

  // ��� ���������

  // �������� ��������� ����������
  ENWARRANT_TYPE_INNER = 1;
  // ��������� �������� ����������
  ENWARRANT_TYPE_FROM_SIDE = 2;
  // ����������� ����� ��� ������������
  ENWARRANT_TYPE_DECREE_RESPONS = 3;
  // ��������� ��� ��������� ������
  ENWARRANT_TYPE_RQFKORDER = 4;

  //���� �� ����� ��������� �����
  ENDATE_NUMBER_REGISTRATION_STATEMENT = 12;
  //������� 20 ���������� ���������
  ENCONNECTIONKIND_STANDART_20 = 13;
  //������� 100 ���������� ���������
  ENCONNECTIONKIND_STANDART_100 = 14;
  //������� 50% �� ��������� (������������)
  ENCONNECTIONKIND_NO_STANDART_ACCOUNT_POWER_50 = 30;

  // ���� ����� ��� ��������
  ENSHEETS4SOTYPE_LAND_SHEET = 1;
  ENSHEETS4SOTYPE_ACCOMPANYINGSHEET1 = 2;
  ENSHEETS4SOTYPE_DISTRIBUTION_CONTRACT = 12;
  ENSHEETS4SOTYPE_DISTRIBUTION_ADDAGREEMENT = 13;
  ENSHEETS4SOTYPE_PETITION = 21; //���������� ���� �� ������������ ��������� ������
  ENSHEETS4SOTYPE_ISSUE = 25;

  // ***** ENSOVALUESTYPE
  // ����� ���䳿 ��������� �������� ������
  ENSOVALUESTYPE_LAND_SHEET_STAGE_NUMBER = 26;
  ENSOVALUESTYPE_NAME_LAND_MANAGER = 31;//������������ ������������ �������� ������
  ENSOVALUESTYPE_POST_ADDRESS_LAND_MANAGER = 32;//������� ������ ������������ �������� ������
  // ���� ����� �� ����������
  ENSOVALUES_CONTRACT_REGISTRATION_DATE = 12;

  // ������� ��-1 ����� �������������
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
  // ��� �������� - "��������� �������� �� �������� � ���������" (��� ���. ���)
  CONTRACTTYPES_PHYS_NEW_APARTMENT = 11;
  // ��� �������� - "��������� �������� �� �������� � ���������" (��� ��. ���)
  CONTRACTTYPES_JUR_NEW_APARTMENT = 11;

const
  // ���� ��������� �� ������������� �/� ��� ���. ���
  CONTRACTTYPES_PHYS: array[1..8] of TContractType =
  (
     (code: 0; name: '���� ��������'),
     (code: 8; name: '��������� �������� ���� ��������� ���� � ���������'),
     (code: 2; name: '��������� ��������'),
     (code: 4; name: '���� �������� / ���� ����������'),
     (code: 6; name: '��������� ���������'),
     (code: 9; name: '���������� ���������� �������� ����� ��������'),
     (code: 10; name: '���������� ���������� ��������� ���������� �������� � ��������'),
     (code: CONTRACTTYPES_PHYS_NEW_APARTMENT; name: '��������� �������� �� �������� � ���������')
  );

  // ���� ��������� �� ������������� �/� ��� ��. ���
  CONTRACTTYPES_JUR: array[1..11] of TContractType =
  (
     (code: 0; name: '���� ��������'),
     (code: 8; name: '��������� �������� ���� ��������� ���� � ���������'),
     (code: 2; name: '��������� ��������'),
     (code: 5; name: '���������� 䳿 ��������'),
     (code: 4; name: '���� ����� / �������� / ��. ������'),
     (code: 3; name: '���������� ��������� �������� ��''�����'),
     (code: 1; name: '���������� � �������� ������ � ��''����'),
     (code: 6; name: '��������� ���������'),
     //(code: 7; name: '������� ���������'),
     (code: 9; name: '���������� ���������� �������� ����� ��������'),
     (code: 10; name: '���������� ���������� ��������� ���������� �������� � ��������'),
     (code: CONTRACTTYPES_JUR_NEW_APARTMENT; name: '��������� �������� �� �������� � ���������')
  );

  // ���� ��������� �� ������������� �/� ��� ��. ���, ��� ������� �� ����� EIC ��� ����� �����
  CONTRACTTYPES_JUR_NO_EIC: array[1..4] of Integer = (2, 5, 4, 10);

  // ��� �������� - "����� �������" (��� ���. ���)
  CONTRACTTYPES_PHYS_NEW_OWNER: Integer = 8;
  //������� 4
  COMOFFER_UNIVERSAL = 1;           //����������
  COMOFFER_UNIVERSAL_ONLINE = 2;    //���������� ������
  COMOFFER_FREE = 3;                //����������
  COMOFFER_FREE_ONLINE = 4;         //���������� ������


    // ������ ���������� �����
  RENS_FROM_CN: array[1..12] of TRenFromCN =
  (
     (code: 5; name: '����������������'),
     (code: 17; name: '��������������'),
     (code: 4; name: '��������������'),
     (code: 9; name: '�����������'),
     (code: 16; name: '����������'),
     (code: 19; name: '������������'),
     (code: 12; name: '����������'),
     (code: 14; name: '����������'),
     (code: 10; name: '�����������������'),
     (code: 20; name: '�����������'),
     (code: 7; name: '�����������'),
     (code: 8; name: '�����������')
  );


  ENSERVICESFROMSIDEOBJECTSTATUS_DRAFT = 1;
	ENSERVICESFROMSIDEOBJECTSTATUS_SIGNED = 2;
	ENSERVICESFROMSIDEOBJECTSTATUS_PAY = 3;
	ENSERVICESFROMSIDEOBJECTSTATUS_WORK_EXECUTE = 4;
	ENSERVICESFROMSIDEOBJECTSTATUS_WORK_COMPLETED= 5;

  ENACTPOSTINGFORM_EXPENDITURE_ACT = 1;
  ENACTPOSTINGFORM_INCOME_ACT = 2;

  //  ������� ������� �� ���������� ��� ������
  SQL_NOT_IN_SELECTED_ENREPORTADDITNZBTMTRLG_FOR_RUKOEE = '184,79,80,91,306,302,311,303,312,304,313,305,314,39,322,52,332,346,349,350,351,353,218,354,355,365,366,367,368,375,386,387';

  implementation
end.


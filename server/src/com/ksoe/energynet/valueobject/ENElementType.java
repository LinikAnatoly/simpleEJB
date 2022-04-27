
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENElementTypeENElementType;
  */

import java.io.Serializable;


public class ENElementType implements Serializable {

    //Елементи об'єктів енергетики
	public static final int LINE10 = 1;
    public static final int LINE04 = 2;
    public static final int SUBSTATION04 = 3;
    public static final int TRANSFORMER04 = 4;
    public static final int LINE150 = 5;
    public static final int SUBSTATION150 = 6;
    public static final int TY_BYT = 7;
    public static final int TY_PROM = 8;

    public static final int RZA = 9;
    public static final int SDTU = 10;
    public static final int LINE_CABLE = 11;

    public static final int TRANSPORT = 12;
    public static final int METROLOGY_COUNTER = 13;
    public static final int METROLOGY_DEVICE = 14;
    public static final int BUILDER = 15;
    public static final int SIT = 16;
    public static final int ISOLATION = 17;
    public static final int METROLOGY_OBJECT = 18;

    public static final int PURCHASES_OBJECT = 19;
    public static final int PURCHASES_NO_OBJECT = 20;

    public static final int TRANSFORMER_OBJECT = 21;

    public static final int OPERATIVE_OBJECT = 22; // Об'єкти договорів на ТО та ремонт

    public static final int SERVICES_OBJECT = 23;

    public static final int PREPRODUCTION_OBJECT = 24; // ЦПП

    // TRUCING = 27;

    public static final int ABSTRACT_INV_NUMBER = 28;

    public static final int METROLOGY_SUBSTATION = 26;

    public static final int EB_OBJECTS = 27;

    public static final int WRITING_NO_OBJECT = 29;

	public static final int SIZ = 30;  // индивидуальные средства защиты
	public static final int BSZ = 31;  // бригадные средства защиты

	public static final int EQUIPMENT_OBJECTS = 32; // устаткування
	public static final int EQUIPMENT_REPAIR_OBJECTS = 33; // устаткування в ремонте

	public static final int NO_OBJECT_RESTOCKING = 35;  // поповнення запасів
	public static final int NO_OBJECT_GIFT = 73;  // благодійна допомога
	public static final int NO_OBJECT_AVR16 = 76;  // АВР16
	public static final int NO_OBJECT_AVZ = 79;  // Поповнення фонду АВЗ

	/** Закупівля лічильників для послуг */
	public static final int NO_OBJECT_COUNTERS_SERVICES = 80;

	//Паспорт Трансформаторної Підстанції 10 - 6 / 0,4 кВ
	public static final int HIGH_VOLTAGE_SELL = 36;  //Високовольтна Ланка
	public static final int DISCONNECTOR = 37;  //Роз'єднувач
	public static final int LOAD_SWITCH = 38;  //Вимикачі навантаження
	public static final int FUSE = 39;  //Запобіжники
	public static final int INSULATOR = 40;  //Ізолятори
	public static final int ARRESTER = 41;  //Розрядники
	public static final int CURRENT_TRANSFORMER = 42;  //Трансформатори тока
	public static final int BUS = 43;  //Шини
	public static final int MEASURDEVICE = 44; //Вимірювальний Прилад
	public static final int CONTACTBREAKER = 45; //Рубільник
	public static final int PANEL = 46; //Панель Низьковольтного Щита
	public static final int LOWVOLTBOARD = 47; //Низьковольтний Щит
	public static final int AUTOMAT = 49; //Автоматичний вимикач

	public static final int SERVICES_FROM_SIDE_OBJECT = 48;  // Об'єкти договорів (сторонні послуги)

	/** 50 - Вантаж для перевезення */
	public static final int CARGO_OBJECT = 50;

	/** 51 - Тех.Условия */
	public static final int TECHCONDITIONS = 51;

	/** 52 - Договор о выполнении Тех.Условий */
	public static final int TECHCONDITIONSSERVICES = 52;

    public static final int ROUTE_BYT = 53;

    /** 54 - Пункт назначения*/
    public static final int DESTINATIONPOINT = 54;

	//Паспорт Повітряної Лінії 6 - 10 кВ
	public static final int POST = 55; //Опора
	public static final int TRAVERS = 56; //Траверс на опорі
	public static final int HOOK = 57; //Крюк на опорі
	public static final int STAND = 58; //Стойка опори
	public static final int WIRE = 59; //Провод
	public static final int BRANCH = 60; //Відгалудження від ПЛ
	public static final int CABEL_OUT_10 = 61; //Кабельний виход з / Кабельна в ставка в ПЛ 6 - 10 кВ

	// ПС 150 - 35 кВ
	/** Аккумуляторная батарея */
	public static final int SUBST150BATTERY = 62;
    /** Разрядники (ОПН) */
	public static final int SUBST150DISCHARGER = 63;
	/** Разъединители */
	public static final int SUBST150DISCONNECTOR = 64;
	/** Трансформаторы тока */
	public static final int SUBST150CURRENTTRANS = 65;
	/** Выключатели */
	public static final int SUBST150SWITCH = 66;
	/** Трансформаторы напряжения */
	public static final int SUBST150VOLTTRANS = 67;
    /** Трансформаторы собств. нужд */
	public static final int SUBST150OWNTRANS = 68;
	/** Силовые трансформаторы */
	public static final int SUBST150POWERTRANS = 69;
	/** Ячейки ПС 35-150 кВ */
	public static final int SUBST150CELL = 70;
	/** Короткозамыкатели */
	public static final int SUBST150SHORTCIRCUITER = 71;
	/** Отделители */
	public static final int SUBST150SEPARATOR = 72;

	/** Благодійна допомога */
	public static final int GIFT = 73;

	/** Отходящее присоединение ВЛ 0,4 кВ от ТП 10 - 6 / 0,4 кВ */
	public static final int SUBST04_VL = 74;
	/** Отходящее присоединение КЛ 0,4 кВ от ТП 10 - 6 / 0,4 кВ */
	public static final int SUBST04_KL = 75;

	/** Виртуальные объекты CallCenter'а */
	public static final int CALLCENTER_OBJECT = 78;


	/** Тип акумуляторної батареї */
	public static final int ENSUBST150_BATTERY_TYPE = 81;
	/** Тип підзарядного пристрою акум. батареї */
	public static final int ENSUBST150_BATTERY_CHARGER_TYPE = 82;
	/** Тип відокремлювача */
	public static final int SUBST150_SEPARATOR_TYPE = 83;
	/** Тип короткозамикача */
	public static final int SUBST150_CIRCUITER_TYPE = 84;
	/** Тип розрядника */
	public static final int SUBST150_DISCHARGER_TYPE = 85;
	/** Тип роз'єднувача */
	public static final int SUBST150_DISCONNECTOR_TYPE = 86;
	/** Тип трансформатора струму */
	public static final int SUBST150_CURRENTTRANS_TYPE = 87;
	/** Тип вимикача */
	public static final int SUBST150_SWITCH_TYPE = 88;
	/** Тип трансформатора напруги */
	public static final int SUBST150_VOLTTRANS_TYPE = 89;
	/** Тип трансформатора власн. потреб */
	public static final int SUBST150_OWNTRANS_TYPE = 90;
	/** Тип силового трансформатора */
	public static final int SUBST150_POWERTRANS_TYPE = 91;


	/** Опора дерев'яна */
	public static final int WOOD_POST = 99;
	/** Опора залізобетонна */
	public static final int ARMORED_POST = 100;


	/** Контрольно-измерительные кабели */
	public static final int ENSUBST150CONTROLCABLE = 101;

	/** Секция шин */
	public static final int ENSUBST150TIRESECTION  = 102;

	/** Викатний елемент */
	public static final int ENSUBST150PULLOUTELEMENT  = 103;

	/** ДГК */
	public static final int ENSUBST150DGK  = 104;

	/** ТВП */
	public static final int ENSUBST150TVP  = 105;

	/** РЗА */
	public static final int ENSUBST150RZA  = 106;

	/** ТН */
	public static final int ENSUBST150TN  = 107;

	/** ВРУ-150 */
	public static final int ENSUBST150VRU150  = 108;

	/** ВРУ ЗРУ -35 */
	public static final int ENSUBST150VRUZRU35  = 109;

	/** ВРУ ЗРУ 6-10 */
	public static final int ENSUBST150VRUZRU6_10  = 110;


	//* Грозозахист ПС та контур заземлення */
	public static final int ENSUBST150_GROUNDING = 111;

	 //**тип Грозозахист ПС та контур заземлення */
	public static final int ENSUBST150_GROUNDING_TYPE = 112;
	  //**тип кабельного каналу */
	public static final int  ENSUBST150_CABLECHANNEL_TYPE = 113;
	  //**кабельний канал */
	public static final int  ENSUBST150_CABLECHANNEL = 114;

	//**тип Будівлі ЗРУ */
	public static final int  ENSUBST150_BUILDZRU_TYPE = 115;
	  //**Будівлі ЗРУ */
	public static final int  ENSUBST150_BUILDZRU = 116;

	//**тип Будівлі ЗРУ */
	public static final int  ENSUBST150_BUILDINGADDITIONAL_TYPE = 117;
	//**Будівлі ЗРУ */
	public static final int  ENSUBST150_BUILDINGADDITIONAL = 118;

	  //** тип Маслосборные конструкции */
	public static final int  ENSUBST150_OILCOLLECTING_TYPE = 119;
	  //** Маслосборные конструкции */
	public static final int  ENSUBST150_OILCOLLECTING = 120;

	  //** тип Внешнее ограждение */
	public static final int  ENSUBST150_EXTERNALFENC_TYPE = 121;
	  //** Внешнее ограждение */
	public static final int  ENSUBST150_EXTERNALFENC = 122;

    //** тип Измерительные трансформаторы */
	public static final int ENSUBST150_TRANSFORMERMEASURE_TYPE = 123;
  //** Измерительные трансформаторы */
	public static final int ENSUBST150_TRANSFORMERMEASURE = 124;

	/** Арматура (ПЛ 35-150 кВ) */
	public static final int ARMATURE = 125;
	/** Грозотрос (ПЛ 35-150 кВ) */
	public static final int GROUND_WIRE = 126;
	/** Фундамент (ПЛ 35-150 кВ) */
	public static final int FOOTING = 127;

	/** Опора металева */
	public static final int METAL_POST = 128;

	/** коды типов объектов для которых не обрабатывать признак возможности генерить планы / акты **/
	public static final String SQL_NO_SELECTED_ELEMENT_TYPE_FOR_ACCESS = "4,7,8,13,18,19,20,23,27,28,29,30,31,34,35,36,37,38,39,40, "
			+ " 41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79, "
			+ " 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 99, 100 , 111 , 112 , 113 , 114 ,115,116,117,118,119,120,121,122,123,124,125,126,127,128";



    public int  code = Integer.MIN_VALUE;
    public String  name;
    public static final String tableName = "ENELEMENTTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENELEMENTTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENELEMENTTYPE.NAME";

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


} // end of ENElementTypeValueObject


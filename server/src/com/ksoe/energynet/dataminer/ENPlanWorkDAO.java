
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENDepartmentType;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.brief.ENMaterialsShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkBillingShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkShort;
import com.ksoe.energynet.valueobject.brief.ENServices2PlanShort;
import com.ksoe.energynet.valueobject.brief.ENTechCond2PlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENBindingOverFilter;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimePlanFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.ENMOL2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2PlanWorkReasonFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENRouteBytDetailFilter;
import com.ksoe.energynet.valueobject.filter.ENServices2PlanFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkBillingShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENServices2PlanShortList;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;
import com.ksoe.rqorder.logic.RQConsts;

  /**
  *  DAO Object for ENPlanWork;
  *
  */

public class ENPlanWorkDAO extends ENPlanWorkDAOGen {

	public ENPlanWorkDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENPlanWorkDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}



	public ENPlanWork getObjectNoRefNoSegr(int uid) throws PersistenceException {

		boolean noSegregation = true;
		boolean noReferences = true;

		ENPlanWork result = new ENPlanWork();
		result.code = uid;

		loadObject(result, noSegregation, noReferences);

		if (result.code == Integer.MIN_VALUE)
			return null;

		return result;
	}



  /**
   *
   * Выбрать планы, которые используют заданный FINMaterials
   *
   * @param mat FINMaterials
   * @param date Дата с которой выбирать планы
   * @param plans планы которые необходимо исключить, можно null - тогда никакой план не надо исключать
   * @return
   * @throws PersistenceException
   *
   * @author kreschishinma
   * @since 04.11.2016
   */
  public ENPlanWorkShortList getListOfPlansFINMaterialsIsUsed(FINMaterials mat, Date date, ENPlanWork[] plans) throws PersistenceException {
	  if(mat == null || date == null) throw new java.lang.IllegalArgumentException("mat and date can't be null");
	  boolean isPlanDefined = true;
	  if(plans == null) {
		  isPlanDefined = false;
	  } else {
		  isPlanDefined = true;
		  for(ENPlanWork plan : plans) {
			  /*Коды всех планов должны быть заполнены если был послан массив*/
			  if(plan == null || plan.code == Integer.MIN_VALUE) {
				  throw new EnergyproSystemException("plan is null");
			  }
		  }
	  }

	  String sql = String.format("select pw1.code from " +
			  "%s as ma1 " +
			  "inner join %s as es1 on ma1.%s = es1.%s " +
			  "inner join %s as pw1 on es1.%s = pw1.%s " +
			  "where  " +
			  "pw1.%s in (?,?) " +
			  "and ma1.%s = ? " +
			  " and pw1.%s >= ? " +
			  ((isPlanDefined) ? " and pw1." + ENPlanWork.code_Field + " not in (" + Tools.repeatSymbol("?", ",", plans.length)+ ") " : "") +
			  "and ma1.%s = ? " +
			  "and ma1.%s = ? " +
			  "and ma1.%s = ? " +
			  "and ma1.%s = ? " +
			  "and ma1.%s = ?", FINMaterials.tableName
			  , ENEstimateItem.tableName, FINMaterials.estimateItemRef_Field, ENEstimateItem.code_Field
			  , ENPlanWork.tableName, ENEstimateItem.planRef_Field, ENPlanWork.code_Field
			  , ENPlanWork.kind_Field
			  , FINMaterials.statusRef_Field
			  , ENPlanWork.dateFinal_Field
			  , FINMaterials.mat_id_Field
			  , FINMaterials.party_id_Field
			  , FINMaterials.rest_purpose_id_Field
			  , FINMaterials.div_code_Field
			  , FINMaterials.frc_code_Field);

	  Vector<Object> bindedObjects = new Vector<>();
	  bindedObjects.add(ENPlanWorkKind.NPW);
	  bindedObjects.add(ENPlanWorkKind.FACT);
	  bindedObjects.add(FINMaterialsStatus.GOOD);
	  bindedObjects.add(date);
	  if(isPlanDefined) {
		  for(ENPlanWork plan : plans) {
			  bindedObjects.add(plan.code);
		  }
	  }
	  bindedObjects.add(mat.mat_id);
	  bindedObjects.add(mat.party_id);
	  bindedObjects.add(mat.rest_purpose_id);
	  bindedObjects.add(mat.div_code);
	  bindedObjects.add(mat.frc_code);

	  List<Integer> listCodes = BaseDAOUtils.executeStatementAndReadObjects(this.getConnection(), sql, bindedObjects, new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
	  if(listCodes == null) listCodes = new ArrayList<>();
	  if(listCodes.size() == 0 )listCodes.add(-1);

	  ENPlanWorkFilter filter = new ENPlanWorkFilter();
	  filter.conditionSQL  = String.format("%s in (%s)", ENPlanWork.code_QFielld, Tools.repeatSymbol("?", ",", listCodes.size()));
	  Vector<Object> bindedObjectsWithCodes = new Vector<>();
	  for(Integer code : listCodes) {
		  bindedObjectsWithCodes.add(code);
	  }
	  return this.getScrollableFilteredList(filter, 0, -1, bindedObjectsWithCodes);
  }

  @Override
public void remove(int code) throws PersistenceException
  {

      // вынесем Время доставки
    ENDeliveryTimePlanDAO dtDAO = new ENDeliveryTimePlanDAO(getConnection(), getUserProfile());
    ENDeliveryTimePlanFilter f = new ENDeliveryTimePlanFilter();
    f.planWorkRef.code = code ;
    int arr[] = dtDAO.getFilteredCodeArray(f, null, null, 0, -1, null);
    for (int i = 0; i<arr.length; i++){
        dtDAO.remove(arr[i]);
    }

    // МОЛ на плане  .. для разнорядки
    ENMOL2PlanWorkDAO m2pDAO = new ENMOL2PlanWorkDAO(getConnection(), getUserProfile());
    ENMOL2PlanWorkFilter m2pFilter = new ENMOL2PlanWorkFilter();
    m2pFilter.planRef.code = code;
    int arrM2P[] = m2pDAO.getFilteredCodeArray(m2pFilter, null, null, 0, -1, null);
    for (int i=0; i < arrM2P.length; i++){
        m2pDAO.remove(arrM2P[i]);
    }



        ENPlanWork plan = getObject(code);

        // удалим предписание для этого плана ... был бы план - проверить на вид работ по предписанию
        if (plan.typeRef.code == ENPlanWorkType.PREDPISANIE){
            ENBindingOverFilter boFilter = new ENBindingOverFilter();
            boFilter.planRef.code = code;
            ENBindingOverDAO boDAO = new ENBindingOverDAO(getConnection(), getUserProfile());
            int[] boArr = boDAO.getFilteredCodeArray(boFilter,0,-1);
            for (int i=0; i < boArr.length; i++){
            boDAO.remove(boArr[i]);
            }
        }

        if ((plan.kind.code == ENPlanWorkKind.CURRENT) && (plan.formRef.code == ENPlanWorkForm.NOPLANNED))
        {
            ENPlanWork2PlanWorkReasonDAO p2prDAO = new ENPlanWork2PlanWorkReasonDAO(getConnection(), getUserProfile());
            ENPlanWork2PlanWorkReasonFilter p2prFilter = new ENPlanWork2PlanWorkReasonFilter();
            p2prFilter.planRef.code = plan.code;
            int[] p2prArr = p2prDAO.getFilteredCodeArray(p2prFilter, 0, -1);
            for (int i=0; i < p2prArr.length; i++){
                p2prDAO.remove(p2prArr[i]);
            }
        }

            /* 20.03.2012 +++ если план на договор по ТУ, удаляем связку "план - договор на ТУ" */
            ENTechCond2PlanWorkDAO ty2plDAO = new ENTechCond2PlanWorkDAO(getConnection(), getUserProfile());
        ENTechCond2PlanWorkFilter ty2plFilter = new ENTechCond2PlanWorkFilter();
        ty2plFilter.planRef.code = plan.code;
        int ty2plArr[] = ty2plDAO.getFilteredCodeArray(ty2plFilter, 0, -1);

        if (ty2plArr.length > 0) {
            for (int t = 0; t < ty2plArr.length; t++){
                ty2plDAO.remove(ty2plArr[t]);
            }
        }


        ENRouteBytDetailDAO rbdDAO = new ENRouteBytDetailDAO(getConnection(), getUserProfile());
        ENRouteBytDetailFilter rf = new ENRouteBytDetailFilter();
    rf.planRef.code = code ;
    int arrrd[] = rbdDAO.getFilteredCodeArray(rf, null, null, 0, -1, null);
    for (int i = 0; i<arrrd.length; i++){
        rbdDAO.remove(arrrd[i]);
    }

        super.remove(code);

        // вынесем Исполнителя ....
        /** выносить нельзя */
        /*
        if (plan.finExecutor != null){
            if (plan.finExecutor.code != Integer.MIN_VALUE){
                new FINExecutorDAO(getConnection(), getUserProfile()).remove(plan.finExecutor.code);
            }
        }
        */

  }



	public static final int[] closedDepartments = { 5, 4, 7, 12, 6, 14, 8, 18, 17, 9, 480, /*500000044,*/ 478, 11, 10, /*482,*/
			481, 479, 353, 243, 312, 259, 286, 114, 595, 483, 142, 560, 170, 530, 503, 195, 452, 425, 214, 500000045,
			760, 780, 505, 127, 144, 172, 197, 216, 245, 261, 288, 314, 355, 427, 454, 532, 562, 597, 506, 246, 787,
			484, 356, 139, 217, 262, 428, 289, 598, 198, 455, 591, 145, 173, 533, 789, 767, 354, 171, 196, 531, 504,
			287, 313, 244, 260, 561, 453, 215, 143, 596, 426, 115, 890, 362, 438, 230, 369, 300, 440, 577, 178, 785,
			576, 973, 975, 976, 514, 179, 803, 809, 224, 363, 295, 516, 786, 660, 903, 661, 904, 229, 222, 515, 202,
			294, 359, 537, 320, 155, 538, 765, 433, 250, 664, 251, 265, 321, 795, 120, 269, 221, 156, 434, 820, 435,
			766, 177, 176, 153, 298, 319, 897, 458, 126, 436, 360, 201, 264, 536, 249, 223, 764, 783, 788, 513, 794,
			977, 978, 979, 898, 299, 154, 432, 361, 574, 889, 601, 602, 971, 900, 563, 608, 580, 605, 328, 828, 805,
			821, 827, 826, 825, 823, 606, 604, 575, 578, 429, 579, 528, 241, 315, 258, 212, 284, 310, 193, 380, 450,
			471, 593, 168, 558, 140, 631, 508, 573, 698, 679, 905, 181, 437, 777, 695, 358, 220, 152, 117, 564, 200,
			534, 790, 263, 293, 763, 457, 431, 248, 512, 175, 782, 318, /*603,*/ 972, 901, 357, 791, 116, 174, 535, 218,
			761, 290, 199, 507, 247, 771, 150, 316, 781, 430, 456, 565, 902, 582, 133, 159, 185, 205, 232, 253, 275,
			302, 325, 371, 442, 463, 520, 550, 611, 762, 892, 893, 894, 891, 599, 370, 324, 301, 581, 549, 519, 462,
			441, 957, 231, 204, 184, 158, 128, 610, 274, 366, 906, 227, 122, 1028, 683, 704, 991, 993, 994, 995, 996,
			998, 999, 700, 707, 699, 728, 705, 697, 297, 592, 983, 724, 984, 517, 254, 255, 256, 257, 845, 637, 374,
			132, 278, 466, 162, 235, 585, 553, 305, 188, 208, 445, 523, 379, 590, 167, 240, 283, 640, 662, 134, 163,
			189, 209, 236, 944, 279, 306, 329, 375, 446, 467, 524, 554, 586, 138, 635, 620, 587, 280, 447, 330, 307,
			468, 525, 135, 190, 237, 164, 555, 638, 797, 948, 796, 276, 372, 443, 129, 233, 303, 160, 186, 326, 583,
			982, 206, 464, 551, 521, 1024, 723, 226, 130, 277, 234, 304, 327, 373, 444, 207, 465, 522, 552, 584, 187,
			161, 252, 180, 157, 203, 270, 271, 548, 985, 367, 296, 272, 364, 896, 365, 368, 518, 511, 510, 509, 568,
			539, 540, 544, 151, 291, 571, 570, 541, 572, 793, 542, 546, 567, 792, 569, 317, 545, 182, 292, 219, 543,
			566, 273, 123, 799, 1011, 1003, 1008, 1015, 1016, 1017, 1012, 1018, 1010, 1007, 1014, 874, 589, 557, 211,
			527, 449, 332, 309, 137, 282, 239, 378, 470, 192, 166, 322, 469, 588, 165, 448, 556, 331, 136, 308, 238,
			191, 526, 281, 210, 377, 266, 124, 125, 121, 895, 732, 736, 735, 645, 729, 643, 778, 641, 644, 642,

			500000142, 500000143, 500000144, 500000145, 500000146, 500000147, 500000281, 500000282, 500000283, 500000284,
			500000285, 500000286, 603, 500000148, 500000149, 500000150, 500000151, 500000152, 500000153, 500000154, 500000155,
			500000156, 500000157, 500000158, 500000159, 500000160, 500000161, 500000162, 500000163, 500000164, 500000165,
			500000166, 500000167, 500000168, 500000169, 500000170, 500000171, 500000172, 500000173, 500000174, 500000175,
			500000176, 500000177, 500000178, 500000179, 500000180, 500000181, 500000182, 500000183, 500000184, 500000185,
			500000186, 500000187, 500000188, 500000189, 500000190, 500000191, 500000192, 500000193, 500000194, 500000195,
			500000196, 500000197, 500000198, 500000199, 500000287, 500000288, 500000289, 500000290, 500000291, 500000292,
			500000293, 500000294, 500000295, 500000296, 500000297, 500000298, 500000299, 500000300, 500000301, 500000302,
			500000303, 500000304, 500000305, 500000306, 500000307, 500000308, 500000309, 500000310, 500000311, 500000312,
			500000313, 500000314, 500000315, 500000316, 500000317, 500000318, 500000319, 500000320, 500000321, 500000322,
			500000323, 500000324, 500000325, 500000326, 500000327, 500000328, 500000329, 500000330, 500000331, 500000332,
			500000333, 500000334, 500000335, 500000336, 500000337, 500000338, 500000339, 500000200, 500000201, 500000202,
			500000203, 500000204, 500000205, 500000340, 500000341, 500000342, 500000343, 500000344, 500000345, 500000346,
			500000347, 500000348, 500000349, 500000350, 500000351, 500000352, 500000353, 500000354, 500000355, 500000356,
			500000357, 500000358

	};



	public static boolean contains(final int[] array, final int v) {

		boolean result = false;

		for (int i : array) {
			if (i == v) {
				result = true;
				break;
			}
		}

		return result;
	}



	@Override
	public int add(ENPlanWork anObject) throws PersistenceException {

		anObject.dateEdit = new Date();
		anObject.userGen = getUserProfile().userName;
		anObject.dateGen = new java.util.Date();


		ENDepartmentDAO departmentDao = new ENDepartmentDAO(getConnection(), getUserProfile());

		if ( !getUserProfile().userName.equals("energynet") ) {

			if (contains(closedDepartments, anObject.departmentRef.code)) {

				ENDepartment department = departmentDao.getObject(anObject.departmentRef.code);

				throw new SystemException("Підрозділ " + department.name + " знаходиться в процесі розформування.\n"
						+ "Для планування оберіть інший підрозділ.");

			}
		}




		/** проверка корневого каталога */
		ENDepartmentFilter departmentFilter = new ENDepartmentFilter();
		departmentFilter.conditionSQL = " endepartment.code in ( "
				+ " select d.code from endepartment d "
				+ " where (d.typerefcode = " + ENDepartmentType.DIVISION + " or d.parentrefcode = " + ENDepartment.ENDEPARTMENT_HOE + " ) ) ";

		int[] dArr = departmentDao.getFilteredCodeArray(departmentFilter, 0, -1);
		if (dArr.length > 0) {
			if (contains(dArr, anObject.departmentRef.code)) {
				ENDepartment department = departmentDao.getObject(anObject.departmentRef.code);

				throw new SystemException(department.name + " не є підрозділом для планування.\n"
						+ "Оберіть інший підрозділ.");
			}
		}



		return super.add(anObject);
	}


	@Override
	public void save(ENPlanWork anObject) throws PersistenceException {

		anObject.dateEdit = new Date();
		anObject.userGen = getUserProfile().userName;

		if (anObject.typeRef.code == ENPlanWorkType.SALE_PRODUCTS
				&& anObject.stateRef.code == ENPlanWorkState.SALE_PRODUCTS) {
			anObject.kind.code = ENPlanWorkKind.SALE_SPECIFICATION;
		}

		ENPlanWork oldPlan = getObjectNoRefNoSegr(anObject.code);
		anObject.dateGen = oldPlan.dateGen;

		this.save(anObject, null);
	}



	@Override
	public void save(ENPlanWork anObject, String[] anAttributes) throws PersistenceException {

		if (anAttributes != null && anAttributes.length == 0)
			return;

		Connection connection = getConnection();

		try {
			PreparedStatement statement = null;

			ENPlanWork oldObject = new ENPlanWork();
			oldObject.code = anObject.code;

			String oldObjectSelectStr = "SELECT " + ENPlanWork.modify_time_Field + "," + ENPlanWork.domain_info_Field
					+ " FROM  ENPLANWORK WHERE CODE = ?";

			ResultSet set = null;
			try {
				statement = connection.prepareStatement(oldObjectSelectStr);
				statement.setInt(1, oldObject.code);
				set = statement.executeQuery();

				if (!set.next())
					throw new PersistenceException("Can't get old object.");
				oldObject.modify_time = set.getLong(1);

				if (set.wasNull())
					oldObject.modify_time = Long.MIN_VALUE;
				oldObject.domain_info = set.getString(2);

			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\nstatement - " + oldObjectSelectStr);
				EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			} finally {
				try {
					if (set != null)
						set.close();
				} catch (SQLException e) {
				}
				try {
					if (statement != null)
						statement.close();
				} catch (SQLException e) {
				}
				statement = null;
			}

			if (oldObject.modify_time != anObject.modify_time)
				throw new PersistenceException("Can't update object (optimistic locking).");

			anObject.modify_time = System.currentTimeMillis();

			if (anObject.getDomain_info() == null)
				anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

			String selectStr;

			Vector fields = null;
			if (anAttributes != null) {
				String fieldNameStr;
				fields = new Vector();
				for (int attrIndex = 0; attrIndex < anAttributes.length; attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DATEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("YEARGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("MONTHGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("YEARORIGINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("MONTHORIGINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DISTANCEALONG") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DISTANCETO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("WORKORDERNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DATEWORKORDER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("PRICONNECTIONNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DATEENDPRICONNECTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("INVESTWORKSAMOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("INVESTWORKSDESCRIPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("SERVICESFSIDEFINID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("SERVICESFSIDECNNUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("TOTALTIMEHOURS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("TOTALTIMEDAYS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DOMAIN_INFO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("STATUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("ELEMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("KIND") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("RENREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("FINEXECUTOR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("STATEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("FORMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("SOURCEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DDSCODES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("BUDGETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("RESPONSIBILITYREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("INVGROUPREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("INVESTITEMNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("IPIMPLEMENTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if (fieldNameStr.compareTo("CAUSEDISCONNECTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVESTDATESTARTWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVESTWORKMEASCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if (fields.size() == 0)
					return;
			}
			if (fields == null) {
				selectStr = "UPDATE ENPLANWORK SET  DATESTART = ? , DATEFINAL = ? , YEARGEN = ? , MONTHGEN = ? , YEARORIGINAL = ? , MONTHORIGINAL = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , DISTANCEALONG = ? , DISTANCETO = ? , WORKORDERNUMBER = ? , DATEWORKORDER = ? , PRICONNECTIONNUMBER = ? , DATEENDPRICONNECTION = ? , INVESTWORKSAMOUNT = ? , INVESTWORKSDESCRIPTION = ? , SERVICESFSIDEFINID = ? , SERVICESFSIDECNNUM = ? , TOTALTIMEHOURS = ? , TOTALTIMEDAYS = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , STATUSCODE = ? , ELEMENTREFCODE = ? , TYPEREFCODE = ? , KINDCODE = ? , RENREFCODE = ? , FINEXECUTORCODE = ? , STATEREFCODE = ? , FORMREFCODE = ? , SOURCEREFCODE = ? , DDSCODESCODE = ? , BUDGETREFCODE = ? , RESPONSIBILITYREFCODE = ? , DEPARTMENTREFCODE = ? , INVGROUPREFCODE = ? , INVESTITEMNUMBER = ? , IPIMPLEMENTTYPEREFCODE = ? , CAUSEDISCONNECTION = ?, INVESTDATESTARTWORK = ?, INVESTWORKMEASCODE = ?"
						+ " WHERE CODE = ?";
			}
			else {
				selectStr = "UPDATE ENPLANWORK SET ";
				for (int fldIndex = 0; fldIndex < fields.size(); fldIndex++) {
					selectStr += (String) fields.get(fldIndex);
					if (fldIndex > 0)
						selectStr += ",";
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;

			try {
				statement = connection.prepareStatement(selectStr);
				if (fields == null) {
					if (anObject.dateStart == null)
						statement.setDate(1, null);
					else
						statement.setDate(1, new java.sql.Date(anObject.dateStart.getTime()));
					if (anObject.dateFinal == null)
						statement.setDate(2, null);
					else
						statement.setDate(2, new java.sql.Date(anObject.dateFinal.getTime()));
					if (anObject.yearGen != Integer.MIN_VALUE)
						statement.setInt(3, anObject.yearGen);
					else
						statement.setNull(3, java.sql.Types.INTEGER);
					if (anObject.monthGen != Integer.MIN_VALUE)
						statement.setInt(4, anObject.monthGen);
					else
						statement.setNull(4, java.sql.Types.INTEGER);
					if (anObject.yearOriginal != Integer.MIN_VALUE)
						statement.setInt(5, anObject.yearOriginal);
					else
						statement.setNull(5, java.sql.Types.INTEGER);
					if (anObject.monthOriginal != Integer.MIN_VALUE)
						statement.setInt(6, anObject.monthOriginal);
					else
						statement.setNull(6, java.sql.Types.INTEGER);
					statement.setString(7, anObject.commentGen);
					statement.setString(8, anObject.userGen);
					if (anObject.dateEdit == null)
						statement.setDate(9, null);
					else
						statement.setDate(9, new java.sql.Date(anObject.dateEdit.getTime()));
					if (anObject.distanceAlong != null)
						anObject.distanceAlong = anObject.distanceAlong.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(10, anObject.distanceAlong);

					if (anObject.distanceTo != null)
						anObject.distanceTo = anObject.distanceTo.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(11, anObject.distanceTo);

					statement.setString(12, anObject.workOrderNumber);
					if (anObject.dateWorkOrder == null)
						statement.setDate(13, null);
					else
						statement.setDate(13, new java.sql.Date(anObject.dateWorkOrder.getTime()));
					statement.setString(14, anObject.priConnectionNumber);
					if (anObject.dateEndPriConnection == null)
						statement.setDate(15, null);
					else
						statement.setDate(15, new java.sql.Date(anObject.dateEndPriConnection.getTime()));
					if (anObject.investWorksAmount != null)
						anObject.investWorksAmount = anObject.investWorksAmount.setScale(3,
								java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(16, anObject.investWorksAmount);

					statement.setString(17, anObject.investWorksDescription);
					if (anObject.servicesFSideFinId != Integer.MIN_VALUE)
						statement.setInt(18, anObject.servicesFSideFinId);
					else
						statement.setNull(18, java.sql.Types.INTEGER);
					statement.setString(19, anObject.servicesFSideCnNum);
					if (anObject.totalTimeHours != null)
						anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,
								java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(20, anObject.totalTimeHours);

					if (anObject.totalTimeDays != null)
						anObject.totalTimeDays = anObject.totalTimeDays.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(21, anObject.totalTimeDays);

					statement.setString(22, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE)
						statement.setBigDecimal(23, null);
					else
						statement.setBigDecimal(23, new java.math.BigDecimal(anObject.modify_time));
					if (anObject.status.code != Integer.MIN_VALUE)
						statement.setInt(24, anObject.status.code);
					else
						statement.setNull(24, java.sql.Types.INTEGER);
					if (anObject.elementRef.code != Integer.MIN_VALUE)
						statement.setInt(25, anObject.elementRef.code);
					else
						statement.setNull(25, java.sql.Types.INTEGER);
					if (anObject.typeRef.code != Integer.MIN_VALUE)
						statement.setInt(26, anObject.typeRef.code);
					else
						statement.setNull(26, java.sql.Types.INTEGER);
					if (anObject.kind.code != Integer.MIN_VALUE)
						statement.setInt(27, anObject.kind.code);
					else
						statement.setNull(27, java.sql.Types.INTEGER);
					if (anObject.renRef.code != Integer.MIN_VALUE)
						statement.setInt(28, anObject.renRef.code);
					else
						statement.setNull(28, java.sql.Types.INTEGER);
					if (anObject.finExecutor.code != Integer.MIN_VALUE)
						statement.setInt(29, anObject.finExecutor.code);
					else
						statement.setNull(29, java.sql.Types.INTEGER);
					if (anObject.stateRef.code != Integer.MIN_VALUE)
						statement.setInt(30, anObject.stateRef.code);
					else
						statement.setNull(30, java.sql.Types.INTEGER);
					if (anObject.formRef.code != Integer.MIN_VALUE)
						statement.setInt(31, anObject.formRef.code);
					else
						statement.setNull(31, java.sql.Types.INTEGER);
					if (anObject.sourceRef.code != Integer.MIN_VALUE)
						statement.setInt(32, anObject.sourceRef.code);
					else
						statement.setNull(32, java.sql.Types.INTEGER);
					if (anObject.ddsCodes.code != Integer.MIN_VALUE)
						statement.setInt(33, anObject.ddsCodes.code);
					else
						statement.setNull(33, java.sql.Types.INTEGER);
					if (anObject.budgetRef.code != Integer.MIN_VALUE)
						statement.setInt(34, anObject.budgetRef.code);
					else
						statement.setNull(34, java.sql.Types.INTEGER);
					if (anObject.responsibilityRef.code != Integer.MIN_VALUE)
						statement.setInt(35, anObject.responsibilityRef.code);
					else
						statement.setNull(35, java.sql.Types.INTEGER);
					if (anObject.departmentRef.code != Integer.MIN_VALUE)
						statement.setInt(36, anObject.departmentRef.code);
					else
						statement.setNull(36, java.sql.Types.INTEGER);
					if (anObject.invgroupRef.code != Integer.MIN_VALUE)
						statement.setInt(37, anObject.invgroupRef.code);
					else
						statement.setNull(37, java.sql.Types.INTEGER);
					statement.setString(38, anObject.investItemNumber);
					if (anObject.ipImplementTypeRef.code != Integer.MIN_VALUE)
						statement.setInt(39, anObject.ipImplementTypeRef.code);
					else
						statement.setNull(39, java.sql.Types.INTEGER);
					if (anObject.causeDisconnection != Integer.MIN_VALUE)
						statement.setInt(40, anObject.causeDisconnection);
					else
						statement.setNull(40, java.sql.Types.INTEGER);

					if (anObject.investDateStartWork == null) {
						statement.setTimestamp(41, null);
					} else {
						statement.setTimestamp(41, new java.sql.Timestamp(anObject.investDateStartWork.getTime()));
					}

                   if (anObject.investWorkMeasCode != Integer.MIN_VALUE)
						statement.setInt(42, anObject.investWorkMeasCode);
					else
						statement.setNull(42, java.sql.Types.INTEGER);

					statement.setInt(43, anObject.code);
				} else {

					for (int i = 0; i < fields.size(); i++) {
						if ("DATESTART".compareTo((String) fields.get(i)) == 0) {
							if (anObject.dateStart == null)
								statement.setDate(i + 1, null);
							else
								statement.setDate(i + 1, new java.sql.Date(anObject.dateStart.getTime()));
							continue;
						}
						if ("DATEFINAL".compareTo((String) fields.get(i)) == 0) {
							if (anObject.dateFinal == null)
								statement.setDate(i + 1, null);
							else
								statement.setDate(i + 1, new java.sql.Date(anObject.dateFinal.getTime()));
							continue;
						}
						if ("YEARGEN".compareTo((String) fields.get(i)) == 0) {
							statement.setInt(i + 1, anObject.yearGen);
							continue;
						}
						if ("MONTHGEN".compareTo((String) fields.get(i)) == 0) {
							statement.setInt(i + 1, anObject.monthGen);
							continue;
						}
						if ("YEARORIGINAL".compareTo((String) fields.get(i)) == 0) {
							statement.setInt(i + 1, anObject.yearOriginal);
							continue;
						}
						if ("MONTHORIGINAL".compareTo((String) fields.get(i)) == 0) {
							statement.setInt(i + 1, anObject.monthOriginal);
							continue;
						}
						if ("COMMENTGEN".compareTo((String) fields.get(i)) == 0) {
							statement.setString(i + 1, anObject.commentGen);
							continue;
						}
						if ("USERGEN".compareTo((String) fields.get(i)) == 0) {
							statement.setString(i + 1, anObject.userGen);
							continue;
						}
						if ("DATEEDIT".compareTo((String) fields.get(i)) == 0) {
							if (anObject.dateEdit == null)
								statement.setDate(i + 1, null);
							else
								statement.setDate(i + 1, new java.sql.Date(anObject.dateEdit.getTime()));
							continue;
						}
						if ("DISTANCEALONG".compareTo((String) fields.get(i)) == 0) {
							if (anObject.distanceAlong != null)
								anObject.distanceAlong = anObject.distanceAlong.setScale(3,
										java.math.BigDecimal.ROUND_HALF_UP);
							statement.setBigDecimal(i + 1, anObject.distanceAlong);
							continue;
						}
						if ("DISTANCETO".compareTo((String) fields.get(i)) == 0) {
							if (anObject.distanceTo != null)
								anObject.distanceTo = anObject.distanceTo.setScale(3,
										java.math.BigDecimal.ROUND_HALF_UP);
							statement.setBigDecimal(i + 1, anObject.distanceTo);
							continue;
						}
						if ("WORKORDERNUMBER".compareTo((String) fields.get(i)) == 0) {
							statement.setString(i + 1, anObject.workOrderNumber);
							continue;
						}
						if ("DATEWORKORDER".compareTo((String) fields.get(i)) == 0) {
							if (anObject.dateWorkOrder == null)
								statement.setDate(i + 1, null);
							else
								statement.setDate(i + 1, new java.sql.Date(anObject.dateWorkOrder.getTime()));
							continue;
						}
						if ("PRICONNECTIONNUMBER".compareTo((String) fields.get(i)) == 0) {
							statement.setString(i + 1, anObject.priConnectionNumber);
							continue;
						}
						if ("DATEENDPRICONNECTION".compareTo((String) fields.get(i)) == 0) {
							if (anObject.dateEndPriConnection == null)
								statement.setDate(i + 1, null);
							else
								statement.setDate(i + 1, new java.sql.Date(anObject.dateEndPriConnection.getTime()));
							continue;
						}
						if ("INVESTWORKSAMOUNT".compareTo((String) fields.get(i)) == 0) {
							if (anObject.investWorksAmount != null)
								anObject.investWorksAmount = anObject.investWorksAmount.setScale(3,
										java.math.BigDecimal.ROUND_HALF_UP);
							statement.setBigDecimal(i + 1, anObject.investWorksAmount);
							continue;
						}
						if ("INVESTWORKSDESCRIPTION".compareTo((String) fields.get(i)) == 0) {
							statement.setString(i + 1, anObject.investWorksDescription);
							continue;
						}
						if ("SERVICESFSIDEFINID".compareTo((String) fields.get(i)) == 0) {
							statement.setInt(i + 1, anObject.servicesFSideFinId);
							continue;
						}
						if ("SERVICESFSIDECNNUM".compareTo((String) fields.get(i)) == 0) {
							statement.setString(i + 1, anObject.servicesFSideCnNum);
							continue;
						}
						if ("TOTALTIMEHOURS".compareTo((String) fields.get(i)) == 0) {
							if (anObject.totalTimeHours != null)
								anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,
										java.math.BigDecimal.ROUND_HALF_UP);
							statement.setBigDecimal(i + 1, anObject.totalTimeHours);
							continue;
						}
						if ("TOTALTIMEDAYS".compareTo((String) fields.get(i)) == 0) {
							if (anObject.totalTimeDays != null)
								anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,
										java.math.BigDecimal.ROUND_HALF_UP);
							statement.setBigDecimal(i + 1, anObject.totalTimeDays);
							continue;
						}
						if ("DOMAIN_INFO".compareTo((String) fields.get(i)) == 0) {
							statement.setString(i + 1, anObject.domain_info);
							continue;
						}
						if ("MODIFY_TIME".compareTo((String) fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE)
								statement.setBigDecimal(i + 1, null);
							else
								statement.setBigDecimal(i + 1, new java.math.BigDecimal(anObject.modify_time));
							continue;
						}
						if ("STATUS".compareTo((String) fields.get(i)) == 0) {
							if (anObject.status.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.status.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("ELEMENTREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.elementRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.elementRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("TYPEREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.typeRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.typeRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("KIND".compareTo((String) fields.get(i)) == 0) {
							if (anObject.kind.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.kind.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("RENREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.renRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.renRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("FINEXECUTOR".compareTo((String) fields.get(i)) == 0) {
							if (anObject.finExecutor.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.finExecutor.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("STATEREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.stateRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.stateRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("FORMREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.formRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.formRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("SOURCEREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.sourceRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.sourceRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("DDSCODES".compareTo((String) fields.get(i)) == 0) {
							if (anObject.ddsCodes.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.ddsCodes.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("BUDGETREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.budgetRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.budgetRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("RESPONSIBILITYREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.responsibilityRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.responsibilityRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("DEPARTMENTREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.departmentRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.departmentRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("INVGROUPREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.invgroupRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.invgroupRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("INVESTITEMNUMBER".compareTo((String) fields.get(i)) == 0) {
							statement.setString(i + 1, anObject.investItemNumber);
							continue;
						}
						if ("IPIMPLEMENTTYPEREF".compareTo((String) fields.get(i)) == 0) {
							if (anObject.ipImplementTypeRef.code != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.ipImplementTypeRef.code);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if ("CAUSEDISCONNECTION".compareTo((String) fields.get(i)) == 0) {
							if (anObject.causeDisconnection != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.causeDisconnection);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
						if("INVESTDATESTARTWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.investDateStartWork == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.investDateStartWork.getTime()));
							}
							continue;
						}
						if ("INVESTWORKMEASCODE".compareTo((String) fields.get(i)) == 0) {
							if (anObject.investWorkMeasCode != Integer.MIN_VALUE)
								statement.setInt(i + 1, anObject.investWorkMeasCode);
							else
								statement.setNull(i + 1, java.sql.Types.INTEGER);
							continue;
						}
					}
					statement.setInt(fields.size(), anObject.code);
				}

				statement.execute();

			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\nstatement - " + selectStr);
				EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			} finally {
				try {
					if (statement != null)
						statement.close();
				} catch (SQLException e) {
				}
			}
		} finally {
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	} // end of save(ENPlanWork anObject,String[] anAttributes)



  public ENMaterialsShortList getMaterialsList(ENPlanWorkFilter aFilterObject, int tkMaterialCode)throws PersistenceException
  {
    return getMaterialsList(aFilterObject, tkMaterialCode, "");
  }

  public ENMaterialsShortList getMaterialsList(ENPlanWorkFilter aFilterObject, int tkMaterialCode, String strCodes)throws PersistenceException
  {
    return getMaterialsList(aFilterObject, " and ei.statusrefcode = "+ ENEstimateItemStatus.PLANNED + " and ei.kindrefcode <> " + ENEstimateItemKind.UNMOUNT , tkMaterialCode, strCodes);
  }

  public ENMaterialsShortList getMaterialsList(ENPlanWorkFilter aFilterObject, String materialCondition, int tkMaterialCode) throws PersistenceException
  {
    return getMaterialsList( aFilterObject, materialCondition, tkMaterialCode, "");
  }


  public ENMaterialsShortList getMaterialsList(ENPlanWorkFilter aFilterObject, String materialCondition, int tkMaterialCode, String strCodes)throws PersistenceException
  {
    ENMaterialsShortList result = new ENMaterialsShortList();
    ENMaterialsShort anObject;
    result.list = new Vector();

    String     condition = "";
    String     orderBy = "";

//    if (aFilterObject != null){
        //condition =  aFilterObject.conditionSQL;
        //orderBy = aFilterObject.orderBySQL;
    //}

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    condition = processCondition(condition);
    orderBy = processCondition(orderBy);


    /**
        *  список материалов для заявки
        *  заходит в фильтре плана
        *  для самих планов - очистить conditionSQL
        *
        * */

    String estimateCodes = "";
    if(strCodes.length() != 0) {
        if (aFilterObject.code == Integer.MIN_VALUE)
            throw new EnergyproSystemException("Bad call of getMaterialsList!");

        estimateCodes = " and ei.code in (" + strCodes + ")";

        aFilterObject.conditionSQL = "";
    }



    //ENPlanWorkFilter planFilter = aFilterObject;
    //planFilter.conditionSQL = "";

    int[] planArr = getFilteredCodeArray(aFilterObject, 0, -1);
    String planCodes = "";
    for (int i = 0; i < planArr.length; i++){
        if (planCodes.length() == 0){
            planCodes = "" + planArr[i];
        }
        else
        {
            planCodes = planCodes + ", " + planArr[i];
        }
    }
    if ( planCodes.length() == 0){
        planCodes = "-1";
    }

    String materialsSQL = "";
    String materialsSQL2 = "";

    if ((materialCondition != null)|| (materialCondition.length() > 0)){
        materialsSQL2 = materialCondition;
    }

    if (tkMaterialCode != Integer.MIN_VALUE){
        materialsSQL = " and ei.materialrefcode = " + tkMaterialCode;
    }


    selectStr =
        " select  " +
        "   materialcode, " +
        "   materialname,  " +
        "   measurementname,  " +
        "   sum(countfact) as countfact, " +
        "   price, " +
        "   sum(cost) as cost, " +
        "   deliverydate  , " +
        "   purchaseitemrefcode " +
        " from " +
        " ( " +
        " select  " +
        "   m.code as materialcode, " +
        "   m.name as materialname,  " +
        "   ms.name as measurementname,  " +
        "   ei.countfact, " +
        "   m.cost as price, " +
        "   coalesce((m.cost * ei.countfact), 0) as cost, " +
       // "   m.deliverydate " + 13.01.2015 SUPP-28271 сроки поставки также должны быть и для неплановых заявок
       /* 30.01.2012 +++ для услуг 30 дней - для материала 60 */
        " coalesce(ei.deliverytime, coalesce(m.deliverydate," + RQConsts.DELIVERY_TIME  + ")) as deliverydate " +

        /// Код строки плана закупки в которой сидит естимейт
        // "  /* Код строки плана закупки в которой сидит естимейт*/ \n" +
        // " ,  ( select pi2ei.purchaseitemrefcode \n" +
        // " from rqpurchaseitem2estmttm pi2ei  , rqpurchaseitem pi , rqplanpurchase p \n" +
        // " where pi2ei.estimateitemrefcode =  ei.code  \n" +
        // " and pi2ei.purchaseitemrefcode = pi.code  \n" +
        // " and p.code = pi.purchaserefcode \n" +
        // " and p.yeargen = ( select pp.yeargen from enestimateitem eii , enplanwork pp where eii.planrefcode = pp.code and eii.code = ei.code )) as purchaseitemrefcode \n" +

        " , ei.purchaseitemrefcode as purchaseitemrefcode " +

        " from enestimateitem ei, tkmaterials m, tkmeasurement ms " +
        " where ei.materialrefcode = m.code " +
        "   and m.measurementcode = ms.code " +
           estimateCodes +
           "   and ei.countfact > 0 " +
        materialsSQL +
        //"   and ei.statusrefcode in ( "+ ENEstimateItemStatus.TEMP +","+ ENEstimateItemStatus.PLANNED +") " +
        materialsSQL2 +
        "   and ei.planrefcode in  " +
        "   ( " + planCodes + ") " +

        /** 26.12.2013 +++ лист не только для заявки!!! используется и для приходов/расходов... */
        // " and ei.code not in (select eee.estimateitemcode from rqorderitem2enestimttm eee where eee.estimateitemcode = ei.code ) " + // 25.12.2013 добавим на верочку проверку что бы естимейт не был в заявках

        " ) q " +
        " group by " +
        "   materialcode, " +
        "   materialname,  " +
        "   measurementname,  " +
        "   price, " +
        "   deliverydate  , " +
        "   purchaseitemrefcode " +
        " order by materialname " ;

    try
        {
        statement = connection.prepareStatement(selectStr);
        set = statement.executeQuery();
        int i;
        for(i = 0;set.next();i++)
        {

        anObject = new ENMaterialsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.measurementName = set.getString(3);
        anObject.countFact = set.getBigDecimal(4);
        if (anObject.countFact != null){
            anObject.countFact = anObject.countFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
        }

        anObject.cost = set.getBigDecimal(5);
        if (anObject.cost != null){
            anObject.cost = anObject.cost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
        }

        anObject.sumCost = set.getBigDecimal(6);
        if (anObject.sumCost != null){
            anObject.sumCost = anObject.sumCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
        }

        anObject.deliveryDate = set.getInt(7);

        anObject.purchaseItemRefCode = set.getInt(8);
        if ( set.wasNull() )
            anObject.purchaseItemRefCode = Integer.MIN_VALUE;


        result.list.add(anObject);
        }


        result.setTotalCount(i);
        return result;
        }
    catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return null;
        }
    finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
        try{connection.close();} catch(SQLException e){}
        }
        }
  }

  ///

  public ENMaterialsShortList getMaterialsList(String planCodes, String estimateItemCodes) throws PersistenceException
  {
    ENMaterialsShortList result = new ENMaterialsShortList();
    ENMaterialsShort anObject;
    result.list = new Vector();

    String     condition = "";
    String     orderBy = "";

//    if (aFilterObject != null){
        //condition =  aFilterObject.conditionSQL;
        //orderBy = aFilterObject.orderBySQL;
    //}

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    condition = processCondition(condition);
    orderBy = processCondition(orderBy);

    selectStr =
        " select  " +
        "   materialcode, " +
        "   materialname,  " +
        "   measurementname,  " +
        "   sum(countfact) as countfact, " +
        "   price, " +
        "   sum(cost) as cost, " +
        "   deliverydate " +
        " from " +
        " ( " +
        " select  " +
        "   m.code as materialcode, " +
        "   m.name as materialname,  " +
        "   ms.name as measurementname,  " +
        "   ei.countfact, " +
        "   m.cost as price, " +
        "   coalesce((m.cost * ei.countfact), 0) as cost, " +
        "   m.deliverydate " +
        " from enestimateitem ei, tkmaterials m, tkmeasurement ms " +
        " where ei.materialrefcode = m.code " +
        "   and m.measurementcode = ms.code " +
        "   and ei.code in (" + estimateItemCodes + ")" +
        "   and ei.countfact > 0 " +
        "   and ei.planrefcode in  " +
        "   ( " + planCodes + ") " +

        " ) q " +
        " group by " +
        "   materialcode, " +
        "   materialname,  " +
        "   measurementname,  " +
        "   price, " +
        "   deliverydate " +
        " order by materialname " ;

    try
    {
        statement = connection.prepareStatement(selectStr);
        set = statement.executeQuery();
        int i;
        for(i = 0; set.next(); i++)
        {
	        anObject = new ENMaterialsShort();

	        anObject.code = set.getInt(1);
	        if ( set.wasNull() )
	            anObject.code = Integer.MIN_VALUE;
	        anObject.name = set.getString(2);
	        anObject.measurementName = set.getString(3);
	        anObject.countFact = set.getBigDecimal(4);
	        if (anObject.countFact != null){
	            anObject.countFact = anObject.countFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
	        }

	        anObject.cost = set.getBigDecimal(5);
	        if (anObject.cost != null){
	            anObject.cost = anObject.cost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
	        }

	        anObject.sumCost = set.getBigDecimal(6);
	        if (anObject.sumCost != null){
	            anObject.sumCost = anObject.sumCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
	        }

	        anObject.deliveryDate = set.getInt(7);

            result.list.add(anObject);
        }

        result.setTotalCount(i);
        return result;
    }
    catch(SQLException e)
    {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return null;
    }
    finally
    {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
        try{connection.close();} catch(SQLException e){}
        }
    }
  }


    public ENMaterialsShortList getServicesList(ENPlanWorkFilter aFilterObject,
            int tkMaterialCode) throws PersistenceException {
        return getServicesList(aFilterObject, tkMaterialCode, "");
    }

  public ENMaterialsShortList getServicesList(ENPlanWorkFilter aFilterObject, int tkMaterialCode, String strCodes) throws PersistenceException
  {
    ENMaterialsShortList result = new ENMaterialsShortList();
    ENMaterialsShort anObject;
    result.list = new Vector();

    String     condition = "";
    String     orderBy = "";

//    if (aFilterObject != null){
        //condition =  aFilterObject.conditionSQL;
        //orderBy = aFilterObject.orderBySQL;
    //}

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    condition = processCondition(condition);
    orderBy = processCondition(orderBy);


    /**
        *  список материалов для заявки
        *  заходит в фильтре плана
        *  для самих планов - очистить conditionSQL
        *
        * */

    String estimateCodes = "";
    if(strCodes.length() != 0) {
        if (aFilterObject.code == Integer.MIN_VALUE)
            throw new EnergyproSystemException("Bad call of getServicesList!");

        estimateCodes = " and ei.code in (" + strCodes + ")";

        aFilterObject.conditionSQL = "";
    }

    //ENPlanWorkFilter planFilter = aFilterObject;
    //planFilter.conditionSQL = "";

    int[] planArr = getFilteredCodeArray(aFilterObject, 0, -1);
    String planCodes = "";
    for (int i = 0; i < planArr.length; i++){
        if (planCodes.length() == 0){
            planCodes = "" + planArr[i];
        }
        else
        {
            planCodes = planCodes + ", " + planArr[i];
        }
    }
    if ( planCodes.length() == 0){
        planCodes = "-1";
    }

    String materialsSQL = "";
    String materialsSQL2 = "";


    if (tkMaterialCode != Integer.MIN_VALUE){
        materialsSQL = " and ei.materialrefcode = " + tkMaterialCode;
    }


    selectStr =
        " select  " +
        "   materialcode, " +
        "   materialname,  " +
        "   measurementname,  " +
        "   sum(countfact) as countfact, " +
        "   price, " +
        "   sum(cost) as cost, " +
        "   deliverydate " +
        " from " +
        " ( " +
        " select  " +
        "   m.code as materialcode, " +
        "   m.name as materialname,  " +
        "   ms.name as measurementname,  " +
        "   ei.countfact, " +
        "   ei.cost as price, " +
        estimateCodes +
        "   coalesce(ei.cost, 0) as cost, " +
        "   m.deliverydate " +
        " from enestimateitem ei, tkmaterials m, tkmeasurement ms " +
        " where ei.materialrefcode = m.code " +
        "   and m.measurementcode = ms.code " +
        "   and ei.countfact > 0 " +
        materialsSQL +
        "   and ei.kindrefcode =  " + ENEstimateItemKind.SERVICES +
        materialsSQL2 +
        "   and ei.planrefcode in  " +
        "   ( " + planCodes + ") " +
        "    and ei.code not in (select eee.estimateitemcode from rqorderitem2enestimttm eee where eee.estimateitemcode = ei.code ) " + // 25.12.2013 нельзя же поидее делать на естимейт который уже заказан еще одну заявку
        " ) q " +
        " group by " +
        "   materialcode, " +
        "   materialname,  " +
        "   measurementname,  " +
        "   price, " +
        "   deliverydate " +
        " order by materialname " ;

    try
        {
        statement = connection.prepareStatement(selectStr);
        set = statement.executeQuery();
        int i;
        for(i = 0;set.next();i++)
        {

        anObject = new ENMaterialsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.measurementName = set.getString(3);
        anObject.countFact = set.getBigDecimal(4);
        if (anObject.countFact != null){
            anObject.countFact = anObject.countFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
        }

        anObject.cost = set.getBigDecimal(5);
        if (anObject.cost != null){
            anObject.cost = anObject.cost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
        }

        anObject.sumCost = set.getBigDecimal(6);
        if (anObject.sumCost != null){
            anObject.sumCost = anObject.sumCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
        }

        anObject.deliveryDate = set.getInt(7);

            result.list.add(anObject);
        }


        result.setTotalCount(i);
        return result;
        }
    catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return null;
        }
    finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
        try{connection.close();} catch(SQLException e){}
        }
        }
  }

  ///

  @Override
public ENPlanWorkShortList getScrollableFilteredList(ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENPlanWorkShortList result = new ENPlanWorkShortList();
   ENPlanWorkShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);


    if (anCondition != null && anCondition.equals("( statuscode <> 6)")) {
        throw new PersistenceException("\n\n"+
                "Ошибка при определении условия поиска планов!!!");
    }

   if(orderBy.length() == 0)
    orderBy = "ENPLANWORK.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENPLANWORK.CODE"+
    ",ENPLANWORK.DATEGEN"+
    ",ENPLANWORK.USERGEN"+
    ",ENPLANWORK.DATEEDIT"+

     ", ENPLANWORKSTATUS.CODE " +
     ", ENPLANWORKSTATUS.NAME " +

     /*
     ",  case when (ENELEMENTDATA.ETYPE in (7,8) " +
     "   and ENPLANWORK.MONTHORIGINAL is not null " +
     " and ENPLANWORK.kindcode=2 " +
     " and ENPLANWORK.code not in ( " +
     " select planoldrefcode from enplancorrecthistory "+
     " where planoldrefcode=ENPLANWORK.code "+
     " and reasoncode=4) "+

     ") then 'Перенесений' else ENPLANWORKSTATUS.NAME end " +
     */

     //", ENELEMENTDATA.ECODE " +
     ", (select ENELEMENTDATA.ECODE from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

    /*
        ", ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) " +
            " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )" +
            " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) " +
            " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) " +
            " end " +
            ") as objname " +
*/", null as objname"+
            ",ENPLANWORK.YEARGEN"+
            ",ENPLANWORK.MONTHGEN"+
            ", ENPLANWORKTYPE.CODE " +
            ", ENPLANWORKTYPE.NAME " +
            ", EPREN.CODE, EPREN.NAME "+
            ", ENPLANWORK.BUDGETREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE) " +
            ", ENPLANWORK.RESPONSIBILITYREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE) " +
            ", ENPLANWORK.DEPARTMENTREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE) " +
            ", ENPLANWORK.DATESTART "+
              ",ENPLANWORK.DATEFINAL"+
              ", ENPLANWORKKIND.CODE " +
              ", ENPLANWORKKIND.NAME " +

              //", ENELEMENTDATA.ENAME " +
              ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) as objectname " +

              ",ENPLANWORK.STATEREFCODE "+

              //", ENELEMENTDATA.INVNUMBER " +
              // NET-4383 -- для планов с типом акта списание ОС в листе планов инвентарный номер будем брать с enplanworkenact2osdata
              ", case when ENPLANWORKSTATE.CODE = "+ ENPlanWorkState.WRITINGS_OS+ " then ( select  qqq.kod_inv from enplanworkenact2osdata qqq where qqq.planworkrefcode = ENPLANWORK.CODE )" +
               " else (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) end as invnumber " +

              ", ENPLANWORKSTATE.NAME as STATENAME " +
              ", ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME "+
              ", ENWORKORDER.WORKORDERNUMBER " +

              ", FINEXECUTOR.CODE " +
              ", FINEXECUTOR.NAME " +
              ", FINEXECUTOR.FINCODE " +
              ", FINEXECUTOR.FINTYPENAME " +
              ", FINEXECUTOR.FINTYPECODE " +
              ", FINEXECUTOR.FINKINDNAME " +
              ", FINEXECUTOR.FINKINDCODE " +
              ", FINEXECUTOR.FINCEHNAME " +
              ", FINEXECUTOR.FINCEHCODE " +
              ", ENWORKORDER.CODE " +
              ", ENPLANWORKFORM.CODE " +
              ", ENPLANWORKFORM.NAME " +
              ", ENPLANWORK.YEARORIGINAL " +
              ", ENPLANWORK.MONTHORIGINAL " +

              ", ENPLANWORKSOURCE.CODE " +
              ", ENPLANWORKSOURCE.NAME " +
              ", (select g.code from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
              ", (select g.name from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
              ", ENPLANWORK.INVESTWORKSDESCRIPTION " +

      ", (select ENIPIMPLEMENTATIONTYPE.CODE from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +
      ", (select ENIPIMPLEMENTATIONTYPE.NAME from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +

      ", case when ENPLANWORK.kindcode in (1,2) then (select sum( (ei.countfact*m.cost)::numeric(15,2)) " +
      " from enestimateitem ei, tkmaterials m " +
      " where ei.statusrefcode = 1 " +
      " and ei.planrefcode = ENPLANWORK.code " +
      " and ei.materialrefcode = m.code"  +
      " and ei.kindrefcode = 1) end as planedSum" +

      ", (select sum(pi.timegen) from enplanworkitem pi where pi.planrefcode = enplanwork.code) as humanHours " +

      //SUPP-69417 Комплектація матеріалами % (Если задание-план и  если на плане есть обязательные материалы тогда покажем процент укомплектованности ) иначе пусто выводим
      //SUPP-97032 для інвестпрограми будем выводить процент выполнения плана, если он есть

     " , case when ENPLANWORK.kindcode = " + ENPlanWorkKind.NPW + " then (select * from get_percent_manning_with_materials(ENPLANWORK.code) ) " +
		   " when ENPLANWORK.kindcode = " + ENPlanWorkKind.CURRENT + " and ENPLANWORK.typerefcode in  (19,20) " +
		   " then coalesce((select coalesce(xqtn.executionpercent::text,'') from  \n" +
		   " enplanxqtnhistory xqtn\n" +
		   " where xqtn.planrefcode = ENPLANWORK.code\n" +
		   " order by xqtn.dategen desc\n" +
		   " LIMIT 1),'') " +
		   " else '' end as percent_manning_with_materials  " +

   /* Забезпечення транспортом % */
	 " , case when (select count(tord.code) from entransportorder tord where tord.planrefcode = ENPLANWORK.CODE  ) > 0 \n" +
	 "     then (select \n" +
	 " 			case when  (q.all_cnt = 0) then 0 else \n" +
	 " 			q.worked_cnt/q.all_cnt*100  end::numeric(15,2) from \n" +
	 " 			( \n" +
	 " 			select \n" +
	 " 			coalesce((select count(t.code) from entransportorder t \n" +
	 " 			where t.planrefcode = p.code \n" +
	 " 			and t.transportorderstatuscd in (2,3)),0)::numeric(15,2) as worked_cnt, \n" +
	 " 			coalesce((select count(t.code) from entransportorder t \n" +
	 " 			where t.planrefcode = p.code),0)::numeric(15,2) as all_cnt \n" +
	 " 			from enplanwork p \n" +
	 " 			where p.code = ENPLANWORK.CODE \n" +
	 " 			) as q \n" +
	 "        )::varchar \n" +
	 "      else '' \n" +
	 " end       \n" +
	 " as  percent_manning_with_transport \n" +
	 " , (select 'акт № '||a.numbergen||', от '||to_char(a.dateact,'dd.MM.yyyy') from enact a " +
     " where a.code = (select a2p.actrefcode from enact2enplanwork a2p where a2p.plancode = enplanwork.code)) as actinfo " +
	 " , ENPLANWORK.SERVICESFSIDEFINID" +
	 " , ENPLANWORK.SERVICESFSIDECNNUM"+
     " FROM ENPLANWORK  " +

    "left join FINEXECUTOR on FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE " +
    "left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
    "left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +


    ", ENPLANWORKSTATUS " +
    //", ENELEMENT " +
    ", ENPLANWORKTYPE " +
    ", EPREN " +
    ", ENPLANWORKKIND " +
    ", ENPLANWORKSTATE " +
    ", ENPLANWORKFORM " +

    ", ENPLANWORKSOURCE " +

    //", ENWORKORDER, ENWORKORDER2ENPLANWORK " +
    //", ENELEMENTDATA " +
    //" WHERE "
    "";

    whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE" ; //+


     //whereStr = whereStr +" AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.RENREFCODE = EPREN.CODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE" ; //+

     whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE" ;

     whereStr = whereStr +" AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE" ; //+

     //уехало в лефт джойн whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " ; //+
     //whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " ; //+

     // whereStr = whereStr + " AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE ";
        //selectStr = selectStr + " ${s} ENPLANWORK.CODE IN ( SELECT ENPLANWORK.CODE FROM ENPLANWORK ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.CODE = ?";
       }
       if(aFilterObject.dateGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
       }
       if(aFilterObject.yearGen != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
       }
       if(aFilterObject.monthGen != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
            else
                whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
       }
       if(aFilterObject.status.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
       }
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
       }
       if(aFilterObject.dateStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
       }
       if(aFilterObject.dateFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
       }
       if(aFilterObject.kind.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
       }
       if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
       }
       if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
       }

       if (aFilterObject.commentGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
       }

       if (aFilterObject.priConnectionNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
       }

       if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
       }

       if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
       }
       if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.IPIMPLEMENTTYPEREFCODE = ? ";
       }
       if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
       }
       if(aFilterObject.servicesFSideFinId != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDEFINID = ?";
       }
       if (aFilterObject.servicesFSideCnNum != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.servicesFSideCnNum.indexOf('*',0) < 0 && aFilterObject.servicesFSideCnNum.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDECNNUM = ?";
           else
               whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDECNNUM LIKE ?";
       }
     }


   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENPlanWork.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENPLANWORK.DOMAIN_INFO IS NOT NULL";
   //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE" + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   selectStr = selectStr + " OFFSET " + fromPosition;
   if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
       if(aFilterObject.dateGen != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
       }
        if(aFilterObject.yearGen != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.yearGen);
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.monthGen);
        }

          if(aFilterObject.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }


          if(aFilterObject.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }


          if(aFilterObject.domain_info != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.domain_info);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.status.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.status.code);
      }
      if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.elementRef.code);
      }
      if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.renRef.code);
      }
      if(aFilterObject.dateStart != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
      }
      if(aFilterObject.dateFinal != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
      }
      if(aFilterObject.kind.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.kind.code);
      }
      if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.budgetRef.code);
      }
      if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.responsibilityRef.code);
      }
      if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.departmentRef.code);
      }
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }
      if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.stateRef.code);
      }

      if(aFilterObject.priConnectionNumber != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.priConnectionNumber);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }

      if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.formRef.code);
      }

      if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.sourceRef.code);
      }
      if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.ipImplementTypeRef.code);
      }
      if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.causeDisconnection);
      }

      if(aFilterObject.servicesFSideFinId != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.servicesFSideFinId);
      }

      if(aFilterObject.servicesFSideCnNum != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.servicesFSideCnNum);
          for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }
     }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     //ElementLogic elementLogic = new ElementLogic(getConnection(), getUserProfile());

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {

       /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new ENPlanWorkShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.dateGen = set.getTimestamp(2); // NET-4213
       anObject.userGen = set.getString(3);
       anObject.dateEdit = set.getDate(4);


       anObject.statusCode = set.getInt(5);

       anObject.statusName = set.getString(6);

       anObject.elementRefCode = set.getInt(7);

       //anObject.objectName = set.getString(8);
       // оптимизировано вьюхой ENELEMENTDATA !!!
       //anObject.objectName = elementLogic.getNameByCode(anObject.elementRefCode)[0] ;

       anObject.yearGen = set.getInt(9);
       if ( set.wasNull() )
           anObject.yearGen = Integer.MIN_VALUE;
       anObject.monthGen = set.getInt(10);
       if ( set.wasNull() )
           anObject.monthGen = Integer.MIN_VALUE;

       anObject.typeRefCode = set.getInt(11);

       anObject.typeRefName = set.getString(12);

       anObject.renRefCode = set.getInt(13);
       anObject.renRefName = set.getString(14);

       anObject.budgetRefCode = set.getInt(15);
       anObject.budgetRefShortName = set.getString(16);

       anObject.responsibilityRefCode = set.getInt(17);
       anObject.responsibilityRefShortName = set.getString(18);

       anObject.departmentRefCode = set.getInt(19);
       anObject.departmentRefShortName = set.getString(20);

       anObject.dateStart = set.getDate(21);
       anObject.dateFinal = set.getDate(22);

       anObject.kindCode = set.getInt(23);

       anObject.kindName = set.getString(24);

       anObject.objectName = set.getString(25);
       anObject.stateRefCode = set.getInt(26);

       anObject.invNumber = set.getString(27);

       anObject.stateRefName = set.getString("STATENAME");
       anObject.stateRefShortName = set.getString("STATESHORTNAME");

       anObject.workOrderNumber = set.getString("WORKORDERNUMBER");

       anObject.finExecutorCode = set.getInt(31);
       if ( set.wasNull() )
        anObject.finExecutorCode = Integer.MIN_VALUE;

       anObject.finExecutorName = set.getString(32);

       anObject.finExecutorFinCode = set.getInt(33);
       if ( set.wasNull() )
        anObject.finExecutorFinCode = Integer.MIN_VALUE;

       anObject.finExecutorFinTypeName = set.getString(34);

       anObject.finExecutorFinTypeCode = set.getInt(35);
       if ( set.wasNull() )
        anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;

       anObject.finExecutorFinKindName = set.getString(36);

       anObject.finExecutorFinKindCode = set.getInt(37);
       if ( set.wasNull() )
        anObject.finExecutorFinKindCode = Integer.MIN_VALUE;

       anObject.finExecutorFinCehName = set.getString(38);

       anObject.finExecutorFinCehCode = set.getInt(39);
       if ( set.wasNull() )
        anObject.finExecutorFinCehCode = Integer.MIN_VALUE;


       anObject.workOrderCode = set.getInt(40);
       if ( set.wasNull() )
        anObject.workOrderCode = Integer.MIN_VALUE;

       anObject.formRefCode = set.getInt(41);
       if ( set.wasNull() )
        anObject.formRefCode = Integer.MIN_VALUE;

       anObject.formRefName = set.getString(42);

       anObject.yearOriginal = set.getInt(43);
       if ( set.wasNull() )
           anObject.yearOriginal = Integer.MIN_VALUE;
       anObject.monthOriginal = set.getInt(44);
       if ( set.wasNull() )
           anObject.monthOriginal = Integer.MIN_VALUE;

       anObject.sourceRefCode = set.getInt(45);
        if(set.wasNull())
        anObject.sourceRefCode = Integer.MIN_VALUE;
       anObject.sourceRefName = set.getString(46);

       anObject.invgroupRefCode = set.getInt(47);
        if(set.wasNull())
        anObject.invgroupRefCode = Integer.MIN_VALUE;
       anObject.invgroupRefName = set.getString(48);

       anObject.investWorksDescription = set.getString(49);

       anObject.ipImplementTypeRefCode = set.getInt(50);
       if(set.wasNull())
    	   anObject.ipImplementTypeRefCode = Integer.MIN_VALUE;
       anObject.ipImplementTypeRefName = set.getString(51);

       anObject.planedSum = set.getBigDecimal(52);
       	if (anObject.planedSum != null)
       		anObject.planedSum = anObject.planedSum.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);


        anObject.humanHours = set.getBigDecimal(53);
       	if (anObject.humanHours != null)
       		anObject.humanHours = anObject.humanHours.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);


       	anObject.percentManningWithMaterials = set.getString(54);
       	anObject.percentManningWithTransport = set.getString(55);

       	anObject.actInfo = set.getString(56);

        anObject.servicesFSideFinId = set.getInt("SERVICESFSIDEFINID");
        if ( set.wasNull() )
           anObject.servicesFSideFinId = Integer.MIN_VALUE;
        anObject.servicesFSideCnNum = set.getString("SERVICESFSIDECNNUM");



       	result.list.add(anObject);
      }


     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

/* для услуг со стороны , с инфо по ОЗ и разпоряжениям
 * */
  public ENPlanWorkShortList getScrollableFilteredListServicesFromSide(ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENPlanWorkShortList result = new ENPlanWorkShortList();
     ENPlanWorkShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);


      if (anCondition != null && anCondition.equals("( statuscode <> 6)")) {
          throw new PersistenceException("\n\n"+
                  "Ошибка при определении условия поиска планов!!!");
      }

     if(orderBy.length() == 0)
      orderBy = "ENPLANWORK.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENPLANWORK.CODE"+
      ",ENPLANWORK.DATEGEN"+
      ",ENPLANWORK.USERGEN"+
      ",ENPLANWORK.DATEEDIT"+

       ", ENPLANWORKSTATUS.CODE " +
       ", ENPLANWORKSTATUS.NAME " +

       /*
       ",  case when (ENELEMENTDATA.ETYPE in (7,8) " +
       "   and ENPLANWORK.MONTHORIGINAL is not null " +
       " and ENPLANWORK.kindcode=2 " +
       " and ENPLANWORK.code not in ( " +
       " select planoldrefcode from enplancorrecthistory "+
       " where planoldrefcode=ENPLANWORK.code "+
       " and reasoncode=4) "+

       ") then 'Перенесений' else ENPLANWORKSTATUS.NAME end " +
       */

       //", ENELEMENTDATA.ECODE " +
       ", (select ENELEMENTDATA.ECODE from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

      /*
          ", ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) " +
              " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )" +
              " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) " +
              " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) " +
              " end " +
              ") as objname " +
  */", null as objname"+
              ",ENPLANWORK.YEARGEN"+
              ",ENPLANWORK.MONTHGEN"+
              ", ENPLANWORKTYPE.CODE " +
              ", ENPLANWORKTYPE.NAME " +
              ", EPREN.CODE, EPREN.NAME "+
              ", ENPLANWORK.BUDGETREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE) " +
              ", ENPLANWORK.RESPONSIBILITYREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE) " +
              ", ENPLANWORK.DEPARTMENTREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE) " +
              ", ENPLANWORK.DATESTART "+
                ",ENPLANWORK.DATEFINAL"+
                ", ENPLANWORKKIND.CODE " +
                ", ENPLANWORKKIND.NAME " +

                //", ENELEMENTDATA.ENAME " +
                ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) as objectname " +

                ",ENPLANWORK.STATEREFCODE "+

                //", ENELEMENTDATA.INVNUMBER " +
                // NET-4383 -- для планов с типом акта списание ОС в листе планов инвентарный номер будем брать с enplanworkenact2osdata
                ", case when ENPLANWORKSTATE.CODE = "+ ENPlanWorkState.WRITINGS_OS+ " then ( select  qqq.kod_inv from enplanworkenact2osdata qqq where qqq.planworkrefcode = ENPLANWORK.CODE )" +
                 " else (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) end as invnumber " +

                ", ENPLANWORKSTATE.NAME as STATENAME " +
                ", ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME "+
                ", ENWORKORDER.WORKORDERNUMBER " +

                ", FINEXECUTOR.CODE " +
                ", FINEXECUTOR.NAME " +
                ", FINEXECUTOR.FINCODE " +
                ", FINEXECUTOR.FINTYPENAME " +
                ", FINEXECUTOR.FINTYPECODE " +
                ", FINEXECUTOR.FINKINDNAME " +
                ", FINEXECUTOR.FINKINDCODE " +
                ", FINEXECUTOR.FINCEHNAME " +
                ", FINEXECUTOR.FINCEHCODE " +
                ", ENWORKORDER.CODE " +
                ", ENPLANWORKFORM.CODE " +
                ", ENPLANWORKFORM.NAME " +
                ", ENPLANWORK.YEARORIGINAL " +
                ", ENPLANWORK.MONTHORIGINAL " +

                ", ENPLANWORKSOURCE.CODE " +
                ", ENPLANWORKSOURCE.NAME " +
                ", (select g.code from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
                ", (select g.name from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
                ", ENPLANWORK.INVESTWORKSDESCRIPTION " +

        ", (select ENIPIMPLEMENTATIONTYPE.CODE from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +
        ", (select ENIPIMPLEMENTATIONTYPE.NAME from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +

        ", case when ENPLANWORK.kindcode in (1,2) then (select sum( (ei.countfact*m.cost)::numeric(15,2)) " +
        " from enestimateitem ei, tkmaterials m " +
        " where ei.statusrefcode = 1 " +
        " and ei.planrefcode = ENPLANWORK.code " +
        " and ei.materialrefcode = m.code"  +
        " and ei.kindrefcode = 1) end as planedSum" +

        ", (select sum(pi.timegen) from enplanworkitem pi where pi.planrefcode = enplanwork.code) as humanHours " +

        //SUPP-69417 Комплектація матеріалами % (Если задание-план и  если на плане есть обязательные материалы тогда покажем процент укомплектованности ) иначе пусто выводим

       " , case when ENPLANWORK.kindcode = " + ENPlanWorkKind.NPW + " then (select * from get_percent_manning_with_materials(ENPLANWORK.code) ) else '' end as percent_manning_with_materials  " +

     /* Забезпечення транспортом % */
  	 " , case when (select count(tord.code) from entransportorder tord where tord.planrefcode = ENPLANWORK.CODE  ) > 0 \n" +
  	 "     then (select \n" +
  	 " 			case when  (q.all_cnt = 0) then 0 else \n" +
  	 " 			q.worked_cnt/q.all_cnt*100  end::numeric(15,2) from \n" +
  	 " 			( \n" +
  	 " 			select \n" +
  	 " 			coalesce((select count(t.code) from entransportorder t \n" +
  	 " 			where t.planrefcode = p.code \n" +
  	 " 			and t.transportorderstatuscd in (2,3)),0)::numeric(15,2) as worked_cnt, \n" +
  	 " 			coalesce((select count(t.code) from entransportorder t \n" +
  	 " 			where t.planrefcode = p.code),0)::numeric(15,2) as all_cnt \n" +
  	 " 			from enplanwork p \n" +
  	 " 			where p.code = ENPLANWORK.CODE \n" +
  	 " 			) as q \n" +
  	 "        )::varchar \n" +
  	 "      else '' \n" +
  	 " end       \n" +
  	 " as  percent_manning_with_transport \n" +
  	 " , (select 'акт № '||a.numbergen||', от '||to_char(a.dateact,'dd.MM.yyyy') from enact a " +
       " where a.code = (select a2p.actrefcode from enact2enplanwork a2p where a2p.plancode = enplanwork.code)) as actinfo " +
  	 " , ENPLANWORK.SERVICESFSIDEFINID" +
  	 " , ENPLANWORK.SERVICESFSIDECNNUM"+

", (select rm.numbergen || ' від ' || to_char(rm.dategen,'dd.mm.yyyy') as info_rm from enreconstrmodernoz2nct r2a , enact2enplanwork a2p , enreconstrmodernoz rm \n"+
" 	 where a2p.actrefcode=r2a.actrefcode \n"+
" 	 and rm.code = r2a.enreconstrmodernozrfcd \n"+
" 	 and a2p.plancode in (  select hh2.plannewrefcode from enplancorrecthistory hh1 , enplancorrecthistory hh2 \n"+
" 							 where hh1.planoldrefcode = ENPLANWORK.CODE /*monthcode*/ \n"+
" 							   and hh1.reasoncode = 4 \n"+
" 							   and hh1.plannewrefcode = hh2.planoldrefcode \n"+
" 							   and hh2.reasoncode = 5  \n"+
" 							UNION \n"+
" 							select hh2.plannewrefcode from  enplancorrecthistory hh2 \n"+
" 							 where hh2.planoldrefcode = ENPLANWORK.CODE /*npzplan*/ \n"+
" 							   and hh2.reasoncode = 5 \n"+
" 							UNION \n"+
" 							select hh2.plannewrefcode from  enplancorrecthistory hh2 \n"+
" 							 where hh2.plannewrefcode = ENPLANWORK.CODE /*npzfact*/ \n"+
" 							   and hh2.reasoncode = 5  )) as info_oz2  \n"+
", (select b.numbergen || ' від ' || to_char(b.dategen,'dd.mm.yyyy') as info_oz1 from enbuilding2enact b2a , enact2enplanwork a2p , enbuilding b \n"+
"	 	 where a2p.actrefcode=b2a.actrefcode \n"+
"	 	 and b.code = b2a.enbuildingrefcode \n"+
"	 	 and a2p.plancode in (  select hh2.plannewrefcode from enplancorrecthistory hh1 , enplancorrecthistory hh2 \n"+
"	 							 where hh1.planoldrefcode = ENPLANWORK.CODE /*monthcode*/ \n"+
"	 							   and hh1.reasoncode = 4 \n"+
"	 							   and hh1.plannewrefcode = hh2.planoldrefcode \n"+
"	 							   and hh2.reasoncode = 5  \n"+
"	 							UNION \n"+
"	 							select hh2.plannewrefcode from  enplancorrecthistory hh2 \n"+
"	 							 where hh2.planoldrefcode = ENPLANWORK.CODE \n"+
"	 							   and hh2.reasoncode = 5 \n"+
"	 							UNION \n"+
"	 							select hh2.plannewrefcode from  enplancorrecthistory hh2 \n"+
"	 							 where hh2.plannewrefcode = ENPLANWORK.CODE \n"+
"	 							   and hh2.reasoncode = 5  )) as info_oz1 \n"+
" ,( \n" +
" 		  SELECT docstatus \n" +
" 	  FROM dblink( \n" +
" 	    'dbname=docflow port=5432 host=10.77.11.67 user=docflow password=#_Ngazidja_#', \n" +
" 		    'select docnum ||'' від '' || to_char(docdateregistration,''dd.mm.yyyy'') from  ( select docs.* \n" +
" 				from docflow.docs, docflow.dfdoc, docflow.dfdocstatus \n" +
" 				WHERE  dfdoc.code = docs.doccode \n" +
" 				and dfdoc.doctyperefcode = docs.doctype \n" +
" 				and dfdoc.statusrefcode = dfdocstatus.code \n" +
" 				AND DFDOC.DOCTYPEREFCODE = 10 \n" +
" 				and dfdoc.code = ' ||  	(select  a2df.dfdoccode from enact2dfdocdecree a2df, enact2enplanwork a2p \n" +
" 	where a2df.actrefcode=a2p.actrefcode  \n" +
" 	and a2p.plancode in (  select hh2.plannewrefcode from enplancorrecthistory hh1 , enplancorrecthistory hh2 \n" +
" 		 							 where hh1.planoldrefcode = ENPLANWORK.CODE \n" +
" 		 							   and hh1.reasoncode = 4 \n" +
" 		 							   and hh1.plannewrefcode = hh2.planoldrefcode \n" +
" 		 							   and hh2.reasoncode = 5  \n" +
" 		 							UNION \n" +
" 		 							select hh2.plannewrefcode from  enplancorrecthistory hh2 \n" +
" 		 							 where hh2.planoldrefcode = ENPLANWORK.CODE \n" +
" 		 							   and hh2.reasoncode = 5 \n" +
" 		 							UNION \n" +
" 		 							select hh2.plannewrefcode from  enplancorrecthistory hh2 \n" +
" 		 							 where hh2.plannewrefcode = ENPLANWORK.CODE \n" +
" 		 							   and hh2.reasoncode = 5  ) limit 1 )|| \n" +
" 				 ' ) as dfdoc ' \n" +
" 		    ) dblink (docstatus varchar ) limit 1 ) as info_dfdocdecree\n" +
       " FROM ENPLANWORK  \n" +
      "left join FINEXECUTOR on FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE \n" +
      "left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
      "left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +


      ", ENPLANWORKSTATUS " +
      //", ENELEMENT " +
      ", ENPLANWORKTYPE " +
      ", EPREN " +
      ", ENPLANWORKKIND " +
      ", ENPLANWORKSTATE " +
      ", ENPLANWORKFORM " +

      ", ENPLANWORKSOURCE " +

      //", ENWORKORDER, ENWORKORDER2ENPLANWORK " +
      //", ENELEMENTDATA " +
      //" WHERE "
      "";

      whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE" ; //+


       //whereStr = whereStr +" AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORK.RENREFCODE = EPREN.CODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE" ; //+

       whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE" ;

       whereStr = whereStr +" AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE" ; //+

       //уехало в лефт джойн whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " ; //+
       //whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " ; //+

       // whereStr = whereStr + " AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE ";
          //selectStr = selectStr + " ${s} ENPLANWORK.CODE IN ( SELECT ENPLANWORK.CODE FROM ENPLANWORK ";

  //" ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.CODE = ?";
         }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
         }
         if(aFilterObject.monthGen != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
              else
                  whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
         }
         if(aFilterObject.status.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
         }
         if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
         }
         if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
         }
         if(aFilterObject.dateStart != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
         }
         if(aFilterObject.dateFinal != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
         }
         if(aFilterObject.kind.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
         }
         if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
         }
         if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
         }
         if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
         }
         if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
         }
         if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
         }

         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
         }

         if (aFilterObject.priConnectionNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
         }

         if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
         }

         if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
         }
         if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.IPIMPLEMENTTYPEREFCODE = ? ";
         }
         if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
         }
         if(aFilterObject.servicesFSideFinId != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDEFINID = ?";
         }
         if (aFilterObject.servicesFSideCnNum != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.servicesFSideCnNum.indexOf('*',0) < 0 && aFilterObject.servicesFSideCnNum.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDECNNUM = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDECNNUM LIKE ?";
         }
       }


     /*SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
     if(segregationInfo.isAccessDenied())
       throw new PersistenceException("{%ENPlanWork.getList%} access denied");

     String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

     if (domainWhereStr.length() != 0){

      if (whereStr.length() == 0)
          whereStr = domainWhereStr;
      else
          whereStr = " "+whereStr + " AND " +domainWhereStr;
      }*/


       if(condition.length() != 0)
       {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";

          whereStr = whereStr + " (" + condition + ")";
       }
  //+ " WHERE" +  сделано выше ????
      if(whereStr.length() != 0)
          selectStr = selectStr + " WHERE" + whereStr;

     // selectStr = selectStr + ") ";

     selectStr = selectStr + " ORDER BY " + orderBy;

     selectStr = selectStr + " OFFSET " + fromPosition;
     if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = 0;
       if(aFilterObject != null){
          if(aFilterObject.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.code);
          }
         if(aFilterObject.dateGen != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
         }
          if(aFilterObject.yearGen != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.yearGen);
          }
          if(aFilterObject.monthGen != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.monthGen);
          }

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }


            if(aFilterObject.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

         if(aFilterObject.dateEdit != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
         }


            if(aFilterObject.domain_info != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.domain_info);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.status.code);
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.elementRef.code);
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.renRef.code);
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.kind.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kind.code);
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.budgetRef.code);
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.responsibilityRef.code);
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.departmentRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }
        if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.stateRef.code);
        }

        if(aFilterObject.priConnectionNumber != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.priConnectionNumber);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }

        if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.formRef.code);
        }

        if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.sourceRef.code);
        }
        if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.ipImplementTypeRef.code);
        }
        if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.causeDisconnection);
        }

        if(aFilterObject.servicesFSideFinId != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.servicesFSideFinId);
        }

        if(aFilterObject.servicesFSideCnNum != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.servicesFSideCnNum);
            for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }
       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

       //ElementLogic elementLogic = new ElementLogic(getConnection(), getUserProfile());

       set = statement.executeQuery();
       int i;
       for(i = 0;set.next();i++)
        {

         /*
         if(i < fromPosition)
          continue;
         else if(i >= fromPosition + quantity)
          {
           i++;
           break;
          }
          */

         anObject = new ENPlanWorkShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.dateGen = set.getTimestamp(2); // NET-4213
         anObject.userGen = set.getString(3);
         anObject.dateEdit = set.getDate(4);


         anObject.statusCode = set.getInt(5);

         anObject.statusName = set.getString(6);

         anObject.elementRefCode = set.getInt(7);

         //anObject.objectName = set.getString(8);
         // оптимизировано вьюхой ENELEMENTDATA !!!
         //anObject.objectName = elementLogic.getNameByCode(anObject.elementRefCode)[0] ;

         anObject.yearGen = set.getInt(9);
         if ( set.wasNull() )
             anObject.yearGen = Integer.MIN_VALUE;
         anObject.monthGen = set.getInt(10);
         if ( set.wasNull() )
             anObject.monthGen = Integer.MIN_VALUE;

         anObject.typeRefCode = set.getInt(11);

         anObject.typeRefName = set.getString(12);

         anObject.renRefCode = set.getInt(13);
         anObject.renRefName = set.getString(14);

         anObject.budgetRefCode = set.getInt(15);
         anObject.budgetRefShortName = set.getString(16);

         anObject.responsibilityRefCode = set.getInt(17);
         anObject.responsibilityRefShortName = set.getString(18);

         anObject.departmentRefCode = set.getInt(19);
         anObject.departmentRefShortName = set.getString(20);

         anObject.dateStart = set.getDate(21);
         anObject.dateFinal = set.getDate(22);

         anObject.kindCode = set.getInt(23);

         anObject.kindName = set.getString(24);

         anObject.objectName = set.getString(25);
         anObject.stateRefCode = set.getInt(26);

         anObject.invNumber = set.getString(27);

         anObject.stateRefName = set.getString("STATENAME");
         anObject.stateRefShortName = set.getString("STATESHORTNAME");

         anObject.workOrderNumber = set.getString("WORKORDERNUMBER");

         anObject.finExecutorCode = set.getInt(31);
         if ( set.wasNull() )
          anObject.finExecutorCode = Integer.MIN_VALUE;

         anObject.finExecutorName = set.getString(32);

         anObject.finExecutorFinCode = set.getInt(33);
         if ( set.wasNull() )
          anObject.finExecutorFinCode = Integer.MIN_VALUE;

         anObject.finExecutorFinTypeName = set.getString(34);

         anObject.finExecutorFinTypeCode = set.getInt(35);
         if ( set.wasNull() )
          anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;

         anObject.finExecutorFinKindName = set.getString(36);

         anObject.finExecutorFinKindCode = set.getInt(37);
         if ( set.wasNull() )
          anObject.finExecutorFinKindCode = Integer.MIN_VALUE;

         anObject.finExecutorFinCehName = set.getString(38);

         anObject.finExecutorFinCehCode = set.getInt(39);
         if ( set.wasNull() )
          anObject.finExecutorFinCehCode = Integer.MIN_VALUE;


         anObject.workOrderCode = set.getInt(40);
         if ( set.wasNull() )
          anObject.workOrderCode = Integer.MIN_VALUE;

         anObject.formRefCode = set.getInt(41);
         if ( set.wasNull() )
          anObject.formRefCode = Integer.MIN_VALUE;

         anObject.formRefName = set.getString(42);

         anObject.yearOriginal = set.getInt(43);
         if ( set.wasNull() )
             anObject.yearOriginal = Integer.MIN_VALUE;
         anObject.monthOriginal = set.getInt(44);
         if ( set.wasNull() )
             anObject.monthOriginal = Integer.MIN_VALUE;

         anObject.sourceRefCode = set.getInt(45);
          if(set.wasNull())
          anObject.sourceRefCode = Integer.MIN_VALUE;
         anObject.sourceRefName = set.getString(46);

         anObject.invgroupRefCode = set.getInt(47);
          if(set.wasNull())
          anObject.invgroupRefCode = Integer.MIN_VALUE;
         anObject.invgroupRefName = set.getString(48);

         anObject.investWorksDescription = set.getString(49);

         anObject.ipImplementTypeRefCode = set.getInt(50);
         if(set.wasNull())
      	   anObject.ipImplementTypeRefCode = Integer.MIN_VALUE;
         anObject.ipImplementTypeRefName = set.getString(51);

         anObject.planedSum = set.getBigDecimal(52);
         	if (anObject.planedSum != null)
         		anObject.planedSum = anObject.planedSum.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);


          anObject.humanHours = set.getBigDecimal(53);
         	if (anObject.humanHours != null)
         		anObject.humanHours = anObject.humanHours.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);


         	anObject.percentManningWithMaterials = set.getString(54);
         	anObject.percentManningWithTransport = set.getString(55);

         	anObject.actInfo = set.getString(56);

          anObject.servicesFSideFinId = set.getInt("SERVICESFSIDEFINID");
          if ( set.wasNull() )
             anObject.servicesFSideFinId = Integer.MIN_VALUE;
          anObject.servicesFSideCnNum = set.getString("SERVICESFSIDECNNUM");

          anObject.info_oz2 = set.getString("info_oz2");
          anObject.info_oz1 = set.getString("info_oz1");
          anObject.info_dfdocdecree =  set.getString("info_dfdocdecree");

         	result.list.add(anObject);
        }


       result.setTotalCount(i);
       return result;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
       return null;
      }
     finally
      {
       try {if (set != null) set.close();}             catch (SQLException e) {}
       try {if (statement != null) statement.close();} catch (SQLException e) {}
       if(connection != super.getConnection())
        {
         try{connection.close();} catch(SQLException e){}
        }
      }
    }

  public ENPlanWorkShortList getScrollableFilteredListForMetrologyCounters(ENPlanWorkFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
      return getScrollableFilteredListForMetrologyCounters(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL), fromPosition, quantity, null);
  }

  public ENPlanWorkShortList getScrollableFilteredListForMetrologyCounters(ENPlanWork aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector aBindObjects) throws PersistenceException
  {
   ENPlanWorkShortList result = new ENPlanWorkShortList();
   ENPlanWorkShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);


    if (anCondition != null && anCondition.equals("( statuscode <> 6)")) {
        throw new PersistenceException("\n\n"+
                "Ошибка при определении условия поиска планов!!!");
    }

   if(orderBy.length() == 0)
    orderBy = "ENPLANWORK.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENPLANWORK.CODE"+
    ",ENPLANWORK.DATEGEN"+
    ",ENPLANWORK.USERGEN"+
    ",ENPLANWORK.DATEEDIT"+

     ", ENPLANWORKSTATUS.CODE " +
     ", ENPLANWORKSTATUS.NAME " +

     /*
     ",  case when (ENELEMENTDATA.ETYPE in (7,8) " +
     "   and ENPLANWORK.MONTHORIGINAL is not null " +
     " and ENPLANWORK.kindcode=2 " +
     " and ENPLANWORK.code not in ( " +
     " select planoldrefcode from enplancorrecthistory "+
     " where planoldrefcode=ENPLANWORK.code "+
     " and reasoncode=4) "+

     ") then 'Перенесений' else ENPLANWORKSTATUS.NAME end " +
     */

     //", ENELEMENTDATA.ECODE " +
     ", (select ENELEMENTDATA.ECODE from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

    /*
        ", ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) " +
            " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )" +
            " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) " +
            " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) " +
            " end " +
            ") as objname " +
*/", null as objname"+
            ",ENPLANWORK.YEARGEN"+
            ",ENPLANWORK.MONTHGEN"+
            ", ENPLANWORKTYPE.CODE " +
            ", ENPLANWORKTYPE.NAME " +
            ", EPREN.CODE, EPREN.NAME "+
            ", ENPLANWORK.BUDGETREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE) " +
            ", ENPLANWORK.RESPONSIBILITYREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE) " +
            ", ENPLANWORK.DEPARTMENTREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE) " +
            ", ENPLANWORK.DATESTART "+
              ",ENPLANWORK.DATEFINAL"+
              ", ENPLANWORKKIND.CODE " +
              ", ENPLANWORKKIND.NAME " +

              //", ENELEMENTDATA.ENAME " +
              ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

              ",ENPLANWORK.STATEREFCODE "+

              //", ENELEMENTDATA.INVNUMBER " +
              ", (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

              ", ENPLANWORKSTATE.NAME as STATENAME " +
              ", ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME "+
              ", ENWORKORDER.WORKORDERNUMBER " +

              /*
              ", FINEXECUTOR.CODE " +
              ", FINEXECUTOR.NAME " +
              ", FINEXECUTOR.FINCODE " +
              ", FINEXECUTOR.FINTYPENAME " +
              ", FINEXECUTOR.FINTYPECODE " +
              ", FINEXECUTOR.FINKINDNAME " +
              ", FINEXECUTOR.FINKINDCODE " +
              ", FINEXECUTOR.FINCEHNAME " +
              ", FINEXECUTOR.FINCEHCODE " +
              */

              ", ENWORKORDER.CODE " +
              ", ENPLANWORKFORM.CODE " +
              ", ENPLANWORKFORM.NAME " +
              ", ENPLANWORK.YEARORIGINAL " +
              ", ENPLANWORK.MONTHORIGINAL " +

              ", ENPLANWORKSOURCE.CODE " +
              ", ENPLANWORKSOURCE.NAME " +

              /*
              ", (select g.code from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
              ", (select g.name from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
              ", ENPLANWORK.INVESTWORKSDESCRIPTION " +

      ", (select ENIPIMPLEMENTATIONTYPE.CODE from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +
      ", (select ENIPIMPLEMENTATIONTYPE.NAME from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +
               */

      ", (select mc.account " +
      "     from enmetrologycounter mc " +
      "    where mc.elementcode = ENPLANWORK.elementrefcode) as account " +

      ", (select a.code " +
      "	    from enact2enplanwork ap, enact a " +
      "	   where ap.plancode = ENPLANWORK.code " +
      "	     and ap.actrefcode = a.code) as actcode " +

      ", (select a.numbergen " +
      "	    from enact2enplanwork ap, enact a " +
      "	   where ap.plancode = ENPLANWORK.code " +
      "	     and ap.actrefcode = a.code) as actnumber " +

    //" FROM ENPLANWORK left join ENELEMENTDATA on ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE " +

    " FROM ENPLANWORK  " +

    /*"left join FINEXECUTOR on FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE " +*/
    "left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
    "left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +


    ", ENPLANWORKSTATUS " +
    //", ENELEMENT " +
    ", ENPLANWORKTYPE " +
    ", EPREN " +
    ", ENPLANWORKKIND " +
    ", ENPLANWORKSTATE " +
    ", ENPLANWORKFORM " +

    ", ENPLANWORKSOURCE " +

    //", ENWORKORDER, ENWORKORDER2ENPLANWORK " +
    //", ENELEMENTDATA " +
    //" WHERE "
    "";

    whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE" ; //+


     //whereStr = whereStr +" AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.RENREFCODE = EPREN.CODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE" ; //+

     whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE" ;

     whereStr = whereStr +" AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE" ; //+

     //уехало в лефт джойн whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " ; //+
     //whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " ; //+

     // whereStr = whereStr + " AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE ";
        //selectStr = selectStr + " ${s} ENPLANWORK.CODE IN ( SELECT ENPLANWORK.CODE FROM ENPLANWORK ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.CODE = ?";
       }
       if(aFilterObject.dateGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
       }
       if(aFilterObject.yearGen != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
       }
       if(aFilterObject.monthGen != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
            else
                whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
       }
       if(aFilterObject.status.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
       }
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
       }
       if(aFilterObject.dateStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
       }
       if(aFilterObject.dateFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
       }
       if(aFilterObject.kind.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
       }
       if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
       }
       if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
       }

       if (aFilterObject.commentGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
       }

       if (aFilterObject.priConnectionNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
       }

       if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
       }

       if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
       }
       if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.IPIMPLEMENTTYPEREFCODE = ? ";
       }
       if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
       }
     }


   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENPlanWork.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENPLANWORK.DOMAIN_INFO IS NOT NULL";
   //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE" + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   selectStr = selectStr + " OFFSET " + fromPosition;
   if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
       if(aFilterObject.dateGen != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
       }
        if(aFilterObject.yearGen != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.yearGen);
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.monthGen);
        }

          if(aFilterObject.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }


          if(aFilterObject.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }


          if(aFilterObject.domain_info != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.domain_info);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.status.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.status.code);
      }
      if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.elementRef.code);
      }
      if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.renRef.code);
      }
      if(aFilterObject.dateStart != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
      }
      if(aFilterObject.dateFinal != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
      }
      if(aFilterObject.kind.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.kind.code);
      }
      if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.budgetRef.code);
      }
      if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.responsibilityRef.code);
      }
      if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.departmentRef.code);
      }
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }
      if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.stateRef.code);
      }

      if(aFilterObject.priConnectionNumber != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.priConnectionNumber);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }

      if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.formRef.code);
      }

      if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.sourceRef.code);
      }
      if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.ipImplementTypeRef.code);
      }
      if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.causeDisconnection);
      }
     }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     //ElementLogic elementLogic = new ElementLogic(getConnection(), getUserProfile());

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {

       /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new ENPlanWorkShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.dateGen = set.getTimestamp(2); // NET-4213
       anObject.userGen = set.getString(3);
       anObject.dateEdit = set.getDate(4);


       anObject.statusCode = set.getInt(5);

       anObject.statusName = set.getString(6);

       anObject.elementRefCode = set.getInt(7);

       //anObject.objectName = set.getString(8);
       // оптимизировано вьюхой ENELEMENTDATA !!!
       //anObject.objectName = elementLogic.getNameByCode(anObject.elementRefCode)[0] ;

       anObject.yearGen = set.getInt(9);
       if ( set.wasNull() )
           anObject.yearGen = Integer.MIN_VALUE;
       anObject.monthGen = set.getInt(10);
       if ( set.wasNull() )
           anObject.monthGen = Integer.MIN_VALUE;

       anObject.typeRefCode = set.getInt(11);

       anObject.typeRefName = set.getString(12);

       anObject.renRefCode = set.getInt(13);
       anObject.renRefName = set.getString(14);

       anObject.budgetRefCode = set.getInt(15);
       anObject.budgetRefShortName = set.getString(16);

       anObject.responsibilityRefCode = set.getInt(17);
       anObject.responsibilityRefShortName = set.getString(18);

       anObject.departmentRefCode = set.getInt(19);
       anObject.departmentRefShortName = set.getString(20);

       anObject.dateStart = set.getDate(21);
       anObject.dateFinal = set.getDate(22);

       anObject.kindCode = set.getInt(23);

       anObject.kindName = set.getString(24);

       anObject.objectName = set.getString(25);
       anObject.stateRefCode = set.getInt(26);

       anObject.invNumber = set.getString(27);

       anObject.stateRefName = set.getString("STATENAME");
       anObject.stateRefShortName = set.getString("STATESHORTNAME");

       anObject.workOrderNumber = set.getString("WORKORDERNUMBER");

       /*
       anObject.finExecutorCode = set.getInt(31);
       if ( set.wasNull() )
        anObject.finExecutorCode = Integer.MIN_VALUE;

       anObject.finExecutorName = set.getString(32);

       anObject.finExecutorFinCode = set.getInt(33);
       if ( set.wasNull() )
        anObject.finExecutorFinCode = Integer.MIN_VALUE;

       anObject.finExecutorFinTypeName = set.getString(34);

       anObject.finExecutorFinTypeCode = set.getInt(35);
       if ( set.wasNull() )
        anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;

       anObject.finExecutorFinKindName = set.getString(36);

       anObject.finExecutorFinKindCode = set.getInt(37);
       if ( set.wasNull() )
        anObject.finExecutorFinKindCode = Integer.MIN_VALUE;

       anObject.finExecutorFinCehName = set.getString(38);

       anObject.finExecutorFinCehCode = set.getInt(39);
       if ( set.wasNull() )
        anObject.finExecutorFinCehCode = Integer.MIN_VALUE;
        */

       anObject.workOrderCode = set.getInt(31);
       if ( set.wasNull() )
        anObject.workOrderCode = Integer.MIN_VALUE;

       anObject.formRefCode = set.getInt(32);
       if ( set.wasNull() )
        anObject.formRefCode = Integer.MIN_VALUE;

       anObject.formRefName = set.getString(33);

       anObject.yearOriginal = set.getInt(34);
       if ( set.wasNull() )
           anObject.yearOriginal = Integer.MIN_VALUE;
       anObject.monthOriginal = set.getInt(35);
       if ( set.wasNull() )
           anObject.monthOriginal = Integer.MIN_VALUE;

       anObject.sourceRefCode = set.getInt(36);
        if(set.wasNull())
        anObject.sourceRefCode = Integer.MIN_VALUE;
       anObject.sourceRefName = set.getString(37);

       /*
       anObject.invgroupRefCode = set.getInt(47);
        if(set.wasNull())
        anObject.invgroupRefCode = Integer.MIN_VALUE;
       anObject.invgroupRefName = set.getString(48);

       anObject.investWorksDescription = set.getString(49);

       anObject.ipImplementTypeRefCode = set.getInt(50);
       if(set.wasNull())
    	   anObject.ipImplementTypeRefCode = Integer.MIN_VALUE;
       anObject.ipImplementTypeRefName = set.getString(51);
       */


       // Сюда запихнем счет, на к-м находится счетчик
       anObject.actInfo = set.getString(38);

       anObject.actRefCode = set.getInt(39);
       if(set.wasNull())
    	   anObject.actRefCode = Integer.MIN_VALUE;

       anObject.actRefNumber = set.getString(40);

       result.list.add(anObject);
      }


     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

  public ENPlanWorkShortList getScrollableFilteredListForEnergosbyt(ENPlanWorkFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
   ENPlanWorkShortList result = new ENPlanWorkShortList();
   ENPlanWorkShort anObject;
   result.list = new Vector();

   String anCondition = (aFilterObject == null) ? (null) : (aFilterObject.conditionSQL);
   String anOrderBy = (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL);

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);


    if (anCondition != null && anCondition.equals("( statuscode <> 6)")) {
        throw new PersistenceException("\n\n"+
                "Ошибка при определении условия поиска планов!!!");
    }

   if(orderBy.length() == 0)
    orderBy = "ENPLANWORK.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =
		   "  SELECT " +
		   "       ENPLANWORK.CODE, " +
		   "       ENPLANWORKSTATUS.CODE, " +
		   "       ENPLANWORKSTATUS.NAME, " +
		   "       ENELEMENTDATA.ECODE, " +
		   "       ENPLANWORK.YEARGEN, " +
		   "       ENPLANWORK.MONTHGEN, " +
		   "       ENPLANWORKTYPE.CODE, " +
		   "       ENPLANWORKTYPE.NAME, " +
		   "       ENPLANWORK.DATESTART, " +
		   "       ENPLANWORK.DATEFINAL, " +
		   "       ENPLANWORKKIND.CODE, " +
		   "       ENPLANWORKKIND.NAME, " +
		   "       ENELEMENTDATA.ENAME as objectname, " +
		   "       ENPLANWORK.STATEREFCODE, " +
		   "       ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME, " +
		   "       ENELEMENTDATA.INVNUMBER " +
		   "  FROM ENPLANWORK, " +
		   "       ENPLANWORKSTATUS, " +
		   "       ENPLANWORKTYPE, " +
		   "       ENPLANWORKKIND, " +
		   "       ENPLANWORKSTATE, " +
		   "       ENELEMENTDATA ";

    whereStr =
    		"  ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE AND " +
			"  ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE AND " +
			"  ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE AND " +
			"  ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE AND " +
			"  ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE AND " +
			"  ENELEMENTDATA.etype in (" + ENElementType.TY_BYT + ", " + ENElementType.TY_PROM + ", " + ENElementType.ROUTE_BYT + ") ";

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.CODE = ?";
       }
       if(aFilterObject.dateGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
       }
       if(aFilterObject.yearGen != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
       }
       if(aFilterObject.monthGen != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
            else
                whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
       }
       if(aFilterObject.status.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
       }
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
       }
       if(aFilterObject.dateStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
       }
       if(aFilterObject.dateFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
       }
       if(aFilterObject.kind.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
       }
       if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
       }
       if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
       }

       if (aFilterObject.commentGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
       }

       if (aFilterObject.priConnectionNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
       }

       if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
       }

       if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
       }
       if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.IPIMPLEMENTTYPEREFCODE = ? ";
       }
       if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
       }
     }


   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENPlanWork.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENPLANWORK.DOMAIN_INFO IS NOT NULL";
   //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE" + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   selectStr = selectStr + " OFFSET " + fromPosition;
   if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
       if(aFilterObject.dateGen != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
       }
        if(aFilterObject.yearGen != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.yearGen);
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.monthGen);
        }

          if(aFilterObject.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }


          if(aFilterObject.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }


          if(aFilterObject.domain_info != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.domain_info);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.status.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.status.code);
      }
      if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.elementRef.code);
      }
      if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.renRef.code);
      }
      if(aFilterObject.dateStart != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
      }
      if(aFilterObject.dateFinal != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
      }
      if(aFilterObject.kind.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.kind.code);
      }
      if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.budgetRef.code);
      }
      if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.responsibilityRef.code);
      }
      if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.departmentRef.code);
      }
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }
      if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.stateRef.code);
      }

      if(aFilterObject.priConnectionNumber != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.priConnectionNumber);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }

      if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.formRef.code);
      }

      if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.sourceRef.code);
      }
      if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.ipImplementTypeRef.code);
      }
      if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.causeDisconnection);
      }
     }

     //ElementLogic elementLogic = new ElementLogic(getConnection(), getUserProfile());

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {

       /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new ENPlanWorkShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;

       anObject.statusCode = set.getInt(2);
       anObject.statusName = set.getString(3);

       anObject.elementRefCode = set.getInt(4);

       anObject.yearGen = set.getInt(5);
       if ( set.wasNull() )
           anObject.yearGen = Integer.MIN_VALUE;
       anObject.monthGen = set.getInt(6);
       if ( set.wasNull() )
           anObject.monthGen = Integer.MIN_VALUE;

       anObject.typeRefCode = set.getInt(7);
       anObject.typeRefName = set.getString(8);

       anObject.dateStart = set.getDate(9);
       anObject.dateFinal = set.getDate(10);

       anObject.kindCode = set.getInt(11);
       anObject.kindName = set.getString(12);

       anObject.objectName = set.getString(13);

       anObject.stateRefCode = set.getInt(14);
       anObject.stateRefShortName = set.getString(15);

       anObject.invNumber = set.getString(16);

       result.list.add(anObject);
      }


     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }



  public ENPlanWorkBillingShortList getScrollableBillingFilteredList(
            ENPlanWorkFilter aFilterObject, int fromPosition, int quantity, Vector aBindObjects) throws PersistenceException {
        return getScrollableBillingFilteredList(
                aFilterObject, (aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
                (aFilterObject == null) ? (null) : (aFilterObject.orderBySQL), fromPosition, quantity, aBindObjects);
  }

  public ENPlanWorkBillingShortList getScrollableBillingFilteredList(ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENPlanWorkBillingShortList result = new ENPlanWorkBillingShortList();
   ENPlanWorkBillingShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENPLANWORK.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENPLANWORK.CODE"+
    ",ENPLANWORK.DATEGEN"+
    ",ENPLANWORK.USERGEN"+
    ",ENPLANWORK.DATEEDIT"+

     ", ENPLANWORKSTATUS.CODE " +
     ", ENPLANWORKSTATUS.NAME " +

     //", ENELEMENTDATA.ECODE " +
     ", (select ENELEMENTDATA.ECODE from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

    /*
        ", ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) " +
            " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )" +
            " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) " +
            " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) " +
            " end " +
            ") as objname " +
*/", null as objname"+
            ",ENPLANWORK.YEARGEN"+
            ",ENPLANWORK.MONTHGEN"+
            ", ENPLANWORKTYPE.CODE " +
            ", ENPLANWORKTYPE.NAME " +
            ", EPREN.CODE, EPREN.NAME "+
            ", ENPLANWORK.BUDGETREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE) " +
            ", ENPLANWORK.RESPONSIBILITYREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE) " +
            ", ENPLANWORK.DEPARTMENTREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE) " +
            ", ENPLANWORK.DATESTART "+
              ",ENPLANWORK.DATEFINAL"+
              ", ENPLANWORKKIND.CODE " +
              ", ENPLANWORKKIND.NAME " +

              //", ENELEMENTDATA.ENAME " +
              ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

              ",ENPLANWORK.STATEREFCODE "+

              //", ENELEMENTDATA.INVNUMBER " +
              ", (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

              ", ENPLANWORKSTATE.NAME as STATENAME " +
              ", ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME "+
              ", ENWORKORDER.WORKORDERNUMBER " +

              ", FINEXECUTOR.CODE " +
              ", FINEXECUTOR.NAME " +
              ", FINEXECUTOR.FINCODE " +
              ", FINEXECUTOR.FINTYPENAME " +
              ", FINEXECUTOR.FINTYPECODE " +
              ", FINEXECUTOR.FINKINDNAME " +
              ", FINEXECUTOR.FINKINDCODE " +
              ", FINEXECUTOR.FINCEHNAME " +
              ", FINEXECUTOR.FINCEHCODE " +
              ", ENWORKORDER.CODE " +
              ", ENPLANWORKFORM.CODE " +
              ", ENPLANWORKFORM.NAME " +
              ", ENPLANWORK.YEARORIGINAL " +
              ", ENPLANWORK.MONTHORIGINAL " +

              ", ENPLANWORKSOURCE.CODE " +
              ", ENPLANWORKSOURCE.NAME " +
              ", (select g.code from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
              ", (select g.name from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
              ", ENRECORDPOINTBYT.DATECOUNTERINST" +
              ", ENRECORDPOINTBYT.DATECOUNTERCHECK" +
              ", ENRECORDPOINTBYT.COUNTERTYPE " +

    //" FROM ENPLANWORK left join ENELEMENTDATA on ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE " +
    " FROM ENPLANWORK " +

    "left join ENRECORDPOINTBYT ON ENPLANWORK.ELEMENTREFCODE = ENRECORDPOINTBYT.ELEMENTCODE " +
    "left join FINEXECUTOR on FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE " +
    "left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
    "left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +


    ", ENPLANWORKSTATUS " +
    //", ENELEMENT " +
    ", ENPLANWORKTYPE " +
    ", EPREN " +
    ", ENPLANWORKKIND " +
    ", ENPLANWORKSTATE " +
    ", ENPLANWORKFORM " +

    ", ENPLANWORKSOURCE " +

    //", ENWORKORDER, ENWORKORDER2ENPLANWORK " +
    //", ENELEMENTDATA " +
    //" WHERE "
    "";

    whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE" ; //+


     //whereStr = whereStr +" AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.RENREFCODE = EPREN.CODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE" ; //+

     whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE" ;

     whereStr = whereStr +" AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE" ; //+

     //уехало в лефт джойн whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " ; //+
     //whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " ; //+

     // whereStr = whereStr + " AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE ";
        //selectStr = selectStr + " ${s} ENPLANWORK.CODE IN ( SELECT ENPLANWORK.CODE FROM ENPLANWORK ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.CODE = ?";
       }
       if(aFilterObject.dateGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
       }
       if(aFilterObject.yearGen != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
       }
       if(aFilterObject.monthGen != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
            else
                whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
       }
       if(aFilterObject.status.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
       }
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
       }
       if(aFilterObject.dateStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
       }
       if(aFilterObject.dateFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
       }
       if(aFilterObject.kind.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
       }
       if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
       }
       if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
       }

       if (aFilterObject.commentGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
       }

       if (aFilterObject.priConnectionNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
       }

       if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
       }

       if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
       }

       if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
       }

     }


   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENPlanWork.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENPLANWORK.DOMAIN_INFO IS NOT NULL";
   //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE" + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   selectStr = selectStr + " OFFSET " + fromPosition;
   if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
       if(aFilterObject.dateGen != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
       }
        if(aFilterObject.yearGen != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.yearGen);
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.monthGen);
        }

          if(aFilterObject.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }


          if(aFilterObject.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }


          if(aFilterObject.domain_info != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.domain_info);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.status.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.status.code);
      }
      if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.elementRef.code);
      }
      if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.renRef.code);
      }
      if(aFilterObject.dateStart != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
      }
      if(aFilterObject.dateFinal != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
      }
      if(aFilterObject.kind.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.kind.code);
      }
      if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.budgetRef.code);
      }
      if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.responsibilityRef.code);
      }
      if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.departmentRef.code);
      }
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }
      if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.stateRef.code);
      }

      if(aFilterObject.priConnectionNumber != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.priConnectionNumber);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }

      if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.formRef.code);
      }

      if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.sourceRef.code);
      }

      if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.causeDisconnection);
      }
     }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     //ElementLogic elementLogic = new ElementLogic(getConnection(), getUserProfile());

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {

       /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new ENPlanWorkBillingShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.dateGen = set.getDate(2);
       anObject.userGen = set.getString(3);
       anObject.dateEdit = set.getDate(4);


       anObject.statusCode = set.getInt(5);

       anObject.statusName = set.getString(6);

       anObject.elementRefCode = set.getInt(7);

       //anObject.objectName = set.getString(8);
       // оптимизировано вьюхой ENELEMENTDATA !!!
       //anObject.objectName = elementLogic.getNameByCode(anObject.elementRefCode)[0] ;

       anObject.yearGen = set.getInt(9);
       if ( set.wasNull() )
           anObject.yearGen = Integer.MIN_VALUE;
       anObject.monthGen = set.getInt(10);
       if ( set.wasNull() )
           anObject.monthGen = Integer.MIN_VALUE;

       anObject.typeRefCode = set.getInt(11);

       anObject.typeRefName = set.getString(12);

       anObject.renRefCode = set.getInt(13);
       anObject.renRefName = set.getString(14);

       anObject.budgetRefCode = set.getInt(15);
       anObject.budgetRefShortName = set.getString(16);

       anObject.responsibilityRefCode = set.getInt(17);
       anObject.responsibilityRefShortName = set.getString(18);

       anObject.departmentRefCode = set.getInt(19);
       anObject.departmentRefShortName = set.getString(20);

       anObject.dateStart = set.getDate(21);
       anObject.dateFinal = set.getDate(22);

       anObject.kindCode = set.getInt(23);

       anObject.kindName = set.getString(24);

       anObject.objectName = set.getString(25);
       anObject.stateRefCode = set.getInt(26);

       anObject.invNumber = set.getString(27);

       anObject.stateRefName = set.getString("STATENAME");
       anObject.stateRefShortName = set.getString("STATESHORTNAME");

       anObject.workOrderNumber = set.getString("WORKORDERNUMBER");

       anObject.finExecutorCode = set.getInt(31);
       if ( set.wasNull() )
        anObject.finExecutorCode = Integer.MIN_VALUE;

       anObject.finExecutorName = set.getString(32);

       anObject.finExecutorFinCode = set.getInt(33);
       if ( set.wasNull() )
        anObject.finExecutorFinCode = Integer.MIN_VALUE;

       anObject.finExecutorFinTypeName = set.getString(34);

       anObject.finExecutorFinTypeCode = set.getInt(35);
       if ( set.wasNull() )
        anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;

       anObject.finExecutorFinKindName = set.getString(36);

       anObject.finExecutorFinKindCode = set.getInt(37);
       if ( set.wasNull() )
        anObject.finExecutorFinKindCode = Integer.MIN_VALUE;

       anObject.finExecutorFinCehName = set.getString(38);

       anObject.finExecutorFinCehCode = set.getInt(39);
       if ( set.wasNull() )
        anObject.finExecutorFinCehCode = Integer.MIN_VALUE;


       anObject.workOrderCode = set.getInt(40);
       if ( set.wasNull() )
        anObject.workOrderCode = Integer.MIN_VALUE;

       anObject.formRefCode = set.getInt(41);
       if ( set.wasNull() )
        anObject.formRefCode = Integer.MIN_VALUE;

       anObject.formRefName = set.getString(42);

       anObject.yearOriginal = set.getInt(43);
       if ( set.wasNull() )
           anObject.yearOriginal = Integer.MIN_VALUE;
       anObject.monthOriginal = set.getInt(44);
       if ( set.wasNull() )
           anObject.monthOriginal = Integer.MIN_VALUE;

       anObject.sourceRefCode = set.getInt(45);
        if(set.wasNull())
        anObject.sourceRefCode = Integer.MIN_VALUE;
       anObject.sourceRefName = set.getString(46);

       anObject.invgroupRefCode = set.getInt(47);
        if(set.wasNull())
        anObject.invgroupRefCode = Integer.MIN_VALUE;
       anObject.invgroupRefName = set.getString(48);

       anObject.dateCounterInst = set.getDate(49);
       anObject.dateCounterCheck = set.getDate(50);
       anObject.counterType = set.getString(51);

       result.list.add(anObject);
      }


     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }


  public int getFilteredCount(ENPlanWork aFilterObject, String anCondition)
            throws PersistenceException {
        return getFilteredCount(aFilterObject, anCondition, null);
    }

    public int getFilteredCount(ENPlanWork aFilterObject, String anCondition,
            Vector aBindObjects) throws PersistenceException {
        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        SegregationInfo segregationInfo = new SegregationProcessor()
                .getSegregationInfoForDataAccess(ENPlanWork.class.getName(),
                        DataAccessType.READ_LIST, getUserProfile()
                                .getDomainInfo().getDomain());
        if (segregationInfo.isAccessDenied())
            throw new PersistenceException(
                    "{%ENPlanWork.getList%} access denied");
        selectStr = "SELECT count(code)";
        whereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",
                segregationInfo, getUserProfile().getDomainInfo());
        if (whereStr.length() == 0)
            whereStr = " (ENPLANWORK.DOMAIN_INFO IS NOT NULL) ";
        else
            whereStr = " " + whereStr;
        {
            selectStr = selectStr + " FROM ENPLANWORK";
            whereStr = whereStr;

            if (aFilterObject != null) {
                if (aFilterObject.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.CODE = ?";
                }
                if (aFilterObject.dateGen != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
                }
                if (aFilterObject.dateStart != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
                }
                if (aFilterObject.dateFinal != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
                }
                if (aFilterObject.yearGen != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
                }
                if (aFilterObject.monthGen != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
                }
                if (aFilterObject.commentGen != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (aFilterObject.commentGen.indexOf('*', 0) < 0
                            && aFilterObject.commentGen.indexOf('?', 0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
                }
                if (aFilterObject.userGen != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (aFilterObject.userGen.indexOf('*', 0) < 0
                            && aFilterObject.userGen.indexOf('?', 0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
                }
                if (aFilterObject.dateEdit != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
                }
                if (aFilterObject.domain_info != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (aFilterObject.domain_info.indexOf('*', 0) < 0
                            && aFilterObject.domain_info.indexOf('?', 0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.DOMAIN_INFO = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.DOMAIN_INFO LIKE ?";
                }
                if (aFilterObject.modify_time != Long.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
                }
                if (aFilterObject.status.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
                }
                if (aFilterObject.elementRef.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
                }
                if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
                }
                if (aFilterObject.stateRef.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
                }
                if (aFilterObject.kind.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
                }
                if (aFilterObject.renRef.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
                }
                if (aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
                }
                if (aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr
                            + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
                }
                if (aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
                }

                if (aFilterObject.priConnectionNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
                    else
                        whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
                }

                if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
                }

                if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
                }
            }
        }

        if (condition.length() != 0) {
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " (" + condition + ")";
        }

        if (whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

        try {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if (aFilterObject != null) {
                if (aFilterObject.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.code);
                }
                if (aFilterObject.dateGen != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateGen.getTime()));
                }
                if (aFilterObject.dateStart != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateStart.getTime()));
                }
                if (aFilterObject.dateFinal != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateFinal.getTime()));
                }
                if (aFilterObject.yearGen != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.yearGen);
                }
                if (aFilterObject.monthGen != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.monthGen);
                }
                if (aFilterObject.commentGen != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.commentGen);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }
                if (aFilterObject.userGen != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.userGen);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }
                if (aFilterObject.dateEdit != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateEdit.getTime()));
                }
                if (aFilterObject.domain_info != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.domain_info);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }
                if(aFilterObject.priConnectionNumber != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.priConnectionNumber);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }

                if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,aFilterObject.formRef.code);
                }

                if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,aFilterObject.causeDisconnection);
                }
            }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            if (!set.next())
                throw new PersistenceException(
                        "Can't get count of objects ({%ENPlanWork%})");
            return set.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return 0;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public ENPlanWorkShortList getScrollableFilteredListNOSEGR(ENPlanWorkFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
    {
        return getScrollableFilteredListNOSEGR(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }

    public ENPlanWorkShortList getScrollableFilteredListNOSEGR(ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
    ENPlanWorkShortList result = new ENPlanWorkShortList();
    ENPlanWorkShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
        orderBy = "ENPLANWORK.CODE";

    if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
        "ENPLANWORK.CODE"+
        ",ENPLANWORK.DATEGEN"+
        ",ENPLANWORK.USERGEN"+
        ",ENPLANWORK.DATEEDIT"+

        ", ENPLANWORKSTATUS.CODE " +
        ", ENPLANWORKSTATUS.NAME " +

        //", ENELEMENTDATA.ECODE " +
        ", (select ENELEMENTDATA.ECODE from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

        /*
            ", ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) " +
                " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )" +
                " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) " +
                " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) " +
                " end " +
                ") as objname " +
    */", null as objname"+
                ",ENPLANWORK.YEARGEN"+
                ",ENPLANWORK.MONTHGEN"+
                ", ENPLANWORKTYPE.CODE " +
                ", ENPLANWORKTYPE.NAME " +
                ", EPREN.CODE, EPREN.NAME "+
                ", ENPLANWORK.BUDGETREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE) " +
                ", ENPLANWORK.RESPONSIBILITYREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE) " +
                ", ENPLANWORK.DEPARTMENTREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE) " +
                ", ENPLANWORK.DATESTART "+
                ",ENPLANWORK.DATEFINAL"+
                ", ENPLANWORKKIND.CODE " +
                ", ENPLANWORKKIND.NAME " +

                //", ENELEMENTDATA.ENAME " +
                ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

                ",ENPLANWORK.STATEREFCODE "+

                //", ENELEMENTDATA.INVNUMBER " +
                ", (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

                ", ENPLANWORKSTATE.NAME as STATENAME " +
                ", ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME "+
                ", ENWORKORDER.WORKORDERNUMBER " +

                ", FINEXECUTOR.CODE " +
                ", FINEXECUTOR.NAME " +
                ", FINEXECUTOR.FINCODE " +
                ", FINEXECUTOR.FINTYPENAME " +
                ", FINEXECUTOR.FINTYPECODE " +
                ", FINEXECUTOR.FINKINDNAME " +
                ", FINEXECUTOR.FINKINDCODE " +
                ", FINEXECUTOR.FINCEHNAME " +
                ", FINEXECUTOR.FINCEHCODE " +
                ", ENWORKORDER.CODE " +
                ", ENPLANWORKFORM.CODE " +
                ", ENPLANWORKFORM.NAME " +
                ", ENPLANWORK.YEARORIGINAL " +
                ", ENPLANWORK.MONTHORIGINAL " +

                ", ENPLANWORKSOURCE.CODE " +
                ", ENPLANWORKSOURCE.NAME " +

      ", (select ENIPIMPLEMENTATIONTYPE.CODE from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +
      ", (select ENIPIMPLEMENTATIONTYPE.NAME from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +

        //" FROM ENPLANWORK left join ENELEMENTDATA on ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE " +
        " , ENPLANWORK.causeDisconnection " +
        " FROM ENPLANWORK " +

        "left join FINEXECUTOR on FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE " +
        "left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
        "left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +


        ", ENPLANWORKSTATUS " +
        //", ENELEMENT " +
        ", ENPLANWORKTYPE " +
        ", EPREN " +
        ", ENPLANWORKKIND " +
        ", ENPLANWORKSTATE " +
        ", ENPLANWORKFORM " +

        ", ENPLANWORKSOURCE " +

        //", ENWORKORDER, ENWORKORDER2ENPLANWORK " +
        //", ENELEMENTDATA " +
        //" WHERE "
        "";

        whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE" ; //+


        //whereStr = whereStr +" AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE" ; //+
        whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE" ; //+
        whereStr = whereStr +" AND ENPLANWORK.RENREFCODE = EPREN.CODE" ; //+
        whereStr = whereStr +" AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE" ; //+

        whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE" ; //+
        whereStr = whereStr +" AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE" ;

        whereStr = whereStr +" AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE" ; //+

        //уехало в лефт джойн whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " ; //+
        //whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " ; //+

        // whereStr = whereStr + " AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE ";
            //selectStr = selectStr + " ${s} ENPLANWORK.CODE IN ( SELECT ENPLANWORK.CODE FROM ENPLANWORK ";

    //" ";
        if(aFilterObject != null)
        {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
        }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
            }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
        }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
        }
        if(aFilterObject.kind.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
        }
        if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
        }

        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
        }

        if (aFilterObject.priConnectionNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
        }

        if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
        }

        if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
        }
        if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.IPIMPLEMENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
        }
        }


    /*
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
        throw new PersistenceException("{%ENPlanWork.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENPLANWORK.DOMAIN_INFO IS NOT NULL";
    //else
        if (whereStr.length() == 0)
            whereStr = domainWhereStr;
        else
            whereStr = " "+whereStr + " AND " +domainWhereStr;
        }
       */

        if(condition.length() != 0)
        {
            if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }
    //+ " WHERE" +  сделано выше ????
        if(whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

    // selectStr = selectStr + ") ";

    selectStr = selectStr + " ORDER BY " + orderBy;

    // selectStr = selectStr + " limit " + quantity + " offset " + fromPosition;

    try
        {
        statement = connection.prepareStatement(selectStr);
        int number = 0;
        if(aFilterObject != null){
            if(aFilterObject.code != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.code);
            }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
            if(aFilterObject.yearGen != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.yearGen);
            }
            if(aFilterObject.monthGen != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.monthGen);
            }

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }


            if(aFilterObject.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userGen);
                for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

        if(aFilterObject.dateEdit != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }


            if(aFilterObject.domain_info != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.domain_info);
                for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.status.code);
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.elementRef.code);
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.renRef.code);
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.kind.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kind.code);
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.budgetRef.code);
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.responsibilityRef.code);
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.departmentRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }
        if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.stateRef.code);
        }

        if(aFilterObject.priConnectionNumber != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.priConnectionNumber);
            for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }

        if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.formRef.code);
        }

        if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.sourceRef.code);
        }
        if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.ipImplementTypeRef.code);
        }
        if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.causeDisconnection);
        }
        }

        if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

        //ElementLogic elementLogic = new ElementLogic(getConnection(), getUserProfile());

        set = statement.executeQuery();
        int i;
        for(i = 0;set.next();i++)
        {

        if(i < fromPosition)
            continue;
        else if(i >= fromPosition + quantity)
            {
            i++;
            break;
            }

        anObject = new ENPlanWorkShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.dateGen = set.getDate(2);
        anObject.userGen = set.getString(3);
        anObject.dateEdit = set.getDate(4);


        anObject.statusCode = set.getInt(5);

        anObject.statusName = set.getString(6);

        anObject.elementRefCode = set.getInt(7);

        //anObject.objectName = set.getString(8);
        // оптимизировано вьюхой ENELEMENTDATA !!!
        //anObject.objectName = elementLogic.getNameByCode(anObject.elementRefCode)[0] ;

        anObject.yearGen = set.getInt(9);
        if ( set.wasNull() )
            anObject.yearGen = Integer.MIN_VALUE;
        anObject.monthGen = set.getInt(10);
        if ( set.wasNull() )
            anObject.monthGen = Integer.MIN_VALUE;

        anObject.typeRefCode = set.getInt(11);

        anObject.typeRefName = set.getString(12);

        anObject.renRefCode = set.getInt(13);
        anObject.renRefName = set.getString(14);

        anObject.budgetRefCode = set.getInt(15);
        anObject.budgetRefShortName = set.getString(16);

        anObject.responsibilityRefCode = set.getInt(17);
        anObject.responsibilityRefShortName = set.getString(18);

        anObject.departmentRefCode = set.getInt(19);
        anObject.departmentRefShortName = set.getString(20);

        anObject.dateStart = set.getDate(21);
        anObject.dateFinal = set.getDate(22);

        anObject.kindCode = set.getInt(23);

        anObject.kindName = set.getString(24);

        anObject.objectName = set.getString(25);
        anObject.stateRefCode = set.getInt(26);

        anObject.invNumber = set.getString(27);

        anObject.stateRefName = set.getString("STATENAME");
        anObject.stateRefShortName = set.getString("STATESHORTNAME");

        anObject.workOrderNumber = set.getString("WORKORDERNUMBER");

        anObject.finExecutorCode = set.getInt(31);
        if ( set.wasNull() )
            anObject.finExecutorCode = Integer.MIN_VALUE;

        anObject.finExecutorName = set.getString(32);

        anObject.finExecutorFinCode = set.getInt(33);
        if ( set.wasNull() )
            anObject.finExecutorFinCode = Integer.MIN_VALUE;

        anObject.finExecutorFinTypeName = set.getString(34);

        anObject.finExecutorFinTypeCode = set.getInt(35);
        if ( set.wasNull() )
            anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;

        anObject.finExecutorFinKindName = set.getString(36);

        anObject.finExecutorFinKindCode = set.getInt(37);
        if ( set.wasNull() )
            anObject.finExecutorFinKindCode = Integer.MIN_VALUE;

        anObject.finExecutorFinCehName = set.getString(38);

        anObject.finExecutorFinCehCode = set.getInt(39);
        if ( set.wasNull() )
            anObject.finExecutorFinCehCode = Integer.MIN_VALUE;


        anObject.workOrderCode = set.getInt(40);
        if ( set.wasNull() )
            anObject.workOrderCode = Integer.MIN_VALUE;

        anObject.formRefCode = set.getInt(41);
        if ( set.wasNull() )
            anObject.formRefCode = Integer.MIN_VALUE;

        anObject.formRefName = set.getString(42);

        anObject.yearOriginal = set.getInt(43);
        if ( set.wasNull() )
            anObject.yearOriginal = Integer.MIN_VALUE;
        anObject.monthOriginal = set.getInt(44);
        if ( set.wasNull() )
            anObject.monthOriginal = Integer.MIN_VALUE;

        anObject.sourceRefCode = set.getInt(45);
            if(set.wasNull())
            anObject.sourceRefCode = Integer.MIN_VALUE;
        anObject.sourceRefName = set.getString(46);

        anObject.ipImplementTypeRefCode = set.getInt(47);
        if(set.wasNull())
     	   anObject.ipImplementTypeRefCode = Integer.MIN_VALUE;
        anObject.ipImplementTypeRefName = set.getString(48);

        anObject.causeDisconnection  = set.getInt(49);
        if ( set.wasNull() )
            anObject.causeDisconnection = Integer.MIN_VALUE;

            result.list.add(anObject);
        }


        result.setTotalCount(i);
        return result;
        }
    catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return null;
        }
    finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
        try{connection.close();} catch(SQLException e){}
        }
        }
    }

    public int[] getFilteredCodeArrayNOSEGR(ENPlanWorkFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
        {
        return getFilteredCodeArrayNOSEGR(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
        }

    public int[] getFilteredCodeArrayNOSEGR(ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
        Vector result = new Vector();

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     selectStr = "SELECT ENPLANWORK.CODE FROM ENPLANWORK";
        String     whereStr = "";
        String     condition = processCondition(anCondition);
        String     orderBy = processCondition(anOrderBy);

        if(orderBy.length() == 0)
        orderBy = "ENPLANWORK.CODE";

        if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        /*
        SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
        if(segregationInfo.isAccessDenied())
        throw new PersistenceException("{%ENPlanWork.getList%} access denied");

        whereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());
        */

        if(whereStr.length() == 0)
        whereStr = " (ENPLANWORK.DOMAIN_INFO IS NOT NULL) ";
        else
        whereStr = " "+whereStr;

        if(aFilterObject != null)
        {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.CODE = ?";
            }
            if(aFilterObject.dateGen != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
            }
            if(aFilterObject.dateStart != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
            }
            if(aFilterObject.dateFinal != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
            }
            if(aFilterObject.yearGen != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
            }
            if(aFilterObject.monthGen != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
            }
            if(aFilterObject.yearOriginal != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.YEARORIGINAL = ?";
            }
            if(aFilterObject.monthOriginal != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.MONTHORIGINAL = ?";
            }
            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
            }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
            }
            if(aFilterObject.dateEdit != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
            }
            if(aFilterObject.distanceAlong != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DISTANCEALONG = ?";
            }
            if(aFilterObject.distanceTo != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DISTANCETO = ?";
            }
            if (aFilterObject.workOrderNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER LIKE ?";
            }
            if(aFilterObject.dateWorkOrder != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEWORKORDER = ?";
            }
            if (aFilterObject.priConnectionNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";
            }
            if(aFilterObject.dateEndPriConnection != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEENDPRICONNECTION = ?";
            }
            if (aFilterObject.investWorksDescription != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.investWorksDescription.indexOf('*',0) < 0 && aFilterObject.investWorksDescription.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.INVESTWORKSDESCRIPTION = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.INVESTWORKSDESCRIPTION LIKE ?";
            }
            if(aFilterObject.servicesFSideFinId != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDEFINID = ?";
            }
            if (aFilterObject.servicesFSideCnNum != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.servicesFSideCnNum.indexOf('*',0) < 0 && aFilterObject.servicesFSideCnNum.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDECNNUM = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDECNNUM LIKE ?";
            }
            if(aFilterObject.totalTimeHours != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.TOTALTIMEHOURS = ?";
            }
            if(aFilterObject.totalTimeDays != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.TOTALTIMEDAYS = ?";
            }
            if (aFilterObject.domain_info != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.DOMAIN_INFO = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.DOMAIN_INFO LIKE ?";
            }
            if(aFilterObject.modify_time != Long.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
            }
            if(aFilterObject.status.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
            }
            if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
            }
            if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
            }
            if(aFilterObject.kind.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
            }
            if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
            }
            if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.FINEXECUTORCODE = ? ";
            }
            if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
            }
            if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.FORMREFCODE = ? ";
            }
            if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.SOURCEREFCODE = ? ";
            }
            if(aFilterObject.ddsCodes.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.DDSCODESCODE = ? ";
            }
            if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
            }
            if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
            }
            if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
            }
            if(aFilterObject.invgroupRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.INVGROUPREFCODE = ? ";
            }
            if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.CAUSEDISCONNECTION = ? ";
            }

        }

        if(condition.length() != 0)
        {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " (" + condition + ")";
        }

        if(whereStr.length() != 0)
            selectStr = selectStr + " WHERE " + whereStr;

        selectStr = selectStr + " ORDER BY " + orderBy;

        try
        {
        statement = connection.prepareStatement(selectStr);
        int number = 0;
        if(aFilterObject != null){
            if(aFilterObject.code != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.code);
            }
            if(aFilterObject.dateGen != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
            }
            if(aFilterObject.dateStart != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
            }
            if(aFilterObject.dateFinal != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
            }
            if(aFilterObject.yearGen != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.yearGen);
            }
            if(aFilterObject.monthGen != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.monthGen);
            }
            if(aFilterObject.yearOriginal != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.yearOriginal);
            }
            if(aFilterObject.monthOriginal != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.monthOriginal);
            }
            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.COMMENTGEN = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.COMMENTGEN LIKE ?";

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.USERGEN = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.USERGEN LIKE ?";

            if(aFilterObject.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userGen);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if(aFilterObject.dateEdit != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
            }
            if(aFilterObject.distanceAlong != null){
                number++;
                aFilterObject.distanceAlong = aFilterObject.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,aFilterObject.distanceAlong);
            }
            if(aFilterObject.distanceTo != null){
                number++;
                aFilterObject.distanceTo = aFilterObject.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,aFilterObject.distanceTo);
            }
            if (aFilterObject.workOrderNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER LIKE ?";

            if(aFilterObject.workOrderNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.workOrderNumber);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if(aFilterObject.dateWorkOrder != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateWorkOrder.getTime()));
            }
            if (aFilterObject.priConnectionNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";

            if(aFilterObject.priConnectionNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.priConnectionNumber);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if(aFilterObject.dateEndPriConnection != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateEndPriConnection.getTime()));
            }
            if (aFilterObject.investWorksDescription != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.investWorksDescription.indexOf('*',0) < 0 && aFilterObject.investWorksDescription.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.INVESTWORKSDESCRIPTION = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.INVESTWORKSDESCRIPTION LIKE ?";

            if(aFilterObject.investWorksDescription != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.investWorksDescription);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if(aFilterObject.servicesFSideFinId != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.servicesFSideFinId);
            }
            if (aFilterObject.servicesFSideCnNum != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.servicesFSideCnNum.indexOf('*',0) < 0 && aFilterObject.servicesFSideCnNum.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.SERVICESFSIDECNNUM = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.SERVICESFSIDECNNUM LIKE ?";

            if(aFilterObject.servicesFSideCnNum != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.servicesFSideCnNum);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if(aFilterObject.totalTimeHours != null){
                number++;
                aFilterObject.totalTimeHours = aFilterObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,aFilterObject.totalTimeHours);
            }
            if(aFilterObject.totalTimeDays != null){
                number++;
                aFilterObject.totalTimeDays = aFilterObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,aFilterObject.totalTimeDays);
            }
            if (aFilterObject.domain_info != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.DOMAIN_INFO = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.DOMAIN_INFO LIKE ?";

            if(aFilterObject.domain_info != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.domain_info);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if(aFilterObject.modify_time != Long.MIN_VALUE){
                number++;
                if(aFilterObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
            }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.status.code);
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.elementRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }
        if(aFilterObject.kind.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kind.code);
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.renRef.code);
        }
        if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.finExecutor.code);
        }
        if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.stateRef.code);
        }
        if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.formRef.code);
        }
        if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.sourceRef.code);
        }
        if(aFilterObject.ddsCodes.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.ddsCodes.code);
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.budgetRef.code);
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.responsibilityRef.code);
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.departmentRef.code);
        }
        if(aFilterObject.invgroupRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.invgroupRef.code);
        }
        if(aFilterObject.causeDisconnection != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.causeDisconnection);
        }
        }

        if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

        set = statement.executeQuery();
        int i;
        for(i = 0;set.next();i++)
        {
            if(i < fromPosition)
            continue;
            else if(i >= fromPosition + quantity)
            {
            i++;
            break;
            }

            result.add(new Integer(set.getInt(1)));
        }

        int[] array;

        array = new int[result.size()];
        for(int j = 0;j < result.size();j++)
        array[j] = ((Integer)result.get(j)).intValue();

        return array;
        }
        catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return null;
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
            try{connection.close();} catch(SQLException e){}
        }
        }


        } // end of getFilteredCodeArray



    public int[] getMonthPlansByAct(int actCode) throws PersistenceException
    {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;

        Vector result = new Vector();

        String selectStr = "select distinct chm.planoldrefcode from enact2enplanwork a2p, enplancorrecthistory ch, enplancorrecthistory chm " +
                    " where a2p.actrefcode =  ? and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT + " and  a2p.plancode = ch.plannewrefcode "+
                    " and ch.planoldrefcode = chm.plannewrefcode and chm.reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW;

        try
        {
        statement = connection.prepareStatement(selectStr);

        statement.setInt(1,actCode);

        set = statement.executeQuery();
        int i;
        for(i = 0;set.next();i++)
        {
            result.add(new Integer(set.getInt(1)));
        }

        int[] array;

        array = new int[result.size()];
        for(int j = 0;j < result.size();j++)
            array[j] = ((Integer)result.get(j)).intValue();

        return array;
    }
    catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return null;
        }
    finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
        try{connection.close();} catch(SQLException e){}
        }
        }

    }


    public void updateDateFinalAndTotalTime(ENPlanWork anObject) throws PersistenceException
    {
        Connection connection = getConnection();

        String updPlan =
            "UPDATE ENPLANWORK SET DATEFINAL = ? , TOTALTIMEHOURS = ? , TOTALTIMEDAYS = ? " +
            " WHERE CODE = ?";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updPlan);

            if (anObject.dateFinal == null)
                statement.setDate(1,null);
            else
                statement.setDate(1,new java.sql.Date(anObject.dateFinal.getTime()));

            if (anObject.totalTimeHours != null)
                anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(2,anObject.totalTimeHours);

            if (anObject.totalTimeDays != null)
                anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(3,anObject.totalTimeDays);

            statement.setInt(4,anObject.code);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updPlan + "\n planCode = " + anObject.code);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }

    public void updateDatesAndTotalTime(ENPlanWork anObject) throws PersistenceException
    {
        Connection connection = getConnection();

        String updPlan =
            "UPDATE ENPLANWORK SET DATESTART = ? , DATEFINAL = ? , TOTALTIMEHOURS = ? , TOTALTIMEDAYS = ? " +
            " WHERE CODE = ?";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updPlan);

            if (anObject.dateStart == null)
                statement.setDate(1,null);
            else
                statement.setDate(1,new java.sql.Date(anObject.dateStart.getTime()));

            if (anObject.dateFinal == null)
                statement.setDate(2,null);
            else
                statement.setDate(2,new java.sql.Date(anObject.dateFinal.getTime()));

            if (anObject.totalTimeHours != null)
                anObject.totalTimeHours = anObject.totalTimeHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(3,anObject.totalTimeHours);

            if (anObject.totalTimeDays != null)
                anObject.totalTimeDays = anObject.totalTimeDays.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(4,anObject.totalTimeDays);

            statement.setInt(5,anObject.code);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updPlan + "\n planCode = " + anObject.code);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }


    public void updateFinExecutor(int planCode, int finExecutorCode) throws PersistenceException
    {
        Connection connection = getConnection();

        String updPlan =
            "UPDATE ENPLANWORK SET FINEXECUTORCODE = ? " +
            " WHERE CODE = ?";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updPlan);

            if (finExecutorCode != Integer.MIN_VALUE)
            statement.setInt(1, finExecutorCode);
            else
            statement.setNull(1, java.sql.Types.INTEGER);

            statement.setInt(2, planCode);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updPlan + "\n planCode = " + planCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }

    public void updateFinExecutorAndDepartment(int planCode, int finExecutorCode, int departmentCode) throws PersistenceException
    {
        Connection connection = getConnection();

        String updPlan =
            "UPDATE ENPLANWORK SET FINEXECUTORCODE = ?, DEPARTMENTREFCODE = ? " +
            " WHERE CODE = ?";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updPlan);

            if (finExecutorCode != Integer.MIN_VALUE)
                statement.setInt(1, finExecutorCode);
            else
                statement.setNull(1, java.sql.Types.INTEGER);

            if (departmentCode != Integer.MIN_VALUE)
                statement.setInt(2, departmentCode);
            else
                statement.setNull(2, java.sql.Types.INTEGER);

            statement.setInt(3, planCode);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updPlan + "\n planCode = " + planCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }

    public void updateBudgetAndResponsibility(int planCode, int budgetCode, int responsibilityCode) throws PersistenceException
    {
        Connection connection = getConnection();

        String updPlan =
            "UPDATE ENPLANWORK SET BUDGETREFCODE = ?, RESPONSIBILITYREFCODE = ? " +
            " WHERE CODE = ?";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updPlan);

            if (budgetCode != Integer.MIN_VALUE)
                statement.setInt(1, budgetCode);
            else
                statement.setNull(1, java.sql.Types.INTEGER);

            if (responsibilityCode != Integer.MIN_VALUE)
                statement.setInt(2, responsibilityCode);
            else
                statement.setNull(2, java.sql.Types.INTEGER);

            statement.setInt(3, planCode);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updPlan + "\n planCode = " + planCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }



    public void updateInvestProgramData(int planCode, int investGroupCode, String investItemNumber) throws PersistenceException
    {
        if (planCode == Integer.MIN_VALUE)
        {
            throw new SystemException("\n\nNET-4301 Не задано код плану!");
        }

        if (investGroupCode == Integer.MIN_VALUE)
        {
            throw new SystemException("\n\nNET-4301 Не задано розділ ІнвестПрограми!");
        }

        if (investItemNumber == null)
        {
            throw new SystemException("\n\nNET-4301 Не задано пункт ІнвестПрограми!");
        }

        if (investItemNumber.trim().equals(""))
        {
            throw new SystemException("\n\nNET-4301 Не задано пункт ІнвестПрограми!");
        }

        Connection connection = getConnection();

        String updPlan =
            "UPDATE ENPLANWORK SET INVGROUPREFCODE = ?, INVESTITEMNUMBER = ? " +
            " WHERE CODE = ? ";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updPlan);

            statement.setInt(1, investGroupCode);
            statement.setString(2, investItemNumber);
            statement.setInt(3, planCode);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updPlan + "\n planCode = " + planCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }

    public ENPlanWorkShortList getTechConditionsPlanList(ENPlanWork aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
    {
     return getTechConditionsPlanList(aFilterObject,anCondition,null,fromPosition,quantity,null);
    }

   public ENPlanWorkShortList getTechConditionsPlanList(String anCondition,int fromPosition,int quantity) throws PersistenceException
    {
     return getTechConditionsPlanList(null,anCondition,fromPosition,quantity);
    }

   public ENPlanWorkShortList getTechConditionsPlanList(ENPlanWorkFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
    {
     return getTechConditionsPlanList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


    public ENPlanWorkShortList getTechConditionsPlanList(ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENPlanWorkShortList result = new ENPlanWorkShortList();
     ENPlanWorkShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENPLANWORK.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENPLANWORK.CODE"+
      ",ENPLANWORK.DATEGEN"+
      ",ENPLANWORK.USERGEN"+
      ",ENPLANWORK.DATEEDIT"+

       ", ENPLANWORKSTATUS.CODE " +
       ", ENPLANWORKSTATUS.NAME " +

       //", ENELEMENTDATA.ECODE " +
       ", (select ENELEMENTDATA.ECODE from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

    /*
            ", ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) " +
            " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )" +
            " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) " +
            " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) " +
            " end " +
            ") as objname " +
  */", null as objname"+
            ",ENPLANWORK.YEARGEN"+
            ",ENPLANWORK.MONTHGEN"+
            ", ENPLANWORKTYPE.CODE " +
            ", ENPLANWORKTYPE.NAME " +
            ", EPREN.CODE, EPREN.NAME "+
            ", ENPLANWORK.BUDGETREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE) " +
            ", ENPLANWORK.RESPONSIBILITYREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE) " +
            ", ENPLANWORK.DEPARTMENTREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE) " +
            ", ENPLANWORK.DATESTART "+
                ",ENPLANWORK.DATEFINAL"+
                ", ENPLANWORKKIND.CODE " +
                ", ENPLANWORKKIND.NAME " +

                //", ENELEMENTDATA.ENAME " +
                ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

                ",ENPLANWORK.STATEREFCODE "+

                //", ENELEMENTDATA.INVNUMBER " +
                ", (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

                ", ENPLANWORKSTATE.NAME as STATENAME " +
                ", ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME "+
                ", ENWORKORDER.WORKORDERNUMBER " +

                ", FINEXECUTOR.CODE " +
                ", FINEXECUTOR.NAME " +
                ", FINEXECUTOR.FINCODE " +
                ", FINEXECUTOR.FINTYPENAME " +
                ", FINEXECUTOR.FINTYPECODE " +
                ", FINEXECUTOR.FINKINDNAME " +
                ", FINEXECUTOR.FINKINDCODE " +
                ", FINEXECUTOR.FINCEHNAME " +
                ", FINEXECUTOR.FINCEHCODE " +
                ", ENWORKORDER.CODE " +
                ", ENPLANWORKFORM.CODE " +
                ", ENPLANWORKFORM.NAME " +
                ", ENPLANWORK.YEARORIGINAL " +
                ", ENPLANWORK.MONTHORIGINAL " +

                ", ENPLANWORKSOURCE.CODE " +
                ", ENPLANWORKSOURCE.NAME " +
                ", (select g.code from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
                ", (select g.name from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +


      //" FROM ENPLANWORK left join ENELEMENTDATA on ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE " +
      " FROM ENPLANWORK " +

      "left join FINEXECUTOR on FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE " +
      "left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
      "left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +


      ", ENPLANWORKSTATUS " +
      //", ENELEMENT " +
      ", ENPLANWORKTYPE " +
      ", EPREN " +
      ", ENPLANWORKKIND " +
      ", ENPLANWORKSTATE " +
      ", ENPLANWORKFORM " +

      ", ENPLANWORKSOURCE " +

      ", entechconditionsservcs " +
      ", entechcond2planwork " +

      //", ENWORKORDER, ENWORKORDER2ENPLANWORK " +
      //", ENELEMENTDATA " +
      //" WHERE "
    "";

      whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE" ; //+


       //whereStr = whereStr +" AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORK.RENREFCODE = EPREN.CODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE" ; //+

       whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE" ;

       whereStr = whereStr +" AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE" ; //+

       whereStr = whereStr + " and entechconditionsservcs.code = entechcond2planwork.techconservicesrefcode";
       whereStr = whereStr + " and entechcond2planwork.planrefcode = enplanwork.code";

  //" ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.CODE = ?";
         }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
         }
         if(aFilterObject.monthGen != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
              else
                  whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
         }
         if(aFilterObject.status.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
         }
         if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
         }
         if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
         }
         if(aFilterObject.dateStart != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
         }
         if(aFilterObject.dateFinal != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
         }
         if(aFilterObject.kind.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
         }
         if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
         }
         if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
         }
         if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
         }
         if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
         }
         if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
         }

         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
         }

         if (aFilterObject.priConnectionNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
         }

         if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
         }

         if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
         }

         if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
         }

       }


     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
     if(segregationInfo.isAccessDenied())
       throw new PersistenceException("{%ENPlanWork.getList%} access denied");

     String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

     if (domainWhereStr.length() != 0){
     // domainWhereStr = "  AND ENPLANWORK.DOMAIN_INFO IS NOT NULL";
     //else
        if (whereStr.length() == 0)
        whereStr = domainWhereStr;
        else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }


       if(condition.length() != 0)
       {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";

          whereStr = whereStr + " (" + condition + ")";
       }
  //+ " WHERE" +  сделано выше ????
      if(whereStr.length() != 0)
          selectStr = selectStr + " WHERE" + whereStr;

     // selectStr = selectStr + ") ";

     selectStr = selectStr + " ORDER BY " + orderBy;

     // selectStr = selectStr + " limit " + quantity + " offset " + fromPosition;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = 0;
       if(aFilterObject != null){
          if(aFilterObject.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.code);
          }
         if(aFilterObject.dateGen != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
         }
          if(aFilterObject.yearGen != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.yearGen);
          }
          if(aFilterObject.monthGen != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.monthGen);
          }

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }


            if(aFilterObject.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

         if(aFilterObject.dateEdit != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
         }


            if(aFilterObject.domain_info != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.domain_info);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.status.code);
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.elementRef.code);
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.renRef.code);
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.kind.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kind.code);
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.budgetRef.code);
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.responsibilityRef.code);
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.departmentRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }
        if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.stateRef.code);
        }

        if(aFilterObject.priConnectionNumber != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.priConnectionNumber);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }

        if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.formRef.code);
        }

        if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.sourceRef.code);
        }

        if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.causeDisconnection);
        }
       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

       //ElementLogic elementLogic = new ElementLogic(getConnection(), getUserProfile());

       set = statement.executeQuery();
       int i;
       for(i = 0;set.next();i++)
        {

         if(i < fromPosition)
          continue;
         else if(i >= fromPosition + quantity)
          {
           i++;
           break;
          }

         anObject = new ENPlanWorkShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.dateGen = set.getDate(2);
         anObject.userGen = set.getString(3);
         anObject.dateEdit = set.getDate(4);


         anObject.statusCode = set.getInt(5);

         anObject.statusName = set.getString(6);

         anObject.elementRefCode = set.getInt(7);

         //anObject.objectName = set.getString(8);
         // оптимизировано вьюхой ENELEMENTDATA !!!
         //anObject.objectName = elementLogic.getNameByCode(anObject.elementRefCode)[0] ;

         anObject.yearGen = set.getInt(9);
         if ( set.wasNull() )
             anObject.yearGen = Integer.MIN_VALUE;
         anObject.monthGen = set.getInt(10);
         if ( set.wasNull() )
             anObject.monthGen = Integer.MIN_VALUE;

         anObject.typeRefCode = set.getInt(11);

         anObject.typeRefName = set.getString(12);

         anObject.renRefCode = set.getInt(13);
         anObject.renRefName = set.getString(14);

         anObject.budgetRefCode = set.getInt(15);
         anObject.budgetRefShortName = set.getString(16);

         anObject.responsibilityRefCode = set.getInt(17);
         anObject.responsibilityRefShortName = set.getString(18);

         anObject.departmentRefCode = set.getInt(19);
         anObject.departmentRefShortName = set.getString(20);

         anObject.dateStart = set.getDate(21);
         anObject.dateFinal = set.getDate(22);

         anObject.kindCode = set.getInt(23);

         anObject.kindName = set.getString(24);

         anObject.objectName = set.getString(25);
         anObject.stateRefCode = set.getInt(26);

         anObject.invNumber = set.getString(27);

         anObject.stateRefName = set.getString("STATENAME");
         anObject.stateRefShortName = set.getString("STATESHORTNAME");

         anObject.workOrderNumber = set.getString("WORKORDERNUMBER");

         anObject.finExecutorCode = set.getInt(31);
         if ( set.wasNull() )
            anObject.finExecutorCode = Integer.MIN_VALUE;

         anObject.finExecutorName = set.getString(32);

         anObject.finExecutorFinCode = set.getInt(33);
         if ( set.wasNull() )
            anObject.finExecutorFinCode = Integer.MIN_VALUE;

         anObject.finExecutorFinTypeName = set.getString(34);

         anObject.finExecutorFinTypeCode = set.getInt(35);
         if ( set.wasNull() )
            anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;

         anObject.finExecutorFinKindName = set.getString(36);

         anObject.finExecutorFinKindCode = set.getInt(37);
         if ( set.wasNull() )
            anObject.finExecutorFinKindCode = Integer.MIN_VALUE;

         anObject.finExecutorFinCehName = set.getString(38);

         anObject.finExecutorFinCehCode = set.getInt(39);
         if ( set.wasNull() )
            anObject.finExecutorFinCehCode = Integer.MIN_VALUE;


         anObject.workOrderCode = set.getInt(40);
         if ( set.wasNull() )
            anObject.workOrderCode = Integer.MIN_VALUE;

         anObject.formRefCode = set.getInt(41);
         if ( set.wasNull() )
            anObject.formRefCode = Integer.MIN_VALUE;

         anObject.formRefName = set.getString(42);

         anObject.yearOriginal = set.getInt(43);
         if ( set.wasNull() )
             anObject.yearOriginal = Integer.MIN_VALUE;
         anObject.monthOriginal = set.getInt(44);
         if ( set.wasNull() )
             anObject.monthOriginal = Integer.MIN_VALUE;

         anObject.sourceRefCode = set.getInt(45);
        if(set.wasNull())
            anObject.sourceRefCode = Integer.MIN_VALUE;
         anObject.sourceRefName = set.getString(46);

         anObject.invgroupRefCode = set.getInt(47);
        if(set.wasNull())
            anObject.invgroupRefCode = Integer.MIN_VALUE;
         anObject.invgroupRefName = set.getString(48);


         result.list.add(anObject);
        }


       result.setTotalCount(i);
       return result;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
       return null;
      }
     finally
      {
       try {if (set != null) set.close();}             catch (SQLException e) {}
       try {if (statement != null) statement.close();} catch (SQLException e) {}
       if(connection != super.getConnection())
        {
         try{connection.close();} catch(SQLException e){}
        }
      }
    }




    public ENPlanWorkShort getShortObjectWithOutDomain(int anObjectCode)
            throws PersistenceException {
        ENPlanWorkFilter filterObject = new ENPlanWorkFilter();
        Vector list;

        filterObject.code = anObjectCode;
        list = getFilteredListWithOutDomain(filterObject).list;
        if (list.size() > 0)
            return (ENPlanWorkShort) list.get(0);
        return null;
    }


    public ENPlanWorkShortList getFilteredListWithOutDomain(
            ENPlanWorkFilter filterObject) throws PersistenceException {
        return getScrollableFilteredListWithOutDomain(filterObject, 0, -1);
    }


    public ENPlanWorkShortList getScrollableFilteredListWithOutDomain(
            ENPlanWorkFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {

        ENPlanWorkShortList result = new ENPlanWorkShortList();
        ENPlanWorkShort anObject;
        result.list = new Vector();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr = "";

        //String     condition = "";
        String     condition = processCondition(aFilterObject.conditionSQL);

        String     orderBy = "";

        if(orderBy.length() == 0)
            orderBy = "ENPLANWORK.CODE";

        if(quantity < 0)
            quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
            throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
            "ENPLANWORK.CODE"+
            ",ENPLANWORK.DATEGEN"+
            ",ENPLANWORK.USERGEN"+
            ",ENPLANWORK.DATEEDIT"+

            ", ENPLANWORKSTATUS.CODE " +
            ", ENPLANWORKSTATUS.NAME " +

            /*
            ",  case when (ENELEMENTDATA.ETYPE in (7,8) " +
            "   and ENPLANWORK.MONTHORIGINAL is not null " +
            " and ENPLANWORK.kindcode=2 " +
            " and ENPLANWORK.code not in ( " +
            " select planoldrefcode from enplancorrecthistory "+
            " where planoldrefcode=ENPLANWORK.code "+
            " and reasoncode=4) "+

            ") then 'Перенесений' else ENPLANWORKSTATUS.NAME end " +
            */

            //", ENELEMENTDATA.ECODE " +
            ", (select ENELEMENTDATA.ECODE from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

            /*
                ", ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) " +
                    " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )" +
                    " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) " +
                    " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) " +
                    " end " +
                    ") as objname " +
        */", null as objname"+
                    ",ENPLANWORK.YEARGEN"+
                    ",ENPLANWORK.MONTHGEN"+
                    ", ENPLANWORKTYPE.CODE " +
                    ", ENPLANWORKTYPE.NAME " +
                    ", EPREN.CODE, EPREN.NAME "+
                    ", ENPLANWORK.BUDGETREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE) " +
                    ", ENPLANWORK.RESPONSIBILITYREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE) " +
                    ", ENPLANWORK.DEPARTMENTREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE) " +
                    ", ENPLANWORK.DATESTART "+
                    ",ENPLANWORK.DATEFINAL"+
                    ", ENPLANWORKKIND.CODE " +
                    ", ENPLANWORKKIND.NAME " +

                    //", ENELEMENTDATA.ENAME " +
                    ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

                    ",ENPLANWORK.STATEREFCODE "+

                    //", ENELEMENTDATA.INVNUMBER " +
                    ", (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

                    ", ENPLANWORKSTATE.NAME as STATENAME " +
                    ", ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME "+
                    ", ENWORKORDER.WORKORDERNUMBER " +

                    ", FINEXECUTOR.CODE " +
                    ", FINEXECUTOR.NAME " +
                    ", FINEXECUTOR.FINCODE " +
                    ", FINEXECUTOR.FINTYPENAME " +
                    ", FINEXECUTOR.FINTYPECODE " +
                    ", FINEXECUTOR.FINKINDNAME " +
                    ", FINEXECUTOR.FINKINDCODE " +
                    ", FINEXECUTOR.FINCEHNAME " +
                    ", FINEXECUTOR.FINCEHCODE " +
                    ", ENWORKORDER.CODE " +
                    ", ENPLANWORKFORM.CODE " +
                    ", ENPLANWORKFORM.NAME " +
                    ", ENPLANWORK.YEARORIGINAL " +
                    ", ENPLANWORK.MONTHORIGINAL " +

                    ", ENPLANWORKSOURCE.CODE " +
                    ", ENPLANWORKSOURCE.NAME " +
                    ", (select g.code from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
                    ", (select g.name from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +


            //" FROM ENPLANWORK left join ENELEMENTDATA on ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE " +
            " FROM ENPLANWORK " +

            "left join FINEXECUTOR on FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE " +
            "left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
            "left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +


            ", ENPLANWORKSTATUS " +
            //", ENELEMENT " +
            ", ENPLANWORKTYPE " +
            ", EPREN " +
            ", ENPLANWORKKIND " +
            ", ENPLANWORKSTATE " +
            ", ENPLANWORKFORM " +

            ", ENPLANWORKSOURCE " +

            //", ENWORKORDER, ENWORKORDER2ENPLANWORK " +
            //", ENELEMENTDATA " +
            //" WHERE "
            "";

            whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE" ; //+


            //whereStr = whereStr +" AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE" ; //+
            whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE" ; //+
            whereStr = whereStr +" AND ENPLANWORK.RENREFCODE = EPREN.CODE" ; //+
            whereStr = whereStr +" AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE" ; //+

            whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE" ; //+
            whereStr = whereStr +" AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE" ;

            whereStr = whereStr +" AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE" ; //+

            //уехало в лефт джойн whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " ; //+
            //whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " ; //+

            // whereStr = whereStr + " AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE ";
                //selectStr = selectStr + " ${s} ENPLANWORK.CODE IN ( SELECT ENPLANWORK.CODE FROM ENPLANWORK ";

        //" ";
            if(aFilterObject != null)
            {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.CODE = ?";
            }
            if(aFilterObject.dateGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
            }
            if(aFilterObject.yearGen != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
            }
            if(aFilterObject.monthGen != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
            }
                if (aFilterObject.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
                }
            if(aFilterObject.dateEdit != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
            }
            if(aFilterObject.status.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
            }
            if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
            }
            if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
            }
            if(aFilterObject.dateStart != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
            }
            if(aFilterObject.dateFinal != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
            }
            if(aFilterObject.kind.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
            }
            if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
            }
            if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
            }
            if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
            }
            if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
            }
            if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
            }

            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
            }

            if (aFilterObject.priConnectionNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
            }

            if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
            }

            if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
            }

            if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
            }

            }




            if(condition.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + condition + ")";
            }
        //+ " WHERE" +  сделано выше ????
            if(whereStr.length() != 0)
                selectStr = selectStr + " WHERE" + whereStr;

        // selectStr = selectStr + ") ";

        selectStr = selectStr + " ORDER BY " + orderBy;

        // selectStr = selectStr + " limit " + quantity + " offset " + fromPosition;

        try
            {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if(aFilterObject != null){
                if(aFilterObject.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,aFilterObject.code);
                }
            if(aFilterObject.dateGen != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
            }
                if(aFilterObject.yearGen != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,aFilterObject.yearGen);
                }
                if(aFilterObject.monthGen != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,aFilterObject.monthGen);
                }

                if(aFilterObject.commentGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.commentGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }


                if(aFilterObject.userGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.userGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }

            if(aFilterObject.dateEdit != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
            }


                if(aFilterObject.domain_info != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.domain_info);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }

            if(aFilterObject.modify_time != Long.MIN_VALUE){
                number++;
                if(aFilterObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
            }
            if(aFilterObject.status.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.status.code);
            }
            if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.elementRef.code);
            }
            if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.renRef.code);
            }
            if(aFilterObject.dateStart != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
            }
            if(aFilterObject.dateFinal != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
            }
            if(aFilterObject.kind.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.kind.code);
            }
            if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.budgetRef.code);
            }
            if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.responsibilityRef.code);
            }
            if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.departmentRef.code);
            }
            if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.typeRef.code);
            }
            if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.stateRef.code);
            }

            if(aFilterObject.priConnectionNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.priConnectionNumber);
                for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.formRef.code);
            }

            if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.sourceRef.code);
            }

            if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.causeDisconnection);
            }
            }


            set = statement.executeQuery();
            int i;
            for(i = 0;set.next();i++)
            {

            if(i < fromPosition)
                continue;
            else if(i >= fromPosition + quantity)
                {
                i++;
                break;
                }

            anObject = new ENPlanWorkShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.dateGen = set.getDate(2);
            anObject.userGen = set.getString(3);
            anObject.dateEdit = set.getDate(4);


            anObject.statusCode = set.getInt(5);

            anObject.statusName = set.getString(6);

            anObject.elementRefCode = set.getInt(7);

            //anObject.objectName = set.getString(8);
            // оптимизировано вьюхой ENELEMENTDATA !!!
            //anObject.objectName = elementLogic.getNameByCode(anObject.elementRefCode)[0] ;

            anObject.yearGen = set.getInt(9);
            if ( set.wasNull() )
                anObject.yearGen = Integer.MIN_VALUE;
            anObject.monthGen = set.getInt(10);
            if ( set.wasNull() )
                anObject.monthGen = Integer.MIN_VALUE;

            anObject.typeRefCode = set.getInt(11);

            anObject.typeRefName = set.getString(12);

            anObject.renRefCode = set.getInt(13);
            anObject.renRefName = set.getString(14);

            anObject.budgetRefCode = set.getInt(15);
            anObject.budgetRefShortName = set.getString(16);

            anObject.responsibilityRefCode = set.getInt(17);
            anObject.responsibilityRefShortName = set.getString(18);

            anObject.departmentRefCode = set.getInt(19);
            anObject.departmentRefShortName = set.getString(20);

            anObject.dateStart = set.getDate(21);
            anObject.dateFinal = set.getDate(22);

            anObject.kindCode = set.getInt(23);

            anObject.kindName = set.getString(24);

            anObject.objectName = set.getString(25);
            anObject.stateRefCode = set.getInt(26);

            anObject.invNumber = set.getString(27);

            anObject.stateRefName = set.getString("STATENAME");
            anObject.stateRefShortName = set.getString("STATESHORTNAME");

            anObject.workOrderNumber = set.getString("WORKORDERNUMBER");

            anObject.finExecutorCode = set.getInt(31);
            if ( set.wasNull() )
                anObject.finExecutorCode = Integer.MIN_VALUE;

            anObject.finExecutorName = set.getString(32);

            anObject.finExecutorFinCode = set.getInt(33);
            if ( set.wasNull() )
                anObject.finExecutorFinCode = Integer.MIN_VALUE;

            anObject.finExecutorFinTypeName = set.getString(34);

            anObject.finExecutorFinTypeCode = set.getInt(35);
            if ( set.wasNull() )
                anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;

            anObject.finExecutorFinKindName = set.getString(36);

            anObject.finExecutorFinKindCode = set.getInt(37);
            if ( set.wasNull() )
                anObject.finExecutorFinKindCode = Integer.MIN_VALUE;

            anObject.finExecutorFinCehName = set.getString(38);

            anObject.finExecutorFinCehCode = set.getInt(39);
            if ( set.wasNull() )
                anObject.finExecutorFinCehCode = Integer.MIN_VALUE;


            anObject.workOrderCode = set.getInt(40);
            if ( set.wasNull() )
                anObject.workOrderCode = Integer.MIN_VALUE;

            anObject.formRefCode = set.getInt(41);
            if ( set.wasNull() )
                anObject.formRefCode = Integer.MIN_VALUE;

            anObject.formRefName = set.getString(42);

            anObject.yearOriginal = set.getInt(43);
            if ( set.wasNull() )
                anObject.yearOriginal = Integer.MIN_VALUE;
            anObject.monthOriginal = set.getInt(44);
            if ( set.wasNull() )
                anObject.monthOriginal = Integer.MIN_VALUE;

            anObject.sourceRefCode = set.getInt(45);
                if(set.wasNull())
                anObject.sourceRefCode = Integer.MIN_VALUE;
            anObject.sourceRefName = set.getString(46);

            anObject.invgroupRefCode = set.getInt(47);
                if(set.wasNull())
                anObject.invgroupRefCode = Integer.MIN_VALUE;
            anObject.invgroupRefName = set.getString(48);


            result.list.add(anObject);
            }


            result.setTotalCount(i);
            return result;
            }
        catch(SQLException e)
            {
            System.out.println(e.getMessage()+"\nstatement - "+selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return null;
            }
        finally
            {
            try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
            if(connection != super.getConnection())
            {
            try{connection.close();} catch(SQLException e){}
            }
            }
    }

    public ENPlanWork getObjectNOSEGR(int uid) throws PersistenceException
    {
     ENPlanWork result = new ENPlanWork();
     result.code = uid;
     loadObjectNOSEGR(result);
     if(result.code == Integer.MIN_VALUE)
      return null;
     return result;
    }


   public void loadObjectNOSEGR(ENPlanWork anObject) throws PersistenceException
    {
     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet set = null;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     /*
     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
     if(segregationInfo.isAccessDenied())
       throw new PersistenceException("{%ENPlanWork.getObject%} access denied");
    */


     selectStr =
     "SELECT  ENPLANWORK.CODE, ENPLANWORK.DATEGEN, ENPLANWORK.DATESTART, ENPLANWORK.DATEFINAL, ENPLANWORK.YEARGEN, ENPLANWORK.MONTHGEN, ENPLANWORK.YEARORIGINAL, ENPLANWORK.MONTHORIGINAL, ENPLANWORK.COMMENTGEN, ENPLANWORK.USERGEN, ENPLANWORK.DATEEDIT, ENPLANWORK.DISTANCEALONG, ENPLANWORK.DISTANCETO, ENPLANWORK.WORKORDERNUMBER, ENPLANWORK.DATEWORKORDER, ENPLANWORK.PRICONNECTIONNUMBER, ENPLANWORK.DATEENDPRICONNECTION, ENPLANWORK.INVESTWORKSDESCRIPTION, ENPLANWORK.SERVICESFSIDEFINID, ENPLANWORK.SERVICESFSIDECNNUM, ENPLANWORK.TOTALTIMEHOURS, ENPLANWORK.TOTALTIMEDAYS, ENPLANWORK.DOMAIN_INFO, ENPLANWORK.MODIFY_TIME, ENPLANWORK.STATUSCODE, ENPLANWORK.ELEMENTREFCODE, ENPLANWORK.TYPEREFCODE, ENPLANWORK.KINDCODE, ENPLANWORK.RENREFCODE, ENPLANWORK.FINEXECUTORCODE, ENPLANWORK.STATEREFCODE, ENPLANWORK.FORMREFCODE, ENPLANWORK.SOURCEREFCODE, ENPLANWORK.DDSCODESCODE, ENPLANWORK.BUDGETREFCODE, ENPLANWORK.RESPONSIBILITYREFCODE, ENPLANWORK.DEPARTMENTREFCODE, ENPLANWORK.INVGROUPREFCODE, ENPLANWORK.IPIMPLEMENTTYPEREFCODE, ENPLANWORK.CAUSEDISCONNECTION "
     +" FROM ENPLANWORK WHERE ENPLANWORK.CODE = ?";

     /*
     String segregationWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());
     if(segregationWhereStr.length() > 0)
      selectStr = selectStr + " AND " + segregationWhereStr;
     */

     try
      {
       statement = connection.prepareStatement(selectStr);
       statement.setInt(1,anObject.code);
       set = statement.executeQuery();
       if(!set.next())
        anObject.code = Integer.MIN_VALUE;
       else
        {
         anObject.code = set.getInt(1);
         anObject.dateGen = set.getDate(2);
         anObject.dateStart = set.getDate(3);
         anObject.dateFinal = set.getDate(4);
         anObject.yearGen = set.getInt(5);
         if ( set.wasNull() )
            anObject.yearGen = Integer.MIN_VALUE;
         anObject.monthGen = set.getInt(6);
         if ( set.wasNull() )
            anObject.monthGen = Integer.MIN_VALUE;
         anObject.yearOriginal = set.getInt(7);
         if ( set.wasNull() )
            anObject.yearOriginal = Integer.MIN_VALUE;
         anObject.monthOriginal = set.getInt(8);
         if ( set.wasNull() )
            anObject.monthOriginal = Integer.MIN_VALUE;
         anObject.commentGen = set.getString(9);
         anObject.userGen = set.getString(10);
         anObject.dateEdit = set.getDate(11);
         anObject.distanceAlong = set.getBigDecimal(12);
         if(anObject.distanceAlong != null)
             anObject.distanceAlong = anObject.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.distanceTo = set.getBigDecimal(13);
         if(anObject.distanceTo != null)
             anObject.distanceTo = anObject.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.workOrderNumber = set.getString(14);
         anObject.dateWorkOrder = set.getDate(15);
         anObject.priConnectionNumber = set.getString(16);
         anObject.dateEndPriConnection = set.getDate(17);
         anObject.investWorksDescription = set.getString(18);
         anObject.servicesFSideFinId = set.getInt(19);
         if ( set.wasNull() )
            anObject.servicesFSideFinId = Integer.MIN_VALUE;
         anObject.servicesFSideCnNum = set.getString(20);
         anObject.totalTimeHours = set.getBigDecimal(21);
         if(anObject.totalTimeHours != null)
             anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.totalTimeDays = set.getBigDecimal(22);
         if(anObject.totalTimeDays != null)
             anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.domain_info = set.getString(23);
         anObject.modify_time = set.getLong(24);
         if(set.wasNull())
          anObject.modify_time = Long.MIN_VALUE;
         anObject.status.code = set.getInt(25);
         if ( set.wasNull() )
             anObject.status.code = Integer.MIN_VALUE;
         anObject.elementRef.code = set.getInt(26);
         if ( set.wasNull() )
             anObject.elementRef.code = Integer.MIN_VALUE;
         anObject.typeRef.code = set.getInt(27);
         if ( set.wasNull() )
             anObject.typeRef.code = Integer.MIN_VALUE;
         anObject.kind.code = set.getInt(28);
         if ( set.wasNull() )
             anObject.kind.code = Integer.MIN_VALUE;
         anObject.renRef.code = set.getInt(29);
         if ( set.wasNull() )
             anObject.renRef.code = Integer.MIN_VALUE;
         anObject.finExecutor.code = set.getInt(30);
         if ( set.wasNull() )
             anObject.finExecutor.code = Integer.MIN_VALUE;
         anObject.stateRef.code = set.getInt(31);
         if ( set.wasNull() )
             anObject.stateRef.code = Integer.MIN_VALUE;
         anObject.formRef.code = set.getInt(32);
         if ( set.wasNull() )
             anObject.formRef.code = Integer.MIN_VALUE;
         anObject.sourceRef.code = set.getInt(33);
         if ( set.wasNull() )
             anObject.sourceRef.code = Integer.MIN_VALUE;
         anObject.ddsCodes.code = set.getInt(34);
         if ( set.wasNull() )
             anObject.ddsCodes.code = Integer.MIN_VALUE;
         anObject.budgetRef.code = set.getInt(35);
         if ( set.wasNull() )
             anObject.budgetRef.code = Integer.MIN_VALUE;
         anObject.responsibilityRef.code = set.getInt(36);
         if ( set.wasNull() )
             anObject.responsibilityRef.code = Integer.MIN_VALUE;
         anObject.departmentRef.code = set.getInt(37);
         if ( set.wasNull() )
             anObject.departmentRef.code = Integer.MIN_VALUE;
         anObject.invgroupRef.code = set.getInt(38);
         if ( set.wasNull() )
             anObject.invgroupRef.code = Integer.MIN_VALUE;
         anObject.ipImplementTypeRef.code = set.getInt(39);
         if ( set.wasNull() )
             anObject.ipImplementTypeRef.code = Integer.MIN_VALUE;
         anObject.causeDisconnection = set.getInt(40);
         if ( set.wasNull() )
             anObject.causeDisconnection = Integer.MIN_VALUE;
         if(anObject.status.code != Integer.MIN_VALUE)
         {
            anObject.setStatus(
            new com.ksoe.energynet.dataminer.generated.ENPlanWorkStatusDAOGen(connection,getUserProfile()).getObject(anObject.status.code));
        }
         if(anObject.typeRef.code != Integer.MIN_VALUE)
         {
            anObject.setTypeRef(
            new com.ksoe.energynet.dataminer.generated.ENPlanWorkTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
        }
         if(anObject.kind.code != Integer.MIN_VALUE)
         {
            anObject.setKind(
            new com.ksoe.energynet.dataminer.generated.ENPlanWorkKindDAOGen(connection,getUserProfile()).getObject(anObject.kind.code));
        }
         if(anObject.renRef.code != Integer.MIN_VALUE)
         {
            anObject.setRenRef(
            new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).getRef(anObject.renRef.code));
        }
         if(anObject.finExecutor.code != Integer.MIN_VALUE)
         {
            anObject.setFinExecutor(
            new com.ksoe.energynet.dataminer.generated.FINExecutorDAOGen(connection,getUserProfile()).getObject(anObject.finExecutor.code));
        }
         if(anObject.stateRef.code != Integer.MIN_VALUE)
         {
            anObject.setStateRef(
            new com.ksoe.energynet.dataminer.generated.ENPlanWorkStateDAOGen(connection,getUserProfile()).getRef(anObject.stateRef.code));
        }
         if(anObject.formRef.code != Integer.MIN_VALUE)
         {
            anObject.setFormRef(
            new com.ksoe.energynet.dataminer.generated.ENPlanWorkFormDAOGen(connection,getUserProfile()).getRef(anObject.formRef.code));
        }
         if(anObject.sourceRef.code != Integer.MIN_VALUE)
         {
            anObject.setSourceRef(
            new com.ksoe.energynet.dataminer.generated.ENPlanWorkSourceDAOGen(connection,getUserProfile()).getRef(anObject.sourceRef.code));
        }
         if(anObject.ddsCodes.code != Integer.MIN_VALUE)
         {
            anObject.setDdsCodes(
            new com.ksoe.rqorder.dataminer.generated.RQDDSCodesDAOGen(connection,getUserProfile()).getObject(anObject.ddsCodes.code));
        }
         if(anObject.budgetRef.code != Integer.MIN_VALUE)
         {
            anObject.setBudgetRef(
            new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.budgetRef.code));
        }
         if(anObject.responsibilityRef.code != Integer.MIN_VALUE)
         {
            anObject.setResponsibilityRef(
            new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.responsibilityRef.code));
        }
         if(anObject.departmentRef.code != Integer.MIN_VALUE)
         {
            anObject.setDepartmentRef(
            new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.departmentRef.code));
        }
         if(anObject.invgroupRef.code != Integer.MIN_VALUE)
         {
            anObject.setInvgroupRef(
            new com.ksoe.energynet.dataminer.generated.ENInvestProgramGroupsDAOGen(connection,getUserProfile()).getRef(anObject.invgroupRef.code));
        }
         if(anObject.ipImplementTypeRef.code != Integer.MIN_VALUE)
         {
            anObject.setIpImplementTypeRef(
            		new com.ksoe.energynet.dataminer.generated.ENIPImplementationTypeDAOGen(connection,getUserProfile()).getRef(anObject.ipImplementTypeRef.code));
         }
       }
     }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      }
     finally
      {
       try {if(set != null) set.close(); if (statement != null) statement.close();}
       catch (SQLException e) {}
       if(connection != super.getConnection())
        {
         try{connection.close();} catch(SQLException e){}
        }
      }
    }


    public void updateCommentGen(int planCode, String commentGen)
            throws PersistenceException {
        Connection connection = getConnection();

        String updPlan = " update enplanwork set commentgen = '" + commentGen
                + "' where code = " + planCode;

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(updPlan);
            statement.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + updPlan
                    + "\n planCode = " + planCode);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            statement = null;
        }
    }


    public ENPlanWorkShortList getPlanWorkGeneralList(String anCondition,
            int fromPosition, int quantity) throws PersistenceException {
        return getPlanWorkGeneralList(null, anCondition, fromPosition, quantity);
    }

    public ENPlanWorkShortList getPlanWorkGeneralList(ENPlanWork aFilterObject,
            String anCondition, int fromPosition, int quantity)
            throws PersistenceException {
        return getPlanWorkGeneralList(aFilterObject, anCondition, null,
                fromPosition, quantity, null);
    }

    public ENPlanWorkShortList getPlanWorkGeneralList(
            ENPlanWorkFilter aFilterObject, int fromPosition, int quantity)
            throws PersistenceException {
        return getPlanWorkGeneralList(
                aFilterObject,
                (aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
                (aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
                fromPosition, quantity, null);
    }

    public ENPlanWorkShortList getPlanWorkGeneralList(ENPlanWork aFilterObject,
            String anCondition, String anOrderBy, int fromPosition,
            int quantity, Vector aBindObjects) throws PersistenceException {
        ENPlanWorkShortList result = new ENPlanWorkShortList();
        ENPlanWorkShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

        if (orderBy.length() == 0)
            orderBy = "ENPLANWORK.CODE";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT " +
                " ENPLANWORK.CODE, " +
                " ENPLANWORK.DATEGEN, " +
                " ENPLANWORK.USERGEN, " +
                " ENPLANWORK.DATEEDIT, " +

                " ENPLANWORKSTATUS.CODE, " +
                " ENPLANWORKSTATUS.NAME, " +

                " ENPLANWORK.ELEMENTREFCODE, " +

                " ENPLANWORK.YEARGEN, " +
                " ENPLANWORK.MONTHGEN, " +

                " ENPLANWORKTYPE.CODE, " +
                " ENPLANWORKTYPE.NAME, " +

                " EPREN.CODE, " +
                " EPREN.NAME, " +

                " ENPLANWORK.BUDGETREFCODE, " +
                " (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE), " +
                " ENPLANWORK.RESPONSIBILITYREFCODE, " +
                " (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE), " +
                " ENPLANWORK.DEPARTMENTREFCODE, " +
                " (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE), " +

                " ENPLANWORK.DATESTART, " +
                " ENPLANWORK.DATEFINAL, " +
                " ENPLANWORKKIND.CODE, " +
                " ENPLANWORKKIND.NAME, " +

                " (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE), " +
                " ENPLANWORK.STATEREFCODE, " +
                " (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE), " +

                " ENPLANWORKSTATE.NAME as STATENAME, " +
                " ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME, " +

                " ENWORKORDER.WORKORDERNUMBER, " +
                " ENWORKORDER.CODE, " +

                " ENPLANWORKFORM.CODE, " +
                " ENPLANWORKFORM.NAME, " +
                " ENPLANWORK.YEARORIGINAL, " +
                " ENPLANWORK.MONTHORIGINAL, " +
                " ENPLANWORKSOURCE.CODE, " +
                " ENPLANWORKSOURCE.NAME, " +

                " (select g.code from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode), " +
                " (select g.name from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode), " +
                " ENPLANWORK.INVESTWORKSDESCRIPTION, " +

                " (select 'акт № '||a.numbergen||', от '||to_char(a.dateact,'dd.MM.yyyy') from enact a " +
                " where a.code = (select a2p.actrefcode from enact2enplanwork a2p where a2p.plancode = enplanwork.code)) " +

                " FROM ENPLANWORK  " +

                " left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
                " left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +

                ", ENPLANWORKSTATUS " +
                ", ENPLANWORKTYPE " +
                ", EPREN " +
                ", ENPLANWORKKIND " +
                ", ENPLANWORKSTATE " +
                ", ENPLANWORKFORM " +

                ", ENPLANWORKSOURCE " +

                "";

        whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE";
        whereStr = whereStr    + " AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE";
        whereStr = whereStr + " AND ENPLANWORK.RENREFCODE = EPREN.CODE";
        whereStr = whereStr + " AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE";
        whereStr = whereStr    + " AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE";
        whereStr = whereStr + " AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE";
        whereStr = whereStr + " AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE";

        if (aFilterObject != null) {
            if (aFilterObject.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.CODE = ?";
            }
            if (aFilterObject.dateGen != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
            }
            if (aFilterObject.yearGen != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
            }
            if (aFilterObject.monthGen != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
            }
            if (aFilterObject.userGen != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*', 0) < 0
                        && aFilterObject.userGen.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
            }
            if (aFilterObject.dateEdit != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
            }
            if (aFilterObject.status.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
            }
            if (aFilterObject.elementRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
            }
            if (aFilterObject.renRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
            }
            if (aFilterObject.dateStart != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
            }
            if (aFilterObject.dateFinal != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
            }
            if (aFilterObject.kind.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
            }
            if (aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
            }
            if (aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
            }
            if (aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
            }
            if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
            }
            if (aFilterObject.stateRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
            }

            if (aFilterObject.commentGen != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.commentGen.indexOf('*', 0) < 0
                        && aFilterObject.commentGen.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
            }

            if (aFilterObject.priConnectionNumber != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.priConnectionNumber.indexOf('*', 0) < 0
                        && aFilterObject.priConnectionNumber.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
            }

            if (aFilterObject.formRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
            }

            if (aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
            }

            if (aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
            }

        }

        SegregationInfo segregationInfo = new SegregationProcessor()
                .getSegregationInfoForDataAccess(ENPlanWork.class.getName(),
                        DataAccessType.READ_LIST, getUserProfile()
                                .getDomainInfo().getDomain());
        if (segregationInfo.isAccessDenied())
            throw new PersistenceException(
                    "{%ENPlanWork.getList%} access denied");

        String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",
                segregationInfo, getUserProfile().getDomainInfo());

        if (domainWhereStr.length() != 0) {
            if (whereStr.length() == 0)
                whereStr = domainWhereStr;
            else
                whereStr = " " + whereStr + " AND " + domainWhereStr;
        }

        if (condition.length() != 0) {
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }

        if (whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

        selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

        try {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if (aFilterObject != null) {
                if (aFilterObject.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.code);
                }
                if (aFilterObject.dateGen != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateGen.getTime()));
                }
                if (aFilterObject.yearGen != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.yearGen);
                }
                if (aFilterObject.monthGen != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.monthGen);
                }

                if (aFilterObject.commentGen != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.commentGen);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.userGen != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.userGen);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.dateEdit != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateEdit.getTime()));
                }

                if (aFilterObject.domain_info != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.domain_info);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.modify_time != Long.MIN_VALUE) {
                    number++;
                    if (aFilterObject.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number, null);
                    else
                        statement.setBigDecimal(number,
                                new java.math.BigDecimal(
                                        aFilterObject.modify_time));
                }
                if (aFilterObject.status.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.status.code);
                }
                if (aFilterObject.elementRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.elementRef.code);
                }
                if (aFilterObject.renRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.renRef.code);
                }
                if (aFilterObject.dateStart != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateStart.getTime()));
                }
                if (aFilterObject.dateFinal != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateFinal.getTime()));
                }
                if (aFilterObject.kind.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.kind.code);
                }
                if (aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.budgetRef.code);
                }
                if (aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,
                            aFilterObject.responsibilityRef.code);
                }
                if (aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.departmentRef.code);
                }
                if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.typeRef.code);
                }
                if (aFilterObject.stateRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.stateRef.code);
                }

                if (aFilterObject.priConnectionNumber != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.priConnectionNumber);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.formRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.formRef.code);
                }

                if (aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.sourceRef.code);
                }
                if (aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.causeDisconnection);
                }
            }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {

//                if (i < fromPosition)
//                    continue;
//                else if (i >= fromPosition + quantity) {
//                    i++;
//                    break;
//                }

                anObject = new ENPlanWorkShort();

                anObject.code = set.getInt(1);
                if (set.wasNull())
                    anObject.code = Integer.MIN_VALUE;
                anObject.dateGen = set.getDate(2);
                anObject.userGen = set.getString(3);
                anObject.dateEdit = set.getDate(4);

                anObject.statusCode = set.getInt(5);
                //anObject.statusName = set.getString(6);
                anObject.statusName = getPlanWorkStatus(anObject.code);

                anObject.elementRefCode = set.getInt(7);

                anObject.yearGen = set.getInt(8);
                if (set.wasNull())
                    anObject.yearGen = Integer.MIN_VALUE;
                anObject.monthGen = set.getInt(9);
                if (set.wasNull())
                    anObject.monthGen = Integer.MIN_VALUE;

                anObject.typeRefCode = set.getInt(10);
                anObject.typeRefName = set.getString(11);

                anObject.renRefCode = set.getInt(12);
                anObject.renRefName = set.getString(13);

                anObject.budgetRefCode = set.getInt(14);
                anObject.budgetRefShortName = set.getString(15);
                anObject.responsibilityRefCode = set.getInt(16);
                anObject.responsibilityRefShortName = set.getString(17);
                anObject.departmentRefCode = set.getInt(18);
                anObject.departmentRefShortName = set.getString(19);

                anObject.dateStart = set.getDate(20);
                anObject.dateFinal = set.getDate(21);

                anObject.kindCode = set.getInt(22);
                anObject.kindName = set.getString(23);

                anObject.objectName = set.getString(24);
                anObject.stateRefCode = set.getInt(25);
                anObject.invNumber = set.getString(26);

                anObject.stateRefName = set.getString("STATENAME");
                anObject.stateRefShortName = set.getString("STATESHORTNAME");

                anObject.workOrderNumber = set.getString("WORKORDERNUMBER");
                anObject.workOrderCode = set.getInt(30);
                if (set.wasNull())
                    anObject.workOrderCode = Integer.MIN_VALUE;

                anObject.formRefCode = set.getInt(31);
                if (set.wasNull())
                    anObject.formRefCode = Integer.MIN_VALUE;
                anObject.formRefName = set.getString(32);

                anObject.yearOriginal = set.getInt(33);
                if (set.wasNull())
                    anObject.yearOriginal = Integer.MIN_VALUE;
                anObject.monthOriginal = set.getInt(34);
                if (set.wasNull())
                    anObject.monthOriginal = Integer.MIN_VALUE;

                anObject.sourceRefCode = set.getInt(35);
                if (set.wasNull())
                    anObject.sourceRefCode = Integer.MIN_VALUE;
                anObject.sourceRefName = set.getString(36);

                anObject.invgroupRefCode = set.getInt(37);
                if (set.wasNull())
                    anObject.invgroupRefCode = Integer.MIN_VALUE;
                anObject.invgroupRefName = set.getString(38);

                anObject.investWorksDescription = set.getString(39);

                anObject.actInfo = set.getString(40);

                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    private String getPlanWorkStatus(int planCode) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = " select p.status from planworkstatus p where p.plancode = " + planCode;

        String planWorkStatus = "";

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                planWorkStatus = set.getString(1);
                if (set.wasNull())
                    planWorkStatus = "";
            }

            return planWorkStatus;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return planWorkStatus;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }


    /**Перечень планов для пункта ИП  */
    public ENPlanWorkShortList getScrollableFilteredListIPitem2plan(ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENPlanWorkShortList result = new ENPlanWorkShortList();
     ENPlanWorkShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);


      if (anCondition != null && anCondition.equals("( statuscode <> 6)")) {
          throw new PersistenceException("\n\n"+
                  "Ошибка при определении условия поиска планов!!!");
      }

     if(orderBy.length() == 0)
      orderBy = "ENPLANWORK.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENPLANWORK.CODE"+
      ",ENPLANWORK.DATEGEN"+
      ",ENPLANWORK.USERGEN"+
      ",ENPLANWORK.DATEEDIT"+

       ", ENPLANWORKSTATUS.CODE " +
       ", ENPLANWORKSTATUS.NAME " +

       /*
       ",  case when (ENELEMENTDATA.ETYPE in (7,8) " +
       "   and ENPLANWORK.MONTHORIGINAL is not null " +
       " and ENPLANWORK.kindcode=2 " +
       " and ENPLANWORK.code not in ( " +
       " select planoldrefcode from enplancorrecthistory "+
       " where planoldrefcode=ENPLANWORK.code "+
       " and reasoncode=4) "+

       ") then 'Перенесений' else ENPLANWORKSTATUS.NAME end " +
       */

       //", ENELEMENTDATA.ECODE " +
       ", (select ENELEMENTDATA.ECODE from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

      /*
          ", ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) " +
              " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )" +
              " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) " +
              " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) " +
              " end " +
              ") as objname " +
  */", null as objname"+
              ",ENPLANWORK.YEARGEN"+
              ",ENPLANWORK.MONTHGEN"+
              ", ENPLANWORKTYPE.CODE " +
              ", ENPLANWORKTYPE.NAME " +
              ", EPREN.CODE, EPREN.NAME "+
              ", ENPLANWORK.BUDGETREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.BUDGETREFCODE) " +
              ", ENPLANWORK.RESPONSIBILITYREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.RESPONSIBILITYREFCODE) " +
              ", ENPLANWORK.DEPARTMENTREFCODE, (select SHORTNAME from ENDEPARTMENT where CODE = ENPLANWORK.DEPARTMENTREFCODE) " +
              ", ENPLANWORK.DATESTART "+
                ",ENPLANWORK.DATEFINAL"+
                ", ENPLANWORKKIND.CODE " +
                ", ENPLANWORKKIND.NAME " +

                //", ENELEMENTDATA.ENAME " +
                ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

                ",ENPLANWORK.STATEREFCODE "+

                //", ENELEMENTDATA.INVNUMBER " +
                ", (select ENELEMENTDATA.INVNUMBER from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE) " +

                ", ENPLANWORKSTATE.NAME as STATENAME " +
                ", ENPLANWORKSTATE.SHORTNAME as STATESHORTNAME "+

               ", '' as WORKORDERNUMBER " +

                ", 0 as CODE " +
                ", '' as NAME " +
                ", 0 as FINCODE " +
                ", '' as FINTYPENAME " +
                ", 0 as FINTYPECODE " +
                ", '' as FINKINDNAME " +
                ", 0 as FINKINDCODE " +
                ", '' as FINCEHNAME " +
                ", 0 as FINCEHCODE " +
                ", 0 as CODE " +
                ", ENPLANWORKFORM.CODE " +
                ", ENPLANWORKFORM.NAME " +
                ", ENPLANWORK.YEARORIGINAL " +
                ", ENPLANWORK.MONTHORIGINAL " +

                ", ENPLANWORKSOURCE.CODE " +
                ", ENPLANWORKSOURCE.NAME " +
                ", (select g.code from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
                ", (select g.name from eninvestprogramgroups g where g.code = enplanwork.invgrouprefcode) " +
                ", ENPLANWORK.INVESTWORKSDESCRIPTION " +

        ", (select ENIPIMPLEMENTATIONTYPE.CODE from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +
        ", (select ENIPIMPLEMENTATIONTYPE.NAME from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENPLANWORK.IPIMPLEMENTTYPEREFCODE) " +

      //" FROM ENPLANWORK left join ENELEMENTDATA on ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE " +

      " FROM ENPLANWORK  " +

    // "left join FINEXECUTOR on FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE " +
    //  "left join ENWORKORDER2ENPLANWORK  on  ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
    //  "left join ENWORKORDER on  ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " +


      ", ENPLANWORKSTATUS " +
      //", ENELEMENT " +
      ", ENPLANWORKTYPE " +
      ", EPREN " +
      ", ENPLANWORKKIND " +
      ", ENPLANWORKSTATE " +
      ", ENPLANWORKFORM " +

      ", ENPLANWORKSOURCE " +
      ", enipitem2plan " +

      //", ENWORKORDER, ENWORKORDER2ENPLANWORK " +
      //", ENELEMENTDATA " +
      //" WHERE "
      "";

      whereStr = " ENPLANWORKSTATUS.CODE = ENPLANWORK.STATUSCODE" ; //+


       //whereStr = whereStr +" AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENPLANWORK.TYPEREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORK.RENREFCODE = EPREN.CODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKKIND.CODE = ENPLANWORK.KINDCODE" ; //+

       whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENPLANWORK.STATEREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKFORM.CODE = ENPLANWORK.FORMREFCODE" ;

       whereStr = whereStr +" AND ENPLANWORKSOURCE.CODE = ENPLANWORK.SOURCEREFCODE" ; //+

       whereStr = whereStr +" AND ENPLANWORK.CODE = enipitem2plan.planrefcode " ; //+

       //уехало в лефт джойн whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " ; //+
       //whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE " ; //+

       // whereStr = whereStr + " AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE ";
          //selectStr = selectStr + " ${s} ENPLANWORK.CODE IN ( SELECT ENPLANWORK.CODE FROM ENPLANWORK ";

  //" ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.CODE = ?";
         }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
         }
         if(aFilterObject.monthGen != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
              else
                  whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
         }
         if(aFilterObject.status.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.STATUSCODE = ? ";
         }
         if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.ELEMENTREFCODE = ? ";
         }
         if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.RENREFCODE = ? ";
         }
         if(aFilterObject.dateStart != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
         }
         if(aFilterObject.dateFinal != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
         }
         if(aFilterObject.kind.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.KINDCODE = ? ";
         }
         if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.BUDGETREFCODE = ? ";
         }
         if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
         }
         if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.DEPARTMENTREFCODE = ? ";
         }
         if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
         }
         if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
         }

         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLANWORK.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLANWORK.COMMENTGEN) LIKE UPPER(?)";
         }

         if (aFilterObject.priConnectionNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLANWORK.PRICONNECTIONNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLANWORK.PRICONNECTIONNUMBER) LIKE UPPER(?)";
         }

         if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.FORMREFCODE = ? ";
         }

         if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.SOURCEREFCODE = ? ";
         }
         if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.IPIMPLEMENTTYPEREFCODE = ? ";
         }
         if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENPLANWORK.CAUSEDISCONNECTION = ? ";
         }
       }


     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
     if(segregationInfo.isAccessDenied())
       throw new PersistenceException("{%ENPlanWork.getList%} access denied");

     String domainWhereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

     if (domainWhereStr.length() != 0){
     // domainWhereStr = "  AND ENPLANWORK.DOMAIN_INFO IS NOT NULL";
     //else
      if (whereStr.length() == 0)
          whereStr = domainWhereStr;
      else
          whereStr = " "+whereStr + " AND " +domainWhereStr;
      }


       if(condition.length() != 0)
       {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";

          whereStr = whereStr + " (" + condition + ")";
       }
  //+ " WHERE" +  сделано выше ????
      if(whereStr.length() != 0)
          selectStr = selectStr + " WHERE" + whereStr;

     // selectStr = selectStr + ") ";

     selectStr = selectStr + " ORDER BY " + orderBy;

     selectStr = selectStr + " OFFSET " + fromPosition;
     if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = 0;
       if(aFilterObject != null){
          if(aFilterObject.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.code);
          }
         if(aFilterObject.dateGen != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
         }
          if(aFilterObject.yearGen != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.yearGen);
          }
          if(aFilterObject.monthGen != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.monthGen);
          }

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }


            if(aFilterObject.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

         if(aFilterObject.dateEdit != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
         }


            if(aFilterObject.domain_info != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.domain_info);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.status.code);
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.elementRef.code);
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.renRef.code);
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.kind.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kind.code);
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.budgetRef.code);
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.responsibilityRef.code);
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.departmentRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }
        if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.stateRef.code);
        }

        if(aFilterObject.priConnectionNumber != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.priConnectionNumber);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }

        if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.formRef.code);
        }

        if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.sourceRef.code);
        }
        if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.ipImplementTypeRef.code);
        }
        if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.causeDisconnection);
        }
       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

       //ElementLogic elementLogic = new ElementLogic(getConnection(), getUserProfile());

       set = statement.executeQuery();
       int i;
       for(i = 0;set.next();i++)
        {

         /*
         if(i < fromPosition)
          continue;
         else if(i >= fromPosition + quantity)
          {
           i++;
           break;
          }
          */

         anObject = new ENPlanWorkShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.dateGen = set.getTimestamp(2); // NET-4213
         anObject.userGen = set.getString(3);
         anObject.dateEdit = set.getDate(4);


         anObject.statusCode = set.getInt(5);

         anObject.statusName = set.getString(6);

         anObject.elementRefCode = set.getInt(7);

         //anObject.objectName = set.getString(8);
         // оптимизировано вьюхой ENELEMENTDATA !!!
         //anObject.objectName = elementLogic.getNameByCode(anObject.elementRefCode)[0] ;

         anObject.yearGen = set.getInt(9);
         if ( set.wasNull() )
             anObject.yearGen = Integer.MIN_VALUE;
         anObject.monthGen = set.getInt(10);
         if ( set.wasNull() )
             anObject.monthGen = Integer.MIN_VALUE;

         anObject.typeRefCode = set.getInt(11);

         anObject.typeRefName = set.getString(12);

         anObject.renRefCode = set.getInt(13);
         anObject.renRefName = set.getString(14);

         anObject.budgetRefCode = set.getInt(15);
         anObject.budgetRefShortName = set.getString(16);

         anObject.responsibilityRefCode = set.getInt(17);
         anObject.responsibilityRefShortName = set.getString(18);

         anObject.departmentRefCode = set.getInt(19);
         anObject.departmentRefShortName = set.getString(20);

         anObject.dateStart = set.getDate(21);
         anObject.dateFinal = set.getDate(22);

         anObject.kindCode = set.getInt(23);

         anObject.kindName = set.getString(24);

         anObject.objectName = set.getString(25);
         anObject.stateRefCode = set.getInt(26);

         anObject.invNumber = set.getString(27);

         anObject.stateRefName = set.getString("STATENAME");
         anObject.stateRefShortName = set.getString("STATESHORTNAME");

         anObject.workOrderNumber = set.getString("WORKORDERNUMBER");

         anObject.finExecutorCode = set.getInt(31);
         if ( set.wasNull() )
          anObject.finExecutorCode = Integer.MIN_VALUE;

         anObject.finExecutorName = set.getString(32);

         anObject.finExecutorFinCode = set.getInt(33);
         if ( set.wasNull() )
          anObject.finExecutorFinCode = Integer.MIN_VALUE;

         anObject.finExecutorFinTypeName = set.getString(34);

         anObject.finExecutorFinTypeCode = set.getInt(35);
         if ( set.wasNull() )
          anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;

         anObject.finExecutorFinKindName = set.getString(36);

         anObject.finExecutorFinKindCode = set.getInt(37);
         if ( set.wasNull() )
          anObject.finExecutorFinKindCode = Integer.MIN_VALUE;

         anObject.finExecutorFinCehName = set.getString(38);

         anObject.finExecutorFinCehCode = set.getInt(39);
         if ( set.wasNull() )
          anObject.finExecutorFinCehCode = Integer.MIN_VALUE;


         anObject.workOrderCode = set.getInt(40);
         if ( set.wasNull() )
          anObject.workOrderCode = Integer.MIN_VALUE;

         anObject.formRefCode = set.getInt(41);
         if ( set.wasNull() )
          anObject.formRefCode = Integer.MIN_VALUE;

         anObject.formRefName = set.getString(42);

         anObject.yearOriginal = set.getInt(43);
         if ( set.wasNull() )
             anObject.yearOriginal = Integer.MIN_VALUE;
         anObject.monthOriginal = set.getInt(44);
         if ( set.wasNull() )
             anObject.monthOriginal = Integer.MIN_VALUE;

         anObject.sourceRefCode = set.getInt(45);
          if(set.wasNull())
          anObject.sourceRefCode = Integer.MIN_VALUE;
         anObject.sourceRefName = set.getString(46);

         anObject.invgroupRefCode = set.getInt(47);
          if(set.wasNull())
          anObject.invgroupRefCode = Integer.MIN_VALUE;
         anObject.invgroupRefName = set.getString(48);

         anObject.investWorksDescription = set.getString(49);

         anObject.ipImplementTypeRefCode = set.getInt(50);
         if(set.wasNull())
      	   anObject.ipImplementTypeRefCode = Integer.MIN_VALUE;
         anObject.ipImplementTypeRefName = set.getString(51);

         result.list.add(anObject);
        }


       result.setTotalCount(i);
       return result;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
       return null;
      }
     finally
      {
       try {if (set != null) set.close();}             catch (SQLException e) {}
       try {if (statement != null) statement.close();} catch (SQLException e) {}
       if(connection != super.getConnection())
        {
         try{connection.close();} catch(SQLException e){}
        }
      }
    }


    public static String processCondition(String aCondition) {
        if (aCondition == null || aCondition.length() == 0)
            return "";

        StringBuffer condition = new StringBuffer(aCondition);
        _checkConditionToken(condition, ";", " ");
        _checkConditionToken(condition, "--", " ");
        _checkConditionToken(condition, "\r", " ");
        _checkConditionToken(condition, "\n", " ");
        _checkConditionToken(condition, "||", " OR ");
        _checkConditionToken(condition, "&&", " AND ");
        _checkConditionToken(condition, "==", "=");
        _checkConditionToken(condition, "!=", "<>");
        _checkConditionToken(condition, "code", "ENPLANWORK.CODE");
        _checkConditionToken(condition, "dategen", "ENPLANWORK.DATEGEN");
        _checkConditionToken(condition, "datestart", "ENPLANWORK.DATESTART");
        _checkConditionToken(condition, "datefinal", "ENPLANWORK.DATEFINAL");
        _checkConditionToken(condition, "yeargen", "ENPLANWORK.YEARGEN");
        _checkConditionToken(condition, "monthgen", "ENPLANWORK.MONTHGEN");
        _checkConditionToken(condition, "yearoriginal", "ENPLANWORK.YEARORIGINAL");
        _checkConditionToken(condition, "monthoriginal", "ENPLANWORK.MONTHORIGINAL");
        _checkConditionToken(condition, "commentgen", "ENPLANWORK.COMMENTGEN");
        _checkConditionToken(condition, "usergen", "ENPLANWORK.USERGEN");
        _checkConditionToken(condition, "dateedit", "ENPLANWORK.DATEEDIT");
        _checkConditionToken(condition, "distancealong", "ENPLANWORK.DISTANCEALONG");
        _checkConditionToken(condition, "distanceto", "ENPLANWORK.DISTANCETO");
        _checkConditionToken(condition, "workordernumber", "ENPLANWORK.WORKORDERNUMBER");
        _checkConditionToken(condition, "dateworkorder", "ENPLANWORK.DATEWORKORDER");
        _checkConditionToken(condition, "priconnectionnumber", "ENPLANWORK.PRICONNECTIONNUMBER");
        _checkConditionToken(condition, "dateendpriconnection", "ENPLANWORK.DATEENDPRICONNECTION");
        _checkConditionToken(condition, "investworksamount", "ENPLANWORK.INVESTWORKSAMOUNT");
        _checkConditionToken(condition, "investworksdescription", "ENPLANWORK.INVESTWORKSDESCRIPTION");
        _checkConditionToken(condition, "servicesfsidefinid", "ENPLANWORK.SERVICESFSIDEFINID");
        _checkConditionToken(condition, "servicesfsidecnnum", "ENPLANWORK.SERVICESFSIDECNNUM");
        _checkConditionToken(condition, "totaltimehours", "ENPLANWORK.TOTALTIMEHOURS");
        _checkConditionToken(condition, "totaltimedays", "ENPLANWORK.TOTALTIMEDAYS");
        _checkConditionToken(condition, "investitemnumber", "ENPLANWORK.INVESTITEMNUMBER");
        _checkConditionToken(condition, "causedisconnection", "ENPLANWORK.CAUSEDISCONNECTION");
        _checkConditionToken(condition, "domain_info", "ENPLANWORK.DOMAIN_INFO");
        _checkConditionToken(condition, "modify_time", "ENPLANWORK.MODIFY_TIME");
        // relationship conditions
        _checkConditionToken(condition, "status", "STATUSCODE");
        _checkConditionToken(condition, "status.code", "STATUSCODE");
        _checkConditionToken(condition, "elementref", "ELEMENTREFCODE");
        _checkConditionToken(condition, "elementref.code", "ELEMENTREFCODE");
        _checkConditionToken(condition, "typeref", "TYPEREFCODE");
        _checkConditionToken(condition, "typeref.code", "TYPEREFCODE");
        _checkConditionToken(condition, "kind", "KINDCODE");
        _checkConditionToken(condition, "kind.code", "KINDCODE");
        _checkConditionToken(condition, "renref", "RENREFCODE");
        _checkConditionToken(condition, "renref.code", "RENREFCODE");
        _checkConditionToken(condition, "stateref", "STATEREFCODE");
        _checkConditionToken(condition, "stateref.code", "STATEREFCODE");
        _checkConditionToken(condition, "formref", "FORMREFCODE");
        _checkConditionToken(condition, "formref.code", "FORMREFCODE");
        _checkConditionToken(condition, "sourceref", "SOURCEREFCODE");
        _checkConditionToken(condition, "sourceref.code", "SOURCEREFCODE");
        _checkConditionToken(condition, "ddscodes", "DDSCODESCODE");
        _checkConditionToken(condition, "ddscodes.code", "DDSCODESCODE");
        _checkConditionToken(condition, "budgetref", "BUDGETREFCODE");
        _checkConditionToken(condition, "budgetref.code", "BUDGETREFCODE");
        _checkConditionToken(condition, "responsibilityref", "RESPONSIBILITYREFCODE");
        _checkConditionToken(condition, "responsibilityref.code", "RESPONSIBILITYREFCODE");
        _checkConditionToken(condition, "departmentref", "DEPARTMENTREFCODE");
        _checkConditionToken(condition, "departmentref.code", "DEPARTMENTREFCODE");
        _checkConditionToken(condition, "invgroupref", "INVGROUPREFCODE");
        _checkConditionToken(condition, "invgroupref.code", "INVGROUPREFCODE");
        return condition.toString();
    }



	@Override
	public int[] getFilteredCodeArray(ENPlanWorkFilter aFilterObject,
			int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(
				aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
				(aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
				fromPosition, quantity, null);
	}

  @Override
public int[] getFilteredCodeArray(ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANWORK.CODE FROM ENPLANWORK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANWORK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPlanWork.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENPLANWORK",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENPLANWORK.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
        }
        if(aFilterObject.yearOriginal != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.YEARORIGINAL = ?";
        }
        if(aFilterObject.monthOriginal != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.MONTHORIGINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
        }
        if(aFilterObject.distanceAlong != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DISTANCEALONG = ?";
        }
        if(aFilterObject.distanceTo != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DISTANCETO = ?";
        }
         if (aFilterObject.workOrderNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER LIKE ?";
         }
        if(aFilterObject.dateWorkOrder != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATEWORKORDER = ?";
        }
         if (aFilterObject.priConnectionNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";
         }
        if(aFilterObject.dateEndPriConnection != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DATEENDPRICONNECTION = ?";
        }
        if(aFilterObject.investWorksAmount != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.INVESTWORKSAMOUNT = ?";
        }
         if (aFilterObject.investWorksDescription != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.investWorksDescription.indexOf('*',0) < 0 && aFilterObject.investWorksDescription.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.INVESTWORKSDESCRIPTION = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.INVESTWORKSDESCRIPTION LIKE ?";
         }
        if(aFilterObject.servicesFSideFinId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDEFINID = ?";
        }
         if (aFilterObject.servicesFSideCnNum != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.servicesFSideCnNum.indexOf('*',0) < 0 && aFilterObject.servicesFSideCnNum.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDECNNUM = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.SERVICESFSIDECNNUM LIKE ?";
         }
        if(aFilterObject.totalTimeHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.TOTALTIMEHOURS = ?";
        }
        if(aFilterObject.totalTimeDays != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.TOTALTIMEDAYS = ?";
        }
         if (aFilterObject.investItemNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.investItemNumber.indexOf('*',0) < 0 && aFilterObject.investItemNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.INVESTITEMNUMBER = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.INVESTITEMNUMBER LIKE ?";
         }
        if(aFilterObject.causeDisconnection != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.CAUSEDISCONNECTION = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANWORK.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENPLANWORK.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
        }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
        }
        if(aFilterObject.kind.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
        }
        if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.FINEXECUTORCODE = ? ";
        }
        if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
        }
        if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.FORMREFCODE = ? ";
        }
        if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.SOURCEREFCODE = ? ";
        }
        if(aFilterObject.ddsCodes.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.DDSCODESCODE = ? ";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.invgroupRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.INVGROUPREFCODE = ? ";
        }
        if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.IPIMPLEMENTTYPEREFCODE = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

    selectStr = selectStr + " ORDER BY " + orderBy;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateGen.getTime()));
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
         }
         if(aFilterObject.monthGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.monthGen);
         }
         if(aFilterObject.yearOriginal != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearOriginal);
         }
         if(aFilterObject.monthOriginal != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.monthOriginal);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANWORK.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENPLANWORK.COMMENTGEN LIKE ?";

           if(aFilterObject.commentGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANWORK.USERGEN = ?";
             else
                 whereStr = whereStr + " ENPLANWORK.USERGEN LIKE ?";

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.distanceAlong != null){
            number++;
            aFilterObject.distanceAlong = aFilterObject.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceAlong);
        }
        if(aFilterObject.distanceTo != null){
            number++;
            aFilterObject.distanceTo = aFilterObject.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceTo);
        }
         if (aFilterObject.workOrderNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER = ?";
             else
                 whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER LIKE ?";

           if(aFilterObject.workOrderNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workOrderNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateWorkOrder != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateWorkOrder.getTime()));
        }
         if (aFilterObject.priConnectionNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.priConnectionNumber.indexOf('*',0) < 0 && aFilterObject.priConnectionNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER = ?";
             else
                 whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";

           if(aFilterObject.priConnectionNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.priConnectionNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateEndPriConnection != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEndPriConnection.getTime()));
        }
        if(aFilterObject.investWorksAmount != null){
            number++;
            aFilterObject.investWorksAmount = aFilterObject.investWorksAmount.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.investWorksAmount);
        }
         if (aFilterObject.investWorksDescription != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.investWorksDescription.indexOf('*',0) < 0 && aFilterObject.investWorksDescription.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANWORK.INVESTWORKSDESCRIPTION = ?";
             else
                 whereStr = whereStr + " ENPLANWORK.INVESTWORKSDESCRIPTION LIKE ?";

           if(aFilterObject.investWorksDescription != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.investWorksDescription);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.servicesFSideFinId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.servicesFSideFinId);
         }
         if (aFilterObject.servicesFSideCnNum != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.servicesFSideCnNum.indexOf('*',0) < 0 && aFilterObject.servicesFSideCnNum.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANWORK.SERVICESFSIDECNNUM = ?";
             else
                 whereStr = whereStr + " ENPLANWORK.SERVICESFSIDECNNUM LIKE ?";

           if(aFilterObject.servicesFSideCnNum != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.servicesFSideCnNum);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.totalTimeHours != null){
            number++;
            aFilterObject.totalTimeHours = aFilterObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeHours);
        }
        if(aFilterObject.totalTimeDays != null){
            number++;
            aFilterObject.totalTimeDays = aFilterObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeDays);
        }
         if (aFilterObject.investItemNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.investItemNumber.indexOf('*',0) < 0 && aFilterObject.investItemNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANWORK.INVESTITEMNUMBER = ?";
             else
                 whereStr = whereStr + " ENPLANWORK.INVESTITEMNUMBER LIKE ?";

           if(aFilterObject.investItemNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.investItemNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.causeDisconnection != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.causeDisconnection);
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANWORK.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENPLANWORK.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.status.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.status.code);
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.kind.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kind.code);
       }
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.renRef.code);
       }
       if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutor.code);
       }
       if(aFilterObject.stateRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.stateRef.code);
       }
       if(aFilterObject.formRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.formRef.code);
       }
       if(aFilterObject.sourceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.sourceRef.code);
       }
       if(aFilterObject.ddsCodes.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ddsCodes.code);
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
       }
       if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.responsibilityRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
       }
       if(aFilterObject.invgroupRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.invgroupRef.code);
       }
       if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ipImplementTypeRef.code);
       }
      }

      if(condition.length() > 0 && aBindObjects != null)
       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {
        if(i < fromPosition)
         continue;
        else if(i >= fromPosition + quantity)
         {
          i++;
          break;
         }

        result.add(new Integer(set.getInt(1)));
       }

      int[] array;

      array = new int[result.size()];
      for(int j = 0;j < result.size();j++)
       array[j] = ((Integer)result.get(j)).intValue();

      return array;
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      throw new SystemException(e.getMessage(), e);
      //return null;
     }
    finally
     {
      try {if (set != null) set.close();}             catch (SQLException e) {}
      try {if (statement != null) statement.close();} catch (SQLException e) {}
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }


    } // end of getFilteredCodeArray

	public boolean checkENPlanWorkTypes(ENPlanWork obj, boolean isException, boolean checkHasOneOfTypes, int... typeCodes) throws PersistenceException
	{
		if(obj == null || obj.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
		ENPlanWorkTypeDAO typeDao = new ENPlanWorkTypeDAO(this.getConnection(), this.getUserProfile());
		ENPlanWork tempObj = this.getObject(obj.code);
		if(tempObj == null) throw new java.lang.NullPointerException();
		ENPlanWorkType objectType = typeDao.getObject(tempObj.typeRef.code);
		Hashtable<Integer, ENPlanWorkType> types = new Hashtable<>();
		for(int typeCode : typeCodes) {
			ENPlanWorkType type = typeDao.getObject(typeCode);
			if(type == null) throw new java.lang.NullPointerException(String.format("Невідомий код типу: %d", typeCode));
			types.put(typeCode, type);
		}
		boolean result = (checkHasOneOfTypes) ? types.containsKey(obj.typeRef.code) : !types.containsKey(obj.typeRef.code);
		if(!result && isException) {
			String err = "";
			if(checkHasOneOfTypes) {
				err = String.format("План з кодом %d", tempObj.code);
				if(types.size() == 1) {
					err += String.format(" повинен мати підвид робіт \"%s\".", types.get(typeCodes[0]).name);
				} else {
					String statusConcat = "";
					for(Enumeration<ENPlanWorkType> enume = types.elements(); enume.hasMoreElements();) {
						statusConcat += ((statusConcat.length() > 0) ? ", " : "") + String.format("\"%s\"", enume.nextElement().getName());
					}

					err += String.format(" повинен мати один із наступних підвидів робіт: %s", statusConcat);
				}
				err += String.format("\n Поточний підвид робіт плану: \"%s\"", objectType.getName());
			} else {
				err = String.format("План з кодом %d має підвид робіт \"%s\""
						, tempObj.code, objectType.name);
			}

			throw new SystemException(err);
		}

		return result;
	}

	/**
	 *
	 * Получить список {@link ENPlanWorkShortList} со всеми планами связанными с заданным договором
	 *
	 * @param servicesObject {@link ENServicesObject}
	 * @return
	 * @throws PersistenceException
	 */
	public ENPlanWorkShortList getListByENServicesObject(ENServicesObject servicesObject) throws PersistenceException {
		if(servicesObject == null || servicesObject.code == Integer.MIN_VALUE || servicesObject.element == null
				|| servicesObject.element.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не заданий договір!");
		}
		Set<Integer> planCodes = new HashSet<>();

		ENTechConditionsServicesDAO techCondServicesDao = new ENTechConditionsServicesDAO(this.getConnection(), this.getUserProfile());
		ENTechCond2PlanWorkDAO techCond2PlanDao = new ENTechCond2PlanWorkDAO(this.getConnection(), this.getUserProfile());
		ENServices2PlanDAO services2PlanDao = new ENServices2PlanDAO(this.getConnection(), this.getUserProfile());

		ENPlanWorkFilter filter = new ENPlanWorkFilter();
		filter.elementRef.code = servicesObject.element.code;
		int[] planCodesByElement = this.getFilteredCodeArrayNOSEGR(filter, 0, -1);
		for(int planCodeByElement : planCodesByElement) planCodes.add(planCodeByElement);

		ENTechConditionsServices techCondServices = techCondServicesDao.getObjectByENEServicesObject(servicesObject);

		if(techCondServices != null) {
			ENTechCond2PlanWorkFilter techCond2PlanFilter = new ENTechCond2PlanWorkFilter();
			techCond2PlanFilter.techConServicesRef.code = techCondServices.code;
			ENTechCond2PlanWorkShortList planListByTechConditions = techCond2PlanDao.getFilteredList(techCond2PlanFilter);
			for(ENTechCond2PlanWorkShort plan2TechCond : planListByTechConditions.list) planCodes.add(plan2TechCond.planRefCode);
		}

		ENServices2PlanFilter services2PlanFilter = new ENServices2PlanFilter();
		services2PlanFilter.servicesObjectRef.code = servicesObject.code;
		ENServices2PlanShortList services2PlanList = services2PlanDao.getFilteredList(services2PlanFilter);
		for(ENServices2PlanShort services2Plan : services2PlanList.list) planCodes.add(services2Plan.planRefCode);

		filter = new ENPlanWorkFilter();
		Vector<Integer> bindedCodes = new Vector<>();
		if(planCodes.size() == 0) {
			// В случае пустого сета не выбирается ни одного элемента
			filter.conditionSQL = "0 == 1";
		} else {
			filter.conditionSQL = String.format("%s in (%s)", ENPlanWork.code_QFielld, Tools.repeatSymbol("?", ",", planCodes.size()));
			bindedCodes.addAll(planCodes);
		}
		return this.getScrollableFilteredList(filter, 0, -1, bindedCodes);


	}

} // end of ENPlanWorkDAO

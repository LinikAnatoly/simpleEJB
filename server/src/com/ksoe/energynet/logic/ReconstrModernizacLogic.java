package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.DocFlowLogic;
import com.ksoe.docflow.valueobject.DFDoc;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENActProj2OZ2DAO;
import com.ksoe.energynet.dataminer.ENOperativeObjectDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZ2DFDocDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZ2ENactDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENRecoModTypeWork;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ2DFDoc;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact;
import com.ksoe.energynet.valueobject.ENReconstrModernOZStatus;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENActProj2OZ2Filter;
import com.ksoe.energynet.valueobject.filter.ENOperativeObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZ2DFDocFilter;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZ2ENactFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENActProj2OZ2ShortList;
import com.ksoe.energynet.valueobject.lists.ENOperativeObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZ2ENactShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQFKOrder2PlanFactDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.filter.RQFKOrder2PlanFactFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrder2PlanFactShortList;




public class ReconstrModernizacLogic extends LogicModule{


    private java.sql.Connection finConnection = null;
    private java.sql.Connection fkOSConnection = null;

    public ReconstrModernizacLogic(Connection connection, UserProfile userProfile) {
        super(connection, userProfile);
    }

    protected java.sql.Connection getConnection_(String dataSourceName) throws DatasourceConnectException
    {
    try {
    if (finConnection != null && ! finConnection.isClosed()) {
        return finConnection;
    }

    InitialContext initialContext = new InitialContext();
    DataSource dataSource = (DataSource) initialContext
            .lookup(dataSourceName);
    finConnection = dataSource.getConnection();
    return finConnection;
    } catch (NamingException e) {
    throw new DatasourceConnectException(dataSourceName, e);
    } catch (SQLException e) {
    throw new DatasourceConnectException(dataSourceName, e);
    }
    }

    protected java.sql.Connection getFKOSConnection() throws DatasourceConnectException
    {
    try {
    if (fkOSConnection != null && ! fkOSConnection.isClosed()) {
        return fkOSConnection;
    }

    InitialContext initialContext = new InitialContext();
    DataSource dataSource = (DataSource) initialContext
            .lookup(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
    fkOSConnection = dataSource.getConnection();
    return fkOSConnection;
    } catch (NamingException e) {
    throw new DatasourceConnectException(AuthorizationJNDINames.FINMATERIAL_DATASOURCE, e);
    } catch (SQLException e) {
    throw new DatasourceConnectException(AuthorizationJNDINames.FINMATERIAL_DATASOURCE, e);
    }
    }


    public int validateExpenceActContract(ENReconstrModernOZ2ENact rm2act) throws PersistenceException, DatasourceConnectException {
        String contractNumber = "";
        String fContractNumber = "";
        java.util.Date contractDate = null;

        String partnerCode = null;
        String partnerName = null;
        int typeWorkInOZ = 0;
        fkOSConnection = getFKOSConnection();
        try {
            // ������� ��������� ������ �� ���� ����������� �� �������� ��� ���� ������
            // ������ �������� ����� ������ � "�������� �� �������", "������� �� ���������� �� �� �� ������ " , "����������"

            // ��������� ��������� �� ��� � ������� �� �������. �� ������� � ���� ���� � ������� �� ������� (Enservicesobject)
            ENActDAO actDAO = new ENActDAO(connection, userProfile);
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
            ENAct actObj = actDAO.getObject(rm2act.actRef.code);
            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
            soFilter.element.code = actObj.element.code;
            // ��������� ���� ����
            ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(connection, userProfile);
            ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
            ENAct2ENPlanWorkFilter a2pFilter = new ENAct2ENPlanWorkFilter();
            a2pFilter.actRef.code = actObj.code;
            ENAct2ENPlanWorkShortList a2pList = a2pDAO.getScrollableFilteredList(a2pFilter, 0, -1);
            ENPlanWork pObject = pDAO.getObject(a2pList.get(0).planCode);

            ENServicesObjectShortList soList = soDAO.getScrollableFilteredList(soFilter, 0, -1);

            if (soList.totalCount > 0 ) {
                contractNumber = soList.get(0).contractNumber;
                contractDate =  soList.get(0).contractDate;

                partnerCode = soList.get(0).partnerCode;
                partnerName = soList.get(0).name;
                typeWorkInOZ = ENRecoModTypeWork.ONSIDEWORK;
            }

            // ��������� ��������� �� ��� � "������� �� ���������� �� �� �� ������ " (������ �� �������)
            ENOperativeObjectDAO opObjDAO = new ENOperativeObjectDAO(connection, userProfile);
            ENOperativeObjectFilter opObjFilter = new ENOperativeObjectFilter();
            opObjFilter.element.code = actObj.element.code;
            ENOperativeObjectShortList opObjList = opObjDAO.getScrollableFilteredList(opObjFilter, 0, -1);

            if (opObjList.totalCount > 0 ) {
                contractNumber = opObjList.get(0).contractNumber;
                contractDate =  opObjList.get(0).contractDate;

                partnerCode = opObjList.get(0).partnerCode;
                partnerName = opObjList.get(0).partnerName;

                typeWorkInOZ = ENRecoModTypeWork.ONSIDEWORK;
            }

            // �������� ��������� �� ��� � ��������� ��  "����������" (������ �� �������)

            ENTechConditionsServicesDAO techServicesDAO = new ENTechConditionsServicesDAO(connection, userProfile);
            ENTechConditionsServicesFilter techServicesFilter = new ENTechConditionsServicesFilter();
            techServicesFilter.conditionSQL = " ENTECHCONDITIONSSERVCS.CODE in ( " +
                    "    select tc2pl.techconservicesrefcode from entechcond2planwork tc2pl  , enplanwork pl  , enact2enplanwork a2p " +
                    "    where tc2pl.planrefcode = a2p.plancode " +
                    "    and tc2pl.planrefcode = pl.code  " +
                    "    and a2p.plancode = pl.code " +
                    "    and a2p.actrefcode =  " + actObj.code + " ) "    ;
            //ENTechConditionsServicesShortList techServicesList = techServicesDAO.getScrollableFilteredList(techServicesFilter, 0, -1);
            ENTechConditionsServicesShortList techServicesList = techServicesDAO.getScrollableFilteredListWITHOUT_SEGR(techServicesFilter, techServicesFilter.conditionSQL, "", 0, -1, null);

            if (techServicesList.totalCount > 0 ) {
            	FKOSLogic OSLogic = new FKOSLogic(fkOSConnection, userProfile);
            	if (techServicesList.get(0).finDocID != Integer.MIN_VALUE ) {
                contractNumber = OSLogic.getCodeAgreeByIdAgree(techServicesList.get(0).finDocID); //  ""+techServicesList.get(0).finDocID;// finContractNumber;
            	}
                contractDate =  techServicesList.get(0).finContractDate;

                partnerCode = techServicesList.get(0).partnerCode;
                partnerName = techServicesList.get(0).partnerName;

                typeWorkInOZ = ENRecoModTypeWork.ONSIDEWORK;
            }


            /* ��� ����� ���� �� ������ �� ������� */
            RQFKOrder2PlanFactDAO fo2plDAO = new RQFKOrder2PlanFactDAO(connection, userProfile);
            RQFKOrder2PlanFactFilter fo2plFilter = new RQFKOrder2PlanFactFilter();
            fo2plFilter.act.code = actObj.code;
            RQFKOrder2PlanFactShortList fo2plList = fo2plDAO.getScrollableFilteredList(fo2plFilter, 0, -1);



            if (fo2plList.totalCount > 0) {
                pObject = pDAO.getObject(fo2plList.get(0).factCode);

                boolean priConnectionNumberIsEmpty = false;


                if (pObject.priConnectionNumber == null)
                {
                    priConnectionNumberIsEmpty = true;
                }
                else if (pObject.priConnectionNumber.trim().equals(""))
                {
                    priConnectionNumberIsEmpty = true;
                }


                // SUPP-4152 - ���� ������ �� ������� � ���� ����� ���������� �� ���� ����� ����� � ���� ���������� ����� ���

                //if (!pObject.priConnectionNumber.equals("")
                 //       || pObject.priConnectionNumber != null) {
                if (! priConnectionNumberIsEmpty)
                {
                    contractNumber = pObject.priConnectionNumber;
                }
                else
                {

                    RQFKOrderDAO fkOrdeDAO = new RQFKOrderDAO(connection, userProfile);
                    RQFKOrder fkOrder = fkOrdeDAO.getObject(fo2plList.get(0).fkorderCode);

                    RQFKOrderItemDAO fkOrdeItemDAO = new RQFKOrderItemDAO(connection, userProfile);
                    RQFKOrderItem fkOrderItem = fkOrdeItemDAO.getObject(fo2plList.get(0).fkorderItemCode);
                    // at2a.summaGen = fkOrder.sumWithoutNds.add(fkOrder.sumNds);
                    contractNumber =  fkOrderItem.contractNumber;
                    contractDate = fkOrderItem.contractDate;
                    // ���������� ���������� �� ������
                    RQOrgDAO orgDAO = new RQOrgDAO(connection, userProfile);
                    RQOrg org = orgDAO.getObject(fkOrder.org.code);
                    if (org != null ) {
                    partnerCode = org.codeorg;
                    partnerName = org.name;
                    }
                }


                typeWorkInOZ = ENRecoModTypeWork.WITHSIDEWORK;
            }


            // �������� ������� � ��-2
            ENReconstrModernOZDAO ozDAO = new ENReconstrModernOZDAO(connection, userProfile);
            ENReconstrModernOZ ozObj = ozDAO.getObject(rm2act.ENReconstrModernOZRef.code);




            // ���� ������������� ��� �� ������ ����� ��������� �� �� ���� �� ������� � ��� �� �� �������� � ��� ������� ���������� ��� ������������ ����
            ENReconstrModernOZ2ENactDAO rm2ActDAO = new ENReconstrModernOZ2ENactDAO(connection, userProfile);
            ENReconstrModernOZ2ENactFilter rm2ActFilter = new ENReconstrModernOZ2ENactFilter();
            rm2ActFilter.ENReconstrModernOZRef.code = rm2act.ENReconstrModernOZRef.code;
            ENReconstrModernOZ2ENactShortList rm2ActList = rm2ActDAO.getScrollableFilteredList(rm2ActFilter, 0, -1);

            // ���� �� ���������� ���� ����� �� ����� ����� �������� ��� ����� ����������
            if (typeWorkInOZ == 0 ) { typeWorkInOZ = ENRecoModTypeWork.OWNERWORK;
                }

            if (rm2ActList.totalCount > 0 ) {

            // �������� ���������� �� ����� ����� ++ SUPP-91908 ���� ������� ������ �� ��� ���� ������� ��� ��������� � ��� ��� 
            if (pObject.budgetRef.code == ENConsts.ENBUDGET_VRTU) {
                if (ozObj.typeRef.code != typeWorkInOZ && ozObj.servicesobject.code == Integer.MIN_VALUE ){
                    throw new EnergyproSystemException("�� ���������� ���� � �� �� ���� ����!!! �������� �� ������ ���� ��   "
                            + new String( ozObj.typeRef.code == ENRecoModTypeWork.OWNERWORK ? " ������� ������� " :
                                        ozObj.typeRef.code == ENRecoModTypeWork.ONSIDEWORK ? " ������� �� ������� " :
                                        ozObj.typeRef.code == ENRecoModTypeWork.WITHSIDEWORK ? " ������� � ������� " : "" )
                            + " , ��� ���� �������� � ����� �� "
                            + new String( typeWorkInOZ == ENRecoModTypeWork.OWNERWORK ? " ������� ������� " :
                                        typeWorkInOZ == ENRecoModTypeWork.ONSIDEWORK ? " ������� �� ������� " :
                                        typeWorkInOZ == ENRecoModTypeWork.WITHSIDEWORK ? " ������� � ������� " : ""
                                        )

                            , userProfile);
                }
            }
            // ���� �������� �� ���������
            // if (ozObj.partnerCode != partnerCode){
            if (partnerCode != null && ozObj.partnerCode != null) {
            if (!ozObj.partnerCode.equals(partnerCode) && pObject.budgetRef.code == ENConsts.ENBUDGET_VRTU    ) {
                throw new EnergyproSystemException(" ��� �������� �� ���� �� �������� �� ������� � ����� �������� �� ���� �� ��� ����`������ �� ��-2 !!!", userProfile);
            }
            }

            if (ozObj.finContractNumber == null){
            fContractNumber = "";
            }
            else {
                fContractNumber = ozObj.finContractNumber;
            }

          // �������� �� �������� �������� ������ ��� ������
            if (pObject.budgetRef.code == ENConsts.ENBUDGET_VRTU) {
            if (contractNumber.intern() != fContractNumber.intern() && contractNumber.length() != 0  && fContractNumber != null 
            		//++ SUPP-91908 ���� ������� ������ �� ��� ���� ������� ��� ��������� � ��� ��� 
            		   && ozObj.servicesobject.code == Integer.MIN_VALUE
            		){
                throw new EnergyproSystemException("�� ������� ����� �������� �� ��������� ��(" + fContractNumber   + ") � ��������� �� ���� ��������� ����("+ contractNumber + ")  !!! ...", userProfile);
                }

            if (contractNumber.intern() != fContractNumber.intern() && contractNumber.length() == 0  && fContractNumber != null ){
                throw new EnergyproSystemException("� �������� �� ������� �������� ���� ��������� ���� ����� �� �������� " + fContractNumber + " !!! ...", userProfile);
                }
            if (contractNumber.intern() != fContractNumber.intern() && contractNumber.length() != 0  && fContractNumber == null ){
                throw new EnergyproSystemException("� �������� �� ������� �������� ���� ��������� ���� ��� ��������  !!! ...", userProfile);
                }
            }
            }
            // +++ SUPP-91908 ���� ������� ������ ��  �� ��������� �������  
            if (/*rm2ActList.totalCount == 0 &&*/ contractNumber.length() != 0 && ozObj.servicesobject.code == Integer.MIN_VALUE ) {
                ozObj.finContractNumber = contractNumber;
                ozObj.finContractDate = contractDate;
                ozObj.partnerCode = partnerCode;
                ozObj.partnerName = partnerName;
                ozObj.typeRef.code = typeWorkInOZ;
                // ozDAO.save(ozObj);
                ozDAO.updateContractPartnerType(ozObj);

            }
            // ���� �� �� �������� ��� ����� � �� ������ "���� ������"
            else {
                ozObj.typeRef.code = ENRecoModTypeWork.OWNERWORK;
                ozDAO.updateTypeOZ(ozObj.code , ENRecoModTypeWork.OWNERWORK);
                // ozDAO.save(ozObj);
            }



            return typeWorkInOZ;
        }
        catch (PersistenceException e)            {throw new EnergyproSystemException(e.getMessage(),e);}

    }


    public void calculationSumByAct(ENReconstrModernOZ2ENact rm2act , int typeWorkInOZ) throws PersistenceException {
        ActCalculator actCalc = new ActCalculator(connection, userProfile);
        ENActDAO actDAO = new ENActDAO(connection, userProfile);
        ENAct actObj = actDAO.getObject(rm2act.actRef.code);
        // �������� ��� � ��� ��� ����������� �� ��.
        if (actObj.statusRef.code != ENActStatus.CLOSED){
            throw new EnergyproSystemException(
            "��� �� ���� ���������� � Գ�.���!!! ");
        }

        ENReconstrModernOZ2ENactDAO rm2actDAO = new ENReconstrModernOZ2ENactDAO(connection, userProfile);
        ENReconstrModernOZ2ENact rm2actObjIns = rm2act;

        /* ��� ����� ���� �� ������ �� �������, �� ������� �� ������� ��� ���� ������ �� ������������� ������������  */
        RQFKOrder2PlanFactDAO fo2plDAO = new RQFKOrder2PlanFactDAO(connection, userProfile);
        RQFKOrder2PlanFactFilter fo2plFilter = new RQFKOrder2PlanFactFilter();
        fo2plFilter.act.code = rm2act.actRef.code;
        RQFKOrder2PlanFactShortList fo2plList = fo2plDAO.getScrollableFilteredList(fo2plFilter, 0, -1);

        if (fo2plList.totalCount > 0) {
        	/* SUPP-69172 -- ��� ���������� � ��-2 ����� , ���� �� ���� ������ ���� ��������� ������ �� ������������� . �����  ����� ����� �� ����� ������ , � �� � ������ ������  */
            /*RQFKOrderDAO fkOrdeDAO = new RQFKOrderDAO(connection, userProfile);
            RQFKOrder fkOrder = fkOrdeDAO.getObject(fo2plList.get(0).fkorderCode);
            rm2actObjIns.sumGen = fkOrder.sumWithoutNds;
            rm2actObjIns.sumNds = fkOrder.sumNds;*/
        	rm2actObjIns.sumGen =  new BigDecimal(0);
            rm2actObjIns.sumNds = new BigDecimal(0);
            RQFKOrderItemDAO fiDAO = new RQFKOrderItemDAO(connection, userProfile);
        	for (int f = 0; f < fo2plList.totalCount; f++) {
        		RQFKOrderItem fiObj = fiDAO.getObject(fo2plList.get(f).fkorderItemCode);
        		
        		
                rm2actObjIns.sumGen = rm2actObjIns.sumGen.add(fiObj.sumWithoutNds);
                rm2actObjIns.sumNds = rm2actObjIns.sumNds.add(fiObj.sumNds);
			}
        	
        	
        	
        } else {
            /* ����������� ����� �� ���������� ���� */
            if (typeWorkInOZ == ENRecoModTypeWork.OWNERWORK || typeWorkInOZ == ENRecoModTypeWork.ONSIDEWORK ){
            rm2actObjIns.sumGen = actCalc.calcTotalCostByActRM(rm2act.actRef.code);
            rm2actObjIns.sumNds = new BigDecimal(0);
            }
        }

        rm2actObjIns.ENReconstrModernOZRef.code = rm2act.ENReconstrModernOZRef.code;
        rm2actObjIns.actRef.code = rm2act.actRef.code;
        rm2actDAO.save(rm2actObjIns);




    }

    // ��� ��������� ����� ����� �� ���� ����� ����������� � ��������� ��2.
public void recalcSumInOZ2(int rmCode) throws PersistenceException {
     // ����������� ����� ����� �� ���� ����� ����������� � ��������� ��2.
        ENReconstrModernOZDAO rmDAO = new ENReconstrModernOZDAO(connection, userProfile);
        ENReconstrModernOZ2ENactDAO rm2actDAO = new ENReconstrModernOZ2ENactDAO(connection, userProfile);
        ENReconstrModernOZ2ENactFilter rm2actFilter = new ENReconstrModernOZ2ENactFilter();
        rm2actFilter.ENReconstrModernOZRef.code = rmCode;
        ENReconstrModernOZ2ENactShortList rm2actList = rm2actDAO.getScrollableFilteredList(rm2actFilter, 0, -1);
        BigDecimal sumByAllActWithoutNDS = new BigDecimal(0);
        BigDecimal sumByAllActNDS = new BigDecimal(0);
        ENReconstrModernOZ rmObj = rmDAO.getObject(rmCode);

        ENActProj2OZ2DAO ap2ozDAO = new ENActProj2OZ2DAO(connection, userProfile);



        if (rmObj == null){
            throw new EnergyproSystemException(
            "������� ��� �������� ����!!! ");
        }
        //    if (rm2actList.totalCount != 0 ) {
                for (int j = 0; j < rm2actList.totalCount; j++) {

                    sumByAllActWithoutNDS  = sumByAllActWithoutNDS.add(rm2actList.get(j).sumGen);
                    sumByAllActNDS = sumByAllActNDS.add(rm2actList.get(j).sumNds);
                }
                rmObj.summaGen = sumByAllActWithoutNDS;
                rmObj.summaNDS = sumByAllActNDS;
                // rmDAO.save(rmObj);

                // ��������� ����� �� ������ ��������� ��������������
                ENActProj2OZ2Filter ap2ozFilter = new ENActProj2OZ2Filter();
                ap2ozFilter.ENReconstrModernOZRef.code = rmCode;
                ENActProj2OZ2ShortList ap2ozList = ap2ozDAO.getScrollableFilteredList(ap2ozFilter, 0, -1);
                BigDecimal ap2ozSummaGen = new BigDecimal(0);

                for (int ap = 0; ap < ap2ozList.totalCount; ap++) {
                    ap2ozSummaGen =    ap2ozSummaGen.add(ap2ozList.get(ap).summaGen);
                }
                rmObj.summaGen = rmObj.summaGen.add(ap2ozSummaGen);

                rmDAO.updateSumGenAndNDS(rmObj);
                // ���� �� ��������� ������������� ������������ ��� �������� �������� �� ����
                // ���������� ��������� ������ ����� �� ��� � ����� �� ��������� ��� ���
                if (rmObj.finContractNumber == null ){
                    rmDAO.setContractpriceAsSummaGen(rmObj);
                }

        //    }
    }

/**
 * ���������� �������� ������� ����� ��.
 *
 * @return ������� ���. ����
 */
public Date getCurrentBuhDate()
{
    String sql =
        " select a.dt_current from os_t.osdate a ";

    PreparedStatement stmt = null ;
    ResultSet set = null ;

    try
    {
        stmt = connection.prepareStatement(sql);

        set = stmt.executeQuery();

        if ( set.next() )
        {
            return set.getDate(1);
        }
        else
        {
            throw new EnergyproSystemException("������� ��� ��������� ������� ���. ���� � ����� \"���� ���. ������\" Գ�. ��������!");
        }
    }
    catch(SQLException e)
    {
        System.out.println(e.getMessage()+"\nstatement - " + sql);
        //EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        throw new EnergyproSystemException(e);
    }
    finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (stmt != null) stmt.close();} catch (SQLException e) {}
     stmt = null;
    }

}

/**
 * ���������� ���������� ID ��� �������
 *
 * @return ����� ID
 */
public int getNextNumUn()
{
    int result = Integer.MIN_VALUE;
    PreparedStatement statement = null;
    ResultSet set = null;

    String sql = "select os_t.SQ_DOVVOD.NEXTVAL V_NUM_DV from dual";

    try
    {

        statement = connection.prepareStatement(sql);
        set = statement.executeQuery();

        while (set.next()) {
            result = set.getInt(1);
        }

        return result;

    }
    catch (SQLException e)
    {
        System.out.println(e.getMessage() + "\nstatement - " + sql);
        return result;
    }
    finally
    {
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
    }
}

public void moveDovvodToOS( ENReconstrModernOZ obj) throws PersistenceException, DatasourceConnectException {

    try
    {
    fkOSConnection = getFKOSConnection();

    FKOSLogic OSLogic = new FKOSLogic(fkOSConnection, userProfile);
    // FKOSLogic OSLogic = new FKOSLogic(connection, userProfile);
    OSLogic.moveDovvodToOS(obj);

    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("��� ����� � ���.���������� ...",e);}
  //  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    //catch (SQLException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally
    {
        try {
            if (fkOSConnection != null && ! fkOSConnection.isClosed()) {
                fkOSConnection.close();
                fkOSConnection = null;
            }
        } catch (SQLException e) {
        }

    }

  }

    public void unMoveDovvodToOS(ENReconstrModernOZ obj)
            throws PersistenceException, DatasourceConnectException {

        try {
            fkOSConnection = getFKOSConnection();

            FKOSLogic OSLogic = new FKOSLogic(fkOSConnection, userProfile);
            OSLogic.unMoveDovvodToOS(obj);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "��� ����� � ���.���������� ...", e);
        }
        // catch (PersistenceException e) {throw new
        // EnergyproSystemException(e.getMessage(),e);}
        // catch (SQLException e) {throw new
        // EnergyproSystemException(e.getMessage(),e);}
        finally {
            try {
                if (fkOSConnection != null && !fkOSConnection.isClosed()) {
                    fkOSConnection.close();
                    fkOSConnection = null;
                }
            } catch (SQLException e) {
            }

        }

    }
    // �������� �� �������������� ���������
    public void checkReserveByInv( String kod_inv) throws PersistenceException, DatasourceConnectException {

        try
        {
        fkOSConnection = getFKOSConnection();

        FKOSLogic OSLogic = new FKOSLogic(fkOSConnection, userProfile);
        OSLogic.checkReserveByInv(kod_inv);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("��� ����� � ���.���������� ...",e);}
        finally
        {
            try {
                if (fkOSConnection != null && ! fkOSConnection.isClosed()) {
                    fkOSConnection.close();
                    fkOSConnection = null;
                }
            } catch (SQLException e) {
            }

        }

    }
    // �������� �������� ��������� � ������

    public void makeReserveRMByInv( ENReconstrModernOZ object) throws PersistenceException, DatasourceConnectException {

        try
        {
        fkOSConnection = getFKOSConnection();

        FKOSLogic OSLogic = new FKOSLogic(fkOSConnection, userProfile);
        OSLogic.makeReserveRMByInv(object);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("��� ����� � ���.���������� ...",e);}
        finally
        {
            try {
                if (fkOSConnection != null && ! fkOSConnection.isClosed()) {
                    fkOSConnection.close();
                    fkOSConnection = null;
                }
            } catch (SQLException e) {
            }

        }

    }


// ������ ������� ��� ���������

    public void unMakeReserveRMByKodInv( String kod_inv) throws PersistenceException, DatasourceConnectException {

        try
        {
        fkOSConnection = getFKOSConnection();

        FKOSLogic OSLogic = new FKOSLogic(fkOSConnection, userProfile);
        OSLogic.unMakeReserveRMByKodInv(kod_inv);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("��� ����� � ���.���������� ...",e);}
        finally
        {
            try {
                if (fkOSConnection != null && ! fkOSConnection.isClosed()) {
                    fkOSConnection.close();
                    fkOSConnection = null;
                }
            } catch (SQLException e) {
            }

        }

    }

	public void addENReconstrModernOZ2DFDoc(ENReconstrModernOZ actOz, DFDoc doc) {
		if (actOz == null || actOz.code <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ���� ��-2!");
		}
		if (doc == null || doc.code <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ���������!");
		}

		try {
			ENReconstrModernOZ2DFDocDAO actOz2DFDocDao = new ENReconstrModernOZ2DFDocDAO(connection, userProfile);
			ENReconstrModernOZ2DFDoc actOz2DFDoc = new ENReconstrModernOZ2DFDoc();
			actOz2DFDoc.enReconstrModernOzRef.code = actOz.code;
			actOz2DFDoc.dfDocCode = doc.code;
			actOz2DFDoc.dfDocDate = doc.dateRegistration;
			actOz2DFDoc.dfDocDescription = doc.description;
			actOz2DFDoc.dfDocNumber = doc.docNum;
			actOz2DFDoc.dfDocSubtypeCode = doc.docSubTypeRef.code;
			actOz2DFDoc.dfDocTypeCode = doc.docTypeRef.code;
			actOz2DFDocDao.add(actOz2DFDoc);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int getDFDocCodeForENReconstrModernOZ(int actOzCode) {
		if (actOzCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���� ��-2!");
		}

		Connection dfConnection = null;

		try {
			ENReconstrModernOZ2DFDocDAO actOz2DocDao = new ENReconstrModernOZ2DFDocDAO(connection, userProfile);
			ENReconstrModernOZ2DFDocFilter actOz2DocFilter = new ENReconstrModernOZ2DFDocFilter();
			actOz2DocFilter.enReconstrModernOzRef.code = actOzCode;
			int[] actOz2DocCodes = actOz2DocDao.getFilteredCodeArray(actOz2DocFilter, 0, -1);

			if (actOz2DocCodes.length == 0) {
				return Integer.MIN_VALUE;
			}

			String dfDocCodes = "";
			for (int act2DocCode : actOz2DocCodes) {
				ENReconstrModernOZ2DFDoc actOz2Doc = actOz2DocDao.getObject(act2DocCode);
				dfDocCodes += (dfDocCodes.isEmpty() ? "" + actOz2Doc.dfDocCode : ", " + actOz2Doc.dfDocCode); 
			}

			dfConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocFlowLogic docFlowLogic = new DocFlowLogic(dfConnection, userProfile);
			return docFlowLogic.getActiveDocCode(dfDocCodes);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (dfConnection != null && !dfConnection.isClosed()) {
					dfConnection.close();
					dfConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public ENReconstrModernOZ getENReconstrModernOZByDFDocCode(int dfDocCode) {
		if (dfDocCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���������!");
		}

		try {
			ENReconstrModernOZ2DFDocDAO actOz2DocDao = new ENReconstrModernOZ2DFDocDAO(connection, userProfile);
			ENReconstrModernOZ2DFDocFilter actOz2DocFilter = new ENReconstrModernOZ2DFDocFilter();
			actOz2DocFilter.dfDocCode = dfDocCode;
			int[] actOz2DocCodes = actOz2DocDao.getFilteredCodeArray(actOz2DocFilter, 0, -1);

			if (actOz2DocCodes.length == 0) {
				return null;
			}

			ENReconstrModernOZ2DFDoc actOz2Doc = actOz2DocDao.getObject(actOz2DocCodes[0]);
			ENReconstrModernOZDAO actOzDao = new ENReconstrModernOZDAO(connection, userProfile);
			return actOzDao.getObjectNOSEGR(actOz2Doc.enReconstrModernOzRef.code);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void cancelDFDoc(int actOzCode) {
		if (actOzCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���� ��-2!");
		}

		int docCode = getDFDocCodeForENReconstrModernOZ(actOzCode);
		if (docCode <= 0) {
			return;
		}

		Connection dfConnection = null;

		try {
			dfConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocFlowLogic docFlowLogic = new DocFlowLogic(dfConnection, userProfile);
			docFlowLogic.setCancel(docCode, true);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (dfConnection != null && !dfConnection.isClosed()) {
					dfConnection.close();
					dfConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public void removeENReconstrModernOZ2DFDoc(int actOzCode, int docCode) {
		removeENReconstrModernOZ2DFDoc(actOzCode, docCode, false);
	}

	public void removeENReconstrModernOZ2DFDoc(int actOzCode, int docCode, boolean removeAll) {
		if (actOzCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���� ��-2!");
		}
		if (docCode <= 0 && !removeAll) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���������!");
		}

		try {
			ENReconstrModernOZ2DFDocDAO actOz2DFDocDao = new ENReconstrModernOZ2DFDocDAO(connection, userProfile);
			ENReconstrModernOZ2DFDocFilter actOz2DFDocFilter = new ENReconstrModernOZ2DFDocFilter();
			actOz2DFDocFilter.enReconstrModernOzRef.code = actOzCode;
			actOz2DFDocFilter.dfDocCode = docCode;
			int[] actOz2DFDocCodes = actOz2DFDocDao.getFilteredCodeArray(actOz2DFDocFilter, 0, -1);

			if (actOz2DFDocCodes.length > 0) {
				ENReconstrModernOZDAO actOzDao = new ENReconstrModernOZDAO(connection, userProfile);
				ENReconstrModernOZ actOz = actOzDao.getObjectNOSEGR(actOzCode);
				if (actOz.statusRef.code != ENReconstrModernOZStatus.DRAFT) {
					throw new SystemException("\n\nNET-4596 ��� ��-2 ������� ���� ��������! ��� ��-2 � ����� " + actOz.code + " �� � ��������!");
				}
			}

			for (int actOz2DFDocCode : actOz2DFDocCodes) {
				actOz2DFDocDao.remove(actOz2DFDocCode);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

}
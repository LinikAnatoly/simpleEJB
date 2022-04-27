package com.ksoe.energynet.util;

import java.rmi.RemoteException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import java.util.Properties;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.management.MBeanServer;
import javax.management.ObjectName;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import org.jboss.mx.util.MBeanServerLocator;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.billing.ejb.BillController;
import com.ksoe.billing.ejb.BillControllerHome;
import com.ksoe.billing.valueobject.filter.BillFilter;
import com.ksoe.billing.valueobject.lists.BillShortList;
import com.ksoe.docflow.dataminer.DFDocServicesConsumerDAO;
import com.ksoe.docflow.ejb.DFDocServicesConsumerController;
import com.ksoe.docflow.ejb.DFDocServicesConsumerControllerHome;
import com.ksoe.docflow.logic.DFConsts;
import com.ksoe.docflow.logic.DocFlowLogic.ApplicationStatus;
import com.ksoe.docflow.logic.ServicesConsumerLogic;
import com.ksoe.energynet.dataminer.BuffetDAO;
import com.ksoe.energynet.dataminer.ENDepartment2EPRenDAO;
import com.ksoe.energynet.dataminer.ENRecordPointBytDAO;
import com.ksoe.energynet.dataminer.ENRecordPointPromDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.ENSheets4SOController;
import com.ksoe.energynet.ejb.ENSheets4SOControllerHome;
import com.ksoe.energynet.ejb.FINWorkerController;
import com.ksoe.energynet.ejb.FINWorkerControllerHome;
import com.ksoe.energynet.ejb.SystemOperationsController;
import com.ksoe.energynet.ejb.SystemOperationsControllerHome;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.logic.DepartmentLogic.BillingServerData;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ReportLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.util.tools.CollectionTools;
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.ENRecordPointProm;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENWarrantStatus;
import com.ksoe.energynet.valueobject.brief.ENRecordPointBytShort;
import com.ksoe.energynet.valueobject.brief.ENRecordPointPromShort;
import com.ksoe.energynet.valueobject.brief.FINWorkerShort;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointPromFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;
import com.ksoe.energynet.valueobject.lists.ENRecordPointBytShortList;
import com.ksoe.energynet.valueobject.lists.ENRecordPointPromShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.lla.persistence.GenericSessionStatelessBean;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.service.ejb.WorkOrderController;
import com.ksoe.service.ejb.WorkOrderControllerHome;

public class ScheduledEventsManager {


	private LocalTime timeNow = LocalTime.now();

	private boolean timeBetween(LocalTime startTime, LocalTime endTime) {
		return (!timeNow.isBefore(startTime)) && timeNow.isBefore(endTime);
	}


    private transient java.sql.Connection connection = null;

	protected java.sql.Connection getConnection(String dataSourceName) throws DatasourceConnectException {
		try {

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext.lookup(dataSourceName);

			connection = dataSource.getConnection();

			return connection;

		} catch (Exception e) {
			System.out.println("@@@@@@@@@@@@@@@@ connection " + dataSourceName + " not available...");
		}

		return null;
	}


    public class DomainInfo {
        public String domainName;
        public int minCodeValue;
        public int maxCodeValue;
    }


    public DomainInfo getDomainInfo(String userName)
            throws PersistenceException, DatasourceConnectException {

        // Connection connection = getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE);
        Connection connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_IMMEDIATE_DATASOURCE);

        PreparedStatement statement = null;
        DomainInfo info = null;

        try {
            String selectStr = "select d.name, d.dinfmincodevalue, d.dinfmaxcodevalue"
                    + " from auth_domain d"
                    + " where d.name = (select user_domain"
                    + " from auth_user"
                    + " where user_name = " + "'" + userName + "')";

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                info = new DomainInfo();
                info.domainName = resultSet.getString(1);
                info.minCodeValue = resultSet.getInt(2);
                info.maxCodeValue = resultSet.getInt(3);
            }
            resultSet.close();

            return info;
        } catch (SQLException e) {
            throw new PersistenceException("Can't get DomainInfo", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

	 public void generateAutoOrderByCountersServices() {
	        Connection conn = null;

	        GenericSessionStatelessBean._userAlias = "energynet";

	        try {

	        	conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	            UserProfile userProfile = new UserProfile();
	            userProfile.userName = "energynet";

	            DomainInfo domainInfo = new DomainInfo();
	            domainInfo = getDomainInfo(userProfile.userName);
	            userProfile.domainInfo.domain = domainInfo.domainName;
	            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
	            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

	            /*
	            	if (conn == null || conn.isClosed()) {
	            		conn = getRemoteConnection(AuthorizationJNDINames.ENERGY_DATASOURCE);
	            	}
	             */

	            ServicesLogic soLogic = new ServicesLogic(conn, userProfile);
	            soLogic.generateAutoOrderByCountersServices();

			} catch (DatasourceConnectException e) {
				e.printStackTrace();
			} catch (PersistenceException e) {
				e.printStackTrace();
			} /*catch (SQLException e) {
				e.printStackTrace();
			}*/ finally {

				GenericSessionStatelessBean._userAlias = "";

				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
					}
				}
			}
		}



	public void generateGukData() {
		Connection conn = null;

		try {

			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";

			DomainInfo domainInfo = new DomainInfo();
			domainInfo = getDomainInfo(userProfile.userName);
			userProfile.domainInfo.domain = domainInfo.domainName;
			userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
			userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

			Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			PreparedStatement statement = null;
			PreparedStatement insStatement = null;
			ResultSet set = null;

			String sql = " select distinct ed.ecode, ed.invnumber, ipp.ipitemrefcode, "
						+ " (select e.renrefcode from enelement e where e.code = ed.ecode) as departmentrefcode "
						+ " , (select ig.name from ENINVESTPROGRAMGROUPS ig, enipitem pi "
						+ " where pi.code = ipp.ipitemrefcode and ig.code = pi.invgrouprefcode) as groupname "
						+ " , (select pi.itemnumber from enipitem pi "
						+ " where pi.code = ipp.ipitemrefcode) as itemnumber "
						+ " , 0 as consumption2013 "
						+ " , 0 as consumption2015 "
						+ " from "
						+ " enipitem2plan ipp, enplanwork p, enplancorrecthistory pch_month, enplancorrecthistory pch_npz, "
						+ " enplanwork pf, enelementdata ed "
						+ " where ipp.ipitemrefcode in (976, 977, 882, 883, 884, 885) "
						+ " and ipp.planrefcode = p.code "
						+ " and p.kindcode = 2 "
						+ " and pch_month.planoldrefcode = p.code "
						+ " and pch_month.reasoncode = 4 "
						+ " and pch_npz.planoldrefcode = pch_month.plannewrefcode "
						+ " and pch_npz.plannewrefcode = pf.code "
						+ " and pf.elementrefcode = ed.ecode "
						+ " and ed.etype = 7 "
						+ " order by departmentrefcode, ipp.ipitemrefcode, ed.invnumber ";

			statement = conn.prepareStatement(sql);

			set = statement.executeQuery();
			for (int i = 0; set.next(); i++) {

				int ecode = set.getInt(1);
				String invnumber = set.getString(2);
				int ipitemrefcode = set.getInt(3);
				int departmentrefcode = set.getInt(4);
				String groupname = set.getString(5);
				String itemnumber = set.getString(6);
				double consumption2013 = set.getInt(7);
				double consumption2015 = set.getDouble(8);

				String billingServerIp = "";
				String billingServerJnpPort = "";

				ENDepartment2EPRenDAO renDao = new ENDepartment2EPRenDAO(userProfile, conn);
				ENDepartment2EPRenFilter renFilter = new ENDepartment2EPRenFilter();
				renFilter.renRef.code = departmentrefcode;

				ENDepartment2EPRenShortList renList = renDao.getScrollableFilteredList(renFilter, 0, -1);
				if (renList.totalCount > 0) {
					billingServerIp = renList.get(0).billingServerIp;
					billingServerJnpPort = renList.get(0).billingServerJnpPort;
				}

				boolean silent = true;

				if (!billingServerIp.equals("")) {
					String jndi = "ksoe/billing/BillController";
					String ejbHome = "com.ksoe.billing.ejb.BillControllerHome";

					BillControllerHome ejbBillHome = (BillControllerHome) BillingEjbCache.getHome(jndi, ejbHome, billingServerIp, billingServerJnpPort, silent);
					BillController billController = ejbBillHome.create();

					BillFilter bill2013 = new BillFilter();
					bill2013.conditionSQL = " bill.code in ("
							+ " select b.code from bill b where b.invstatuscode <> 2 "
							// + " and b.periodrefcode in (select cp.code from currentperiod cp where cp.startperioddate between '01.01.2013' and '01.12.2013') "
							+ " AND ( (b.startDate >= '01.01.2013' AND b.endDate <= '31.12.2013') "
							+ "		 OR (b.name = 'Счет порожден корректировочной субсидией' "
							+ "		 		AND b.issueddate between '01.01.2013' AND '31.12.2013') ) "
							+ " and b.recordpontrfcode in (select rp.code from recordpoint rp where rp.name = '" + invnumber + "') )";

							// System.out.println("##########  billingServerIp = " + billingServerIp);
							System.out.println("##########  invnumber = " + invnumber + " :: i = " + i);
							// System.out.println("##########  bill2013.conditionSQL = " + bill2013.conditionSQL);

					BillShortList bill2013List = billController.getScrollableFilteredList(bill2013, 0, -1);
					for (int b = 0; b < bill2013List.totalCount; b++) {
						consumption2013 = consumption2013 + bill2013List.get(b).consumption.doubleValue();
					}


					BillFilter bill2015 = new BillFilter();
					bill2015.conditionSQL = " bill.code in (select b.code from bill b where b.invstatuscode <> 2 "
							// + " and b.periodrefcode in (select cp.code from currentperiod cp where cp.startperioddate between '01.01.2015' and '01.12.2015') "
							+ " AND ( (b.startDate >= '01.01.2015' AND b.endDate <= '31.12.2015') "
							+ "		 OR (b.name = 'Счет порожден корректировочной субсидией' "
							+ "		 		AND b.issueddate between '01.01.2015' AND '31.12.2015') ) "
							+ " and b.recordpontrfcode in (select rp.code from recordpoint rp where rp.name = '" + invnumber + "') )";

					BillShortList bill2015List = billController.getScrollableFilteredList(bill2015, 0, -1);
					for (int b = 0; b < bill2015List.totalCount; b++) {
						consumption2015 = consumption2015 + bill2015List.get(b).consumption.doubleValue();
					}


					String insSql = "insert into gukdata (ecode, invnumber, ipitemrefcode, departmentrefcode, groupname, itemnumber, consumption2013, consumption2015) "
							+ " values (?, ?, ?, ?, ?, ?, ?, ?)";

					insStatement = connection.prepareStatement(insSql);

					insStatement.setInt(1, ecode);
					insStatement.setString(2, invnumber);
					insStatement.setInt(3, ipitemrefcode);
					insStatement.setInt(4, departmentrefcode);
					insStatement.setString(5, groupname);
					insStatement.setString(6, itemnumber);
					insStatement.setDouble(7, consumption2013);
					insStatement.setDouble(8, consumption2015);

					insStatement.execute();
				}

			}
		} catch (DatasourceConnectException e) {
			e.printStackTrace();
		} catch (PersistenceException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			throw new SystemException(e);
		} catch (NamingException e) {
			throw new SystemException(e);
		} catch (RemoteException e) {
			throw new SystemException(e);
		} catch (CreateException e) {
			throw new SystemException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


	public class runUpdateRecordpointByt implements Runnable {

		private BillingServerData serverData;
		private Collection<ENRecordPointBytShort> recordPoints;

		private static final int MAX_COUNT = 30000;

		public runUpdateRecordpointByt(BillingServerData serverData) {
			this(serverData, null);
		}

		public runUpdateRecordpointByt(BillingServerData serverData, Collection<ENRecordPointBytShort> recordPoints) {
			this.serverData = serverData;
			this.recordPoints = recordPoints;
		}


		@Override
		public void run() {
			Connection conn = null;
			try {
				conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

				UserProfile userProfile = new UserProfile();
				userProfile.userName = "energynet";

				DomainInfo domainInfo = new DomainInfo();
				domainInfo = getDomainInfo(userProfile.userName);
				userProfile.domainInfo.domain = domainInfo.domainName;
				userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
				userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

				Collection<ENRecordPointBytShort> recordPointsToProcess = null;

				ENRecordPointBytDAO rpDao = new ENRecordPointBytDAO(conn, userProfile);
				ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(conn, userProfile);

				if(this.recordPoints != null) {
					recordPointsToProcess = this.recordPoints;
				} else {
					String jndi = "ksoe/service/WorkOrderController";
					String ejbHome = "com.ksoe.service.ejb.WorkOrderControllerHome";

					WorkOrderControllerHome ejbWorkOrderHome = (WorkOrderControllerHome) BillingEjbCache.getHome(jndi, ejbHome
							, this.serverData.billingServerIp, this.serverData.billingServerJnpPort, true);
					WorkOrderController workOrderController = ejbWorkOrderHome.create();

					ENRecordPointBytShortList recordPointBillingList = workOrderController.getRecordPointBytForNet();
					if(recordPointBillingList.totalCount > MAX_COUNT) {
						Collection<Collection<ENRecordPointBytShort>> collectionsToProcess = CollectionTools.partition(recordPointBillingList.list
								, MAX_COUNT);
						int count = 0;
						for(Collection<ENRecordPointBytShort> collectionToProcess : collectionsToProcess) {
							runUpdateRecordpointByt task = new runUpdateRecordpointByt(this.serverData, collectionToProcess);
							Thread thread = new Thread(task);
							thread.setName("thread-"+(++count));
							thread.start();
						}
						return;
					} else {
						recordPointsToProcess = recordPointBillingList.list;
					}
				}


				System.out.println(String.format("%s (billing server url - %s) starting processing %d of ENRecordPointByts"
						, Thread.currentThread().getName(), String.format("%s:%s"
								, this.serverData.billingServerIp, this.serverData.billingServerJnpPort)
								, recordPointsToProcess.size()));

				// таблица точек учета по которым изменились номера лицевых счетов
				Hashtable<ENRecordPointByt, String> changedAccountNumbers = new Hashtable<>();

				for(ENRecordPointBytShort recordPointBilling : recordPointsToProcess) {
					if(recordPointBilling.elementCode == Integer.MIN_VALUE) continue;
					ENRecordPointBytFilter rpBytFilter = new ENRecordPointBytFilter();
					rpBytFilter.element.code = recordPointBilling.elementCode;

					int rpArr[] = rpDao.getFilteredCodeArray(rpBytFilter, 0, -1);
					if (rpArr.length == 1) {
						ENRecordPointByt recordPointByt = rpDao.getObject(rpArr[0]);

						if(!recordPointByt.accountNumber.equals(recordPointBilling.accountNumber)) {
							changedAccountNumbers.put(recordPointByt, recordPointByt.accountNumber);
						}

						recordPointByt.accountNumber = recordPointBilling.accountNumber;
						recordPointByt.name = recordPointBilling.name;
						recordPointByt.address = recordPointBilling.address;
						recordPointByt.serialNumber = recordPointBilling.serialNumber;
						recordPointByt.invNumber = recordPointBilling.invNumber;
						recordPointByt.counterType = recordPointBilling.counterType;
						recordPointByt.phasity = recordPointBilling.phasity;
						recordPointByt.classAccuracy = recordPointBilling.classAccuracy;
						recordPointByt.checkperiod = recordPointBilling.checkperiod;
						recordPointByt.dateCounterInst = recordPointBilling.dateCounterInst;
						recordPointByt.dateCounterCheck = recordPointBilling.dateCounterCheck;
						recordPointByt.datecheck = recordPointBilling.datecheck;
						recordPointByt.checkperiod1 = recordPointBilling.checkperiod1;
						recordPointByt.phone = recordPointBilling.phone;
						recordPointByt.seal = recordPointBilling.seal;
						recordPointByt.counterCapacity = recordPointBilling.counterCapacity;
						recordPointByt.counterVoltageNominal = recordPointBilling.counterVoltageNominal;
						recordPointByt.counterDateProduct = recordPointBilling.counterDateProduct;

						recordPointByt.statuscode = recordPointBilling.isworkingcode;
						recordPointByt.areaType = recordPointBilling.areaType;

						recordPointByt.fiderCode = recordPointBilling.fiderCode;
						recordPointByt.fiderName = recordPointBilling.fiderName;

						recordPointByt.codeEIC = recordPointBilling.codeEIC;
						recordPointByt.disablePlan = recordPointBilling.disablePlan;
						recordPointByt.tower = recordPointBilling.tower;
						recordPointByt.feeder04 = recordPointBilling.feeder04;
						recordPointByt.contractDate = recordPointBilling.contractDate;
						recordPointByt.dateFirstConsumption = recordPointBilling.dateFirstConsumption;
						recordPointByt.prevCounterCheck = recordPointBilling.prevCounterCheck;
						recordPointByt.prevCheckPeriod = recordPointBilling.prevCheckPeriod;
						rpDao.save(recordPointByt);
					}
				}

				if(changedAccountNumbers.size() > 0) {
					int countUpdatedServicesObject = 0;
					for(ENRecordPointByt recordPoint : changedAccountNumbers.keySet()) {
						String oldAccountNumber = changedAccountNumbers.get(recordPoint);

						ENServicesObjectFilter servicesObjectFilter = new ENServicesObjectFilter();
						servicesObjectFilter.personalAccountCode = recordPoint.rpCode;
						servicesObjectFilter.personalAccountNumber = oldAccountNumber;
						servicesObjectFilter.conditionSQL = " EXISTS (SELECT FROM enservicesobject2techcondtnsservices AS sots "
								+ " INNER JOIN entechconditionsservcs AS ts ON ts.code = sots.techcondservrefcode "
								+ " INNER JOIN endepartment2epren AS deep ON ts.departmentcode = deep.departmentrefcode "
								+ " WHERE sots.servicesobjectrefcode = ENSERVICESOBJECT.CODE"
								+ " AND deep.billingserverip = ? AND deep.billingserverjnpport = ?)";

						Vector<Object> bindedParams = new Vector<>(Arrays.asList(this.serverData.billingServerIp
								, this.serverData.billingServerJnpPort));

						int[] servicesObjectCodes = servicesObjectDao.getFilteredCodeArray(servicesObjectFilter, 0, -1, bindedParams);

						for(int servicesObjectCode : servicesObjectCodes) {
							ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);
							servicesObject.personalAccountNumber = recordPoint.accountNumber;
							servicesObjectDao.save(servicesObject, new String[] {ENServicesObject.personalAccountNumber_Field});
							countUpdatedServicesObject++;
						}
					}
					System.out.println(String.format("%s (billing server url - %s) %d of ENServicesObject has been processed"
							, Thread.currentThread().getName(), String.format("%s:%s"
									, this.serverData.billingServerIp, this.serverData.billingServerJnpPort)
									, countUpdatedServicesObject));
				}

				System.out.println(String.format("%s (billing server url - %s) processing %d of ENRecordPointByts has been finished"
						, Thread.currentThread().getName(), String.format("%s:%s"
								, this.serverData.billingServerIp, this.serverData.billingServerJnpPort)
								, recordPointsToProcess.size()));
			} catch (DatasourceConnectException e) {
				e.printStackTrace();
			} catch (PersistenceException e) {
				e.printStackTrace();
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (RemoteException e) {
				e.printStackTrace();
			} catch (CreateException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
					}
				}
			}
		}
	}


	public void updateRecordpointBytInfo() {
		Connection conn = null;

		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";

			DomainInfo domainInfo = new DomainInfo();
			domainInfo = getDomainInfo(userProfile.userName);
			userProfile.domainInfo.domain = domainInfo.domainName;
			userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
			userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

			DepartmentLogic depLogic = new DepartmentLogic(conn, userProfile);

			List<BillingServerData> serverDataList = depLogic.getServerData();

			for (BillingServerData serverData : serverDataList) {

				runUpdateRecordpointByt runUpdate = new runUpdateRecordpointByt(serverData);

				Thread t = new Thread(runUpdate);
				t.setName("thread-0");
				t.start();
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


	public class runUpdateRecordpointProm implements Runnable {

		private static final int MAX_COUNT = 30000;

		private BillingServerData serverData;
		private Collection<ENRecordPointPromShort> recordPoints;

		public runUpdateRecordpointProm(BillingServerData serverData) {
			this(serverData, null);
		}

		public runUpdateRecordpointProm(BillingServerData serverData, Collection<ENRecordPointPromShort> recordPoints) {
			this.serverData = serverData;
			this.recordPoints = recordPoints;
		}

		@Override
		public void run() {
		Connection conn = null;

		try {
				conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

				UserProfile userProfile = new UserProfile();
				userProfile.userName = "energynet";

				DomainInfo domainInfo = new DomainInfo();
				domainInfo = getDomainInfo(userProfile.userName);
				userProfile.domainInfo.domain = domainInfo.domainName;
				userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
				userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

				ENRecordPointPromDAO promDao = new ENRecordPointPromDAO(conn, userProfile);
				ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(conn, userProfile);

				Collection<ENRecordPointPromShort> recordPointsToProcess = null;
				if(this.recordPoints != null) {
					recordPointsToProcess = this.recordPoints;
				} else {

					String jndi = "ksoe/service/WorkOrderController";
					String ejbHome = "com.ksoe.service.ejb.WorkOrderControllerHome";

					WorkOrderControllerHome ejbWorkOrderHome = (WorkOrderControllerHome) BillingEjbCache.getHome(jndi, ejbHome
							, this.serverData.billingServerIp, this.serverData.billingServerJnpPort, true);
					WorkOrderController workOrderController = ejbWorkOrderHome.create();

					ENRecordPointPromShortList recordPointBillingList = workOrderController.getRecordPointPromForNet();

					if(recordPointBillingList.totalCount > MAX_COUNT) {
						Collection<Collection<ENRecordPointPromShort>> collectionsToProcess = CollectionTools.partition(recordPointBillingList.list
								, MAX_COUNT);
						int count = 0;
						for(Collection<ENRecordPointPromShort> collectionToProcess : collectionsToProcess) {
							runUpdateRecordpointProm task = new runUpdateRecordpointProm(this.serverData, collectionToProcess);
							Thread thread = new Thread(task);
							thread.setName("thread-"+(++count));
							thread.start();
						}
						return;
					} else {
						recordPointsToProcess = recordPointBillingList.list;
					}

				}

				System.out.println(String.format("%s (billing server url - %s) starting processing %d of ENRecordPointProms"
						, Thread.currentThread().getName(), String.format("%s:%s"
								, this.serverData.billingServerIp, this.serverData.billingServerJnpPort)
								, recordPointsToProcess.size()));

				// таблица точек учета по которым изменились номера лицевых счетов
				Hashtable<ENRecordPointProm, String> changedAccountNumbers = new Hashtable<>();

				for(ENRecordPointPromShort recordPointBilling : recordPointsToProcess) {
					if(recordPointBilling.elementCode == Integer.MIN_VALUE) continue;
					ENRecordPointPromFilter rpPromFilter = new ENRecordPointPromFilter();
					rpPromFilter.element.code = recordPointBilling.elementCode;

					int rpArr[] = promDao.getFilteredCodeArray(rpPromFilter, 0, -1);

					if(rpArr.length == 1) {
						ENRecordPointProm recordPointProm = promDao.getObject(rpArr[0]);

						if(!recordPointProm.accountNumber.equals(recordPointBilling.accountNumber)) {
							changedAccountNumbers.put(recordPointProm, recordPointProm.accountNumber);
						}

						recordPointProm.dayofcalculation = recordPointBilling.dayofcalculation;
			       		recordPointProm.inspector = recordPointBilling.inspector;
			       		recordPointProm.datecontrol = recordPointBilling.datecontrol;
			       		recordPointProm.datetp = recordPointBilling.datetp;
			       		//SUPP-47094
			       		recordPointProm.counterType = recordPointBilling.counterType;
			       		recordPointProm.accountName = recordPointBilling.accountName;
			       		recordPointProm.accountNumber = recordPointBilling.accountNumber;

			       		recordPointProm.recordPointName = recordPointBilling.recordPointName;

			       		recordPointProm.seal = recordPointBilling.seal;

			       		recordPointProm.counterCapacity = recordPointBilling.counterCapacity;
			       		recordPointProm.counterVoltageNominal = recordPointBilling.counterVoltageNominal;
			       		recordPointProm.counterDateProduct = recordPointBilling.counterDateProduct;

			       		recordPointProm.fiderCode = recordPointBilling.fiderCode;
			       		recordPointProm.fiderName = recordPointBilling.fiderName;

			       		recordPointProm.codeEIC = recordPointBilling.codeEIC;
			       		recordPointProm.disablePlan = recordPointBilling.disablePlan;
			       		recordPointProm.tower = recordPointBilling.tower;
			       		recordPointProm.feeder04 = recordPointBilling.feeder04;
			       		recordPointProm.contractDate = recordPointBilling.contractDate;
			       		recordPointProm.dateFirstConsumption = recordPointBilling.dateFirstConsumption;


			       		promDao.save(recordPointProm);
					}
				}

				if(changedAccountNumbers.size() > 0) {
					int countUpdatedServicesObject = 0;
					for(ENRecordPointProm recordPoint : changedAccountNumbers.keySet()) {
						String oldAccountNumber = changedAccountNumbers.get(recordPoint);

						ENServicesObjectFilter servicesObjectFilter = new ENServicesObjectFilter();
						servicesObjectFilter.personalAccountCode = recordPoint.accountCode;
						servicesObjectFilter.personalAccountNumber = oldAccountNumber;
						servicesObjectFilter.conditionSQL = " EXISTS (SELECT FROM enservicesobject2techcondtnsservices AS sots "
								+ " INNER JOIN entechconditionsservcs AS ts ON ts.code = sots.techcondservrefcode "
								+ " INNER JOIN endepartment2epren AS deep ON ts.departmentcode = deep.departmentrefcode "
								+ " WHERE sots.servicesobjectrefcode = ENSERVICESOBJECT.CODE"
								+ " AND deep.billingserverip = ? AND deep.billingserverjnpport = ?)";

						Vector<Object> bindedParams = new Vector<>(Arrays.asList(this.serverData.billingServerIp
								, this.serverData.billingServerJnpPort));

						int[] servicesObjectCodes = servicesObjectDao.getFilteredCodeArray(servicesObjectFilter, 0, -1, bindedParams);

						for(int servicesObjectCode : servicesObjectCodes) {
							ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);
							servicesObject.personalAccountNumber = recordPoint.accountNumber;
							servicesObjectDao.save(servicesObject, new String[] {ENServicesObject.personalAccountNumber_Field});
							countUpdatedServicesObject++;
						}

					}
					System.out.println(String.format("%s (billing server url - %s) %d of ENServicesObject (prom) has been processed"
							, Thread.currentThread().getName(), String.format("%s:%s"
									, this.serverData.billingServerIp, this.serverData.billingServerJnpPort)
									, countUpdatedServicesObject));
				}

				System.out.println(String.format("%s (billing server url - %s) processing %d of ENRecordPointProms has been finished"
						, Thread.currentThread().getName(), String.format("%s:%s"
								, this.serverData.billingServerIp, this.serverData.billingServerJnpPort)
								, recordPointsToProcess.size()));


			} catch (DatasourceConnectException e) {
				throw new SystemException(e);
			} catch (PersistenceException e) {
				throw new SystemException(e);
			} catch (NamingException e) {
				throw new SystemException(e);
			} catch (RemoteException e) {
				throw new SystemException(e);
			} catch (CreateException e) {
				throw new SystemException(e);
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
					}
				}
			}
		}
	}




	public void updateRecordpointPromInfo() {
		Connection conn = null;

		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";

			DomainInfo domainInfo = new DomainInfo();
			domainInfo = getDomainInfo(userProfile.userName);
			userProfile.domainInfo.domain = domainInfo.domainName;
			userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
			userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

			DepartmentLogic depLogic = new DepartmentLogic(conn, userProfile);

			List<BillingServerData> serverDataList = depLogic.getServerData();
			for (BillingServerData serverData : serverDataList) {

				runUpdateRecordpointProm runUpdate = new runUpdateRecordpointProm(serverData);

				Thread t = new Thread(runUpdate);
				t.setName("thread-0");
				t.start();
			}


		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		}  finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


	/**
	 *  обновление среза остатков материалов
	 *
	 */

	public void checkRestMaterials_() {
		System.out.println("@@@@@@@@@@@@@@@@  checkRestMaterials...  FINMATERIALCOLLECTION_DATASOURCE isConnected.....");
	}


	public void checkRestMaterials() {

		Connection finConn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		CallableStatement callStmt = null;

		try {

			boolean isConnected = false;
			try {

				finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
				isConnected = true;

			} catch (Exception e) {
				System.out.println("@@@@@@@@@@@@@@@@  checkRestMaterials...  FINMATERIALCOLLECTION_DATASOURCE isConnected = " + isConnected);
			}


		    if (isConnected && finConn != null) {

		    	String checkSegmentSql = "select status from dba_rollback_segs r where r.segment_name = 'RB_FINANSY'";

		    	statement = finConn.prepareStatement(checkSegmentSql);
		    	resultSet = statement.executeQuery();

		    	while (resultSet.next()) {

		    		String segmentState = resultSet.getString(1);

		    		System.out.println("################ RB_FINANSY segmentState = " + segmentState);

					if (segmentState.equals("OFFLINE")) {

						System.out.println("################ RB_FINANSY segmentState = " + segmentState);

						String upSegmentSql = "ALTER ROLLBACK SEGMENT RB_FINANSY ONLINE";

						statement = finConn.prepareStatement(upSegmentSql);
				    	statement.executeQuery();
					}
		    	}

		    	resultSet.close();
		    	statement.close();



				String sql = "select last_day(a.month) from umc_dba.prov_parts a "
						+ " where a.saved_rest = 1 and a.rest_state = 0 order by 1";

	            statement = finConn.prepareStatement(sql);
	            resultSet = statement.executeQuery();

				while (resultSet.next()) {
					Date restDate = resultSet.getDate(1);

					String initSQL = "begin umc_dba.PKG_REST.RECALC_REST(?, ?, ?); end; ";
		            callStmt = finConn.prepareCall(initSQL);

		            callStmt.setDate(1,new java.sql.Date(restDate.getTime()));
		            callStmt.registerOutParameter(2, java.sql.Types.INTEGER);
		            callStmt.registerOutParameter(3, java.sql.Types.INTEGER);

		            callStmt.execute();

		            callStmt.close();
				}
		    }


		} catch (SQLException e) {
			// throw new SystemException(e);
			System.out.println("@@@@@@@@@@@@@@@@  ERRORRRRRRR  checkRestMaterials... " + e.getMessage());

		} finally {
			if (callStmt != null) {
				try {
					callStmt.close();
				} catch (SQLException e) {
				}
			}
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
				}
			}
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
				}
			}
			if (finConn != null) {
				try {
					finConn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


	/**
	 *  закрытие документов, у которых установлена дата действия в будущем
	 *
	 */
	public void checkDocOrdersDate() {

		Connection dfConn = null;
		PreparedStatement statement = null;

		try {
			dfConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);

			String updateSql1 = "update dfdocorder set staterefcode = " + DFConsts.DOC_STATE_TIME_OUT + " where code in ( "
					+ " select o.code from dfdocorder o, dfdocstate s "
					+ " where o.staterefcode = s.code "
					+ " and o.enddate <= current_date "
					+ " and o.staterefcode in (" + DFConsts.DOC_STATE_DRAFT + ", " + DFConsts.DOC_STATE_WORKING + ") )";

			String updateSql2 = "update dfdocdecree set staterefcode = " + DFConsts.DOC_STATE_TIME_OUT + " where code in ( "
					+ " select d.code from dfdocdecree d, dfdocstate s "
					+ " where d.staterefcode = s.code "
					+ " and d.enddate <= current_date "
					+ " and d.staterefcode in (" + DFConsts.DOC_STATE_DRAFT + ", " + DFConsts.DOC_STATE_WORKING + ") )";

			try {
				statement = dfConn.prepareStatement(updateSql1);
				statement.execute();
				statement.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				statement = dfConn.prepareStatement(updateSql2);
				statement.execute();
				statement.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}


		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
				}
			}
			if (dfConn != null) {
				try {
					dfConn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	/**
	 *  Закрытие просроченных доверенностей
	 *
	 */
	public void checkENWarrantsDate() {

		Connection netConnection = null;
		PreparedStatement statement = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			String updateSql = "update enwarrant "
					+ " set warrantstatusrefcode = " + ENWarrantStatus.INACTIVE
					+ " where coalesce(datefinal, to_date('01.01.3000', 'dd.MM.yyyy')) < current_date "
					+ "   and warrantstatusrefcode = " + ENWarrantStatus.ACTIVE;

			try {
				statement = netConnection.prepareStatement(updateSql);
				statement.execute();
				statement.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
				}
			}
			if (netConnection != null) {
				try {
					netConnection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void clearViberTempData() {

		Connection siteConn = null;
		PreparedStatement preparedStmt = null;

		try {
			siteConn = getConnection(AuthorizationJNDINames.SITE_DATASOURCE);

			String deleteQuery = "DELETE FROM vibertmp WHERE create_time < now() - 600";

			preparedStmt = siteConn.prepareStatement(deleteQuery);
			preparedStmt.execute();

		} catch (DatasourceConnectException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStmt != null)
					preparedStmt.close();
			} catch (SQLException e) {
			}
			try {
				if (siteConn != null && !siteConn.isClosed()) {
					siteConn.close();
					siteConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}


	/**
	 * формирование додатка №3 за текущий месяц по РЭС-ам
	 */
	public void generateReportForShevchenkoNN() {
		Connection connection = null;
		GenericSessionStatelessBean._userAlias = "energynet";

		try {
			connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";

			DomainInfo domainInfo = new DomainInfo();
			domainInfo = getDomainInfo(userProfile.userName);
			userProfile.domainInfo.domain = domainInfo.domainName;
			userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
			userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

			ReportLogic reportLogic = new ReportLogic(connection, userProfile);
			reportLogic.generationReportForSheva();

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {

			GenericSessionStatelessBean._userAlias = "";

			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	/**
	 * Формирование писем об отводе земли, которые должны быть отправлены ЗАВТРА
	 */
	public void generateNextLandSheets() {
        GenericSessionStatelessBean._userAlias = "energynet";

        try {
            Context context = new InitialContext();
            Object sheetRef = context.lookup(ENSheets4SOController.JNDI_NAME);
            ENSheets4SOControllerHome sheetHome = (ENSheets4SOControllerHome) PortableRemoteObject.narrow(sheetRef, ENSheets4SOControllerHome.class);
            ENSheets4SOController sheetController = sheetHome.create();

            sheetController.generateNextLandSheets();
        } catch (NamingException e) {
            throw new SystemException(e);
        } catch (RemoteException e) {
            throw new SystemException(e);
        } catch (CreateException e) {
            throw new SystemException(e);
        } finally {
            GenericSessionStatelessBean._userAlias = "";
		}
	}




	/**
	 *  удаление заявок и услуг, которые остались не подтвержденными
	 *
	 */
	public void removeOldApplications() {

		Connection dfConnection = null;
		GenericSessionStatelessBean._userAlias = "energynet";

		try {

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";

			DomainInfo domainInfo = new DomainInfo();
			domainInfo = getDomainInfo(userProfile.userName);
			userProfile.domainInfo.domain = domainInfo.domainName;
			userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
			userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

			dfConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(dfConnection, userProfile);

			Context context = new InitialContext();

			Object servicesConsumerRef = context.lookup(DFDocServicesConsumerController.JNDI_NAME);
			DFDocServicesConsumerControllerHome servicesConsumerHome = (DFDocServicesConsumerControllerHome) PortableRemoteObject
					.narrow(servicesConsumerRef, DFDocServicesConsumerControllerHome.class);
			DFDocServicesConsumerController servicesConsumerController = servicesConsumerHome.create();

			servicesConsumerController.removeOldApplications();

		} catch (Exception e) {
			// throw new SystemException(e);
			e.printStackTrace();
		} finally {
			GenericSessionStatelessBean._userAlias = "";

			if (dfConnection != null) {
				try {
					dfConnection.close();
				} catch (SQLException e) {
				}
			}
		}
	}



	/**
	 *
	 * Синхронизация табельных номеров и скидочных карт программы Буфет
	 *
	 */
	public void synchronizeBuffetCards() {
		Connection buffetConnection = null;
		Connection energyNetConnection = null;
		try {
			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";

			DomainInfo domainInfo = new DomainInfo();
			domainInfo = getDomainInfo(userProfile.userName);
			userProfile.domainInfo.domain = domainInfo.domainName;
			userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
			userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

			buffetConnection = this.getConnection(AuthorizationJNDINames.BUFET_DATASOURCE);
			energyNetConnection = this.getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);



			BuffetDAO buffetDao = new BuffetDAO(buffetConnection, userProfile);

			FINWorkerFilter filter = new FINWorkerFilter();

			Properties props = new Properties();
			props.put(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.security.jndi.JndiLoginInitialContextFactory");
			props.put(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");
			props.put(Context.SECURITY_PRINCIPAL, "energynet");
			props.put(Context.SECURITY_CREDENTIALS, "1");
			Context context = new InitialContext(props);
			Object objRef = context.lookup(FINWorkerController.JNDI_NAME);
			FINWorkerControllerHome home = (FINWorkerControllerHome) PortableRemoteObject.narrow(objRef, FINWorkerControllerHome.class);
			FINWorkerController controller = home.create();
			FINWorkerShortList list = controller.getWorkerList(filter, 0, -1, false);
			List<String> addedCards = new ArrayList<>();
			List<String> removedCards = new ArrayList<>();
			List<String> codeCards = buffetDao.getCardCodes();
			List<Integer> codeCardsInt = new ArrayList<>();
			List<Integer> tabNumbers = new ArrayList<>();
			for(String codeCard : codeCards) {
				codeCardsInt.add(Integer.valueOf(codeCard));
			}
			/*Подправка карт с нулем впереди (если есть такие карточки, то ноль убирается)*/
			for(String codeCard : codeCards) {
				if(codeCard.startsWith("0")) {
					String codeCardWithoutZero = String.valueOf(Integer.valueOf(codeCard));
					buffetDao.removeCardFromBuffet(codeCardWithoutZero);
					buffetDao.updateCode(codeCard, codeCardWithoutZero);
					
				}
			}
			/*Обработка сотрудников - если карточки нет, то добавляется в БД Буфета*/
			for(FINWorkerShort item : list.list) {
				Integer intTabNumber = Integer.valueOf(item.tabNumber);
				tabNumbers.add(intTabNumber);
				if(!codeCardsInt.contains(intTabNumber)) {
					buffetDao.addCardToBufet(intTabNumber.toString(), item.name);
					addedCards.add(String.format("%s %s", item.tabNumber, item.name));
				}
			}
			/*Обработка уволенных (карточки удаляются)*/ 
			for(Integer codeCard : codeCardsInt) {
				if(!tabNumbers.contains(codeCard)) {
					String strCodeCard = String.valueOf(codeCard);
					String name = buffetDao.getCardName(strCodeCard);
					buffetDao.addDismissedCardToBuffet(strCodeCard, name);
					buffetDao.removeCardFromBuffet(strCodeCard);
					removedCards.add(String.format("%s %s", strCodeCard, name));
				}
			}

			System.out.println(String.format("В программу Буфет добавлено сотрудников в количестве %d человек. Список: \n %s"
					, addedCards.size(), addedCards));
			System.out.println(String.format("В программе Буфет удалено уволенных сотрудников в количестве %d человек. Список: \n %s"
					, removedCards.size(), removedCards));


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(energyNetConnection != null && !energyNetConnection.isClosed()) {
					energyNetConnection.close();
				}
			} catch (SQLException e) {}
			try {
				if(buffetConnection != null && buffetConnection.isClosed()) {
					buffetConnection.close();
				}
			} catch (SQLException e) {}
		}
	}



	/**
	 * закрытие просроченных услуг на сторону ( вышел срок оплаты )
	 *
	 */
	public void checkServicesObject() {

		Connection netConnection = null;
		Connection docFlowConnection = null;

		try {

			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";

			DomainInfo domainInfo = new DomainInfo();
			domainInfo = getDomainInfo(userProfile.userName);
			userProfile.domainInfo.domain = domainInfo.domainName;
			userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
			userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

			ServicesConsumerLogic servicesConsumerLogic = new ServicesConsumerLogic(docFlowConnection, userProfile);

            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(userProfile, netConnection);
            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
            soFilter.conditionSQL = " enservicesobject.code in (select w.socode from ( "
            		+ " select s.code as socode, "
            		+ " coalesce((select sum(coalesce(p.sumtotal, 0)) from enpayment2so p where p.servicesobjectrefcode = s.code), 0) as paySo "
            		+ " from enservicesobject s "
            		+ " where s.isnopay <> 1 "
            		+ " and s.contragenttyperefcode <> 2 "
            		+ " and s.contractstatusrefcode in "
            		+ " (" + ENServicesContractStatus.GOOD + ", "+ ENServicesContractStatus.BUDGETAPPROVED + ", "+ ENServicesContractStatus.SIGNED + ") "

            		/** SUPP-57310... 22.05.2017 +++ только услуги.... */
            		+ " and s.contractkindrefcode = " + ENServicesContractKind.SERVICES
            		+ " and s.contracttyperefcode = " + ENServicesContractType.OTHERS

            		/** для договоров, созданных с сайта - 15 дней, для всех остальных - 30....  + 3 дня - на разноску банка... */
            		+ " and (case when s.createdfromsite = " + ENConsts.CREATED_FROM_SITE_NO + " then "
            		+ "   current_date >= add_months(s.contractdateservices + 3, 1) "
            		+ "     else current_date >= s.contractdateservices + 18 end ) "


            		/** SUPP-57310... 19.05.2017 +++ закрываем все платные договора без оплаты.... */
            		/*
            		+ " and s.elementcode in (select distinct pl.elementrefcode from enplanwork pl where pl.code in ( "
            		+ " select tcl.planrefcode from enplanwork2classfctntp tcl, tkclassificationtype t "
            		+ " where tcl.classificationtyperfcd = t.code "
            		+ " and t.replacecounterkindcode in (" + TKReplaceCounterKind.REPLACE_COUNTER + "," + TKReplaceCounterKind.PARAMETERIZATION_COUNTER + ") ) )  "
            		*/

            		+ " ) w where w.payso = 0)";


            int soArr[] = soDAO.getFilteredCodeArray(soFilter, 0, -1);
            for (int s = 0; s < soArr.length; s++) {

	            /** отмена договора */
				soDAO.updateContractServicesStatus(soArr[s]);

				if (netConnection == null || netConnection.isClosed()) {
					netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
				}

				ServicesLogic soLogic = new ServicesLogic(netConnection, userProfile);

				/** Отвяжем счетчики */
				soLogic.removeForCounters(soArr[s], true);


				/** если услуга связана с заявкой потребителя - закрыть задания... */
				int servicesConsumerCode = soLogic.getServicesConsumerCode(soArr[s]);
				if (servicesConsumerCode != Integer.MIN_VALUE) {

					String resolution = "Втрачено чинність після спливу терміну сплати суми.";
					servicesConsumerLogic.closeExpiredTask(servicesConsumerCode, soArr[s], resolution, ApplicationStatus.SIXTH);
				}

			}

			System.out.println("#### Ok!!! updateContractServicesStatus totalCount = " + soArr.length);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (netConnection != null) {
				try {
					netConnection.close();
				} catch (SQLException e) {
				}
			}
			if (docFlowConnection != null) {
				try {
					docFlowConnection.close();
				} catch (SQLException e) {
				}
			}
		}
	}



	/**
	 * очистка ConnectionPool
	 */
	public void flushConnectionPool() {

		try {

			LocalTime startTime = LocalTime.parse("00:00");
	        LocalTime stopTime = LocalTime.parse("05:00");

	        if (timeBetween(startTime, stopTime)) {

	        	Object[] opArgs = new Object[] {};
				String[] sig = new String[] {};
				MBeanServer server = MBeanServerLocator.locateJBoss();

				System.out.println("######################################### server = " + server.toString());
				server.invoke(new ObjectName("jboss.jca:service=ManagedConnectionPool,name=EnergyNetDataSource"), "flush", opArgs, sig);
				System.out.println("######################################### server flush ConnectionPool EnergyNetDataSource....");

				server.invoke(new ObjectName("jboss.jca:service=ManagedConnectionPool,name=AuthorizationDataSource"), "flush", opArgs, sig);
				System.out.println("######################################### server flush ConnectionPool AuthorizationDataSource....");

				server.invoke(new ObjectName("jboss.jca:service=ManagedConnectionPool,name=LogDataSource"), "flush", opArgs, sig);
				System.out.println("######################################### server flush ConnectionPool LogDataSource....");

				server.invoke(new ObjectName("jboss.jca:service=ManagedConnectionPool,name=FinMaterialDataSource"), "flush", opArgs, sig);
				System.out.println("######################################### server flush ConnectionPool FinMaterialDataSource....");

				server.invoke(new ObjectName("jboss.jca:service=ManagedConnectionPool,name=MDAXDataSource"), "flush", opArgs, sig);
				System.out.println("######################################### server flush ConnectionPool MDAXDataSource....");

				server.invoke(new ObjectName("jboss.jca:service=ManagedConnectionPool,name=DocFlowDataSource"), "flush", opArgs, sig);
				System.out.println("######################################### server flush ConnectionPool DocFlowDataSource....");
	        }


		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	/**
	 * перезагрузка сервисов
	 */
	public void restartInspectPlanWorkService() {

		GenericSessionStatelessBean._userAlias = "energynet";

		try {

			LocalTime startTime = LocalTime.parse("03:45");
	        LocalTime stopTime = LocalTime.parse("04:00");

	        if (timeBetween(startTime, stopTime)) {

	        	Context context = new InitialContext();

				Object systemOperationsRef = context.lookup(SystemOperationsController.JNDI_NAME);
				SystemOperationsControllerHome systemOperationsHome = (SystemOperationsControllerHome) PortableRemoteObject
						.narrow(systemOperationsRef, SystemOperationsControllerHome.class);
				SystemOperationsController systemOperationsController = systemOperationsHome.create();

				systemOperationsController.restartInspectPlanWorkService();

				System.out.println("#####################  InspectPlanWorkService reStarted oK......");
	        }

		} catch (Exception e) {
			// throw new SystemException(e);
			e.printStackTrace();
		} finally {
			GenericSessionStatelessBean._userAlias = "";
		}
	}
	
	/**
	 * отправка пакета документов в архив и отмена договора о присоединении для просроченных договоров
	 */
	public void expiredAgreementsCancellation() {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";
			userProfile.userAlias = "energynet";
			DomainInfo domainInfo = new DomainInfo();
			domainInfo = getDomainInfo(userProfile.userName);
			userProfile.domainInfo.domain = domainInfo.domainName;
			userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
			userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

			ServicesLogic soLogic = new ServicesLogic(conn, userProfile);
			soLogic.expiredAgreementsCancellation();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


}

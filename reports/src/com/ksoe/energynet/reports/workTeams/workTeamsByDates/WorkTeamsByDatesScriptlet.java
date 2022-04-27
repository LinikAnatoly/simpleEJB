package com.ksoe.energynet.reports.workTeams.workTeamsByDates;

import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.fill.JRFillParameter;
import net.sf.jasperreports.engine.JRScriptletException;

import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.List;
import java.util.HashSet;
import java.util.Map.Entry;
import java.util.AbstractMap;
import java.util.HashMap;
import java.util.Collection;
import java.util.Vector;
import java.util.stream.Collectors;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.math.BigDecimal;
import java.net.URL;
import java.util.Base64;
import java.net.HttpURLConnection;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.StringBuilder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.text.ParseException;
import java.sql.Connection;

import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.util.tools.CollectionTools;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.callcenter.dataminer.CCDamageLog2ENPlanWorkDAO;
import com.ksoe.callcenter.valueobject.brief.CCDamageLog2ENPlanWorkShort;
import com.ksoe.callcenter.valueobject.lists.CCDamageLog2ENPlanWorkShortList;
import com.ksoe.callcenter.valueobject.filter.CCDamageLog2ENPlanWorkFilter;
import com.ksoe.energynet.logic.ENSettingsLogic;
import com.ksoe.energynet.logic.ENSettingsKeysConsts;

public class WorkTeamsByDatesScriptlet extends JRDefaultScriptlet {

	private DateFormat dfDateTime = new SimpleDateFormat("dd.MM.yyyy HH:mm");
	private Map<Integer, Entry<Date, Date>> admittances = new HashMap<>();
	private Set<Integer> planCodes = new HashSet<Integer>();
	private Map<Integer, Integer> monthPlanCodes = new HashMap<>();
	private String dispatcherUrl = null;
	private String dispatcherAuth = null;

	
	/**
	 * ѕодключитьс€ к оперативному журналу диспетчера и получить по кодам планов строку-ответ с временем начала и окончани€ работ
	*/
	public String getAdmittanceInfoByPlanCodes(Collection<Integer> planCodes) throws IOException, ProtocolException
		, MalformedURLException, PersistenceException, JRScriptletException {
		if(dispatcherUrl == null) {
			UserProfile userProfile = (UserProfile)this.getParameterValue("userProfile");
			Connection connection = (Connection) this.getParameterValue("REPORT_CONNECTION");
			ENSettingsLogic logic = new ENSettingsLogic(connection, userProfile);
			dispatcherUrl = logic.getValue(ENSettingsKeysConsts.DISPATCHER_URL);
			dispatcherAuth = logic.getValue(ENSettingsKeysConsts.DISPATCHER_AUTHORIZATION);
		}
		URL url = new URL(dispatcherUrl + "rest/DSAdmittance/getInfoStringByPlanCodes?planCodes=" 
			+ Tools.collection2String(planCodes, ","));
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		conn.setConnectTimeout(50000);
		conn.setReadTimeout(50000);                                                   
		conn.setRequestProperty("Authorization", "Basic " + dispatcherAuth);
		InputStream inputStream = conn.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
		StringBuilder content = new StringBuilder();
		String inputLine;
		while ((inputLine = reader.readLine()) != null) {
			content.append(inputLine);
		}
		return content.toString();
	}
	
	private Date convertDateTime(String dateWithTime) throws ParseException {
		if(dateWithTime.equals("null")) {
			return null;
		} else {
			return dfDateTime.parse(dateWithTime);
		}
	}
	
	private List<Integer> getMonthPlanCodesThatHaveCallCenterOrder(List<Integer> planCodes) 
		throws JRScriptletException, PersistenceException {
		List<Integer> result = new ArrayList<>();
		if(planCodes.size() == 0) return result;
		Connection callCenterConnection = (Connection)this.getParameterValue("callCenterConnection");
		UserProfile userProfile = (UserProfile)this.getParameterValue("userProfile");
		CCDamageLog2ENPlanWorkDAO dao = new CCDamageLog2ENPlanWorkDAO(callCenterConnection, userProfile);
		CCDamageLog2ENPlanWorkFilter filter = new CCDamageLog2ENPlanWorkFilter();
		filter.conditionSQL = String.format("enplanworkcode IN (%s)", Tools.repeatSymbol("?", ",", planCodes.size()));
		Vector<Integer> params = new Vector<Integer>();
		params.addAll(planCodes);
		CCDamageLog2ENPlanWorkShortList list = dao.getScrollableFilteredList(filter, 0, -1, params);
		result = list.list.stream().map(CCDamageLog2ENPlanWorkShort::getEnplanworkcode).collect(Collectors.toList());
		return result;
	}
	
	
	public boolean addToData(Integer plan_code, Date datestart, String department, String finexecutor, String object, String state
		, BigDecimal totaltimehours, String vehicles, Integer month_plan_code, String departureTime, String arrivalTime , String ptype) throws JRScriptletException {
			if(!planCodes.contains(plan_code)) {
				Map<String, Object> dataMap = new HashMap<>();
				dataMap.put("plan_code", plan_code);
				dataMap.put("datestart", datestart);
				dataMap.put("department", department);
				dataMap.put("finexecutor", finexecutor);
				dataMap.put("object", object);
				dataMap.put("state", state);
				dataMap.put("ptype", ptype);
				dataMap.put("totaltimehours", totaltimehours);
				dataMap.put("vehicles", vehicles);
				dataMap.put("departure_time", departureTime);
				dataMap.put("arrival_time", arrivalTime);
				List<Map<String, Object>> data = (List<Map<String, Object>>)this.getParameterValue("data");
				data.add(dataMap);
				planCodes.add(plan_code);
				monthPlanCodes.put(plan_code, month_plan_code);
				return true;		
			} else {
				return false;
			}
	}
	
	public Map<Integer, Entry<Date, Date>> makeMapOfPlanCodesWithStartFinish() throws IOException, ProtocolException
		, MalformedURLException, ParseException, JRScriptletException, PersistenceException {
		Map<Integer, Entry<Date, Date>> result = new HashMap<>();
		Collection<Collection<Integer>> planCollections = CollectionTools.partition(planCodes, 250);
		List<Integer> callCenterOrders = (List<Integer>)this.getParameterValue("callCenterOrders");
		int i = 0;
		for(Collection<Integer> planCollection : planCollections) {
			String admittanceInfo = getAdmittanceInfoByPlanCodes(planCollection);
			if(admittanceInfo.equals("null")) continue;
			StringTokenizer tokenizer = new StringTokenizer(admittanceInfo,";\n");
			while(tokenizer.hasMoreTokens()) {
				String token = tokenizer.nextToken();
				Integer planCode = Integer.valueOf(token.substring(0, token.indexOf(" ")));
				String strDates = token.substring(token.indexOf("(") + 1, token.length() - 1);
				int pos = strDates.indexOf("-");
				String strStart = strDates.substring(0, pos - 1);
				String strFinish = strDates.substring(pos + 2);
				Entry<Date, Date> entry = new AbstractMap.SimpleImmutableEntry<>(convertDateTime(strStart), convertDateTime(strFinish));
				result.put(planCode, entry);
			}
			
			final List<Integer> monthPlanCodesList = new ArrayList<>();
			planCollection.stream().map(o -> monthPlanCodes.get(o)).forEach(v -> monthPlanCodesList.add(v));
			List<Integer> monthPlanCodesListWithOrder = this.getMonthPlanCodesThatHaveCallCenterOrder(monthPlanCodesList);
			List<Integer> planCodesWithOrder = monthPlanCodes.entrySet().stream().filter(e -> monthPlanCodesListWithOrder.contains(e.getValue())).map(Entry::getKey).collect(Collectors.toList());
			callCenterOrders.addAll(planCodesWithOrder);
		}
		return result;
	}
}

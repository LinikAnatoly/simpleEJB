package com.ksoe.energynet.util;

import java.util.Set;

import com.ksoe.lla.persistence.exception.SystemException;

import java.util.HashSet;
import java.util.Hashtable;

public final class LockUtils {
	
	private static final Hashtable<String, Set<Long>> lockHash = new Hashtable<String, Set<Long>>();

	
	private static final String getLockKey() {
		Throwable throwable = new Throwable();
		return String.format("%s.%s", throwable.getStackTrace()[2].getClassName(), throwable.getStackTrace()[2].getMethodName());
	}
	
	public static final boolean lockEntity(long code) {
		Set<Long> lockSet = null;
		String lockKey = getLockKey();
		if(lockHash.containsKey(lockKey)) {
			lockSet = lockHash.get(lockKey);
			if(lockSet.contains(code)) {
				return false;
			}
		} else {
			lockSet = new HashSet<Long>();
			lockHash.put(lockKey, lockSet);
		}
		return lockSet.add(code);
	}
	
	public static final void unLockEntity(long code) {
		String lockKey = getLockKey();
		if(lockHash.containsKey(lockKey)) {
			Set<Long> lockSet = lockHash.get(lockKey);
			if(!lockSet.contains(code)) {
				throw new SystemException("Something very bad happened!");
			}
			lockSet.remove(code);
		} else {
			throw new SystemException("Something very bad happened!");
		}
	}
	
	private LockUtils() {
		
	}
}

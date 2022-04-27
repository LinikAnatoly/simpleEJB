package com.ksoe.energynet.util;

import java.util.AbstractMap.SimpleEntry;
import java.util.Map.Entry;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.Vector;
import java.util.stream.Collectors;

public final class LockUtilsSync {
	private static final Map<String, Map<Number, Lock>> lockHash = new Hashtable<>();
	
	static class Lock {
		private Set<Thread> threads = Collections.synchronizedSet(new HashSet<>());
		public boolean addThread(Thread thread) {
			return threads.add(thread);
		}
		public boolean removeThread(Thread thread) {
			return threads.remove(thread);	
		}
		public int countThreads() {
			return threads.size();
		}
	}

	public static Object lockByCode(Number code) {
		Objects.requireNonNull(code);
		Map<Number, Lock> lockMap = getLockingMap(true);
		synchronized(lockMap) {
			Lock lock = null;
			if(lockMap.containsKey(code)) {
				lock = lockMap.get(code);
			} else {
				lock = getLock();
				lockMap.put(code, lock);
			}
			if(!lock.addThread(Thread.currentThread())) throw new RuntimeException("Something very bad happened!");
			return lock;
		}
	}

	public static Object lockByCodes(Collection<? extends Number> codes) {
		Objects.requireNonNull(codes);
		if(codes.isEmpty()) throw new IllegalArgumentException("\"codes\" is empty");
		Map<Number, Lock> lockMap = getLockingMap(true);
		Map<Object, Thread> waitingThreads = new Hashtable<Object, Thread>();
		Set<Number> remainingCodes = new HashSet<>(codes);
		List<Lock> acquiredLock = new Vector<>(1);
		Thread thisThread = Thread.currentThread();
		synchronized(lockMap) {
			if(!Collections.disjoint(lockMap.keySet(), codes)) {
				Map<Number, Lock> joints = lockMap.entrySet().stream().filter(e -> codes.contains(e.getKey())).collect(Collectors.toMap(Entry::getKey, Entry::getValue));
				remainingCodes.removeAll(joints.keySet());
				Set<Lock> jointLocks = new HashSet<>(joints.values());
				jointLocks.stream().map(e -> new SimpleEntry<Object, Thread>(e, new Thread(() -> {
						LockUtilsSync.waitOnLock(e);
						synchronized(lockMap) {
							Set<Number> unlockedCodes = joints.entrySet().stream()
								.filter(entry -> entry.getValue() == e)
								.map(Entry::getKey)
								.collect(Collectors.toSet());
							synchronized(acquiredLock) {
								if(acquiredLock.isEmpty()) {
									acquiredLock.add(getLock());
									if(!acquiredLock.get(0).addThread(thisThread))
										throw new RuntimeException("Something very bad happened!");
								}
								
								unlockedCodes.forEach(code -> lockMap.put(code, acquiredLock.get(0)));
							}
							waitingThreads.remove(e);
						}
					}))).forEach(e -> waitingThreads.put(e.getKey(), e.getValue()));
				waitingThreads.forEach((k,v) -> v.start());
			}			
		}
		if(waitingThreads != null) while(!waitingThreads.isEmpty()) {}
		synchronized(lockMap) {
			if(acquiredLock.isEmpty()) {
				acquiredLock.add(getLock());
				if(!acquiredLock.get(0).addThread(thisThread))
					throw new RuntimeException("Something very bad happened!");
			}
			remainingCodes.forEach(code -> lockMap.put(code, acquiredLock.get(0)));		
		}
		return acquiredLock.get(0);
	}
	
	public static void releaseLock(Number code) {
		Objects.requireNonNull(code);
		Map<Number, Lock> lockMap = getLockingMap(false);
		if(lockMap == null) throw new RuntimeException("Something very bad happened!");
		synchronized(lockMap) {
			if(!lockMap.containsKey(code)) throw new RuntimeException("Something very bad happened! " + code);
			Lock lock = lockMap.get(code);
			lock.removeThread(Thread.currentThread());
			if(lock.countThreads() == 0) lockMap.remove(code);	
		}
	}
	
	public static void releaseLocks(Collection<? extends Number> codes) {
		Objects.requireNonNull(codes);
		codes.forEach(LockUtilsSync::releaseLock);
	}
	
	public static int countLocks() {
		Map<Number, Lock> lockMap = getLockingMap(false);
		int count = (lockMap == null) ? 0 : lockMap.size();
		return count;
	}
	
	private static Lock getLock() {
		Map<Number, Lock> lockMap = getLockingMap(true);
		Lock lock = new Lock();
		if(lockMap.containsValue(lock)) throw new RuntimeException("Something very bad happened!");
		return lock;
	}
	private static Map<Number, Lock> getLockingMap(boolean createIfNotExists) {
		Map<Number, Lock> lockMap = null;
		String lockKey = getCallingClassName();
		if(lockHash.containsKey(lockKey)) {
			lockMap = lockHash.get(lockKey);
		} else {
			if(createIfNotExists) {
				lockMap = new Hashtable<>();
				lockHash.put(lockKey, lockMap);
			}
		}
		return lockMap;
	}
	private static String getCallingClassName() {
		return new Throwable().getStackTrace()[2].getClassName();
	}
	private static void waitOnLock(Object value) {
		synchronized(value) {}
	}
	
	private LockUtilsSync() {}
}
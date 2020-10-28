### Serial GC
```
java -XX:+UseSerialGC -Xms512m -Xmx512m -Xloggc:gc.demo.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps GCLogAnalysis  
共生成对象次数:13936  
java -XX:+UseSerialGC -Xms2048m -Xmx2048m -Xloggc:gc.demo.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps GCLogAnalysis
共生成对象次数:19062
```

### Default use Parallel GC in JDK8
```
java -Xloggc:gc.demo.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps GCLogAnalysis
共生成对象次数:21433
java -Xms4g -Xmx4g -XX:+PrintGCDetails -XX:+PrintGCDateStamps GCLogAnalysis
共生成对象次数:23903

java -Xms16g -Xmx16g -XX:+PrintGCDetails -XX:+PrintGCDateStamps GCLogAnalysis
正在执行...
执行结束!共生成对象次数:12387
Heap
 PSYoungGen      total 4893184K, used 3447622K [0x000000066ab00000, 0x00000007c0000000, 0x00000007c0000000)
  eden space 4194304K, 82% used [0x000000066ab00000,0x000000073d1d1840,0x000000076ab00000)
  from space 698880K, 0% used [0x0000000795580000,0x0000000795580000,0x00000007c0000000)
  to   space 698880K, 0% used [0x000000076ab00000,0x000000076ab00000,0x0000000795580000)
 ParOldGen       total 11185152K, used 0K [0x00000003c0000000, 0x000000066ab00000, 0x000000066ab00000)
  object space 11185152K, 0% used [0x00000003c0000000,0x00000003c0000000,0x000000066ab00000)
 Metaspace       used 2639K, capacity 4486K, committed 4864K, reserved 1056768K
  class space    used 291K, capacity 386K, committed 512K, reserved 1048576K
```

### CMS
```
java -XX:+UseConcMarkSweepGC -Xms512m -Xmx512m -Xloggc:gc.demo.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps GCLogAnalysis
共生成对象次数:13314  

java -XX:+UseConcMarkSweepGC -Xms4g -Xmx4g -Xloggc:gc.demo.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps GCLogAnalysis  
共生成对象次数:10952
```

### G1
```
java -XX:+UseG1GC -Xms512m -Xmx512m -Xloggc:gc.demo.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps GCLogAnalysis  
共生成对象次数:11496  
java -XX:+UseG1GC -Xms4g -Xmx4g -Xloggc:gc.demo.log -XX:+PrintGC -XX:+PrintGCDateStamps GCLogAnalysis  
共生成对象次数:15387  

java -XX:+UseG1GC -Xms16g -Xmx16g -XX:+PrintGC -XX:+PrintGCDateStamps GCLogAnalysis
正在执行...
2020-10-28T21:03:50.835+0800: [GC pause (G1 Evacuation Pause) (young) 816M->211M(16G), 0.0247998 secs]
2020-10-28T21:03:50.937+0800: [GC pause (G1 Evacuation Pause) (young) 923M->350M(16G), 0.0262362 secs]
2020-10-28T21:03:51.037+0800: [GC pause (G1 Evacuation Pause) (young) 1062M->484M(16G), 0.0252629 secs]
2020-10-28T21:03:51.140+0800: [GC pause (G1 Evacuation Pause) (young) 1196M->623M(16G), 0.0257375 secs]
2020-10-28T21:03:51.238+0800: [GC pause (G1 Evacuation Pause) (young) 1335M->768M(16G), 0.0276490 secs]
2020-10-28T21:03:51.340+0800: [GC pause (G1 Evacuation Pause) (young) 1480M->910M(16G), 0.0268627 secs]
2020-10-28T21:03:51.443+0800: [GC pause (G1 Evacuation Pause) (young) 1622M->1059M(16G), 0.0273664 secs]
2020-10-28T21:03:51.549+0800: [GC pause (G1 Evacuation Pause) (young) 1771M->1208M(16G), 0.0248150 secs]
执行结束!共生成对象次数:22536
```

### OOM
```
java -Xmx128m -XX:+PrintGCDetails GCLogAnalysis  
Exception in thread "main" java.lang.OutOfMemoryError: Java heap space
```

### Summary

```
并发GC在本机环境效果最好，但是有个奇怪的现象Xmx设置成16g，一次GC都没触发，但是生成的对象数量却只有4g堆内存的一半，不是很理解
```




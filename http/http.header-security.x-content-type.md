# `x-content-type-options: nosniff` and mime type

MIME .pdf reviewed

Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,_/_;q=0.8,application/signed-exchange;v=b3;q=0.9

```xml
<filter>
 <filter-name>httpHeaderSecurity</filter-name>
 <filter-class>org.apache.catalina.filters.HttpHeaderSecurityFilter</filter-class>
 <init-param>
  <param-name>hstsEnabled</param-name>
  <param-value>true</param-value>
 </init-param>
 <init-param>
  <param-name>maxAgeSeconds</param-name>
  <param-value>31536000</param-value>
 </init-param>
 <init-param>
  <param-name>includeSubDomains</param-name>
  <param-value>true</param-value>
 </init-param>
 <async-supported>true</async-supported>
</filter>

<filter-mapping>
<filter-name>httpHeaderSecurity</filter-name>
<url-pattern>/*</url-pattern>
<url-pattern>*</url-pattern>
<dispatcher>REQUEST</dispatcher>
</filter-mapping>
```

```
HTTP/1.1 200
Accept-Ranges: bytes
ETag: W/"7945-1526963263708"
Last-Modified: Tue, 22 May 2018 04:27:43 GMT
Content-Length: 7945
Date: Mon, 01 Nov 2021 00:58:34 GMT
Connection: close
```

```
HTTP/1.1 200
X-Frame-Options: SAMEORIGIN
X-Content-Type-Options: nosniff
X-XSS-Protection: 1; mode=block
Accept-Ranges: bytes
ETag: W/"8464755-1594793479000"
Last-Modified: Wed, 15 Jul 2020 06:11:19 GMT
Content-Length: 8464755
Date: Mon, 01 Nov 2021 01:00:05 GMT
Connection: close
```

tomcat `web.xml`

tested: this issue caused by `http header security`, `x-content-type-options: nosniff`, additional mine type required.

```xml
    <!-- student archive files : pdf formats -->
    <mime-mapping>
        <extension>pdf reviewed</extension>
        <mime-type>application/pdf</mime-type>
    </mime-mapping>
```

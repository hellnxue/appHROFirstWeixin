<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf" %>

<es:webAppZhongqiuHeader title="中秋福利欢乐奉献-智阳网络" description="智阳网络技术" keywords="智阳网络技术"/>

<div class="section-box p-index">
  <div class="section-list m-page" data-page="1">
    <div style="background:url(${ctx}/static/zhongqiu/images/pic01.jpg) no-repeat center center;background-size:auto 100%; width:100%; height:100%;"></div>
  </div>
  <div class="section-list" data-page="2">
    <ul class="series-list">
      <li><img src="${ctx}/static/zhongqiu/images/list_01img.jpg" width="100%"><a class="upico"></a>
        <div class="series-mian none">
            <div class="pageHeader_dg" style="height:113px;"> <a href="detail?type=1" class="Fixcent" id="Fix1" style="z-index:9999; top:0px;left:0;"><img src="${ctx}/static/zhongqiu/images/dg2.jpg"></a> </div>
            <div id="waterfall" class="waterlist" data-url="${ctx}/static/zhongqiu/json/json1.js"></div>
            <div class="Fixexit" id="Fixexit1" style=" margin-bottom:10px;"></div>
        </div>
      </li>
      <li><img src="${ctx}/static/zhongqiu/images/list_02img.jpg" width="100%"><a class="upico"></a>
      <div class="series-mian none">
            <div class="pageHeader_dg" style="height:113px;"> <a href="detail?type=2" class="Fixcent" id="Fix2" style="z-index:9999; top:0px;left:0;"><img src="${ctx}/static/zhongqiu/images/dg2.jpg"></a> </div>
            <div id="waterfall1" class="waterlist" data-url="${ctx}/static/zhongqiu/json/json2.js"></div>
            <div class="Fixexit" id="Fixexit2" style=" margin-bottom:10px;"></div>
        </div>
      </li>
      <li><img src="${ctx}/static/zhongqiu/images/list_03img.jpg" width="100%"><a class="upico"></a>
      <div class="series-mian none">
            <div class="pageHeader_dg" style="height:113px;"> <a href="detail?type=3" class="Fixcent" id="Fix3" style="z-index:9999; top:0px;left:0;"><img src="${ctx}/static/zhongqiu/images/dg2.jpg"></a> </div>
            <div id="waterfall2" class="waterlist" data-url="${ctx}/static/zhongqiu/json/json3.js"></div>
            <div class="Fixexit" id="Fixexit3" style=" margin-bottom:10px;"></div>
        </div>
      </li>
      <li><img src="${ctx}/static/zhongqiu/images/list_04img.jpg" width="100%"><a class="upico"></a>
      <div class="series-mian none">
            <div class="pageHeader_dg" style="height:113px;"> <a href="detail?type=4" class="Fixcent" id="Fix4" style="z-index:9999; top:0px;left:0;"><img src="${ctx}/static/zhongqiu/images/dgjd.jpg"></a> </div>
            <div id="waterfall3" class="waterlist" data-url="${ctx}/static/zhongqiu/json/json4.js"></div>
            <div class="Fixexit" id="Fixexit4" style=" margin-bottom:10px;"></div>
        </div>
      </li>
    </ul>
  </div>
  <div class="section-list" data-page="3">
    <img src="${ctx}/static/zhongqiu/images/pic03.jpg" width="100%">
  </div>
</div>
<script src="${ctx}/static/zhongqiu/js/jquery.scrollfix.js" type="text/javascript"></script>


<!--在这里编写你的代码-->


</body>
</html>
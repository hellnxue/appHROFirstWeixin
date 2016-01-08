<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf" %>

<es:webAppAnxinshebaoHeader title="安心社保-智阳网络" description="智阳网络技术" keywords="智阳网络技术"/>
  <form id="myForm" method="post" class="am-form">
<div class="home">
  <div class="container">
    <div class="mainbody">
    	<div class="notice_mk">
        	<p>您正在申请的是安心社保服务。<br>您的资料将采用加密技术传输，请放心填写。</p>
        </div>
        <div class="form_list">
              <div class="list citylist"><div class="mk_box">
              <div class="tit fl"><em class="redtishixing">*</em><span class="tits">地区：</span></div>
              <div class="rs_cityselect fl">
                <div class="city_selected_show region-over-mian line-content fix" id="region-select-cell">
                  <input name="region-data" id="region-data" type="hidden" value="">
                  <ul class="region-select fix" >
                    <li class="item"><span id="areas"></span></li>
                  </ul>
                  <br id="areasErrmsg"/> 
                  <a class="region-trigger" href="javascript:;" data-spm-anchor-id="0.0.0.0"></a>
                  <div class="region-wrapper">
                    <div class="r-b">
                      <div class="cont">
                        <ul>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-db" class="reg">
                                <label for="db">东北</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-1816" class="prov">
                                <label for="r-1816">黑龙江</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1816"></a>
                                <div class="city" id="p-1816"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1817">
                                      <label for="r-1817">哈尔滨</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1831">
                                      <label for="r-1831">齐齐哈尔</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1842">
                                      <label for="r-1842">鹤岗</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1846">
                                      <label for="r-1846">双鸭山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1852">
                                      <label for="r-1852">鸡西</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1857">
                                      <label for="r-1857">大庆</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1863">
                                      <label for="r-1863">伊春</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1867">
                                      <label for="r-1867">牡丹江</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1875">
                                      <label for="r-1875">佳木斯</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1883">
                                      <label for="r-1883">七台河</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1886">
                                      <label for="r-1886">黑河</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1893">
                                      <label for="r-1893">绥化</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1904">
                                      <label for="r-1904">大兴安岭</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1816"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2118" class="prov">
                                <label for="r-2118">吉林</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2118"></a>
                                <div class="city" id="p-2118"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2119">
                                      <label for="r-2119">长春</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2125">
                                      <label for="r-2125">吉林</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2132">
                                      <label for="r-2132">四平</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2138">
                                      <label for="r-2138">辽源</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2142">
                                      <label for="r-2142">通化</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2149">
                                      <label for="r-2149">白山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2156">
                                      <label for="r-2156">松原</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2162">
                                      <label for="r-2162">白城</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2168">
                                      <label for="r-2168">延边朝鲜族自治州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2118"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2361" class="prov">
                                <label for="r-2361">辽宁</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2361"></a>
                                <div class="city" id="p-2361"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2362">
                                      <label for="r-2362">沈阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2368">
                                      <label for="r-2368">大连</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2374">
                                      <label for="r-2374">鞍山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2379">
                                      <label for="r-2379">抚顺</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2384">
                                      <label for="r-2384">本溪</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2388">
                                      <label for="r-2388">丹东</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2393">
                                      <label for="r-2393">锦州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2399">
                                      <label for="r-2399">葫芦岛</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2404">
                                      <label for="r-2404">营口</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2408">
                                      <label for="r-2408">盘锦</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2412">
                                      <label for="r-2412">阜新</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2416">
                                      <label for="r-2416">辽阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2420">
                                      <label for="r-2420">铁岭</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2427">
                                      <label for="r-2427">朝阳</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2361"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-gat" class="reg">
                                <label for="gat">港澳台</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-4846" class="prov">
                                <label for="r-4846">香港</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-4846"></a>
                                <div class="city" id="p-4846"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4847">
                                      <label for="r-4847">香港岛</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4849">
                                      <label for="r-4849">九龙</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4851">
                                      <label for="r-4851">新界</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-4846"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-4853" class="prov">
                                <label for="r-4853">澳门</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-4853"></a>
                                <div class="city" id="p-4853"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4854">
                                      <label for="r-4854">澳门半岛</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4856">
                                      <label for="r-4856">澳门离岛</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-4853"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-4858" class="prov">
                                <label for="r-4858">台湾</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-4858"></a>
                                <div class="city" id="p-4858"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4859">
                                      <label for="r-4859">新北市</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4861">
                                      <label for="r-4861">宜兰县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4863">
                                      <label for="r-4863">桃园县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4865">
                                      <label for="r-4865">新竹县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4867">
                                      <label for="r-4867">苗栗县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4869">
                                      <label for="r-4869">台中县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4871">
                                      <label for="r-4871">彰化县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4873">
                                      <label for="r-4873">南投县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4875">
                                      <label for="r-4875">云林县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4877">
                                      <label for="r-4877">嘉义县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4879">
                                      <label for="r-4879">台南县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4881">
                                      <label for="r-4881">高雄县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4883">
                                      <label for="r-4883">屏东县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4885">
                                      <label for="r-4885">台东县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4887">
                                      <label for="r-4887">花莲县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4889">
                                      <label for="r-4889">澎湖县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4891">
                                      <label for="r-4891">基隆市</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4893">
                                      <label for="r-4893">新竹市</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4895">
                                      <label for="r-4895">台中市</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4897">
                                      <label for="r-4897">嘉义市</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4899">
                                      <label for="r-4899">台南市</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4901">
                                      <label for="r-4901">台北市</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4903">
                                      <label for="r-4903">高雄市</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4905">
                                      <label for="r-4905">金门县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4907">
                                      <label for="r-4907">连江县</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-4858"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-hb" class="reg">
                                <label for="hb">华北</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-1098" class="prov">
                                <label for="r-1098">北京</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1098"></a>
                                <div class="city" id="p-1098"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1099">
                                      <label for="r-1099">北京</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1098"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-1511" class="prov">
                                <label for="r-1511">河北</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1511"></a>
                                <div class="city" id="p-1511"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1512">
                                      <label for="r-1512">石家庄</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1531">
                                      <label for="r-1531">唐山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1541">
                                      <label for="r-1541">秦皇岛</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1547">
                                      <label for="r-1547">邯郸</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1564">
                                      <label for="r-1564">邢台</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1583">
                                      <label for="r-1583">保定</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1607">
                                      <label for="r-1607">张家口</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1622">
                                      <label for="r-1622">承德</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1632">
                                      <label for="r-1632">沧州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1648">
                                      <label for="r-1648">廊坊</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1658">
                                      <label for="r-1658">衡水</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1511"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2434" class="prov">
                                <label for="r-2434">内蒙古</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2434"></a>
                                <div class="city" id="p-2434"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2435">
                                      <label for="r-2435">呼和浩特</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2442">
                                      <label for="r-2442">包头</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2447">
                                      <label for="r-2447">乌海</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2449">
                                      <label for="r-2449">赤峰</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2460">
                                      <label for="r-2460">通辽</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2469">
                                      <label for="r-2469">鄂尔多斯</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2478">
                                      <label for="r-2478">呼伦贝尔</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2492">
                                      <label for="r-2492">乌兰察布</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2504">
                                      <label for="r-2504">锡林郭勒盟</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2517">
                                      <label for="r-2517">巴彦淖尔</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2525">
                                      <label for="r-2525">阿拉善盟</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2529">
                                      <label for="r-2529">兴安盟</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2434"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2536" class="prov">
                                <label for="r-2536">宁夏</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2536"></a>
                                <div class="city" id="p-2536"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2537">
                                      <label for="r-2537">银川</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2542">
                                      <label for="r-2542">石嘴山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2547">
                                      <label for="r-2547">吴忠</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2552">
                                      <label for="r-2552">中卫</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2554">
                                      <label for="r-2554">固原</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2536"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2728" class="prov">
                                <label for="r-2728">山西</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2728"></a>
                                <div class="city" id="p-2728"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2729">
                                      <label for="r-2729">太原</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2735">
                                      <label for="r-2735">大同</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2744">
                                      <label for="r-2744">阳泉</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2748">
                                      <label for="r-2748">长治</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2761">
                                      <label for="r-2761">晋城</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2768">
                                      <label for="r-2768">朔州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2774">
                                      <label for="r-2774">晋中</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2786">
                                      <label for="r-2786">忻州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2801">
                                      <label for="r-2801">临汾</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2819">
                                      <label for="r-2819">运城</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2833">
                                      <label for="r-2833">吕梁</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2728"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-3256" class="prov">
                                <label for="r-3256">天津</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-3256"></a>
                                <div class="city" id="p-3256"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3257">
                                      <label for="r-3257">天津</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-3256"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-hd" class="reg">
                                <label for="hd">华东</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-1002" class="prov">
                                <label for="r-1002">安徽</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1002"></a>
                                <div class="city" id="p-1002"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1003">
                                      <label for="r-1003">合肥</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1008">
                                      <label for="r-1008">芜湖</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1013">
                                      <label for="r-1013">蚌埠</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1018">
                                      <label for="r-1018">淮南</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1021">
                                      <label for="r-1021">马鞍山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1024">
                                      <label for="r-1024">淮北</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1027">
                                      <label for="r-1027">铜陵</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1030">
                                      <label for="r-1030">安庆</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1040">
                                      <label for="r-1040">黄山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1046">
                                      <label for="r-1046">滁州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1054">
                                      <label for="r-1054">阜阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1061">
                                      <label for="r-1061">宿州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1067">
                                      <label for="r-1067">巢湖</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1073">
                                      <label for="r-1073">六安</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1080">
                                      <label for="r-1080">亳州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1085">
                                      <label for="r-1085">池州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1090">
                                      <label for="r-1090">宣城</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1002"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-1103" class="prov">
                                <label for="r-1103">福建</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1103"></a>
                                <div class="city" id="p-1103"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1104">
                                      <label for="r-1104">福州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1114">
                                      <label for="r-1114">厦门</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1116">
                                      <label for="r-1116">三明</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1128">
                                      <label for="r-1128">莆田</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1131">
                                      <label for="r-1131">泉州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1141">
                                      <label for="r-1141">漳州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1152">
                                      <label for="r-1152">南平</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1163">
                                      <label for="r-1163">龙岩</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1171">
                                      <label for="r-1171">宁德</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1103"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2847" class="prov">
                                <label for="r-2847">山东</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2847"></a>
                                <div class="city" id="p-2847"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2848">
                                      <label for="r-2848">济南</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2854">
                                      <label for="r-2854">青岛</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2861">
                                      <label for="r-2861">淄博</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2866">
                                      <label for="r-2866">枣庄</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2869">
                                      <label for="r-2869">东营</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2874">
                                      <label for="r-2874">潍坊</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2884">
                                      <label for="r-2884">烟台</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2894">
                                      <label for="r-2894">威海</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2899">
                                      <label for="r-2899">济宁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2911">
                                      <label for="r-2911">泰安</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2917">
                                      <label for="r-2917">日照</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2921">
                                      <label for="r-2921">莱芜</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2923">
                                      <label for="r-2923">德州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2935">
                                      <label for="r-2935">临沂</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2946">
                                      <label for="r-2946">聊城</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2955">
                                      <label for="r-2955">滨州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2963">
                                      <label for="r-2963">菏泽</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2847"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-hn" class="reg">
                                <label for="hn">华南</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-1277" class="prov">
                                <label for="r-1277">广西</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1277"></a>
                                <div class="city" id="p-1277"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1278">
                                      <label for="r-1278">南宁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1287">
                                      <label for="r-1287">柳州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1295">
                                      <label for="r-1295">桂林</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1309">
                                      <label for="r-1309">梧州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1315">
                                      <label for="r-1315">北海</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1318">
                                      <label for="r-1318">防城港</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1322">
                                      <label for="r-1322">钦州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1326">
                                      <label for="r-1326">贵港</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1330">
                                      <label for="r-1330">玉林</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1337">
                                      <label for="r-1337">百色</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1350">
                                      <label for="r-1350">贺州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1355">
                                      <label for="r-1355">河池</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1367">
                                      <label for="r-1367">来宾</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1374">
                                      <label for="r-1374">崇左</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1277"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-1474" class="prov">
                                <label for="r-1474">海南</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1474"></a>
                                <div class="city" id="p-1474"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1475">
                                      <label for="r-1475">海口</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1477">
                                      <label for="r-1477">三亚</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1479">
                                      <label for="r-1479">五指山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1481">
                                      <label for="r-1481">琼海</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1483">
                                      <label for="r-1483">儋州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1485">
                                      <label for="r-1485">文昌</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1487">
                                      <label for="r-1487">万宁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1489">
                                      <label for="r-1489">东方</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1491">
                                      <label for="r-1491">澄迈县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1493">
                                      <label for="r-1493">定安县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1495">
                                      <label for="r-1495">屯昌县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1497">
                                      <label for="r-1497">临高县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1499">
                                      <label for="r-1499">白沙黎族自治县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1501">
                                      <label for="r-1501">昌江黎族自治县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1503">
                                      <label for="r-1503">乐东黎族自治县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1505">
                                      <label for="r-1505">陵水黎族自治县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1507">
                                      <label for="r-1507">保亭黎族苗族自治县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1509">
                                      <label for="r-1509">琼中黎族苗族自治县</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3705">
                                      <label for="r-3705">南沙群岛</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3707">
                                      <label for="r-3707">西沙群岛</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3709">
                                      <label for="r-3709">中沙群岛的岛礁及其海域</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1474"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2614" class="prov">
                                <label for="r-2614">广东</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2614"></a>
                                <div class="city" id="p-2614"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2615">
                                      <label for="r-2615">广州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2619">
                                      <label for="r-2619">深圳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2621">
                                      <label for="r-2621">珠海</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2623">
                                      <label for="r-2623">汕头</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2628">
                                      <label for="r-2628">韶关</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2638">
                                      <label for="r-2638">河源</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2645">
                                      <label for="r-2645">梅州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2654">
                                      <label for="r-2654">惠州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2660">
                                      <label for="r-2660">汕尾</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2665">
                                      <label for="r-2665">东莞</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2667">
                                      <label for="r-2667">中山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2669">
                                      <label for="r-2669">江门</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2675">
                                      <label for="r-2675">佛山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2677">
                                      <label for="r-2677">阳江</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2682">
                                      <label for="r-2682">湛江</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2689">
                                      <label for="r-2689">茂名</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2695">
                                      <label for="r-2695">肇庆</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2703">
                                      <label for="r-2703">清远</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2712">
                                      <label for="r-2712">潮州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2716">
                                      <label for="r-2716">揭阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2722">
                                      <label for="r-2722">云浮</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2614"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-hz" class="reg">
                                <label for="hz">华中</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-1670" class="prov">
                                <label for="r-1670">河南</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1670"></a>
                                <div class="city" id="p-1670"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1671">
                                      <label for="r-1671">郑州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1679">
                                      <label for="r-1679">开封</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1686">
                                      <label for="r-1686">洛阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1697">
                                      <label for="r-1697">平顶山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1705">
                                      <label for="r-1705">焦作</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1713">
                                      <label for="r-1713">鹤壁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1717">
                                      <label for="r-1717">新乡</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1727">
                                      <label for="r-1727">安阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1734">
                                      <label for="r-1734">濮阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1741">
                                      <label for="r-1741">许昌</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1748">
                                      <label for="r-1748">漯河</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1753">
                                      <label for="r-1753">三门峡</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1760">
                                      <label for="r-1760">南阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1773">
                                      <label for="r-1773">商丘</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1782">
                                      <label for="r-1782">信阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1792">
                                      <label for="r-1792">周口</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1803">
                                      <label for="r-1803">驻马店</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-4915">
                                      <label for="r-4915">济源</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1670"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-1908" class="prov">
                                <label for="r-1908">湖北</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1908"></a>
                                <div class="city" id="p-1908"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1909">
                                      <label for="r-1909">武汉</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1911">
                                      <label for="r-1911">黄石</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1915">
                                      <label for="r-1915">襄阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1923">
                                      <label for="r-1923">十堰</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1931">
                                      <label for="r-1931">荆州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1939">
                                      <label for="r-1939">宜昌</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1949">
                                      <label for="r-1949">荆门</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1954">
                                      <label for="r-1954">鄂州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1956">
                                      <label for="r-1956">孝感</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1964">
                                      <label for="r-1964">黄冈</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1975">
                                      <label for="r-1975">咸宁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1982">
                                      <label for="r-1982">随州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1985">
                                      <label for="r-1985">仙桃</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1987">
                                      <label for="r-1987">天门</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1989">
                                      <label for="r-1989">潜江</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1991">
                                      <label for="r-1991">神农架林区</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1993">
                                      <label for="r-1993">恩施土家族苗族自治州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1908"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2002" class="prov">
                                <label for="r-2002">湖南</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2002"></a>
                                <div class="city" id="p-2002"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2003">
                                      <label for="r-2003">长沙</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2009">
                                      <label for="r-2009">株洲</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2016">
                                      <label for="r-2016">湘潭</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2021">
                                      <label for="r-2021">衡阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2030">
                                      <label for="r-2030">邵阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2041">
                                      <label for="r-2041">岳阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2049">
                                      <label for="r-2049">常德</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2058">
                                      <label for="r-2058">张家界</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2062">
                                      <label for="r-2062">益阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2068">
                                      <label for="r-2068">郴州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2079">
                                      <label for="r-2079">永州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2090">
                                      <label for="r-2090">怀化</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2103">
                                      <label for="r-2103">娄底</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2109">
                                      <label for="r-2109">湘西土家族苗族自治州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2002"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2258" class="prov">
                                <label for="r-2258">江西</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2258"></a>
                                <div class="city" id="p-2258"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2259">
                                      <label for="r-2259">南昌</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2265">
                                      <label for="r-2265">景德镇</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2269">
                                      <label for="r-2269">萍乡</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2274">
                                      <label for="r-2274">新余</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2277">
                                      <label for="r-2277">九江</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2289">
                                      <label for="r-2289">鹰潭</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2293">
                                      <label for="r-2293">赣州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2312">
                                      <label for="r-2312">吉安</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2325">
                                      <label for="r-2325">宜春</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2336">
                                      <label for="r-2336">抚州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2348">
                                      <label for="r-2348">上饶</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2258"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-jzh" class="reg">
                                <label for="jzh">江浙沪</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-2177" class="prov">
                                <label for="r-2177">江苏</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2177"></a>
                                <div class="city" id="p-2177"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2178">
                                      <label for="r-2178">南京</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2182">
                                      <label for="r-2182">徐州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2190">
                                      <label for="r-2190">连云港</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2196">
                                      <label for="r-2196">淮安</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2202">
                                      <label for="r-2202">宿迁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2208">
                                      <label for="r-2208">盐城</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2218">
                                      <label for="r-2218">扬州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2224">
                                      <label for="r-2224">泰州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2230">
                                      <label for="r-2230">南通</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2238">
                                      <label for="r-2238">镇江</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2243">
                                      <label for="r-2243">常州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2247">
                                      <label for="r-2247">无锡</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2251">
                                      <label for="r-2251">苏州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2177"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2610" class="prov">
                                <label for="r-2610">上海</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2610"></a>
                                <div class="city" id="p-2610"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2611">
                                      <label for="r-2611">上海</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2610"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-3478" class="prov">
                                <label for="r-3478">浙江</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-3478"></a>
                                <div class="city" id="p-3478"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3479">
                                      <label for="r-3479">杭州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3486">
                                      <label for="r-3486">宁波</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3493">
                                      <label for="r-3493">温州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3503">
                                      <label for="r-3503">嘉兴</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3510">
                                      <label for="r-3510">湖州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3515">
                                      <label for="r-3515">绍兴</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3522">
                                      <label for="r-3522">金华</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3531">
                                      <label for="r-3531">衢州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3537">
                                      <label for="r-3537">舟山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3541">
                                      <label for="r-3541">台州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3549">
                                      <label for="r-3549">丽水</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-3478"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-xb" class="reg">
                                <label for="xb">西北</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-1181" class="prov">
                                <label for="r-1181">甘肃</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1181"></a>
                                <div class="city" id="p-1181"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1182">
                                      <label for="r-1182">兰州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1187">
                                      <label for="r-1187">金昌</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1190">
                                      <label for="r-1190">白银</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1195">
                                      <label for="r-1195">天水</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1202">
                                      <label for="r-1202">嘉峪关</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1204">
                                      <label for="r-1204">武威</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1209">
                                      <label for="r-1209">张掖</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1216">
                                      <label for="r-1216">平凉</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1224">
                                      <label for="r-1224">酒泉</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1232">
                                      <label for="r-1232">庆阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1241">
                                      <label for="r-1241">定西</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1249">
                                      <label for="r-1249">陇南</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1259">
                                      <label for="r-1259">甘南藏族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1268">
                                      <label for="r-1268">临夏回族自治州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1181"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2561" class="prov">
                                <label for="r-2561">青海</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2561"></a>
                                <div class="city" id="p-2561"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2562">
                                      <label for="r-2562">西宁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2567">
                                      <label for="r-2567">海东</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2574">
                                      <label for="r-2574">海北藏族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2579">
                                      <label for="r-2579">黄南藏族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2584">
                                      <label for="r-2584">海南藏族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2590">
                                      <label for="r-2590">果洛藏族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2597">
                                      <label for="r-2597">玉树藏族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2604">
                                      <label for="r-2604">海西蒙古族藏族自治州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2561"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-3371" class="prov">
                                <label for="r-3371">新疆</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-3371"></a>
                                <div class="city" id="p-3371"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3372">
                                      <label for="r-3372">乌鲁木齐</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3375">
                                      <label for="r-3375">克拉玛依</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3377">
                                      <label for="r-3377">石河子</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3379">
                                      <label for="r-3379">阿拉尔</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3381">
                                      <label for="r-3381">图木舒克</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3383">
                                      <label for="r-3383">五家渠</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3385">
                                      <label for="r-3385">吐鲁番</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3389">
                                      <label for="r-3389">哈密</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3393">
                                      <label for="r-3393">和田</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3402">
                                      <label for="r-3402">阿克苏</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3412">
                                      <label for="r-3412">喀什</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3425">
                                      <label for="r-3425">克孜勒苏柯尔克孜自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3430">
                                      <label for="r-3430">巴音郭楞蒙古自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3440">
                                      <label for="r-3440">昌吉回族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3449">
                                      <label for="r-3449">博尔塔拉蒙古自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3453">
                                      <label for="r-3453">伊犁哈萨克自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3781">
                                      <label for="r-3781">阿勒泰地区</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3782">
                                      <label for="r-3782">塔城地区</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-3371"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-2973" class="prov">
                                <label for="r-2973">陕西</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-2973"></a>
                                <div class="city" id="p-2973"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2974">
                                      <label for="r-2974">西安</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2980">
                                      <label for="r-2980">铜川</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2983">
                                      <label for="r-2983">宝鸡</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-2995">
                                      <label for="r-2995">咸阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3008">
                                      <label for="r-3008">渭南</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3020">
                                      <label for="r-3020">延安</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3034">
                                      <label for="r-3034">汉中</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3046">
                                      <label for="r-3046">榆林</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3059">
                                      <label for="r-3059">安康</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3070">
                                      <label for="r-3070">商洛</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-2973"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                          <li>
                            <dl>
                              <dt>
                                <input type="checkbox" id="r-xn" class="reg">
                                <label for="xn">西南</label>
                              </dt>
                              <dd>
                                <input type="checkbox" id="r-1382" class="prov">
                                <label for="r-1382">贵州</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-1382"></a>
                                <div class="city" id="p-1382"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1383">
                                      <label for="r-1383">贵阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1389">
                                      <label for="r-1389">六盘水</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1394">
                                      <label for="r-1394">遵义</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1408">
                                      <label for="r-1408">安顺</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1415">
                                      <label for="r-1415">铜仁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1426">
                                      <label for="r-1426">毕节</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1435">
                                      <label for="r-1435">黔西南布依族苗族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1444">
                                      <label for="r-1444">黔东南苗族侗族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-1461">
                                      <label for="r-1461">黔南布依族苗族自治州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-1382"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-3078" class="prov">
                                <label for="r-3078">四川</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-3078"></a>
                                <div class="city" id="p-3078"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3079">
                                      <label for="r-3079">成都</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3091">
                                      <label for="r-3091">自贡</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3095">
                                      <label for="r-3095">攀枝花</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3099">
                                      <label for="r-3099">泸州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3105">
                                      <label for="r-3105">德阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3112">
                                      <label for="r-3112">绵阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3121">
                                      <label for="r-3121">广元</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3127">
                                      <label for="r-3127">遂宁</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3132">
                                      <label for="r-3132">内江</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3137">
                                      <label for="r-3137">乐山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3146">
                                      <label for="r-3146">南充</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3154">
                                      <label for="r-3154">宜宾</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3165">
                                      <label for="r-3165">广安</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3171">
                                      <label for="r-3171">达州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3179">
                                      <label for="r-3179">巴中</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3184">
                                      <label for="r-3184">雅安</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3193">
                                      <label for="r-3193">眉山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3200">
                                      <label for="r-3200">资阳</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3205">
                                      <label for="r-3205">阿坝藏族羌族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3219">
                                      <label for="r-3219">甘孜藏族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3238">
                                      <label for="r-3238">凉山彝族自治州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-3078"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-3262" class="prov">
                                <label for="r-3262">重庆</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-3262"></a>
                                <div class="city" id="p-3262"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3263">
                                      <label for="r-3263">重庆</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-3262"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-3290" class="prov">
                                <label for="r-3290">西藏</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-3290"></a>
                                <div class="city" id="p-3290"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3291">
                                      <label for="r-3291">拉萨</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3300">
                                      <label for="r-3300">那曲</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3311">
                                      <label for="r-3311">昌都</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3323">
                                      <label for="r-3323">山南</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3336">
                                      <label for="r-3336">日喀则</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3355">
                                      <label for="r-3355">阿里</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3363">
                                      <label for="r-3363">林芝</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-3290"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <dd>
                                <input type="checkbox" id="r-3559" class="prov">
                                <label for="r-3559">云南</label>
                                <span class="orange num"></span><a class="unfold" href="javascript:;" target="_self" action="unfold" for="p-3559"></a>
                                <div class="city" id="p-3559"><i class="line"></i>
                                  <ul>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3560">
                                      <label for="r-3560">昆明</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3571">
                                      <label for="r-3571">曲靖</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3581">
                                      <label for="r-3581">玉溪</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3591">
                                      <label for="r-3591">保山</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3597">
                                      <label for="r-3597">昭通</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3609">
                                      <label for="r-3609">普洱</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3620">
                                      <label for="r-3620">临沧</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3629">
                                      <label for="r-3629">丽江</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3635">
                                      <label for="r-3635">文山壮族苗族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3644">
                                      <label for="r-3644">红河哈尼族彝族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3658">
                                      <label for="r-3658">西双版纳傣族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3662">
                                      <label for="r-3662">楚雄彝族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3673">
                                      <label for="r-3673">大理白族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3686">
                                      <label for="r-3686">德宏傣族景颇族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3692">
                                      <label for="r-3692">怒江傈僳族自治州</label>
                                    </li>
                                    <li class="cit">
                                      <input type="checkbox" id="r-3697">
                                      <label for="r-3697">迪庆藏族自治州</label>
                                    </li>
                                  </ul>
                                  <div class="o"><a href="javascript:;" class="btn-a2" action="close-city" for="p-3559"><span class="go-ico-del"></span></a></div>
                                </div>
                              </dd>
                              <div class="c"></div>
                            </dl>
                          </li>
                        </ul>
                      </div>
                      <div class="o"><a href="javascript:;" target="_self" class="fui-btn go-ico-del" action="cancel"></a></div>
                      <span id="tip">红色文字表示在其他指定地区中有勾选，<br>
                                                                  再次勾选会更新之前该省份的设置</span></div>
                  </div>
                </div>
              </div>
              <div class="clear"></div>
            </div></div>
            <!-- 地区结束 -->
              <div class="list">
              <div class="mk_box">
              <div class="tit fl"><em class="redtishixing">*</em><span class="tits">产品：</span></div>
              <div class="sb_select fl" id="productsErrmsg">
              <span class="mr10"><input type="checkbox" name="product" value="1" checked="checked"  data-validation-message="请选择产品" required >社保</span>
              <span class="mr10"><input type="checkbox" name="product" value="2"> 住房公积金</span>
              <span class="mr10"><input type="checkbox" name="product" value="3"> 代发工资</span>
              <span class="mr10"><input type="checkbox" name="product" value="4"> dayHR</span><br/>sdfsdfdsf
              </div>
               <div class="clear"></div>
              </div>
              </div>
          <div class="list">
          <div class="mk_box">
            <div class="tit fl"><em class="redtishixing">*</em><span class="tits" >联系人姓名：</span></div>
            <div class="sb_select fl" id="linkmanErrmsg">
              <input class="text" type="text" name="text" value="" id="linkman" placeholder="中英文组合，长度不超过十位字符"  data-validation-message="请输入联系人姓名" required/> <br/>
            </div>
            <div class="clear"></div>
          </div>
        </div>
        <div class="list">
          <div class="mk_box">
            <div class="tit fl"><em class="redtishixing">*</em><span class="tits">联系人电话：</span></div>
            <div class="sb_select fl" id="linkmobileErrmsg">
              <input class="text" type="text" name="text" value="" id="linkmobile"/> <br/>
            </div>
            <div class="clear"></div>
          </div>
        </div>
         <div class="list">
          <div class="mk_box">
            <div class="tit fl"><em class="redtishixing">*</em><span class="tits">服务人数：</span></div>
            <div class="sb_select fl" id="serviceNumErrmsg">
              <input class="text" type="text" name="text" value="" id="serviceNum"/><br/>
            </div>
            <div class="clear"></div>
          </div>
        </div>
         <div class="list">
          <div class="mk_box">
            <div class="tit fl"><em class="redtishixing">*</em><span class="tits">用户名：</span></div>
            <div class="sb_select fl" id="loginNameErrmsg">
              <input class="text" type="text" name="text" value="" id="loginName"/> <br/>
            </div>
            <div class="clear"></div>
          </div>
        </div>
         <div class="list">
          <div class="mk_box">
            <div class="tit fl"><em class="redtishixing">*</em><span class="tits">密码：</span></div>
            <div class="sb_select fl" id="passwordErrmsg">
              <input class="text" type="password" name="text" value="" id="password"/> <br/>
            </div>
            <div class="clear"></div>
          </div>
        </div>
         <div class="list">
          <div class="mk_box">
            <div class="tit fl"><em class="redtishixing">*</em><span class="tits">企业名称：</span></div>
            <div class="sb_select fl" id="orgNameErrmsg">
              <input class="text" type="text" name="text" value="" id="orgName"/> <br/>
            </div>
            <div class="clear">asdfsdfsdfdsfdfsdf</div>
          </div>
        </div>
     <!--<p align="center" class="m15"><input type="checkbox"> 免责声明</p> -->
         <p align="center"><input type="submit" class="sub_btn" value="提 交" id="shebaosubmit"></p>
        </div>
    </div>
  </div>
</div>
 </form>
<script src="${ctx}/static/assets/js/jquery.min.js"></script> 
<script src="${ctx}/static/assets/js/amazeui.js"></script> 
<!-- v1.6.2 jquery -->
<%-- <script type="text/javascript" src="${ctx }/static/shebao-m/js/jquery.js"></script> --%>
<script type="text/javascript" src="${ctx }/static/shebao-m/js/web.js"></script>
<script src="${ctx }/static/shebao-m/js/multiregion.js" type="text/javascript"></script>
<script>

	$(function() {
		 /*  $("#shebaosubmit").click(function() {
			handleSubmit();
		});   */
		
		$("#myForm").validator({
			  onInValid: function(validity) {
				  console.log(123);
			       var $field=$(validity.field);
				   
				   //验证不通过时
					if(!validity.valid){
					 
					   $field.parent("div").find("label").html("").remove();
					  
					   $field.parent("div").append("<label style='color:red'>"+$field.data('validationMessage')+"</label>");
					   
					  
					}
			  
			  },
			  //验证通过时
			  onValid: function(validity) {
				 
				 $(validity.field).parent("div").find("label").html("").remove();
				 
				},
			 patterns:{
				  //pwd:/[^0-9]/
				},
				submit:function(){
				 
				  if(!this.isFormValid()){//表单验证状态
				   
					return false;
				  }else{
					alert("success");
				    return false;//暂时设置为不提交
				  }
				  
				}
			  
			
			}); 
		

	//错误信息函数
	function showErrorMsg(msgid, msg) {
		
		var lbcr = msgid + "cr";

		if ($("#" + lbcr).html() != null) {
			$("#" + lbcr).html("").remove();
		}
		if (arguments.length == 2) {
			console.log(msg);
			if (msgid != "areasErrmsg") {
				$("#" + msgid).append(
						"<label style='color:red;' id='"+lbcr+ "' >" + msg
								+ "<label>");
			} else {
				$("#" + msgid).after(
						"<label style='color:red;' id='"+lbcr+ "' >" + msg
								+ "<label>");
			}
			
			return false;
		}
		

	}

	//处理数据
	function handleSubmit() {
		var areas = $("#areas").html();//区域

		var products = "";
		$(":checked[name=product]").each(function() {

			products += $(this).val() + ",";
		});
		products = products.substring(0, products.length - 1);//产品

		var linkman = $("#linkman").val();
		var linkmobile = $("#linkmobile").val();
		var serviceNum = $("#serviceNum").val(); //服务人数

		var loginName = $("#loginName").val(); //用户名
		var password = $("#password").val(); //密码
		var orgName = $("#orgName").val(); //企业名称

		var linkmanpattern = /^\s*[\s\S]{1,10}\s*$/.test(linkman);
		
		var linkmanpattern1=/^[\u4E00-\u9FA5a-zA-Z]+$/.test(linkman);

		var linkmobilepattern = /^13[0-9]{9}$|^14[5|7][0-9]{8}$|^15[012356789][0-9]{8}$|^17[0|6-8][0-9]{8}$|^18[0-9]{9}$/
				.test(linkmobile);

		var numpattern = /^[1-9][0-9]*$/.test(serviceNum);

		if (areas == "") {
			return showErrorMsg("areasErrmsg", "请选择地区！");
		} else {
			 showErrorMsg("areasErrmsg");
		}
		if (products == "") {
			return showErrorMsg("productsErrmsg", "请选择产品！");
		} else {
			showErrorMsg("productsErrmsg");
		}

		if (!linkmanpattern) {
			return showErrorMsg("linkmanErrmsg", "联系人姓名不能超过10个汉字或为空！");
		}else if(!linkmanpattern1){
			return showErrorMsg("linkmanErrmsg", "联系人姓名为中文、英文或两者的组合！");
		} else {
			showErrorMsg("linkmanErrmsg");
		}
		
		if (linkmobile=="") {
			return showErrorMsg("linkmobileErrmsg", "手机号码不能为空！");
		} else if (!linkmobilepattern) {
			return showErrorMsg("linkmobileErrmsg", "手机号码格式错误！");
		} else {
			showErrorMsg("linkmobileErrmsg");
		}

		if (serviceNum == "") {
			return showErrorMsg("serviceNumErrmsg", "服务人数不能为空！");
		} else if (!numpattern) {
			return showErrorMsg("serviceNumErrmsg", "服务人数请填写正确数字！");
		} else {
			showErrorMsg("serviceNumErrmsg");
		}

		var loginNamePattern1 = /^[0-9]+$/.test(loginName);
		var loginNamePattern2 = /^[a-zA-Z0-9_-]+$/.test(loginName);//用户名只能包括英文字母、数字和下划线_和-

		console.log(loginName.length);
		if (loginName == "") {
			return showErrorMsg("loginNameErrmsg", "用户名不能为空！");
		} else if (loginNamePattern1) {
			return showErrorMsg("loginNameErrmsg", "用户名不能全是数字！");
		} else if (!loginNamePattern2) {
			return showErrorMsg("loginNameErrmsg", "用户名为英文字母数字和下划线_和-的组合！");
		} else if (loginName.length<4||loginName.length>20) {
			return showErrorMsg("loginNameErrmsg", "用户名必须在4-20个字符之间！！");
		} else {
			showErrorMsg("loginNameErrmsg");
		}

		var pwdPattern1 = /^[0-9]+$/.test(password);
		var pwdPattern2 = /[a-zA-Z0-9]+$/.test(password);
		console.log("length=======" + password.length);
		if (password == "") {
			return showErrorMsg("passwordErrmsg", "密码不能为空！");
		} else if (pwdPattern1) {
			return showErrorMsg("passwordErrmsg", "密码不能全是数字！");
		} else if (!pwdPattern2) {
			return showErrorMsg("passwordErrmsg", "密码格式为英文或英文与数字的组合！");
		} else if (password.length<6||password.length>18) {
			return showErrorMsg("passwordErrmsg", "密码长度为6-18位！");
		} else {
			showErrorMsg("passwordErrmsg");
		}

		if (orgName == "") {
			return showErrorMsg("orgNameErrmsg", "企业名称不能为空！");
		} else {
			showErrorMsg("orgNameErrmsg");
		}
		
		var dataObject = {
			serviceArea : areas,
			prodCode : products,
			name : linkman,
			mobile : linkmobile,
			loginName : loginName,
			password : password,
			orgName : orgName,
			serviceNum : serviceNum
		};

		var jsonObject = JSON.stringify(dataObject);

		console.log(jsonObject);
		   $.ajax({
			async : false,
			contentType : "application/json",
			dataType : "json",
			type : "POST",
			url : "${ctx}/hrhelper-platform/anxinshebaoDemandUpdate",
			data : jsonObject,
			success : function(objarray) {
				console.log("objarray=" + objarray);
				if (objarray.staus == "true") {
					$("#shebaosubmit").unbind("click");//取消点击事件绑定
					//alert(objarray.message);
					alert("安心社保意向单提交成功。可凭您刚才输入的用户名和密码到网址http://www.hrofirst.com登录查看。");
					window.location.replace("${ctx}/anxinshebao/index");

				} else {
					alert(objarray.message);
				}
			},
			error : function() {
				console.log("ajax异常错误");
			}
		});  
	};
	});
</script>
</body>
</html>

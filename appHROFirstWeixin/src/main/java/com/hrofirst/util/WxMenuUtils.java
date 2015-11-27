package com.hrofirst.util;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hrofirst.util.ssl.HttpClientConnectionManager;

/**
 * 微信自定义菜单创建
 */
public class WxMenuUtils {
	// http客户端
	public static DefaultHttpClient httpclient;

	public static String apiUrl = "https://open.weixin.qq.com/connect/oauth2/authorize";

	static {
		httpclient = new DefaultHttpClient();
		httpclient = (DefaultHttpClient) HttpClientConnectionManager
				.getSSLInstance(httpclient);
		// 接受任何证书的浏览器客户端
	}

	public static void main(String[] args) {
		// 第一人力
		hrofirstMenu();

		// HR帮手
		// hrMenu();

		// 企帮手
		// orgMenu();

		// 员工帮手
		// personMenu();

	}

	/**
	 * HROFirst第一人力菜单
	 */
	public static void hrofirstMenu() {
		System.out.println("HROFirst**************************************");
		try {
			String accessToken = getAccessToken("wx00bd6c8fa058c39f",
					"9a487465fb98ab18beb430078daa636a");

			// System.out.println(accessToken);

			System.out.println("查询菜单：" + getMenuInfo(accessToken));
			// 删除旧的菜单
			String res1 = deleteMenu(accessToken);
			System.out.println(res1);

			// 一级菜单
			String jsonString = "{\"button\":["
					// https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx00bd6c8fa058c39f&redirect_uri=http%3A%2F%2Fapphrofirst.ezhiyang.com%2Fanxinshebao%2Findex&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect
					+ "{\"type\":\"view\",\"name\":\"安心社保\",\"url\":\"http://apphrofirst.ezhiyang.com/anxinshebao/index\",\"sub_button\":[]},"
					+ "{\"name\":\"惠福利\",\"sub_button\":["
					+ "{\"type\":\"view\",\"name\":\"惠福利介绍\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzIzMzAxMjQwOA==&mid=400035022&idx=1&sn=cd65328b6d6e769cf4639b816150b681&scene=23&srcid=1019p6YrnjO8k5YPUMQYAhdc#rd\",\"sub_button\":[]},"
					// https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx00bd6c8fa058c39f&redirect_uri=http%3A%2F%2Fapphrofirst.ezhiyang.com%2F1018%2Ft2&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect
					+ "{\"type\":\"view\",\"name\":\"年会爆款\",\"url\":\"http://apphrofirst.ezhiyang.com/1018/t2\",\"sub_button\":[]}"
					+ "]},"
					+ "{\"name\":\"公司简介\",\"sub_button\":["
					+ "{\"type\":\"view\",\"name\":\"智阳简介\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzIzMzAxMjQwOA==&mid=211163608&idx=1&sn=0112fdf7b40459e9580f35b7c3760d73&scene=23&srcid=10191pYg192iUZA2YmzO9075#rd\",\"sub_button\":[]},"
					+ "{\"type\":\"view\",\"name\":\"昊基简介\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA5MzYyOTUzMw==&mid=211198659&idx=1&sn=c0a7b7b8d977a08bf392cebdd864a3ff&scene=23&srcid=1015DNIrAn4ib9dI5jWZwi55#rd\",\"sub_button\":[]}"
					+ "]}" + "]}";
			System.out.println(jsonString);
			// 创建第一人力公众号菜单
			String res = createMenu(jsonString, accessToken);
			System.out.println("res= " + res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * HR帮手菜单
	 */
	public static void hrMenu() {
		System.out.println("HR帮手**************************************");

		try {
			String accessToken = getAccessToken("wx0d9683313e7d027d",
					"6a615d03896313b85baee07b477d4487");

			System.out.println(accessToken);

			System.out.println(getMenuInfo(accessToken));

			String res1 = deleteMenu(accessToken);
			System.out.println(res1);

			// 创建菜单
			String s = "";

			// hr帮手
			s = "{\"button\":["
					+ "{\"type\":\"view\",\"name\":\"安心社保\",\"url\":\"http://apphrofirst.ezhiyang.com/anxinshebao/index\",\"sub_button\":[]},"
					+ "{\"name\":\"惠福利\",\"sub_button\":["
					+ "{\"type\":\"view\",\"name\":\"惠福利介绍\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzIzMzAxMjQwOA==&mid=400035022&idx=1&sn=cd65328b6d6e769cf4639b816150b681&scene=23&srcid=1019p6YrnjO8k5YPUMQYAhdc#rd\",\"sub_button\":[]},"
					+ "{\"type\":\"view\",\"name\":\"年会爆款\",\"url\":\"http://apphrofirst.ezhiyang.com/1018/t2\",\"sub_button\":[]}"
					+ "]},"
					+ "{\"name\":\"精彩活动\",\"sub_button\":["
					+ "{\"type\":\"view\",\"name\":\"HR福利群\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx0d9683313e7d027d&redirect_uri=http%3A%2F%2Fapphr.ezhiyang.com%2Fhtml%2Findex&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect\",\"sub_button\":[]},"
					+ "{\"type\":\"view\",\"name\":\"政策包查询\",\"url\":\"http://apphr.ezhiyang.com/static/policyNew/hr-city.html\",\"sub_button\":[]}"
					+ "]}" + "]}";

			String res = createMenu(s, accessToken);
			System.out.println("res= " + res);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 企帮手菜单
	 */
	public static void orgMenu() {
		System.out.println("企帮手**************************************");
		// 智阳企帮手
		try {
			String accessToken = getAccessToken("wx6de3d7446f40a5c5",
					"31c1c188f8a57541949b984717b2fe61");

			System.out.println(accessToken);

			System.out.println(getMenuInfo(accessToken));

			String res1 = deleteMenu(accessToken);
			System.out.println(res1);

			// 创建菜单
			String s = "";

			// 企业帮手
			s = "{\"button\":[{\"type\":\"view\",\"name\":\"办公平台\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6de3d7446f40a5c5&redirect_uri=http%3A%2F%2Fapporg.ezhiyang.com%2FwebApp%2FweixinORG&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect\",\"sub_button\":[]},{\"type\":\"view\",\"name\":\"消息中心\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6de3d7446f40a5c5&redirect_uri=http%3A%2F%2Fapporg.ezhiyang.com%2FwebApp%2FweixinORGNews&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect\",\"sub_button\":[]},{\"type\":\"view\",\"name\":\"第一人力\",\"url\":\"http://chuye.cloud7.com.cn/8454396\",\"sub_button\":[]}]}";
			String res = createMenu(s, accessToken);
			System.out.println("res= " + res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 员工帮手菜单
	 */
	public static void personMenu() {
		System.out.println("员工帮手**************************************");

		try {
			String accessToken = getAccessToken("wxf8fc9a730a1c3dce",
					"cf1752d9f8176af79f6d9f6281ac2947");

			System.out.println(accessToken);

			System.out.println(getMenuInfo(accessToken));

			String res1 = deleteMenu(accessToken);
			System.out.println(res1);

			// 创建菜单
			String s = "";

			// 员工帮手
			s = "{\"button\":[{\"type\":\"view\",\"name\":\"登录\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf8fc9a730a1c3dce&redirect_uri=http%3A%2F%2Fappperson.ezhiyang.com%2FwebApp%2FweixinPerson&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect\",\"sub_button\":[]},{\"type\":\"view\",\"name\":\"移动签到\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf8fc9a730a1c3dce&redirect_uri=http%3A%2F%2Fappperson.ezhiyang.com%2FwebApp%2FweixinPersonSignIn&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect\",\"sub_button\":[]},{\"type\":\"click\",\"name\":\"上传资料\",\"key\":\"uploadFiles\",\"sub_button\":[]}]}";

			String res = createMenu(s, accessToken);
			System.out.println("res= " + res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 测试api.ezhiyang.com
	 */
	public static String getApiEzhiyang() throws Exception {
		HttpGet get = HttpClientConnectionManager
				.getGetMethod("https://api.ezhiyang.com/");
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.out.println(jsonStr);
		return jsonStr;
	}

	/**
	 * 创建菜单
	 */
	public static String createMenu(String params, String accessToken)
			throws Exception {
		HttpPost httpost = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/menu/create?access_token="
						+ accessToken);
		httpost.setEntity(new StringEntity(params, "UTF-8"));
		HttpResponse response = httpclient.execute(httpost);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.out.println(jsonStr);
		JSONObject object = JSON.parseObject(jsonStr);

		return object.getString("errmsg");
	}

	/**
	 * 获取accessToken
	 */
	public static String getAccessToken(String appid, String secret)
			throws Exception {
		HttpGet get = HttpClientConnectionManager
				.getGetMethod("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
						+ appid + "&secret=" + secret);
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		JSONObject object = JSON.parseObject(jsonStr);

		return object.getString("access_token");
	}

	/**
	 * 查询菜单
	 */
	public static String getMenuInfo(String accessToken) throws Exception {
		HttpGet get = HttpClientConnectionManager
				.getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/get?access_token="
						+ accessToken);
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		return jsonStr;
	}

	/**
	 * 删除自定义菜单
	 */
	public static String deleteMenu(String accessToken) throws Exception {
		HttpGet get = HttpClientConnectionManager
				.getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/delete?access_token="
						+ accessToken);
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		JSONObject object = JSON.parseObject(jsonStr);

		return object.getString("errmsg");
	}
}
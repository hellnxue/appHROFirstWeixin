package com.service.provider;

import com.service.provider.entity.ReturnS;

public interface QuQuIntentService {
	/**
	 * 投保预约
	 * <pre>
	 * @author steven.chen
	 * @date 2015年7月23日 下午4:45:29 
	 * </pre>
	 * name  必须
	 * mobile 必须
	 * storeId 必须
	 * @param intentEntity
	 * @return
	 */
	public ReturnS addIntent(String  params);

}

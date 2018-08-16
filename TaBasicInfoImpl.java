package cn.sunline.ltts.busi.HelloWorld.serviceimpl;

import java.util.List;

import cn.sunline.ltts.biz.global.CommUtil;
import cn.sunline.ltts.biz.global.SysUtil;
import cn.sunline.ltts.busi.HelloWorld.namedsql.dongtaiDao;
import cn.sunline.ltts.busi.HelloWorld.servicetype.TaBasicInfo.TaInfoInsert.Input;
import cn.sunline.ltts.busi.HelloWorld.tables.khjbxx.Kapp_khjbxxDao;
import cn.sunline.ltts.busi.HelloWorld.tables.khjbxx.kapp_khjbxx;
import cn.sunline.ltts.busi.HelloWorld.type.TaBasicInfo.TaBasic;
import cn.sunline.ltts.busi.sdk.util.DaoUtil;
import cn.sunline.ltts.core.api.logging.BizLog;
import cn.sunline.ltts.core.api.logging.BizLogUtil;
 /**
  * 客户基础信息服务实现
  * 客户基础信息服务实现
  *
  */
@cn.sunline.ltts.frw.model.annotation.Generated
@cn.sunline.ltts.frw.model.annotation.ConfigType(value="TaBasicInfoImpl", longname="客户基础信息服务实现", type=cn.sunline.ltts.frw.model.annotation.ConfigType.Type.service)
public class TaBasicInfoImpl implements cn.sunline.ltts.busi.HelloWorld.servicetype.TaBasicInfo{
	private static final BizLog log=BizLogUtil.getBizLog(TaBasicInfoImpl.class);
 /**
  * 查找客户基本信息
  *
  */
	public cn.sunline.ltts.busi.HelloWorld.type.TaBasicInfo.TaBasic sel_basicInfo(String kehuzhanghao){
		
	}

	public Integer info_insert(String kehuhao, String kehuzhanghao,
			String username, String password) {
		// TODO Auto-generated method stub
		kapp_khjbxx khjbxx=SysUtil.getInstance(kapp_khjbxx.class);
		khjbxx.setKehuhao(kehuhao);
		khjbxx.setKehuzhanghao(kehuzhanghao);
		khjbxx.setUsername(username);
		khjbxx.setPassword(password);
		//Integer result=Kapp_khjbxxDao.insert(khjbxx);
		Integer result=DaoUtil.insert(kapp_khjbxx.class, khjbxx);
		return result;
	}

	public Integer info_insert(Input input) {
		// TODO Auto-generated method stub
		kapp_khjbxx khjbxx=SysUtil.getInstance(kapp_khjbxx.class);
		//khjbxx.setKehuhao(input.getKehuhao());
		//khjbxx.setKehuzhanghao(input.getKehuzhanghao());
		//khjbxx.setUsername(input.getUsername());
		//khjbxx.setPassword(input.getPassword());
		//khjbxx.setZhjlx(input.getZhjlx());
		
		
		CommUtil.copyProperties(khjbxx, input);
		
		Integer result=Kapp_khjbxxDao.insert(khjbxx);
		//事务提交
		DaoUtil.commitTransaction();
		return result;
	}

	public Integer info_delete(String kehuzhanghao) {
		// TODO Auto-generated method stub
		Integer result=Kapp_khjbxxDao.deleteOne_odb1(kehuzhanghao);
		DaoUtil.commitTransaction();
		return result;
	}

	public Integer info_update(TaBasic info) {
		
		// TODO Auto-generated method stub
		kapp_khjbxx khjbxx=SysUtil.getInstance(kapp_khjbxx.class);
		khjbxx.setKehuhao(info.getKehuhao());
		khjbxx.setKehuzhanghao(info.getKehuzhanghao());
		khjbxx.setUsername(info.getUsername());
		khjbxx.setPassword(info.getPassword());
		khjbxx.setZhjlx(info.getZhjlx());
		Integer result=Kapp_khjbxxDao.updateOne_odb1(khjbxx);
		DaoUtil.commitTransaction();
		return result;
	}

	public List kapp_select(){
		List list=dongtaiDao.khjbxx_select(true);
		return list;
	}





	



}

package cn.sunline.edsp.busi.ustran.trans.selltran;


import java.util.List;

import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfpal.legends.security.EncryptTool;

import cn.sunline.adp.cedar.base.util.CommUtil;
import cn.sunline.adp.cedar.busi.sdk.biz.global.SysUtil;
import cn.sunline.edsp.base.lang.Options;
import cn.sunline.edsp.busi.icif.iobus.type.jf.IoSellComplexType;
import cn.sunline.edsp.busi.icif.iobus.type.jf.IoSellComplexType.QueryUserBindList;
import cn.sunline.edsp.busi.icif.iobus.type.jf.IoSellComplexType.RateLists;
import cn.sunline.edsp.busi.icif.sys.errors.MerchantError;
import cn.sunline.edsp.busi.icif.sys.type.JfEnumType.E_ATPEST;
import cn.sunline.edsp.busi.icif.sys.type.JfEnumType.E_COPEFG;
import cn.sunline.edsp.busi.icif.sys.type.JfEnumType.E_PROFES;
import cn.sunline.edsp.busi.icif.sys.type.JfEnumType.E_SFSOXU;
import cn.sunline.edsp.busi.icif.sys.type.JfEnumType.E_USERLE;
import cn.sunline.edsp.busi.icif.sys.type.JfEnumType.E_USERTP;
import cn.sunline.edsp.busi.us.namedsql.IcifMerchantDao;
import cn.sunline.edsp.busi.us.tables.Jif.Cif_agent_baseDao;
import cn.sunline.edsp.busi.us.tables.Jif.Cif_merc_agentDao;
import cn.sunline.edsp.busi.us.tables.Jif.Cif_merchant_baseDao;
import cn.sunline.edsp.busi.us.tables.Jif.Cif_user_baseDao;
import cn.sunline.edsp.busi.us.tables.Jif.Cif_user_bindDao;
import cn.sunline.edsp.busi.us.tables.Jif.cif_agent_base;
import cn.sunline.edsp.busi.us.tables.Jif.cif_merc_agent;
import cn.sunline.edsp.busi.us.tables.Jif.cif_merchant_audit;
import cn.sunline.edsp.busi.us.tables.Jif.cif_merchant_base;
import cn.sunline.edsp.busi.us.tables.Jif.cif_user_base;
import cn.sunline.edsp.busi.us.tables.Jif.cif_user_bind;
import cn.sunline.edsp.busi.ustran.trans.selltran.intf.Meraud.Input;
import cn.sunline.ltts.apollo.ApolloConfigBean;
import cn.sunline.ltts.busi.aplt.adapter.DateTools;
import cn.sunline.ltts.busi.aplt.adapter.RunEnvTools;
import cn.sunline.ltts.busi.sys.dict.CfDict;
import cn.sunline.ltts.busi.sys.type.NasEnumType.E_ACBDTP;
import cn.sunline.ltts.busi.sys.type.NasEnumType.E_IDCKRT;
import cn.sunline.ltts.busi.sys.type.NasEnumType.E_MPCKRT;



public class meraud {
	
	
	/**
	 * 处理商户审核历史记录信息
	 * @param input
	 */
	private static void dealMerchantAuditInfo(final cn.sunline.edsp.busi.ustran.trans.selltran.intf.Meraud.Input input) {
		cif_merchant_audit merchantAudit = IcifMerchantDao.sel_cif_merchant_audit(input.getMercno(), false);
		String cktime = DateTools.getCurrentTimeInfo();
		if(CommUtil.isNotNull(merchantAudit)) {
			if(CommUtil.isNull(input.getShclas())) {
				IcifMerchantDao.upd_cif_merchant_audit_info(input.getAtpest(), input.getMercno(), E_ATPEST.SHTG.getLongName(), cktime);
			}else {
				IcifMerchantDao.upd_cif_merchant_audit_info(input.getAtpest(), input.getMercno(), input.getShclas().getLongName(), cktime);
			}
			
		}
		
	}
	
	/**
	 * 
	 * @Author jiazimo
	 *         <p>
	 *         <li>2019年11月29日-上午10:11:56</li>
	 *         <li>功能说明：处理修改信息</li>
	 *         </p>
	 * @param input
	 */
	private static void dealUpdateClobInfoSuccess(final cn.sunline.edsp.busi.ustran.trans.selltran.intf.Meraud.Input input) {
		long count = IcifMerchantDao.sel_count_cif_merchant_audit_info(input.getMercno(), false);
		String updata = "";
		if(count==1) {
			cif_merchant_audit merchantAudit = IcifMerchantDao.sel_cif_merchant_audit_info_status(input.getMercno(),false);
			if(CommUtil.isNotNull(merchantAudit)) {
				updata = merchantAudit.getUpdata();
			}
		}
		
		String cktime = DateTools.getCurrentTimeInfo();
		if(CommUtil.isNull(input.getShclas())) {
			IcifMerchantDao.up_cif_merchant_audit_info_status(input.getAtpest(), input.getMercno(), E_ATPEST.SHTG.getLongName(),cktime);
		}else {
			IcifMerchantDao.up_cif_merchant_audit_info_status(input.getAtpest(), input.getMercno(), input.getShclas().getLongName(),cktime);
		}
		
		if(CommUtil.equals(E_PROFES.JSXG.getValue(), input.getPmtype().getValue())) {
			Object object = JSONObject.parse(updata);
			Map<String,Object> map = (Map)object;
			cif_user_bind userBind = Cif_user_bindDao.selectFirst_odb6(input.getMercno(), false);
			userBind.setSequid(userBind.getSequid());
			userBind.setBankna(map.get("bankna").toString());
			userBind.setLnknbr(map.get("lnknbr").toString());
			userBind.setCardno(map.get("cardno").toString());
			userBind.setCustna(map.get("custna").toString());
			userBind.setTlphno(map.get("tlphno").toString());
			if(CommUtil.isNotNull(map.get("stflag").toString())) {
				if(CommUtil.equals("0", map.get("stflag").toString())) {
					userBind.setCopefg(E_COPEFG.DG);
				}else if(CommUtil.equals("1", map.get("stflag").toString())) {
					userBind.setCopefg(E_COPEFG.DS);
				}
			}
			try {
				userBind.setDesena(EncryptTool.maskName(map.get("custna").toString(), ApolloConfigBean.getInstance().getSecretKey()));
				userBind.setDescno(EncryptTool.maskBankCard(map.get("cardno").toString(), ApolloConfigBean.getInstance().getSecretKey()));
				userBind.setTmphno(EncryptTool.maskMobile(map.get("tlphno").toString(), ApolloConfigBean.getInstance().getSecretKey()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Cif_user_bindDao.updateOne_odb1(userBind);
		}else if(CommUtil.equals(E_PROFES.FLXG.getValue(), input.getPmtype().getValue())) {
			cif_merchant_base merchantBase = Cif_merchant_baseDao.selectOne_odb_index_mercno(input.getMercno(), false);
			merchantBase.setFedata(updata);
			Cif_merchant_baseDao.updateOne_odb_index_mercno(merchantBase);
		}
	}
	
	/**
	 * 
	 * @Author jiazimo
	 *         <p>
	 *         <li>2019年11月29日-下午2:50:36</li>
	 *         <li>功能说明：处理修改信息前处理</li>
	 *         </p>
	 * @param input
	 */
	private static void dealUpdateClobBeforeInfo(final cn.sunline.edsp.busi.ustran.trans.selltran.intf.Meraud.Input input) {
		if(CommUtil.isNotNull(input.getPmtype())) {
			if(CommUtil.equals(E_ATPEST.SHTG.getValue(), input.getAtpest().getValue())) {
				dealUpdateClobInfoSuccess(input);
			}else if(CommUtil.equals(E_ATPEST.WTG.getValue(), input.getAtpest().getValue())) {
				dealUpdateClobInfoFail(input);
			}
		}
	}
	
	
	/**
	 * 
	 * @Author jiazimo
	 *         <p>
	 *         <li>2019年11月29日-下午2:57:01</li>
	 *         <li>功能说明：审核失败处理</li>
	 *         </p>
	 * @param input
	 */
	private static void dealUpdateClobInfoFail(Input input) {
		String cktime = DateTools.getCurrentTimeInfo();
		if(CommUtil.isNull(input.getShclas())) {
			IcifMerchantDao.up_cif_merchant_audit_info_status(input.getAtpest(), input.getMercno(), E_ATPEST.SHTG.getLongName(),cktime);
		}else {
			IcifMerchantDao.up_cif_merchant_audit_info_status(input.getAtpest(), input.getMercno(), input.getShclas().getLongName(),cktime);
		}
	}
	
	
	/**
	 * 
	 * @Author jiazimo
	 *         <p>
	 *         <li>2019年11月29日-下午3:41:56</li>
	 *         <li>功能说明：商户审核通知校验</li>
	 *         </p>
	 * @param input
	 */
	private static void checkMerchantInfo(Input input) {
		
		if(CommUtil.isNull(input.getAtpest())) {
			throw MerchantError.SeArgs.E0001(CfDict.icif.atpest.getLongName());
		}
		
		if(CommUtil.isNull(input.getMercno())) {
			throw MerchantError.SeArgs.E0001(CfDict.icif.sellid.getLongName());
		}
		
		if(CommUtil.equals(E_ATPEST.SHTG.getValue(), input.getAtpest().getValue())) {
			if(CommUtil.isNull(input.getSellpe())) {
				throw MerchantError.SeArgs.E0001(CfDict.icif.sellpe.getLongName());
			}
		}
	}

	/**
	 * 商户审核结果
	 * @param input
	 * @param property
	 * @param output
	 */
	public static void meraud( final cn.sunline.edsp.busi.ustran.trans.selltran.intf.Meraud.Input input,  final cn.sunline.edsp.busi.ustran.trans.selltran.intf.Meraud.Property property,  final cn.sunline.edsp.busi.ustran.trans.selltran.intf.Meraud.Output output){
		
		checkMerchantInfo(input);
		
		dealUpdateClobBeforeInfo(input);
		
		if(input.getAtpest() == E_ATPEST.WTG) {
//			IcifMerchantDao.up_cif_merchant_base(input.getAtpest(), input.getMercno());
			
			cif_merchant_base merchantBase = Cif_merchant_baseDao.selectOne_odb_index_mercno(input.getMercno(), false);
			if(CommUtil.isNotNull(merchantBase)) {
				merchantBase.setAtpest(input.getAtpest());
				merchantBase.setAudire(input.getShclas().getLongName());
				merchantBase.setCktime(DateTools.getCurrentTimeInfo());
				Cif_merchant_baseDao.updateOne_odb_index_mercno(merchantBase);
			}
			
			dealMerchantAuditInfo(input);
			
		} else {
			cif_merchant_base base = Cif_merchant_baseDao.selectOne_odb_index_mercno(input.getMercno(), true);
			base.setShywlx(input.getShywlx());
			base.setShfklx(input.getShfklx());
			base.setShclas(input.getShclas());
			base.setLjsxue(input.getLjsxue());
			base.setTmbzxx(input.getTmbzxx());
			base.setAudire(input.getAudire());
			base.setSqktzt(input.getSqktzt());
			base.setShbaoz(input.getShbaoz());
			base.setAtpest(input.getAtpest());
			base.setSellpe(input.getSellpe());
			base.setData_update_time(DateTools.getCurrentDateTime());
			base.setCktime(DateTools.getCurrentTimeInfo());
			Cif_merchant_baseDao.updateOne_odb_index_mercno(base);
			
			cif_user_base userBase = Cif_user_baseDao.selectOne_odb1(base.getUserid(), false);
			if(CommUtil.isNotNull(userBase)) {
				userBase.setUserle(E_USERLE.HX);
				Cif_user_baseDao.updateOne_odb1(userBase);
			}
			
			dealMerchantAuditInfo(input);
			
			cif_merchant_base basea = Cif_merchant_baseDao.selectOne_odb_index_mercno(input.getMercno(), true);
			String jsona = basea.getFedata();//费率信息
			
			
			List<Ratelist> rateList = JSON.parseArray(jsona, Ratelist.class);
	
			Options<IoSellComplexType.RateLists> options = SysUtil.getInstance(Options.class);
			RateLists rateInfo = null;
			for(int i=0;i<rateList.size();i++) {
				rateInfo = SysUtil.getInstance(RateLists.class);
				CommUtil.copyProperties(rateInfo, rateList.get(i));
				options.add(rateInfo);
			}
			output.setRatelist(options);
			
			
			cif_merc_agent mercAgent = Cif_merc_agentDao.selectOne_odb1(input.getMercno(), false);
			cif_agent_base agentBase = Cif_agent_baseDao.selectOne_odb1(mercAgent.getAgntno(), false);
			cif_merchant_base agent_base = Cif_merchant_baseDao.selectOne_odb_index_mercno(input.getMercno(), true);
			cif_user_base  user_base = Cif_user_baseDao.selectOne_odb1(agent_base.getUserid(), true);
			cif_user_bind  bind = IcifMerchantDao.sel_icif_merchant_user_bind_info(input.getMercno(), E_SFSOXU.YES, true);
			QueryUserBindList BindList = SysUtil.getInstance(QueryUserBindList.class);
			BindList.setCdopac(bind.getCardno());
			BindList.setOpbrch(bind.getLnknbr());
			BindList.setCdopna(bind.getCustna());
			BindList.setBrchna(bind.getBankna());
			BindList.setCardtp(bind.getActype());
			BindList.setBdcart(E_IDCKRT.S);
			BindList.setCopefg(bind.getCopefg());
			BindList.setIdtfna(user_base.getCustna());
			BindList.setIdtftp(user_base.getIdtftp());
			BindList.setIdtfno(user_base.getIdtfno());
			BindList.setBankph(bind.getTlphno());
			BindList.setIsdflt(bind.getChoose());
			BindList.setAcbdtp(E_ACBDTP.ZZH);
			output.setLstBindcaInfo(BindList);
			output.setAcctid(input.getMercno());
			output.setAgname(agent_base.getSellna());
			output.setBradna(agent_base.getSbrand());
			output.setCentid(mercAgent.getAgntno());
			output.setCentna(agentBase.getAgntna());
			output.setCustid(agent_base.getUserid());
			output.setCustna(user_base.getCustna());
			output.setIdckrt(E_IDCKRT.S);
			output.setIdtfno(user_base.getIdtfno());
			output.setIdtftp(user_base.getIdtftp());
			output.setMactid(agent_base.getUserid());
			output.setMpckrt(E_MPCKRT.CG);
			output.setMrchno(input.getMercno());
			output.setOrgncd(agent_base.getOrgncd());
			output.setPhonno(agent_base.getTlphno());
			output.setTempno(agent_base.getRatemp());
			output.setUschnl(agent_base.getSource());
			output.setUsertp(E_USERTP.SH);
			output.setBrchno(RunEnvTools.getTranbr());
			output.setAcctna(agent_base.getSellna());
			
			
		}
		
		
		
		/*cif_merchant_base merchantBase = Cif_merchant_baseDao.selectOne_odb3(input.getSellid(), false);
		
		cif_user_idtf userIdtf = Cif_user_idtfDao.selectOne_odb2(merchantBase.getUserid(), false);
		
		cif_user_puss userPuss = Cif_user_pussDao.selectOne_odb1(merchantBase.getUserid(), false);
		
		cif_agent_base agentBase = Cif_agent_baseDao.selectOne_odb1(merchantBase.getAgntid(), false); 
		
		if(CommUtil.equals(E_ATPEST.SHTG.getValue(), input.getAtpest().getValue())) {
			output.setCustid(merchantBase.getUserid());//用户ID
			output.setCustna(userIdtf.getCustna());//客户姓名
			output.setIdtftp(E_IDTFTP.JMSFZ);//证件类型
			output.setIdtfno(userIdtf.getIdtfno());//证件号码
			output.setPhonno(userPuss.getPhonno());//手机号码
			output.setIdckrt(E_IDCKRT.S);//身份核查结果
			output.setMpckrt(E_MPCKRT.CG);//人脸 持证找照审核结果
			output.setChanid(userPuss.getSourch());//来源渠道
			output.setMactid(merchantBase.getUserid());//电子主账户开户标�
			output.setJfcutp(E_JFCUTP.SH);//客户类型
			output.setPsedid(merchantBase.getBranid());//POS品牌ID
			output.setPsedna(merchantBase.getBrandm());//品牌名称
			output.setAgntid(merchantBase.getSellid());//内部商户�
			output.setAcctid(merchantBase.getSellid());//子账户开户标�
			output.setAgname(merchantBase.getSellna());//商户名称
			output.setCentid(merchantBase.getAgntid());//上级服务商ID
			output.setCentna(agentBase.getAgntna());//上级服务商名�
			output.setTempno("");//模板编号
			output.setShfrlx(E_SLFETP.SLGS);//商户分润类型
			
			Options<QueryUserBindList> options = SysUtil.getInstance(Options.class);
			List<QueryUserBindList> list = IcifMerchantDao.sel_icif_merchant_user_bind_info(input.getSellid(), false);
			QueryUserBindList queryUserBind = null;
			for(int i=0;i<list.size();i++){
				queryUserBind = SysUtil.getInstance(QueryUserBindList.class);
				CommUtil.copyProperties(queryUserBind, list.get(i));
				queryUserBind.setBdcart(E_IDCKRT.S);
				queryUserBind.setBdcatp(E_BDCATP.QGNZH);
				queryUserBind.setIsdflt(E_ISORNO.Y);
				queryUserBind.setAcctid(input.getSellid());
				//主账�子账�
				options.add(queryUserBind);
			}
			output.setLstBindcaInfo(options);
			
			String json = merchantBase.getFeedata();//费率信息
			JsonRootBean rateList = JsonUtil.convertJson2Bean(json, JsonRootBean.class);
			List<Ratelist> rateLists = rateList.getRatelist();
			Options<IoSellComplexType.RateList> option = SysUtil.getInstance(Options.class);
			RateList rateInfo = null;
			for(int i=0;i<rateLists.size();i++) {
				rateInfo = SysUtil.getInstance(RateList.class);
				CommUtil.copyProperties(rateInfo, rateLists.get(i));
				option.add(rateInfo);
			}
			output.setRatelist(option);
			
			
		}*/
	}
	
		
}

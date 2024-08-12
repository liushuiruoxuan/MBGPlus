package com.generator.mbgplus.service.impl;

import com.generator.mbgplus.entity.po.TenementDevice;
import com.generator.mbgplus.mapper.TenementDeviceMapper;
import com.generator.mbgplus.service.ITenementDeviceService;
import com.kun.common.database.service.impl.BaseServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
* @author chai
* @since 2024-08-12 14:55:07
*/
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class TenementDeviceServiceImpl extends BaseServiceImpl<TenementDeviceMapper, TenementDevice> implements ITenementDeviceService {


}


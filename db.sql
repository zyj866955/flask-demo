CREATE TABLE `user_basic` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(20) COMMENT '账号',
  `email` varchar(20) COMMENT '邮箱',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，是否可用，0-不可用，1-可用',
  `mobile` char(11) NOT NULL COMMENT '手机号',
  `password` varchar(93) NULL COMMENT '密码',
  `user_name` varchar(32) NOT NULL COMMENT '昵称',
  `profile_photo` varchar(128) NULL COMMENT '头像',
  `last_login` datetime NULL COMMENT '最后登录时间',
  `is_media` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是自媒体，0-不是，1-是',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否实名认证，0-不是，1-是',
  `introduction` varchar(50) NULL COMMENT '简介',
  `certificate` varchar(30) NULL COMMENT '认证',
  `article_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发文章数',
  `following_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关注的人数',
  `fans_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '被关注的人数',
  `like_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '累计点赞人数',
  `read_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '累计阅读人数',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

CREATE TABLE `user_profile` (
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别，0-男，1-女',
  `birthday` date NULL COMMENT '生日',
  `real_name` varchar(32) NULL COMMENT '真实姓名',
  `id_number` varchar(20) NULL COMMENT '身份证号',
  `id_card_front` varchar(128) NULL COMMENT '身份证正面',
  `id_card_back` varchar(128) NULL COMMENT '身份证背面',
  `id_card_handheld` varchar(128) NULL COMMENT '手持身份证',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `register_media_time` datetime NULL COMMENT '注册自媒体时间',
  `area` varchar(20) COMMENT '地区',
  `company` varchar(20) COMMENT '公司',
  `career` varchar(20) COMMENT '职业',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户资料表';

CREATE TABLE `user_relation` (
  `relation_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `target_user_id` bigint(20) unsigned NOT NULL COMMENT '目标用户ID',
  `relation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关系，0-取消，1-关注，2-拉黑',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`relation_id`),
  UNIQUE KEY `user_target` (`user_id`, `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关系表';

INSERT INTO toutiao.user_profile (user_id, gender, birthday, real_name, id_number, id_card_front, id_card_back, id_card_handheld, create_time, update_time, register_media_time, area, company, career) VALUES (1, 0, null, 'zhouyajun', null, null, null, null, '2019-11-25 14:18:59', '2019-11-25 14:18:59', null, null, null, null);
INSERT INTO toutiao.user_profile (user_id, gender, birthday, real_name, id_number, id_card_front, id_card_back, id_card_handheld, create_time, update_time, register_media_time, area, company, career) VALUES (2, 1, null, 'jinwenjun', null, null, null, null, '2019-11-25 14:19:33', '2019-11-25 14:19:33', null, null, null, null);

INSERT INTO toutiao.user_basic (user_id, account, email, status, mobile, password, user_name, profile_photo, last_login, is_media, is_verified, introduction, certificate, article_count, following_count, fans_count, like_count, read_count) VALUES (1, null, null, 1, '13612345678', null, 'itcast', null, null, 0, 0, null, null, 0, 0, 0, 0, 0);
INSERT INTO toutiao.user_basic (user_id, account, email, status, mobile, password, user_name, profile_photo, last_login, is_media, is_verified, introduction, certificate, article_count, following_count, fans_count, like_count, read_count) VALUES (2, null, null, 1, '13912341233', null, '张三', null, null, 0, 0, null, null, 0, 0, 0, 0, 0);
INSERT INTO toutiao.user_basic (user_id, account, email, status, mobile, password, user_name, profile_photo, last_login, is_media, is_verified, introduction, certificate, article_count, following_count, fans_count, like_count, read_count) VALUES (4, null, null, 1, '18872554923', null, 'itcast张三', null, null, 0, 0, null, null, 0, 0, 0, 0, 0);
INSERT INTO toutiao.user_basic (user_id, account, email, status, mobile, password, user_name, profile_photo, last_login, is_media, is_verified, introduction, certificate, article_count, following_count, fans_count, like_count, read_count) VALUES (5, null, null, 1, '16672554923', null, 'itcast张三张三', null, null, 0, 0, null, null, 0, 0, 0, 0, 0);


INSERT INTO toutiao.user_relation (relation_id, user_id, target_user_id, relation, create_time, update_time) VALUES (1, 1, 2, 1, '2019-11-25 14:04:14', '2019-11-25 14:04:14');
INSERT INTO toutiao.user_relation (relation_id, user_id, target_user_id, relation, create_time, update_time) VALUES (2, 1, 4, 1, '2019-11-25 14:04:51', '2019-11-25 14:04:51');
INSERT INTO toutiao.user_relation (relation_id, user_id, target_user_id, relation, create_time, update_time) VALUES (3, 1, 5, 1, '2019-11-25 14:05:22', '2019-11-25 14:05:22');
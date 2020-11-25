DROP DATABASE IF EXISTS e_commerce;
CREATE DATABASE `e_commerce` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE e_commerce;
DROP TABLE IF EXISTS product;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒ����',
  `category_id` int(11) NOT NULL COMMENT '��Ʒ������',
  `mer_id` int(11) NOT NULL COMMENT '�̼ұ��',
  `freight_id` int(11) DEFAULT NULL,
  `type_id` tinyint(4) NOT NULL COMMENT '���ͱ��',
  `sketch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����',
  `intro` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒ����',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��Ʒ�ؼ���',
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��ǩ',
  `marque` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒ�ͺ�',
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ֿ�����',
  `brand_id` int(11) NOT NULL COMMENT 'Ʒ�Ʊ��',
  `virtual` int(11) NOT NULL DEFAULT '0' COMMENT '���⹺����',
  `price` decimal(8,2) NOT NULL COMMENT '��Ʒ�۸�',
  `market_price` decimal(8,2) NOT NULL COMMENT '�г��۸�',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '��ʹ�û��ֵ���',
  `stock` int(11) NOT NULL COMMENT '�����',
  `warning_stock` int(11) NOT NULL COMMENT '��澯��',
  `picture_url` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '����ͼ',
  `posters` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '״̬ -1=>�¼�,1=>�ϼ�,2=>Ԥ��,0=>δ�ϼ�',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '���״̬ -1 ���ʧ�� 0 δ��� 1 ��˳ɹ�',
  `is_package` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '�Ƿ����ײ�',
  `is_integral` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '�Ƿ��ǻ��ֲ�Ʒ',
  `sort` int(11) NOT NULL DEFAULT '99' COMMENT '����',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `system_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL COMMENT '��Ʒ�����',
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��������',
  `sort` int(11) NOT NULL DEFAULT '999' COMMENT '���д���',
  PRIMARY KEY (`id`),
  KEY `product_attribute_category_id_name_index` (`category_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_attribute_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ѡ������',
  `attr_id` int(11) NOT NULL COMMENT '���Ա���',
  `sort` int(11) NOT NULL DEFAULT '999' COMMENT '����',
  PRIMARY KEY (`id`),
  KEY `product_attribute_option_name_attr_id_index` (`name`,`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_attribute_and_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) NOT NULL COMMENT 'sku����',
  `option_id` int(11) NOT NULL DEFAULT '0' COMMENT '����ѡ�����',
  `attribute_id` int(11) NOT NULL COMMENT '���Ա���',
  `sort` int(11) NOT NULL DEFAULT '999' COMMENT '����',
  `supplier_option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_and_option_sku_id_option_id_attribute_id_index` (`sku_id`,`option_id`,`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '��Ʒ����',
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'sku����',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��ͼ',
  `price` decimal(8,2) NOT NULL COMMENT '�۸�',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '���',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��Ʒ����',
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��Ʒ������',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku��',
  PRIMARY KEY (`id`),
  KEY `product_sku_name_product_id_index` (`name`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '��Ʒ����',
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�������',
  `sort` int(11) NOT NULL DEFAULT '999' COMMENT '����',
  PRIMARY KEY (`id`),
  KEY `product_supplier_attribute_name_product_id_index` (`name`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '��Ʒ���',
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒ����',
  `url` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ͼƬ��ַ',
  `size` int(11) DEFAULT NULL COMMENT '��Ƶ��С',
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ͼƬ����',
  `sort` int(11) NOT NULL DEFAULT '999' COMMENT '����',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ͼƬ״̬',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��Դ���� 0=>ͼƬ 1=>��Ƶ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL COMMENT '��Ʒ�����',
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ʒ������',
  `image_url` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ͼƬurl',
  `sort` int(11) NOT NULL DEFAULT '999' COMMENT '���д���',
  `status` tinyint(4) NOT NULL COMMENT '״̬',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_brand_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�����',
  `pid` int(11) NOT NULL COMMENT '��������',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����ͼ',
  `index_block_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��ҳ�鼶״̬ 1=>��ʾ',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=>����',
  `sort` int(11) NOT NULL DEFAULT '999' COMMENT '����',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�������',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '���׺�',
  `member_id` int(11) NOT NULL COMMENT '�ͻ����',
  `supplier_id` int(11) DEFAULT '0' COMMENT '�̻�����',
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�̻�����',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬ 0δ����,1�Ѹ���,2�ѷ���,3��ǩ��,-1�˻�����,-2�˻���,-3���˻�,-4ȡ������ -5��������',
  `after_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�û��ۺ�״̬ 0 δ�����ۺ� 1 �����ۺ� -1 �ۺ���ȡ�� 2 ������ 200 �������',
  `product_count` int(11) NOT NULL DEFAULT '0' COMMENT '��Ʒ����',
  `product_amount_total` decimal(12,4) NOT NULL COMMENT '��Ʒ�ܼ�',
  `order_amount_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'ʵ�ʸ�����',
  `logistics_fee` decimal(12,4) NOT NULL COMMENT '�˷ѽ��',
  `address_id` int(11) NOT NULL COMMENT '�ջ���ַ����',
  `pay_channel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '֧������ 0��� 1΢�� 2֧����',
  `out_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����֧������',
  `escrow_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '������֧����ˮ��',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `delivery_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `order_settlement_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��������״̬ 0δ���� 1�ѽ���',
  `order_settlement_time` int(11) NOT NULL DEFAULT '0' COMMENT '��������ʱ��',
  `is_package` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '�Ƿ����ײ�',
  `is_integral` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '�Ƿ��ǻ��ֲ�Ʒ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_sn_member_id_order_status_out_trade_no_index` (`order_sn`,`member_id`,`order_status`,`out_trade_no`(191))
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '��������',
  `product_id` int(11) NOT NULL COMMENT '��Ʒ����',
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒ����',
  `product_price` decimal(12,4) NOT NULL COMMENT '��Ʒ�۸�',
  `product_sku` int(11) NOT NULL COMMENT '��ƷSKU',
  `product_picture_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_mode_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒ�ͺ���Ϣ',
  `product_mode_params` int(11) DEFAULT NULL COMMENT '��Ʒ�ͺŲ���',
  `discount_rate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�ۿ۱���',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '�ۿ۱���',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '��������',
  `subtotal` decimal(12,4) NOT NULL COMMENT 'С�ƽ��',
  `is_product_exists` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '��Ʒ�Ƿ���Ч 1ʧЧ',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '�ͻ���Ʒ��ע',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_detail_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_logistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '��������',
  `express_no` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '������ݵ���',
  `consignee_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ջ�������',
  `consignee_telphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��ϵ�绰',
  `consignee_telphone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '������ϵ�绰',
  `consignee_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ջ���ַ',
  `consignee_zip` int(11) NOT NULL COMMENT '��������',
  `logistics_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '������ʽ',
  `logistics_fee` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '���������˷�',
  `order_logistics_status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬',
  `logistics_settlement_status` int(11) NOT NULL DEFAULT '0' COMMENT '��������״̬',
  `logistics_result_last` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�������״̬����',
  `logistics_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��������',
  `logistics_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `logistics_update_time` int(11) NOT NULL DEFAULT '0' COMMENT '��������ʱ��',
  `logistics_settlement_time` int(11) NOT NULL DEFAULT '0' COMMENT '��������ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `returns_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�˻���� ���ͻ���ѯ',
  `order_id` int(11) NOT NULL COMMENT '�������',
  `express_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��������',
  `consignee_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ջ�������',
  `consignee_telphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��ϵ�绰',
  `consignee_telphone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '������ϵ�绰',
  `consignee_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ջ���ַ',
  `consignee_zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��������',
  `logistics_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '������ʽ',
  `logistics_fee` decimal(12,2) NOT NULL COMMENT '���������˷�',
  `order_logistics_status` int(11) DEFAULT NULL COMMENT '����״̬',
  `logistics_settlement_status` int(11) DEFAULT NULL COMMENT '��������״̬',
  `logistics_result_last` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�������״̬����',
  `logistics_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��������',
  `logistics_create_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `logistics_update_time` int(11) DEFAULT NULL COMMENT '��������ʱ��',
  `logistics_settlement_time` int(11) DEFAULT NULL COMMENT '��������ʱ��',
  `returns_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ȫ���˵� 1�����˵�',
  `handling_way` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PUPAWAY:�˻����;REDELIVERY:���·���;RECLAIM-REDELIVERY:��Ҫ��黹�����·���; REFUND:�˿�; COMPENSATION:���˻����⳥',
  `returns_amount` decimal(8,2) NOT NULL COMMENT '�˿���',
  `return_submit_time` int(11) NOT NULL COMMENT '�˻�����ʱ��',
  `handling_time` int(11) NOT NULL COMMENT '�˻�����ʱ��',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�˻�ԭ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_returns_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��������',
  `order_detail_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�Ӷ�������',
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ۺ󵥺�',
  `member_id` int(11) NOT NULL COMMENT '�û�����',
  `state` tinyint(4) NOT NULL COMMENT '���� 0 ���˿� 1�˻��˿�',
  `product_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬ 0:���յ��� 1:δ�յ���',
  `why` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�˻���ԭ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '���״̬ -1 �ܾ� 0 δ��� 1���ͨ��',
  `audit_time` int(11) NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  `audit_why` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '���ԭ��',
  `note` text COLLATE utf8mb4_unicode_ci COMMENT '��ע',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- �û�
CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tel` bigint(20) DEFAULT NULL COMMENT '�ֻ�����',
  `password` varchar(555) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��¼����',
  `wx_token` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '΢��TOKEN',
  `im_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�û�����token',
  `open_id` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','-1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '�˺�״̬',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_tel_unique` (`tel`),
  UNIQUE KEY `member_wx_token_unique` (`wx_token`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '�û����',
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ջ�������',
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ֻ�����',
  `prov` int(11) DEFAULT NULL COMMENT 'ʡ',
  `city` int(11) NOT NULL COMMENT '��',
  `area` int(11) DEFAULT NULL COMMENT '��',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '�ֵ���ַ',
  `number` int(11) NOT NULL COMMENT '��������',
  `default` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Ĭ���ջ���ַ 1=>Ĭ��',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `member_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '�û�����',
  `card_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ֿ�������',
  `card_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '���п���',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_card_card_number_unique` (`card_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `member_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '�û�����',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_cart_member_id_unique` (`member_id`),
  KEY `member_cart_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `member_cart_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL COMMENT '���ﳵ����',
  `product_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒsku��Ϣ',
  `product_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒ����',
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��Ʒ����',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '�۸�',
  `product_id` int(11) NOT NULL COMMENT '��Ʒ����',
  `supplier_id` int(11) NOT NULL COMMENT '���̱���',
  `sku_id` int(11) NOT NULL COMMENT '��Ʒsku����',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '��Ʒ����',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_cart_item_cart_id_product_id_supplier_id_index` (`cart_id`,`product_id`,`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `member_query_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '�û�����',
  `keyword` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ؼ���',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ����
CREATE TABLE `transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '���׵���',
  `member_id` bigint(20) NOT NULL COMMENT '���׵��û�ID',
  `amount` decimal(8,2) NOT NULL COMMENT '���׽��',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT 'ʹ�õĻ���',
  `pay_state` tinyint(4) NOT NULL COMMENT '֧������ 0:��� 1:΢�� 2:֧���� 3:xxx',
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '֧����Դ wx app web wap',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '֧��״̬ -1��ȡ�� 0 δ��� 1����� -2:�쳣',
  `completion_time` int(11) NOT NULL COMMENT '�������ʱ��',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��ע',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_order_sn_member_id_pay_state_source_status_index` (`order_sn`(191),`member_id`,`pay_state`,`source`(191),`status`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `transaction_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `events` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�¼�����',
  `result` text COLLATE utf8mb4_unicode_ci COMMENT '�������',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�������',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '���׺�',
  `member_id` int(11) NOT NULL COMMENT '�ͻ����',
  `supplier_id` int(11) NOT NULL COMMENT '�̻�����',
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�̻�����',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬ 0δ����,1�Ѹ���,2�ѷ���,3��ǩ��,-1�˻�����,-2�˻���,-3���˻�,-4ȡ������',
  `after_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�û��ۺ�״̬ 0 δ�����ۺ� 1 �����ۺ� -1 �ۺ���ȡ�� 2 ������ 200 �������',
  `product_count` int(11) NOT NULL DEFAULT '0' COMMENT '��Ʒ����',
  `product_amount_total` decimal(12,4) NOT NULL COMMENT '��Ʒ�ܼ�',
  `order_amount_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'ʵ�ʸ�����',
  `logistics_fee` decimal(12,4) NOT NULL COMMENT '�˷ѽ��',
  `address_id` int(11) NOT NULL COMMENT '�ջ���ַ����',
  `pay_channel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '֧������ 0��� 1΢�� 2֧����',
  `out_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����֧������',
  `escrow_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '������֧����ˮ��',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `delivery_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `order_settlement_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��������״̬ 0δ���� 1�ѽ���',
  `order_settlement_time` int(11) NOT NULL DEFAULT '0' COMMENT '��������ʱ��',
  `is_package` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '�Ƿ����ײ�',
  `is_integral` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '�Ƿ��ǻ��ֲ�Ʒ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_order_sn_unique` (`order_sn`),
  KEY `order_order_sn_member_id_order_status_out_trade_no_index` (`order_sn`,`member_id`,`order_status`,`out_trade_no`(191))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_returns_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��������',
  `order_detail_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�Ӷ�������',
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ۺ󵥺�',
  `member_id` int(11) NOT NULL COMMENT '�û�����',
  `state` tinyint(4) NOT NULL COMMENT '���� 0 ���˿� 1�˻��˿�',
  `product_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬ 0:���յ��� 1:δ�յ���',
  `why` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�˻���ԭ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '���״̬ -1 �ܾ� 0 δ��� 1���ͨ��',
  `audit_time` int(11) NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  `audit_why` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '���ԭ��',
  `note` text COLLATE utf8mb4_unicode_ci COMMENT '��ע',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `returns_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�˻���� ���ͻ���ѯ',
  `order_id` int(11) NOT NULL COMMENT '�������',
  `express_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��������',
  `consignee_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ջ�������',
  `consignee_telphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��ϵ�绰',
  `consignee_telphone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '������ϵ�绰',
  `consignee_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�ջ���ַ',
  `consignee_zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��������',
  `logistics_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '������ʽ',
  `logistics_fee` decimal(12,2) NOT NULL COMMENT '���������˷�',
  `order_logistics_status` int(11) DEFAULT NULL COMMENT '����״̬',
  `logistics_settlement_status` int(11) DEFAULT NULL COMMENT '��������״̬',
  `logistics_result_last` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�������״̬����',
  `logistics_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��������',
  `logistics_create_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `logistics_update_time` int(11) DEFAULT NULL COMMENT '��������ʱ��',
  `logistics_settlement_time` int(11) DEFAULT NULL COMMENT '��������ʱ��',
  `returns_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ȫ���˵� 1�����˵�',
  `handling_way` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PUPAWAY:�˻����;REDELIVERY:���·���;RECLAIM-REDELIVERY:��Ҫ��黹�����·���; REFUND:�˿�; COMPENSATION:���˻����⳥',
  `returns_amount` decimal(8,2) NOT NULL COMMENT '�˿���',
  `return_submit_time` int(11) NOT NULL COMMENT '�˻�����ʱ��',
  `handling_time` int(11) NOT NULL COMMENT '�˻�����ʱ��',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�˻�ԭ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_appraise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '��������',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '��������',
  `level` enum('-1','0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '���� -1���� 0���� 1����',
  `desc_star` tinyint(4) NOT NULL COMMENT '������� 1-5',
  `logistics_star` tinyint(4) NOT NULL COMMENT '�������� 1-5',
  `attitude_star` tinyint(4) NOT NULL COMMENT '����̬�� 1-5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_appraise_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
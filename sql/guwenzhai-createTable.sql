DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS collection;
DROP TABLE IF EXISTS press;
DROP TABLE IF EXISTS poetry;
DROP TABLE IF EXISTS auther;
DROP TABLE IF EXISTS dynasty;
DROP TABLE IF EXISTS account;

CREATE TABLE account (
	acn_rid int primary key auto_increment comment '账户ID', 
	acn_eml varchar(50) comment '登录邮箱',
	acn_head varchar(255) comment '用户头像',
	acn_pwd varchar(20) comment '账户密码',
	acn_perm varchar(10) default 'user:cus' comment '用户权限'
) COMMENT '账户表';
INSERT INTO account VALUES (NULL, 'administrator@163.com', NULL, '123456', 'user:adm');

CREATE TABLE dynasty (
	dny_rid int primary key auto_increment comment '朝代ID',
	dny_cot varchar(10) comment '朝代'
) COMMENT '朝代表';

CREATE TABLE auther (
	atr_rid int primary key auto_increment comment '作者ID',
	atr_nam varchar(10) comment '作者姓名',
	atr_dny int comment '朝代ID',
	atr_btd text comment '生卒年月',
	atr_inf text comment '详细信息',
	foreign key (atr_dny) references dynasty(dny_rid)
) COMMENT '作者表';

CREATE TABLE poetry (
	pty_rid int primary key auto_increment comment '诗词ID',
	pty_atr int comment '作者ID',
	pty_ttl varchar(50) comment '诗词题目',
	pty_cot text comment '诗词内容',
	pty_tst text comment '诗词翻译',
	pty_apt text comment '诗词鉴赏',
	pty_not text comment '诗词注释',
	pty_fam text comment '名句',
	pty_rec int comment '喜欢数',
	pty_smt bit comment '资源状态', -- 0表示未审核，1表示审核通过，审核不通过删除记录
	foreign key (pty_atr) references auther(atr_rid)
) COMMENT '诗词表';

CREATE TABLE press (
	prs_rid int primary key auto_increment comment '评论ID',
	prs_pty int comment '所属诗词ID',
	prs_acn int comment '发布人ID',
	prs_cot text comment '评论内容',
	prs_smt bit comment '评论状态', -- 0表示未审核，1表示审核通过，审核不通过删除记录
	foreign key (prs_pty) references poetry(pty_rid),
	foreign key (prs_acn) references account(acn_rid)
) COMMENT '评论表';

CREATE TABLE collection (
	cln_rid int primary key auto_increment comment '收藏ID',
	cln_pty int comment '收藏诗词ID',
	cln_acn int comment '收藏人ID',
	foreign key (cln_pty) references poetry(pty_rid),
	foreign key (cln_acn) references account(acn_rid)
) COMMENT '收藏表';

CREATE TABLE feedback (
	fbk_rid int primary key auto_increment comment '反馈ID',
	fbk_pty int comment '反馈诗词ID',
	fbk_acn int comment '反馈人ID',
	fbk_cot text comment '反馈内容',
	foreign key (fbk_pty) references poetry(pty_rid),
	foreign key (fbk_acn) references account(acn_rid)
) COMMENT '纠错反馈表';
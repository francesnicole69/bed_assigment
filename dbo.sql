
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[chat]') AND type IN ('U'))
	DROP TABLE [dbo].[chat]
GO

CREATE TABLE [dbo].[chat] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [adminid] bigint  NULL,
  [ask] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [reply] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [isreply] int  NULL,
  [userid] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[chat] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'chat',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'chat',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'管理员id',
'SCHEMA', N'dbo',
'TABLE', N'chat',
'COLUMN', N'adminid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提问内容',
'SCHEMA', N'dbo',
'TABLE', N'chat',
'COLUMN', N'ask'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回复内容',
'SCHEMA', N'dbo',
'TABLE', N'chat',
'COLUMN', N'reply'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否回复',
'SCHEMA', N'dbo',
'TABLE', N'chat',
'COLUMN', N'isreply'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户id',
'SCHEMA', N'dbo',
'TABLE', N'chat',
'COLUMN', N'userid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'ai问答',
'SCHEMA', N'dbo',
'TABLE', N'chat'
GO


-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'1', N'2025-07-09 10:33:52', N'1', N'提问内容1', N'回复内容1', N'1', N'1')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'2', N'2025-07-09 10:33:52', N'2', N'提问内容2', N'回复内容2', N'2', N'2')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'3', N'2025-07-09 10:33:52', N'3', N'提问内容3', N'回复内容3', N'3', N'3')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'4', N'2025-07-09 10:33:52', N'4', N'提问内容4', N'回复内容4', N'4', N'4')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'5', N'2025-07-09 10:33:52', N'5', N'提问内容5', N'回复内容5', N'5', N'5')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'6', N'2025-07-09 10:33:52', N'6', N'提问内容6', N'回复内容6', N'6', N'6')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'7', N'2025-07-09 10:33:52', N'7', N'提问内容7', N'回复内容7', N'7', N'7')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'8', N'2025-07-09 10:33:52', N'8', N'提问内容8', N'回复内容8', N'8', N'8')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'9', N'2025-07-09 10:33:52', N'9', N'提问内容9', N'回复内容9', N'9', N'9')
GO

INSERT INTO [dbo].[chat] ([id], [addtime], [adminid], [ask], [reply], [isreply], [userid]) VALUES (N'10', N'2025-07-09 10:33:52', N'10', N'提问内容10', N'回复内容10', N'10', N'10')
GO


-- ----------------------------
-- Table structure for chathelper
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[chathelper]') AND type IN ('U'))
	DROP TABLE [dbo].[chathelper]
GO

CREATE TABLE [dbo].[chathelper] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [ask] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [reply] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[chathelper] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'chathelper',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'chathelper',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提问内容',
'SCHEMA', N'dbo',
'TABLE', N'chathelper',
'COLUMN', N'ask'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回复内容',
'SCHEMA', N'dbo',
'TABLE', N'chathelper',
'COLUMN', N'reply'
GO

EXEC sp_addextendedproperty
'MS_Description', N'聊天助手',
'SCHEMA', N'dbo',
'TABLE', N'chathelper'
GO


-- ----------------------------
-- Records of chathelper
-- ----------------------------
INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'1', N'2025-07-09 10:33:52', N'提问内容1', N'回复内容1')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'2', N'2025-07-09 10:33:52', N'提问内容2', N'回复内容2')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'3', N'2025-07-09 10:33:52', N'提问内容3', N'回复内容3')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'4', N'2025-07-09 10:33:52', N'提问内容4', N'回复内容4')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'5', N'2025-07-09 10:33:52', N'提问内容5', N'回复内容5')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'6', N'2025-07-09 10:33:52', N'提问内容6', N'回复内容6')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'7', N'2025-07-09 10:33:52', N'提问内容7', N'回复内容7')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'8', N'2025-07-09 10:33:52', N'提问内容8', N'回复内容8')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'9', N'2025-07-09 10:33:52', N'提问内容9', N'回复内容9')
GO

INSERT INTO [dbo].[chathelper] ([id], [addtime], [ask], [reply]) VALUES (N'10', N'2025-07-09 10:33:52', N'提问内容10', N'回复内容10')
GO


-- ----------------------------
-- Table structure for config
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[config]') AND type IN ('U'))
	DROP TABLE [dbo].[config]
GO

CREATE TABLE [dbo].[config] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [value] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[config] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'config',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'config',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'config',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'值',
'SCHEMA', N'dbo',
'TABLE', N'config',
'COLUMN', N'value'
GO

EXEC sp_addextendedproperty
'MS_Description', N'轮播图',
'SCHEMA', N'dbo',
'TABLE', N'config'
GO


-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO [dbo].[config] ([id], [addtime], [name], [value]) VALUES (N'1', N'2025-07-09 10:33:52', N'swiper1', N'file/swiperPicture1.jpg')
GO

INSERT INTO [dbo].[config] ([id], [addtime], [name], [value]) VALUES (N'2', N'2025-07-09 10:33:52', N'swiper2', N'file/swiperPicture2.jpg')
GO

INSERT INTO [dbo].[config] ([id], [addtime], [name], [value]) VALUES (N'3', N'2025-07-09 10:33:52', N'swiper3', N'file/swiperPicture3.jpg')
GO


-- ----------------------------
-- Table structure for jiankangshuju
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[jiankangshuju]') AND type IN ('U'))
	DROP TABLE [dbo].[jiankangshuju]
GO

CREATE TABLE [dbo].[jiankangshuju] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [yonghuzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yonghuxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [xingbie] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [nianling] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tizhong] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [xueya] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [xuetang] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [xinlv] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [xuezhi] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [shuimianshijian] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [zongdanguchun] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [xueyang] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [dengjishijian] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[jiankangshuju] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'yonghuzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'yonghuxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'xingbie'
GO

EXEC sp_addextendedproperty
'MS_Description', N'年龄',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'nianling'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体重（kg）',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'tizhong'
GO

EXEC sp_addextendedproperty
'MS_Description', N'血压（mmHg）',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'xueya'
GO

EXEC sp_addextendedproperty
'MS_Description', N'血糖（mg/dL）',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'xuetang'
GO

EXEC sp_addextendedproperty
'MS_Description', N'心率（次/分）',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'xinlv'
GO

EXEC sp_addextendedproperty
'MS_Description', N'血脂（mmol/L）',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'xuezhi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'睡眠时间（天/小时）',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'shuimianshijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'总胆固醇（mg/dL）',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'zongdanguchun'
GO

EXEC sp_addextendedproperty
'MS_Description', N'血氧（ bpm）',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'xueyang'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登记时间',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju',
'COLUMN', N'dengjishijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'健康数据',
'SCHEMA', N'dbo',
'TABLE', N'jiankangshuju'
GO


-- ----------------------------
-- Records of jiankangshuju
-- ----------------------------
INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'1', N'2025-07-09 10:33:52', N'用户账号1', N'用户姓名1', N'性别1', N'年龄1', N'体重（kg）1', N'血压（mmHg）1', N'血糖（mg/dL）1', N'心率（次/分）1', N'血脂（mmol/L）1', N'睡眠时间（天/小时）1', N'总胆固醇（mg/dL）1', N'血氧（ bpm）1', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'2', N'2025-07-09 10:33:52', N'用户账号2', N'用户姓名2', N'性别2', N'年龄2', N'体重（kg）2', N'血压（mmHg）2', N'血糖（mg/dL）2', N'心率（次/分）2', N'血脂（mmol/L）2', N'睡眠时间（天/小时）2', N'总胆固醇（mg/dL）2', N'血氧（ bpm）2', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'3', N'2025-07-09 10:33:52', N'用户账号3', N'用户姓名3', N'性别3', N'年龄3', N'体重（kg）3', N'血压（mmHg）3', N'血糖（mg/dL）3', N'心率（次/分）3', N'血脂（mmol/L）3', N'睡眠时间（天/小时）3', N'总胆固醇（mg/dL）3', N'血氧（ bpm）3', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'4', N'2025-07-09 10:33:52', N'用户账号4', N'用户姓名4', N'性别4', N'年龄4', N'体重（kg）4', N'血压（mmHg）4', N'血糖（mg/dL）4', N'心率（次/分）4', N'血脂（mmol/L）4', N'睡眠时间（天/小时）4', N'总胆固醇（mg/dL）4', N'血氧（ bpm）4', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'5', N'2025-07-09 10:33:52', N'用户账号5', N'用户姓名5', N'性别5', N'年龄5', N'体重（kg）5', N'血压（mmHg）5', N'血糖（mg/dL）5', N'心率（次/分）5', N'血脂（mmol/L）5', N'睡眠时间（天/小时）5', N'总胆固醇（mg/dL）5', N'血氧（ bpm）5', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'6', N'2025-07-09 10:33:52', N'用户账号6', N'用户姓名6', N'性别6', N'年龄6', N'体重（kg）6', N'血压（mmHg）6', N'血糖（mg/dL）6', N'心率（次/分）6', N'血脂（mmol/L）6', N'睡眠时间（天/小时）6', N'总胆固醇（mg/dL）6', N'血氧（ bpm）6', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'7', N'2025-07-09 10:33:52', N'用户账号7', N'用户姓名7', N'性别7', N'年龄7', N'体重（kg）7', N'血压（mmHg）7', N'血糖（mg/dL）7', N'心率（次/分）7', N'血脂（mmol/L）7', N'睡眠时间（天/小时）7', N'总胆固醇（mg/dL）7', N'血氧（ bpm）7', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'8', N'2025-07-09 10:33:52', N'用户账号8', N'用户姓名8', N'性别8', N'年龄8', N'体重（kg）8', N'血压（mmHg）8', N'血糖（mg/dL）8', N'心率（次/分）8', N'血脂（mmol/L）8', N'睡眠时间（天/小时）8', N'总胆固醇（mg/dL）8', N'血氧（ bpm）8', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'9', N'2025-07-09 10:33:52', N'用户账号9', N'用户姓名9', N'性别9', N'年龄9', N'体重（kg）9', N'血压（mmHg）9', N'血糖（mg/dL）9', N'心率（次/分）9', N'血脂（mmol/L）9', N'睡眠时间（天/小时）9', N'总胆固醇（mg/dL）9', N'血氧（ bpm）9', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[jiankangshuju] ([id], [addtime], [yonghuzhanghao], [yonghuxingming], [xingbie], [nianling], [tizhong], [xueya], [xuetang], [xinlv], [xuezhi], [shuimianshijian], [zongdanguchun], [xueyang], [dengjishijian]) VALUES (N'10', N'2025-07-09 10:33:52', N'用户账号10', N'用户姓名10', N'性别10', N'年龄10', N'体重（kg）10', N'血压（mmHg）10', N'血糖（mg/dL）10', N'心率（次/分）10', N'血脂（mmol/L）10', N'睡眠时间（天/小时）10', N'总胆固醇（mg/dL）10', N'血氧（ bpm）10', N'2025-07-09 10:33:52')
GO


-- ----------------------------
-- Table structure for keshi
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[keshi]') AND type IN ('U'))
	DROP TABLE [dbo].[keshi]
GO

CREATE TABLE [dbo].[keshi] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [keshi] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [keshiweizhi] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yishengzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[keshi] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'keshi',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'keshi',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'科室',
'SCHEMA', N'dbo',
'TABLE', N'keshi',
'COLUMN', N'keshi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'科室位置',
'SCHEMA', N'dbo',
'TABLE', N'keshi',
'COLUMN', N'keshiweizhi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'医生账号',
'SCHEMA', N'dbo',
'TABLE', N'keshi',
'COLUMN', N'yishengzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'科室',
'SCHEMA', N'dbo',
'TABLE', N'keshi'
GO


-- ----------------------------
-- Records of keshi
-- ----------------------------
INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'1', N'2025-07-09 10:33:52', N'科室1', N'科室位置1', N'医生账号1')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'2', N'2025-07-09 10:33:52', N'科室2', N'科室位置2', N'医生账号2')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'3', N'2025-07-09 10:33:52', N'科室3', N'科室位置3', N'医生账号3')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'4', N'2025-07-09 10:33:52', N'科室4', N'科室位置4', N'医生账号4')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'5', N'2025-07-09 10:33:52', N'科室5', N'科室位置5', N'医生账号5')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'6', N'2025-07-09 10:33:52', N'科室6', N'科室位置6', N'医生账号6')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'7', N'2025-07-09 10:33:52', N'科室7', N'科室位置7', N'医生账号7')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'8', N'2025-07-09 10:33:52', N'科室8', N'科室位置8', N'医生账号8')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'9', N'2025-07-09 10:33:52', N'科室9', N'科室位置9', N'医生账号9')
GO

INSERT INTO [dbo].[keshi] ([id], [addtime], [keshi], [keshiweizhi], [yishengzhanghao]) VALUES (N'10', N'2025-07-09 10:33:52', N'科室10', N'科室位置10', N'医生账号10')
GO


-- ----------------------------
-- Table structure for menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[menu]') AND type IN ('U'))
	DROP TABLE [dbo].[menu]
GO

CREATE TABLE [dbo].[menu] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [menujson] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[menu] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'menu',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'menu',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单',
'SCHEMA', N'dbo',
'TABLE', N'menu',
'COLUMN', N'menujson'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单',
'SCHEMA', N'dbo',
'TABLE', N'menu'
GO


-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO [dbo].[menu] ([id], [addtime], [menujson]) VALUES (N'1', N'2025-07-09 10:33:52', N'[{"backMenu":[{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-explore","buttons":["新增","查看","修改","删除"],"classname":"users","menu":"管理员","menuJump":"列表","tableName":"users"}],"fontClass":"icon-common13","menu":"管理员管理","unicode":"&#xedf7;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-pay","buttons":["新增","查看","修改","删除"],"classname":"keshi","menu":"科室","menuJump":"列表","tableName":"keshi"}],"fontClass":"icon-common20","menu":"科室管理","unicode":"&#xee02;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-vip","buttons":["新增","查看","修改","删除"],"classname":"yonghu","menu":"用户","menuJump":"列表","tableName":"yonghu"},{"allButtons":["新增","查看","修改","删除","审核"],"appFrontIcon":"cuIcon-flashlightopen","buttons":["新增","查看","修改","删除","审核"],"classname":"yiliaojigou","menu":"医疗机构","menuJump":"列表","tableName":"yiliaojigou"}],"fontClass":"icon-user1","menu":"用户管理","unicode":"&#xef97;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"classname":"tijianleixing","menu":"体检类型","menuJump":"列表","tableName":"tijianleixing"},{"allButtons":["新增","查看","修改","删除","审核","预约"],"appFrontIcon":"cuIcon-pic","buttons":["查看","修改","删除","审核"],"classname":"tijianxiangmu","menu":"体检项目","menuJump":"列表","tableName":"tijianxiangmu"}],"fontClass":"icon-common3","menu":"体检项目管理","unicode":"&#xeda5;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-goods","buttons":["新增","查看","修改","删除"],"classname":"news","menu":"健康科普","menuJump":"列表","tableName":"news"}],"fontClass":"icon-common18","menu":"健康科普管理","unicode":"&#xedff;"},{"child":[{"allButtons":["新增","查看","修改","删除","支付","体检人数","首页总数","首页统计","体检","取消"],"appFrontIcon":"cuIcon-phone","buttons":["查看","删除","体检人数","首页总数","首页统计","修改"],"classname":"tijianyuyue","menu":"体检预约","menuJump":"列表","tableName":"tijianyuyue"},{"allButtons":["新增","查看","修改","删除","体检报告"],"appFrontIcon":"cuIcon-circle","buttons":["查看","删除","修改"],"classname":"tijianxinxi","menu":"体检信息","menuJump":"列表","tableName":"tijianxinxi"},{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-form","buttons":["查看","删除","修改"],"classname":"tijianbaogao","menu":"体检报告","menuJump":"列表","tableName":"tijianbaogao"},{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-news","buttons":["查看","删除","修改"],"classname":"quxiaoyuyue","menu":"取消预约","menuJump":"列表","tableName":"quxiaoyuyue"}],"fontClass":"icon-common43","menu":"体检信息管理","unicode":"&#xef27;"},{"child":[{"allButtons":["新增","查看","修改","删除","支付","挂号数量","首页总数","首页统计"],"appFrontIcon":"cuIcon-keyboard","buttons":["查看","修改","删除","挂号数量","首页总数","首页统计"],"classname":"yuyueguahao","menu":"预约挂号","menuJump":"列表","tableName":"yuyueguahao"},{"allButtons":["新增","查看","修改","删除","挂号"],"appFrontIcon":"cuIcon-circle","buttons":["查看","修改","删除"],"classname":"yishengzuozhen","menu":"医生坐诊","menuJump":"列表","tableName":"yishengzuozhen"}],"fontClass":"icon-common28","menu":"预约挂号管理","unicode":"&#xee2d;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-taxi","buttons":["新增","查看","修改","删除"],"classname":"config","menu":"轮播图","menuJump":"列表","tableName":"config"}],"fontClass":"icon-common33","menu":"轮播图管理","unicode":"&#xee6a;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-send","buttons":["查看","修改","删除"],"classname":"jiankangshuju","menu":"健康数据","menuJump":"列表","tableName":"jiankangshuju"}],"fontClass":"icon-common4","menu":"健康数据管理","unicode":"&#xedab;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-pay","buttons":["新增","查看","修改","删除"],"classname":"systemNotice","menu":"消息通知","menuJump":"列表","tableName":"system_notice"}],"fontClass":"icon-common16","menu":"消息通知管理","unicode":"&#xedfd;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-link","buttons":["新增","查看","修改","删除"],"classname":"popupRemind","menu":"吃药提醒","menuJump":"列表","tableName":"popup_remind"}],"fontClass":"icon-common29","menu":"吃药提醒管理","unicode":"&#xee2e;"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"classname":"news","menu":"健康科普","menuJump":"列表","tableName":"news"}],"menu":"新闻资讯管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["新增","查看","修改","删除"],"classname":"chat","menu":"ai问答","menuJump":"列表","tableName":"chat"}],"menu":"客服聊天管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["查看","预约"],"classname":"tijianxiangmu","menu":"体检项目","menuJump":"列表","tableName":"tijianxiangmu"}],"menu":"健康体检管理"},{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","挂号"],"classname":"yishengzuozhen","menu":"医生坐诊","menuJump":"列表","tableName":"yishengzuozhen"}],"menu":"医生坐诊管理"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","pathName":"users","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"allButtons":["新增","查看","修改","删除","支付","体检人数","首页总数","首页统计","体检","取消"],"appFrontIcon":"cuIcon-phone","buttons":["查看","修改","删除","支付","取消"],"classname":"tijianyuyue","menu":"体检预约","menuJump":"列表","tableName":"tijianyuyue"},{"allButtons":["新增","查看","修改","删除","体检报告"],"appFrontIcon":"cuIcon-circle","buttons":["查看","删除"],"classname":"tijianxinxi","menu":"体检信息","menuJump":"列表","tableName":"tijianxinxi"},{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-form","buttons":["查看","删除"],"classname":"tijianbaogao","menu":"体检报告","menuJump":"列表","tableName":"tijianbaogao"},{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-news","buttons":["查看","修改","删除"],"classname":"quxiaoyuyue","menu":"取消预约","menuJump":"列表","tableName":"quxiaoyuyue"}],"fontClass":"icon-common43","menu":"体检信息管理","unicode":"&#xef27;"},{"child":[{"allButtons":["新增","查看","修改","删除","支付","挂号数量","首页总数","首页统计"],"appFrontIcon":"cuIcon-keyboard","buttons":["查看","修改","删除","支付"],"classname":"yuyueguahao","menu":"预约挂号","menuJump":"列表","tableName":"yuyueguahao"}],"fontClass":"icon-common28","menu":"预约挂号管理","unicode":"&#xee2d;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-phone","buttons":["查看"],"classname":"storeup","menu":"我的收藏","menuJump":"1","tableName":"storeup"}],"fontClass":"icon-common8","menu":"我的收藏管理","unicode":"&#xedb6;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-send","buttons":["新增","查看","修改","删除"],"classname":"jiankangshuju","menu":"健康数据","menuJump":"列表","tableName":"jiankangshuju"}],"fontClass":"icon-common4","menu":"健康数据管理","unicode":"&#xedab;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-link","buttons":["新增","查看","修改","删除"],"classname":"popupRemind","menu":"吃药提醒","menuJump":"列表","tableName":"popup_remind"}],"fontClass":"icon-common29","menu":"吃药提醒管理","unicode":"&#xee2e;"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"classname":"news","menu":"健康科普","menuJump":"列表","tableName":"news"}],"menu":"新闻资讯管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["新增","查看","修改","删除"],"classname":"chat","menu":"ai问答","menuJump":"列表","tableName":"chat"}],"menu":"客服聊天管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["查看","预约"],"classname":"tijianxiangmu","menu":"体检项目","menuJump":"列表","tableName":"tijianxiangmu"}],"menu":"健康体检管理"},{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","挂号"],"classname":"yishengzuozhen","menu":"医生坐诊","menuJump":"列表","tableName":"yishengzuozhen"}],"menu":"医生坐诊管理"}],"hasBackLogin":"否","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","pathName":"yonghu","roleName":"用户","tableName":"yonghu"},{"backMenu":[{"child":[{"allButtons":["新增","查看","修改","删除","审核","预约"],"appFrontIcon":"cuIcon-pic","buttons":["新增","查看","修改","删除"],"classname":"tijianxiangmu","menu":"体检项目","menuJump":"列表","tableName":"tijianxiangmu"}],"fontClass":"icon-common3","menu":"体检项目管理","unicode":"&#xeda5;"},{"child":[{"allButtons":["新增","查看","修改","删除","支付","体检人数","首页总数","首页统计","体检","取消"],"appFrontIcon":"cuIcon-phone","buttons":["查看","删除","体检人数","首页总数","首页统计","体检"],"classname":"tijianyuyue","menu":"体检预约","menuJump":"列表","tableName":"tijianyuyue"},{"allButtons":["新增","查看","修改","删除","体检报告"],"appFrontIcon":"cuIcon-circle","buttons":["查看","删除","体检报告"],"classname":"tijianxinxi","menu":"体检信息","menuJump":"列表","tableName":"tijianxinxi"},{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-form","buttons":["查看","删除"],"classname":"tijianbaogao","menu":"体检报告","menuJump":"列表","tableName":"tijianbaogao"},{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-news","buttons":["查看","删除"],"classname":"quxiaoyuyue","menu":"取消预约","menuJump":"列表","tableName":"quxiaoyuyue"}],"fontClass":"icon-common43","menu":"体检信息管理","unicode":"&#xef27;"},{"child":[{"allButtons":["新增","查看","修改","删除","支付","挂号数量","首页总数","首页统计"],"appFrontIcon":"cuIcon-keyboard","buttons":["查看","删除","挂号数量","首页总数","首页统计"],"classname":"yuyueguahao","menu":"预约挂号","menuJump":"列表","tableName":"yuyueguahao"},{"allButtons":["新增","查看","修改","删除","挂号"],"appFrontIcon":"cuIcon-circle","buttons":["新增","查看","修改","删除"],"classname":"yishengzuozhen","menu":"医生坐诊","menuJump":"列表","tableName":"yishengzuozhen"}],"fontClass":"icon-common28","menu":"预约挂号管理","unicode":"&#xee2d;"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-send","buttons":["查看","删除"],"classname":"jiankangshuju","menu":"健康数据","menuJump":"列表","tableName":"jiankangshuju"}],"fontClass":"icon-common4","menu":"健康数据管理","unicode":"&#xedab;"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"classname":"news","menu":"健康科普","menuJump":"列表","tableName":"news"}],"menu":"新闻资讯管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["新增","查看","修改","删除"],"classname":"chat","menu":"ai问答","menuJump":"列表","tableName":"chat"}],"menu":"客服聊天管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["查看","预约"],"classname":"tijianxiangmu","menu":"体检项目","menuJump":"列表","tableName":"tijianxiangmu"}],"menu":"健康体检管理"},{"child":[{"appFrontIcon":"cuIcon-time","buttons":["查看","挂号"],"classname":"yishengzuozhen","menu":"医生坐诊","menuJump":"列表","tableName":"yishengzuozhen"}],"menu":"医生坐诊管理"}],"hasBackLogin":"是","hasBackRegister":"是","hasFrontLogin":"否","hasFrontRegister":"否","pathName":"yiliaojigou","roleName":"医疗机构","tableName":"yiliaojigou"}]')
GO


-- ----------------------------
-- Table structure for news
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[news]') AND type IN ('U'))
	DROP TABLE [dbo].[news]
GO

CREATE TABLE [dbo].[news] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [title] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [introduction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[news] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'news',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'news',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'news',
'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简介',
'SCHEMA', N'dbo',
'TABLE', N'news',
'COLUMN', N'introduction'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'news',
'COLUMN', N'picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'news',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'健康科普',
'SCHEMA', N'dbo',
'TABLE', N'news'
GO


-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'1', N'2025-07-09 10:33:51', N'余生，愿你活出自己的精彩', N'曾几何时，为了让自己显得合群，选择去做自己不喜欢的事;为了讨好喜欢的人，一次次地委屈自己;甚至，为了陌生人的一个眼神，就陷入了深深的自我怀疑。', N'file/newsPicture1.jpg', N'可是，这样小心翼翼的你，一定很累吧。你以为照顾了所有人的想法，就能得到他们的喜欢;你以为逼着自己合群，就能真的合群。直到后来才发现，在日复一日对自己的为难中，你逐渐弄丢了真实的自己.
殊不知，人生在世，最不值得的事情，就是在别人的眼光中，迷失自己。其实，正如世界上没有十全十美的人，你也同样无法做到让每个人满意。
世上没有不快乐的人，只有不肯让自己快乐的心。有一句话说:
如果一段关系让你变得卑微，你可以选择抽身离去;如果一个人总是让你悲伤哭泣，你要学会放手。
始终相信，每个人最初的样子，都是最美好的。真正喜欢你的人，会喜欢你原来的样子:真正爱你的从来不需要你的委曲求全。
后半生，请把身上的枷锁，全部解除。去做喜欢的事，去听自己内心的声音。你会发现，这世上没有什么事情比活出自己更加幸福。
要相信，真实的自己亦是一道风景线。你若盛开，清风自来。愿你此生尽兴，不负韶华，')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'2', N'2025-07-09 10:33:51', N'岁月无常，好好珍惜', N'常听到这样的话，如果一切可以重新开始，我一定改掉任性，学会坚持，如果有下辈子，我一定好好珍惜，不会再弄丢原本属于自己的幸福。', N'file/newsPicture2.jpg', N'然而，世上有很多事情没有再来一次的机会，一旦错失就意味着无法弥补，正如人与人之间，有的只是一世的缘分，一旦转身，就意味着再无可能。
这一生只活一次，有些人也只爱一回。
所以，在拥有时就好好把握，对于来世，可以适当憧憬，但不要一昧去幻想，活着，唯有珍惜身边做好眼前事，才能让明天少一些遗憾。人，
既然有幸来到这个世上，那就要努力把这辈子活好。岁月其实远没有想象中的那么漫长，若是能爱就好好爱，别让说好相伴一生的人，中途散走;若是当下能相知相守，就别去等待虚无缥缈的未来。
就像一位网友留言说的:我从来不去期待下辈子，我要的只有今生，世事无常，来世是怎样的光景，谁都无法预知。对我来说，在有限的时光里，善待爱自己及自己爱的人，用心珍惜相聚的每一时刻，努力过好当下就足够了。
时光匆匆，韶华似水，每个人都只有这短暂的一生。
有些事，如果喜欢就坚定努力的去做，有些人，如果爱就真诚用心地去爱，别幻想着重来，别总是寄希望于下辈子。
下辈子，彼此也许再也不会遇见，就算遇见了，谁还会记得谁，今生相互承诺的两个人，来生也许相见不相识。
想起之前看过的一句话:人生没有假如，我们没有来世，下辈子，你我也许只是大千世界里互不相识的两个陌生人。
的确，生命只有一次，今生有幸相遇的人，下辈子不一定能遇见，就算能遇见，谁能把谁陪伴，谁又是谁的谁?
余生不长，趁着岁月未老，好好珍惜这辈子的缘分吧，别等到失去了才悔不该当初。')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'3', N'2025-07-09 10:33:51', N'与其背着烦恼活，不如带着美好过', N'一直觉得，感情里，无疾而终并不可怕，可怕的是结束后，你还抱着回忆不肯放;岁月中，失去并不可怕，可怕的是失去后，你还揪着曾经不肯忘。
有些事，明知道不应该继续，却始终没有转身的勇气;有些人，明知道已经成为过去，却还是舍不得放手;有时候，明知道纠缠于往事旧人只会徒增伤悲，却仍然执着的去回忆，去留恋。', N'file/newsPicture3.jpg', N'人生短短几十年，为什么要蹉跎浪费在无可挽回的失去上，为什么不酒脱一点，看开一点，活得轻松快乐一点。
这世间，没有谁的人生是十全十美的，总要面对一些离别，总要经历一些失去，如果总对身边的一切执念太深，只会越活越累。
时间不停向前，人也不可避免的要向前看。面对一些不如意、不顺心的事，该放的就放，该忘的就忘，别总把自己困在失败的悲伤中。
生而为人，放不是无能，而是一种洒脱，忘更不是懦弱，而是一种智慧。
在来去匆匆，聚散不定的现实里，放下不属于自己的感情，才能有新的开始，忘记心中的烦恼，才能收获愉快的心情。
所以，有些离开的人，该放就放下吧，一直念念不忘，伤害的是自己，有些烦心事，该忘就忘了吧一直耿耿于怀，痛苦的是自己。
-辈子本就不长，何必让自己活得那么累，过去的情就让它过去，别再留恋，想不通的事就算了，别再纠结。
人生的旅途，总有些事让人烦，总有些情让人伤。只有学会忘记过往的不如意，忘记一些不必要的烦恼，以轻盈的身心重新出发，才不会被旧人旧事所累。
记得，每个人心灵的空间都是有限的，当装多了纠结与伤感，就装不下自在与欢快了。要想日子过得简单轻松一点，就要懂得放下执念，忘掉痛苦，清除伤。')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'4', N'2025-07-09 10:33:51', N'理想很丰满，现实很骨感', N'游戏里的你帅气无比，乘风御剑，通关杀敌无所不能，你满足于那其中的成就感，你满足于通关的畅快淋漓。', N'file/newsPicture4.jpg', N'年轻人，可那毕竟不是现实，理想很丰满，现实很骨感这不是玩笑，你不走出来，怎么会知
你真的想等到某天喜欢上一个姑娘时，才去纠结咖啡钱电影钱你要如何与爸妈张口，才去苦恼为她买礼物你要怎样省吃俭用节衣缩食?
你没有挥金如土的.魄力，没有殷实的家境，没有既定的光芒锦绣的前程，二十出头的年纪，你不努力，你想拿什么报答那个在你身边用最好的青春陪伴你的姑娘?你又拿什么报答含辛茹苦养育你这么多年的父母?
生活不是游戏，不会给你那么多反复再来的机会，青春年少风华正茂，年轻人，你不努力，你想指望什么?
年轻人，走出来奋斗吧!累也好苦也罢。如果你现在对自己各种放纵，你指望以后你用什么条件来放松?
年轻人，你要努力赚钱，为了自己，也为了你爸妈。为了他们在以后逛商场的时候，可以给自己买东西像给你买东西一样毫不犹豫。为了他们可以在同老友谈起你时可以一脸安详，而不是想着，这个月，儿子交了房租还有钱吃饭么。我们这个年龄的人，已经像吸血鬼一样巴着父母活了二十多年了，还真的要继续吸着他们的血活下去么?
年轻人，停止期望凡事简单容易。如果总是挑简单的事情做，那你永远成不了大器，生活总会在始料不及时考验你，所以你必须挑战困难，保持坚强，世上任何值得拥有的东西都需要付诸努力，勤奋与自律，倘若自甘平庸，那你就会变得庸碌无为。
年轻人，与我们一起，挑战一下自己，拥抱一下梦想。你想要的生活，跳起来，一定够得到!')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'5', N'2025-07-09 10:33:51', N'理想是一种精神上的追求', N'如果前方是一片黑暗，理想是否会黯淡?黑暗终究不能限制理想的步伐，只是需要时间。', N'file/newsPicture5.jpg', N'是否会撕裂黑暗的结界?给理想一点时间，是否会完成理想的目标?太多时候，黑给黑暗一缕曙光，暗限制了理想的脚步，时间成了撕裂黑暗的曙光。社会的压抑，未知的迷茫，甚至是事实的打击，都成了所谓的黑暗。
理想应该是一种精神上的追求，一种我们内心深处的渴望。也许理想的种类太多，不一样的人也有不一样的理想。但唯一的共同点就是我们在追求，追求自己精神上亦或是心中的目标。但总是不尽人意，一来存在太多不确定因素，二来时间还不够。理想并不是一而就的空话。
想过放弃，因为理想与现实的差距。但又不想放弃，因为理想是精神上的追求心中的渴望。纠结了太多，却是否想过在纠结的时候，已经选择了错过。被刻意选择的错过是什么?是路过。我们在不经意间路过了多少理想，只是因为纠结。如果坚定自己的理想，用时间去行动，是否会少几次刻意的错过:-次，与一位朋友谈到如何乐观，然后追求理想。朋友想了一会儿，给我的回答是正能量与时间。他说，想要乐观就要不断给自己正能量。事物有阴阳两面，如果阳代表乐观，那在我们看待一件事时要看阳面千万别看阴面。这样自己不会消极，某种程度上来说就是一种正能量。想要追求理想，务必要花费时间。正如没有风平浪静的大海，想要追求理想，要时间。给理想一点时间，让自己去追求，不顾切的追求。
点点滴滴的小事构成了我们的生活，点点滴滴的努力给理想铺平了路。每一次小成功都为理想迈进了一步。每一次失败，都告诉我们一些教训，反方向来说为下一次成功提供了经验。不要觉得失败是可怕的，长远来看，正是失败才有了成功。
时间在流逝。如果安于现状，就会乐不思。理想需要时间不代表我们可以挥霍，我们能做的是珍惜时间，去为理想拼搏。
间接意义上讲，理想的时间是我们的努力。
如果正在路上，一直任性向前走，忘记时间不回头。')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'6', N'2025-07-09 10:33:51', N'人生如梦，梦想是帆', N'人生如梦，梦想是帆，每个人都有一个只属于自己的梦，但我们同属一个国家，所以每个人的梦又与国家的兴衰荣辱紧密相连。先哲顾炎武曾说:天下兴亡，匹夫有责。只有国家好，大家才能好。', N'file/newsPicture6.jpg', N'我依然清楚的记得:
当甲午战争战败，日寇无礼踏破中国的门户;当八国联军侵入北京，无情掠夺中国的财产:当七七事变发生，中国的老人、妇孺被残忍杀害的时候，我在想那时中国的梦是怎样的!
我虽不曾亲眼看到，但那却是铁一般的事实。因为从老人们那深邃的眼神中可以感到无尽的愤懑;从他们干瘪的脸颊可以看到深情的泪水，从他们嘹亮的军歌中可以想到那奋勇杀敌时的豪迈;从他们激昂话语中听到那誓要捍卫家园振兴中华的誓言。作为新一代青年的我们难道不应该树立远大的理想，付之以踏实的行动，去继承先辈们的使命。去实现中华民族的伟大崛起和复兴吗?
有梦才能使中国繁荣!
在改革开放以来中国取得了一系列的可以载入中国史册的成就。香港、澳门的回归，经济特区的建立，使中国成为发展国家中的经济大国，科技先进国和军事强国。当中国成功举办奥运的时候，当神九飞天的时候，当蛟龙入海的时候，当航母下水的时候，当莫言荣获诺贝尔文学奖的时候。我相信每个人都感觉到了无比的自豪。但是现在的中国与其他发达国家还有很大差距。作为新一代的我们，难道不应该志存高远吗?
我想有的人会说，我们的力量是有限的。的确个人的力量很渺小，但是中国梦就是因一个个微不足道的个人的梦一直汇集、汇集，然后凝聚成的一个巨大的梦。冯至在《十四行诗》中写道，我们准备着，深深领受，那些意想不到的奇迹，在漫长的岁月里，忽然有彗星的出现，狂风乍起。
梦想是美丽的，它是美的期望;梦想是阳光的，它使人由浮躁走向踏实;梦想是充满力量的，它可以激发人身体里无限的潜能。我们期盼的是国泰民安、经济发展、政治清明、文化繁荣、社会和谐、生态良
好、公平正义。这才是中国人伟大的梦')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'7', N'2025-07-09 10:33:51', N'若月亮没来-王宇宙Leto，乔浚丞', N'《若月亮没来(若是月亮还没来)》是王宇宙Leto，乔浚丞演唱的歌曲，于2024年1月22日上线发行。', N'file/newsPicture7.jpg', N'风吹过山 船靠了岸  风光呀 一点点看  我走向北 你去往南
故事呀 一篇篇翻  好烦 又加班到很晚  你搭上空荡的 地铁已是末班
好烦 很爱却要分开  恋爱谈不明白  好烦 接近理想好难 却又还很不甘
如何拥抱平淡  如果 最难得到圆满  不如选择坦然 若是月亮还没来
路灯也可照窗台  照着白色的山茶花微微开  若是晨风还没来
晚风也可吹入怀  吹着那一地树影温柔摇摆  你总以为你不够好
不够苗条和美貌  可是完美谁能达到  做你自己就很好
烦恼烦恼拥有太少  没有房车没有钞票  可爱你的人永远会 
把你当做心尖珍宝  我也懂大多数的时候  你只想逃离这世界
我也懂太多的情绪在  一个人失眠的深夜 你可以是悲伤或者埋怨
但请不要放弃明天  这一直灰暗的世界  我想看见你的笑脸
若是月亮还没来  路灯也可照窗台  照着白色的山茶花微微开
若是晨风还没来  晚风也可吹入怀  吹着那一地树影温柔摇摆
若是月亮还没来  路灯也可照窗台  照着白色的山茶花微微开
若是晨风还没来  晚风也可吹入怀  吹着那一地树影温柔摇摆
李哲今年1月份创作了《若月亮没来》这首歌。随着歌曲的热度不断上升，约他写歌的人越来越多，他的工作变得更加繁忙。
近年来，李哲凭借对音乐的热爱和不懈的努力，创作了几百首音乐作品，其中不乏广为人知的佳作，例如王栎鑫的《一个人》、何赛飞与叶炫清在央视演唱的《木兰诗》等歌曲，都是由李哲作曲。
如今，李哲的音乐才华和努力得到了业界的广泛认可，他的音乐作品多次登上各大音乐平台的热歌榜，成为备受瞩目的新生代音乐人。现在，走在街头、坐在车里，经常会听到自己的作品。看到自己的音乐作品受到如此广泛的喜爱和认可，我感到非常有成就感。李哲笑着说，他会努力创作更多优秀音乐作品，为家乡争光。')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'8', N'2025-07-09 10:33:51', N'-米阳光传递一份温暖', N'黑暗中跌倒，坚强里苦笑。只是因为青春还在，所以梦想一直在路上。当年华未曾老去，青春没有散场，留给幽暗的岁月，还有几分值得珍藏?孤独无助时、伤心难过时总爱恣意挥霍愤怒。伤了、痛了原本以为就都结束了;可是心里还不甘愿放弃，就只为一个理由，有梦想的人永不孤单。', N'file/newsPicture8.jpg', N'放进去了的青春，走不出来的悲伤却总是给年少时的我们留下太多无法割舍的情怀。记录岁月的足迹，聆听时光的故事。然轻吟浅唱出，青春嘉年华。
故事里总会有，那些太多感慨于时间的无情，太多对往事的追忆，太多的太多，而今刻在了心里也停泻在了流年里。一段无法抹去的回忆，也只不过是一场烟火燃放的瞬间，却也一辈子在脑海里兜兜转转。很是怀念那些相遇的日子，邂逅了幸福也留在了时间轨迹里。时而想起，那些曾肩并肩奋斗的日子，那些写满感动与快乐的岁月。
如今，我们似乎渐行渐远，彼此奋斗着青春的轮回。渐渐的，我们都长大了，时间改变了我们时刻分享彼此快乐与不快乐的习惯，青春的渐逝，岁月的更迭让我们变得都不再联系，身边的朋友也越来越少;那些欢笑，那些幸福的流年也随着我们的陌生而变得更加奢侈。也许多年以后，我们都有了自己的朋友，有了自己关心的人。那时，我们再细数那些癫狂在你生命里一辈子的记忆故事，蓦然发现一切都停留在了回忆里。')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'9', N'2025-07-09 10:33:51', N'自己的路自己走，自己的心自己懂', N'岛上书店》中有句话:每个人的生命里，都有最艰难的那一年，将人生变得美好而辽阔。
你有没有经历过那么一年，在走过的岁月中跋涉得异常艰难困苦，却仍无法灭前行的勇气。哪怕所有人都极力劝阻，也要不甘心地试一试;哪怕前方已没有道路，却还在坚定前行;哪怕再看不到任何希望，也要竭尽全力地为自己争取一个机会。', N'file/newsPicture9.jpg', N'你开始不动声色的扮演着一个大人，经历着生活日复一日的打。
每天醒在天还没亮的五六点，挤过早高峰的地下铁，面对成山的工作，加班到深夜倒下就睡更成为了日常，还要应付各色的人际关系，逐渐开始接受努力也不一定有回报的道理。
这段日子也许很长，但你没有放弃对生活的信心，始终相信人生总会变得一帆风顺，更坚信每件事的最后都会有一个好的结局，如果不是，说明还没到最后。
于是你树立新的目标，让这一年的奔波更有方向。
虽然永远无法预料明天是晴是雨，也无法预知你在乎的人是否还在身边，你一直以来的坚持究竟能换来什么。
但你能决定的是，今天有没有备好雨伞，有没有好好爱人以及是否为自己追求的理想拼尽全力。
永远不要只看见前方路途遥远而忘了从前的自己坚持了多久才走到了这里，
今天拼尽全力虽然艰辛万分，在未来都将成为落在你身上的礼物。')
GO

INSERT INTO [dbo].[news] ([id], [addtime], [title], [introduction], [picture], [content]) VALUES (N'10', N'2025-07-09 10:33:51', N'愿你有明天可奔赴，有过往可回头', N'此去经年，用一张离家的车票，换一段有故事可说的人生。
大概就是那时候怀揣着梦想，背上了行囊，一腔热血决定远行的你。独自拎着一只行李箱，背着双肩包在深夜抵达一个陌生的城市，站在人潮涌动的车站出口，望着宽敞公路上车水马龙的喧嚣，城市里亮如白昼的繁华。', N'file/newsPicture10.jpg', N'这世界上的人们都活的匆匆忙忙，每个人看起来都很焦虑，每个人都有自己的苦楚，却往往找不到人可以诉说。也许你的倾诉，对别人来说是一种打扰，而且别人没经历过你的经历，所以无法体会你的心情。我们总是在心情不好的时候拿着手机，翻翻通讯录，然后再默默放下手机，压住心中那股想要找人说说话的想法。
等到低落的情绪慢慢有些好转，才开始明白，人这一生，无论是什么样的路，都是自己的选择，冲动也好，深思熟虑也罢，自己选的路，不管多难，都要自己走下去。心中的感受，不管是复杂还是简单，都只能自己来懂，别人帮不了你，也安慰不了你，顶多给你一些无济于事的劝告，最后还得靠自己想开。你选的幸福，你自己享受;你选的眼泪，你自己来流，生活就是如此，自己的路，自己走;自己的心，自己懂。')
GO


-- ----------------------------
-- Table structure for popup_remind
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[popup_remind]') AND type IN ('U'))
	DROP TABLE [dbo].[popup_remind]
GO

CREATE TABLE [dbo].[popup_remind] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [userid] bigint  NOT NULL,
  [title] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [type] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [brief] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [remind_time] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[popup_remind] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布人用户ID',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind',
'COLUMN', N'userid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind',
'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind',
'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简介',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind',
'COLUMN', N'brief'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提醒时间',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind',
'COLUMN', N'remind_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'吃药提醒',
'SCHEMA', N'dbo',
'TABLE', N'popup_remind'
GO


-- ----------------------------
-- Records of popup_remind
-- ----------------------------
INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'1', N'2025-07-09 10:33:52', N'1', N'标题1', N'私人', N'简介1', N'内容1', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'2', N'2025-07-09 10:33:52', N'2', N'标题2', N'私人', N'简介2', N'内容2', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'3', N'2025-07-09 10:33:52', N'3', N'标题3', N'私人', N'简介3', N'内容3', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'4', N'2025-07-09 10:33:52', N'4', N'标题4', N'私人', N'简介4', N'内容4', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'5', N'2025-07-09 10:33:52', N'5', N'标题5', N'私人', N'简介5', N'内容5', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'6', N'2025-07-09 10:33:52', N'6', N'标题6', N'私人', N'简介6', N'内容6', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'7', N'2025-07-09 10:33:52', N'7', N'标题7', N'私人', N'简介7', N'内容7', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'8', N'2025-07-09 10:33:52', N'8', N'标题8', N'私人', N'简介8', N'内容8', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'9', N'2025-07-09 10:33:52', N'9', N'标题9', N'私人', N'简介9', N'内容9', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[popup_remind] ([id], [addtime], [userid], [title], [type], [brief], [content], [remind_time]) VALUES (N'10', N'2025-07-09 10:33:52', N'10', N'标题10', N'私人', N'简介10', N'内容10', N'2025-07-09 10:33:52')
GO


-- ----------------------------
-- Table structure for quxiaoyuyue
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[quxiaoyuyue]') AND type IN ('U'))
	DROP TABLE [dbo].[quxiaoyuyue]
GO

CREATE TABLE [dbo].[quxiaoyuyue] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [tijianxiangmu] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianleixing] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijiandidian] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianfeiyong] int  NULL,
  [yonghuzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yonghuxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [xingbie] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigouzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigoumingcheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [quxiaoyuanyin] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [quxiaoshijian] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[quxiaoyuyue] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检项目',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'tijianxiangmu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检类型',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'tijianleixing'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检地点',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'tijiandidian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检费用',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'tijianfeiyong'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'yonghuzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'yonghuxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'xingbie'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构账号',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'jigouzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'jigoumingcheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'取消原因',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'quxiaoyuanyin'
GO

EXEC sp_addextendedproperty
'MS_Description', N'取消时间',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue',
'COLUMN', N'quxiaoshijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'取消预约',
'SCHEMA', N'dbo',
'TABLE', N'quxiaoyuyue'
GO


-- ----------------------------
-- Records of quxiaoyuyue
-- ----------------------------
INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'1', N'2025-07-09 10:33:52', N'体检项目1', N'体检类型1', N'体检地点1', N'1', N'用户账号1', N'用户姓名1', N'性别1', N'机构账号1', N'机构名称1', N'取消原因1', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'2', N'2025-07-09 10:33:52', N'体检项目2', N'体检类型2', N'体检地点2', N'2', N'用户账号2', N'用户姓名2', N'性别2', N'机构账号2', N'机构名称2', N'取消原因2', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'3', N'2025-07-09 10:33:52', N'体检项目3', N'体检类型3', N'体检地点3', N'3', N'用户账号3', N'用户姓名3', N'性别3', N'机构账号3', N'机构名称3', N'取消原因3', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'4', N'2025-07-09 10:33:52', N'体检项目4', N'体检类型4', N'体检地点4', N'4', N'用户账号4', N'用户姓名4', N'性别4', N'机构账号4', N'机构名称4', N'取消原因4', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'5', N'2025-07-09 10:33:52', N'体检项目5', N'体检类型5', N'体检地点5', N'5', N'用户账号5', N'用户姓名5', N'性别5', N'机构账号5', N'机构名称5', N'取消原因5', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'6', N'2025-07-09 10:33:52', N'体检项目6', N'体检类型6', N'体检地点6', N'6', N'用户账号6', N'用户姓名6', N'性别6', N'机构账号6', N'机构名称6', N'取消原因6', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'7', N'2025-07-09 10:33:52', N'体检项目7', N'体检类型7', N'体检地点7', N'7', N'用户账号7', N'用户姓名7', N'性别7', N'机构账号7', N'机构名称7', N'取消原因7', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'8', N'2025-07-09 10:33:52', N'体检项目8', N'体检类型8', N'体检地点8', N'8', N'用户账号8', N'用户姓名8', N'性别8', N'机构账号8', N'机构名称8', N'取消原因8', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'9', N'2025-07-09 10:33:52', N'体检项目9', N'体检类型9', N'体检地点9', N'9', N'用户账号9', N'用户姓名9', N'性别9', N'机构账号9', N'机构名称9', N'取消原因9', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[quxiaoyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [xingbie], [jigouzhanghao], [jigoumingcheng], [quxiaoyuanyin], [quxiaoshijian]) VALUES (N'10', N'2025-07-09 10:33:52', N'体检项目10', N'体检类型10', N'体检地点10', N'10', N'用户账号10', N'用户姓名10', N'性别10', N'机构账号10', N'机构名称10', N'取消原因10', N'2025-07-09 10:33:52')
GO


-- ----------------------------
-- Table structure for storeup
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[storeup]') AND type IN ('U'))
	DROP TABLE [dbo].[storeup]
GO

CREATE TABLE [dbo].[storeup] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [refid] bigint  NULL,
  [tablename] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [name] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [type] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [inteltype] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [remark] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [userid] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[storeup] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'refid',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'refid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'表名',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'tablename'
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'推荐类型',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'inteltype'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户id',
'SCHEMA', N'dbo',
'TABLE', N'storeup',
'COLUMN', N'userid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'我的收藏',
'SCHEMA', N'dbo',
'TABLE', N'storeup'
GO


-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[system_notice]') AND type IN ('U'))
	DROP TABLE [dbo].[system_notice]
GO

CREATE TABLE [dbo].[system_notice] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[system_notice] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'system_notice',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'system_notice',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公告内容',
'SCHEMA', N'dbo',
'TABLE', N'system_notice',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'消息通知',
'SCHEMA', N'dbo',
'TABLE', N'system_notice'
GO


-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO [dbo].[system_notice] ([id], [addtime], [content]) VALUES (N'1', N'2025-07-09 10:33:52', N'公告信息...')
GO


-- ----------------------------
-- Table structure for tijianbaogao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tijianbaogao]') AND type IN ('U'))
	DROP TABLE [dbo].[tijianbaogao]
GO

CREATE TABLE [dbo].[tijianbaogao] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [tijianxiangmu] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianleixing] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijiandidian] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianfeiyong] int  NULL,
  [yonghuzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yonghuxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigouzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigoumingcheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [baogaoxiangqing] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [baogaoshijian] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[tijianbaogao] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检项目',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'tijianxiangmu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检类型',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'tijianleixing'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检地点',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'tijiandidian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检费用',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'tijianfeiyong'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'yonghuzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'yonghuxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构账号',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'jigouzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'jigoumingcheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'报告详情',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'baogaoxiangqing'
GO

EXEC sp_addextendedproperty
'MS_Description', N'报告时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao',
'COLUMN', N'baogaoshijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检报告',
'SCHEMA', N'dbo',
'TABLE', N'tijianbaogao'
GO


-- ----------------------------
-- Records of tijianbaogao
-- ----------------------------
INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'1', N'2025-07-09 10:33:52', N'体检项目1', N'体检类型1', N'体检地点1', N'1', N'用户账号1', N'用户姓名1', N'机构账号1', N'机构名称1', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'2', N'2025-07-09 10:33:52', N'体检项目2', N'体检类型2', N'体检地点2', N'2', N'用户账号2', N'用户姓名2', N'机构账号2', N'机构名称2', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'3', N'2025-07-09 10:33:52', N'体检项目3', N'体检类型3', N'体检地点3', N'3', N'用户账号3', N'用户姓名3', N'机构账号3', N'机构名称3', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'4', N'2025-07-09 10:33:52', N'体检项目4', N'体检类型4', N'体检地点4', N'4', N'用户账号4', N'用户姓名4', N'机构账号4', N'机构名称4', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'5', N'2025-07-09 10:33:52', N'体检项目5', N'体检类型5', N'体检地点5', N'5', N'用户账号5', N'用户姓名5', N'机构账号5', N'机构名称5', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'6', N'2025-07-09 10:33:52', N'体检项目6', N'体检类型6', N'体检地点6', N'6', N'用户账号6', N'用户姓名6', N'机构账号6', N'机构名称6', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'7', N'2025-07-09 10:33:52', N'体检项目7', N'体检类型7', N'体检地点7', N'7', N'用户账号7', N'用户姓名7', N'机构账号7', N'机构名称7', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'8', N'2025-07-09 10:33:52', N'体检项目8', N'体检类型8', N'体检地点8', N'8', N'用户账号8', N'用户姓名8', N'机构账号8', N'机构名称8', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'9', N'2025-07-09 10:33:52', N'体检项目9', N'体检类型9', N'体检地点9', N'9', N'用户账号9', N'用户姓名9', N'机构账号9', N'机构名称9', N'', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianbaogao] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [baogaoxiangqing], [baogaoshijian]) VALUES (N'10', N'2025-07-09 10:33:52', N'体检项目10', N'体检类型10', N'体检地点10', N'10', N'用户账号10', N'用户姓名10', N'机构账号10', N'机构名称10', N'', N'2025-07-09 10:33:52')
GO


-- ----------------------------
-- Table structure for tijianleixing
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tijianleixing]') AND type IN ('U'))
	DROP TABLE [dbo].[tijianleixing]
GO

CREATE TABLE [dbo].[tijianleixing] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [tijianleixing] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[tijianleixing] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'tijianleixing',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianleixing',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检类型',
'SCHEMA', N'dbo',
'TABLE', N'tijianleixing',
'COLUMN', N'tijianleixing'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检类型',
'SCHEMA', N'dbo',
'TABLE', N'tijianleixing'
GO


-- ----------------------------
-- Records of tijianleixing
-- ----------------------------
INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'1', N'2025-07-09 10:33:51', N'体检类型1')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'2', N'2025-07-09 10:33:51', N'体检类型2')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'3', N'2025-07-09 10:33:52', N'体检类型3')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'4', N'2025-07-09 10:33:52', N'体检类型4')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'5', N'2025-07-09 10:33:52', N'体检类型5')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'6', N'2025-07-09 10:33:52', N'体检类型6')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'7', N'2025-07-09 10:33:52', N'体检类型7')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'8', N'2025-07-09 10:33:52', N'体检类型8')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'9', N'2025-07-09 10:33:52', N'体检类型9')
GO

INSERT INTO [dbo].[tijianleixing] ([id], [addtime], [tijianleixing]) VALUES (N'10', N'2025-07-09 10:33:52', N'体检类型10')
GO


-- ----------------------------
-- Table structure for tijianxiangmu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tijianxiangmu]') AND type IN ('U'))
	DROP TABLE [dbo].[tijianxiangmu]
GO

CREATE TABLE [dbo].[tijianxiangmu] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [tijianxiangmu] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianleixing] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijiantupian] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijiandidian] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [keyuerenshu] int  NULL,
  [tijianfeiyong] float(53)  NULL,
  [tijianliucheng] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [fabushijian] datetime2(0)  NULL,
  [jigouzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigoumingcheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [sfsh] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [shhf] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [storeup_number] int  NULL,
  [clicktime] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[tijianxiangmu] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检项目',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'tijianxiangmu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检类型',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'tijianleixing'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检图片',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'tijiantupian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检地点',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'tijiandidian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'可约人数',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'keyuerenshu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检费用',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'tijianfeiyong'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检流程',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'tijianliucheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'fabushijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构账号',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'jigouzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'jigoumingcheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否审核',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'sfsh'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回复内容',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'shhf'
GO

EXEC sp_addextendedproperty
'MS_Description', N'收藏数',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'storeup_number'
GO

EXEC sp_addextendedproperty
'MS_Description', N'最近点击时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu',
'COLUMN', N'clicktime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检项目',
'SCHEMA', N'dbo',
'TABLE', N'tijianxiangmu'
GO


-- ----------------------------
-- Records of tijianxiangmu
-- ----------------------------
INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'1', N'2025-07-09 10:33:52', N'体检项目1', N'体检类型1', N'file/tijianxiangmuTijiantupian1.jpg,file/tijianxiangmuTijiantupian2.jpg,file/tijianxiangmuTijiantupian3.jpg', N'体检地点1', N'1', N'1', N'体检流程1', N'2025-07-09 10:33:52', N'机构账号1', N'机构名称1', N'是', N'', N'1', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'2', N'2025-07-09 10:33:52', N'体检项目2', N'体检类型2', N'file/tijianxiangmuTijiantupian2.jpg,file/tijianxiangmuTijiantupian3.jpg,file/tijianxiangmuTijiantupian4.jpg', N'体检地点2', N'2', N'2', N'体检流程2', N'2025-07-09 10:33:52', N'机构账号2', N'机构名称2', N'是', N'', N'2', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'3', N'2025-07-09 10:33:52', N'体检项目3', N'体检类型3', N'file/tijianxiangmuTijiantupian3.jpg,file/tijianxiangmuTijiantupian4.jpg,file/tijianxiangmuTijiantupian5.jpg', N'体检地点3', N'3', N'3', N'体检流程3', N'2025-07-09 10:33:52', N'机构账号3', N'机构名称3', N'是', N'', N'3', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'4', N'2025-07-09 10:33:52', N'体检项目4', N'体检类型4', N'file/tijianxiangmuTijiantupian4.jpg,file/tijianxiangmuTijiantupian5.jpg,file/tijianxiangmuTijiantupian6.jpg', N'体检地点4', N'4', N'4', N'体检流程4', N'2025-07-09 10:33:52', N'机构账号4', N'机构名称4', N'是', N'', N'4', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'5', N'2025-07-09 10:33:52', N'体检项目5', N'体检类型5', N'file/tijianxiangmuTijiantupian5.jpg,file/tijianxiangmuTijiantupian6.jpg,file/tijianxiangmuTijiantupian7.jpg', N'体检地点5', N'5', N'5', N'体检流程5', N'2025-07-09 10:33:52', N'机构账号5', N'机构名称5', N'是', N'', N'5', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'6', N'2025-07-09 10:33:52', N'体检项目6', N'体检类型6', N'file/tijianxiangmuTijiantupian6.jpg,file/tijianxiangmuTijiantupian7.jpg,file/tijianxiangmuTijiantupian8.jpg', N'体检地点6', N'6', N'6', N'体检流程6', N'2025-07-09 10:33:52', N'机构账号6', N'机构名称6', N'是', N'', N'6', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'7', N'2025-07-09 10:33:52', N'体检项目7', N'体检类型7', N'file/tijianxiangmuTijiantupian7.jpg,file/tijianxiangmuTijiantupian8.jpg,file/tijianxiangmuTijiantupian9.jpg', N'体检地点7', N'7', N'7', N'体检流程7', N'2025-07-09 10:33:52', N'机构账号7', N'机构名称7', N'是', N'', N'7', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'8', N'2025-07-09 10:33:52', N'体检项目8', N'体检类型8', N'file/tijianxiangmuTijiantupian8.jpg,file/tijianxiangmuTijiantupian9.jpg,file/tijianxiangmuTijiantupian10.jpg', N'体检地点8', N'8', N'8', N'体检流程8', N'2025-07-09 10:33:52', N'机构账号8', N'机构名称8', N'是', N'', N'8', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'9', N'2025-07-09 10:33:52', N'体检项目9', N'体检类型9', N'file/tijianxiangmuTijiantupian9.jpg,file/tijianxiangmuTijiantupian10.jpg,file/tijianxiangmuTijiantupian11.jpg', N'体检地点9', N'9', N'9', N'体检流程9', N'2025-07-09 10:33:52', N'机构账号9', N'机构名称9', N'是', N'', N'9', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxiangmu] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiantupian], [tijiandidian], [keyuerenshu], [tijianfeiyong], [tijianliucheng], [fabushijian], [jigouzhanghao], [jigoumingcheng], [sfsh], [shhf], [storeup_number], [clicktime]) VALUES (N'10', N'2025-07-09 10:33:52', N'体检项目10', N'体检类型10', N'file/tijianxiangmuTijiantupian10.jpg,file/tijianxiangmuTijiantupian11.jpg,file/tijianxiangmuTijiantupian12.jpg', N'体检地点10', N'10', N'10', N'体检流程10', N'2025-07-09 10:33:52', N'机构账号10', N'机构名称10', N'是', N'', N'10', N'2025-07-09 10:33:52')
GO


-- ----------------------------
-- Table structure for tijianxinxi
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tijianxinxi]') AND type IN ('U'))
	DROP TABLE [dbo].[tijianxinxi]
GO

CREATE TABLE [dbo].[tijianxinxi] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [tijianxiangmu] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianleixing] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijiandidian] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianfeiyong] int  NULL,
  [yonghuzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yonghuxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigouzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigoumingcheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianshijian] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[tijianxinxi] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检项目',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'tijianxiangmu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检类型',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'tijianleixing'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检地点',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'tijiandidian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检费用',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'tijianfeiyong'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'yonghuzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'yonghuxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构账号',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'jigouzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'jigoumingcheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi',
'COLUMN', N'tijianshijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检信息',
'SCHEMA', N'dbo',
'TABLE', N'tijianxinxi'
GO


-- ----------------------------
-- Records of tijianxinxi
-- ----------------------------
INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'1', N'2025-07-09 10:33:52', N'体检项目1', N'体检类型1', N'体检地点1', N'1', N'用户账号1', N'用户姓名1', N'机构账号1', N'机构名称1', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'2', N'2025-07-09 10:33:52', N'体检项目2', N'体检类型2', N'体检地点2', N'2', N'用户账号2', N'用户姓名2', N'机构账号2', N'机构名称2', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'3', N'2025-07-09 10:33:52', N'体检项目3', N'体检类型3', N'体检地点3', N'3', N'用户账号3', N'用户姓名3', N'机构账号3', N'机构名称3', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'4', N'2025-07-09 10:33:52', N'体检项目4', N'体检类型4', N'体检地点4', N'4', N'用户账号4', N'用户姓名4', N'机构账号4', N'机构名称4', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'5', N'2025-07-09 10:33:52', N'体检项目5', N'体检类型5', N'体检地点5', N'5', N'用户账号5', N'用户姓名5', N'机构账号5', N'机构名称5', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'6', N'2025-07-09 10:33:52', N'体检项目6', N'体检类型6', N'体检地点6', N'6', N'用户账号6', N'用户姓名6', N'机构账号6', N'机构名称6', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'7', N'2025-07-09 10:33:52', N'体检项目7', N'体检类型7', N'体检地点7', N'7', N'用户账号7', N'用户姓名7', N'机构账号7', N'机构名称7', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'8', N'2025-07-09 10:33:52', N'体检项目8', N'体检类型8', N'体检地点8', N'8', N'用户账号8', N'用户姓名8', N'机构账号8', N'机构名称8', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'9', N'2025-07-09 10:33:52', N'体检项目9', N'体检类型9', N'体检地点9', N'9', N'用户账号9', N'用户姓名9', N'机构账号9', N'机构名称9', N'2025-07-09 10:33:52')
GO

INSERT INTO [dbo].[tijianxinxi] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [tijianshijian]) VALUES (N'10', N'2025-07-09 10:33:52', N'体检项目10', N'体检类型10', N'体检地点10', N'10', N'用户账号10', N'用户姓名10', N'机构账号10', N'机构名称10', N'2025-07-09 10:33:52')
GO


-- ----------------------------
-- Table structure for tijianyuyue
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tijianyuyue]') AND type IN ('U'))
	DROP TABLE [dbo].[tijianyuyue]
GO

CREATE TABLE [dbo].[tijianyuyue] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [tijianxiangmu] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianleixing] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijiandidian] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianfeiyong] int  NULL,
  [keyuerenshu] int  NOT NULL,
  [yuyueshijian] datetime2(0)  NULL,
  [yonghuzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yonghuxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigouzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigoumingcheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [ispay] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tijianzhuangtai] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yuyuexiangqing] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[tijianyuyue] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检项目',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'tijianxiangmu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检类型',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'tijianleixing'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检地点',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'tijiandidian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检费用',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'tijianfeiyong'
GO

EXEC sp_addextendedproperty
'MS_Description', N'预约数',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'keyuerenshu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'预约时间',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'yuyueshijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'yonghuzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'yonghuxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构账号',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'jigouzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'jigoumingcheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否支付',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'ispay'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检状态',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'tijianzhuangtai'
GO

EXEC sp_addextendedproperty
'MS_Description', N'预约详情',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue',
'COLUMN', N'yuyuexiangqing'
GO

EXEC sp_addextendedproperty
'MS_Description', N'体检预约',
'SCHEMA', N'dbo',
'TABLE', N'tijianyuyue'
GO


-- ----------------------------
-- Records of tijianyuyue
-- ----------------------------
INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'1', N'2025-07-09 10:33:52', N'体检项目1', N'体检类型1', N'体检地点1', N'1', N'1', N'2025-07-09 10:33:52', N'用户账号1', N'用户姓名1', N'机构账号1', N'机构名称1', N'未支付', N'已体检', N'预约详情1')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'2', N'2025-07-09 10:33:52', N'体检项目2', N'体检类型2', N'体检地点2', N'2', N'2', N'2025-07-09 10:33:52', N'用户账号2', N'用户姓名2', N'机构账号2', N'机构名称2', N'未支付', N'已体检', N'预约详情2')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'3', N'2025-07-09 10:33:52', N'体检项目3', N'体检类型3', N'体检地点3', N'3', N'3', N'2025-07-09 10:33:52', N'用户账号3', N'用户姓名3', N'机构账号3', N'机构名称3', N'未支付', N'已体检', N'预约详情3')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'4', N'2025-07-09 10:33:52', N'体检项目4', N'体检类型4', N'体检地点4', N'4', N'4', N'2025-07-09 10:33:52', N'用户账号4', N'用户姓名4', N'机构账号4', N'机构名称4', N'未支付', N'已体检', N'预约详情4')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'5', N'2025-07-09 10:33:52', N'体检项目5', N'体检类型5', N'体检地点5', N'5', N'5', N'2025-07-09 10:33:52', N'用户账号5', N'用户姓名5', N'机构账号5', N'机构名称5', N'未支付', N'已体检', N'预约详情5')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'6', N'2025-07-09 10:33:52', N'体检项目6', N'体检类型6', N'体检地点6', N'6', N'6', N'2025-07-09 10:33:52', N'用户账号6', N'用户姓名6', N'机构账号6', N'机构名称6', N'未支付', N'已体检', N'预约详情6')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'7', N'2025-07-09 10:33:52', N'体检项目7', N'体检类型7', N'体检地点7', N'7', N'7', N'2025-07-09 10:33:52', N'用户账号7', N'用户姓名7', N'机构账号7', N'机构名称7', N'未支付', N'已体检', N'预约详情7')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'8', N'2025-07-09 10:33:52', N'体检项目8', N'体检类型8', N'体检地点8', N'8', N'8', N'2025-07-09 10:33:52', N'用户账号8', N'用户姓名8', N'机构账号8', N'机构名称8', N'未支付', N'已体检', N'预约详情8')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'9', N'2025-07-09 10:33:52', N'体检项目9', N'体检类型9', N'体检地点9', N'9', N'9', N'2025-07-09 10:33:52', N'用户账号9', N'用户姓名9', N'机构账号9', N'机构名称9', N'未支付', N'已体检', N'预约详情9')
GO

INSERT INTO [dbo].[tijianyuyue] ([id], [addtime], [tijianxiangmu], [tijianleixing], [tijiandidian], [tijianfeiyong], [keyuerenshu], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [jigouzhanghao], [jigoumingcheng], [ispay], [tijianzhuangtai], [yuyuexiangqing]) VALUES (N'10', N'2025-07-09 10:33:52', N'体检项目10', N'体检类型10', N'体检地点10', N'10', N'10', N'2025-07-09 10:33:52', N'用户账号10', N'用户姓名10', N'机构账号10', N'机构名称10', N'未支付', N'已体检', N'预约详情10')
GO


-- ----------------------------
-- Table structure for users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type IN ('U'))
	DROP TABLE [dbo].[users]
GO

CREATE TABLE [dbo].[users] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [username] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [password] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [role] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [tupian] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[users] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'users',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'users',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名',
'SCHEMA', N'dbo',
'TABLE', N'users',
'COLUMN', N'username'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'users',
'COLUMN', N'password'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色',
'SCHEMA', N'dbo',
'TABLE', N'users',
'COLUMN', N'role'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'users',
'COLUMN', N'tupian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'管理员',
'SCHEMA', N'dbo',
'TABLE', N'users'
GO


-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO [dbo].[users] ([id], [addtime], [username], [password], [role], [tupian]) VALUES (N'1', N'2025-07-09 10:33:52', N'admin', N'admin', N'管理员', NULL)
GO


-- ----------------------------
-- Table structure for yiliaojigou
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[yiliaojigou]') AND type IN ('U'))
	DROP TABLE [dbo].[yiliaojigou]
GO

CREATE TABLE [dbo].[yiliaojigou] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [jigouzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [mima] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [jigoumingcheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [touxiang] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [lianxidianhua] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [sfsh] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [shhf] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[yiliaojigou] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构账号',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'jigouzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'mima'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'jigoumingcheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'营业执照',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'touxiang'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系电话',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'lianxidianhua'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否审核',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'sfsh'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回复内容',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou',
'COLUMN', N'shhf'
GO

EXEC sp_addextendedproperty
'MS_Description', N'医疗机构',
'SCHEMA', N'dbo',
'TABLE', N'yiliaojigou'
GO


-- ----------------------------
-- Records of yiliaojigou
-- ----------------------------
INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'51', N'2025-07-09 10:33:51', N'机构账号1', N'123456', N'机构名称1', N'file/yiliaojigouTouxiang1.jpg', N'19819881111', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'52', N'2025-07-09 10:33:51', N'机构账号2', N'123456', N'机构名称2', N'file/yiliaojigouTouxiang2.jpg', N'19819881112', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'53', N'2025-07-09 10:33:51', N'机构账号3', N'123456', N'机构名称3', N'file/yiliaojigouTouxiang3.jpg', N'19819881113', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'54', N'2025-07-09 10:33:51', N'机构账号4', N'123456', N'机构名称4', N'file/yiliaojigouTouxiang4.jpg', N'19819881114', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'55', N'2025-07-09 10:33:51', N'机构账号5', N'123456', N'机构名称5', N'file/yiliaojigouTouxiang5.jpg', N'19819881115', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'56', N'2025-07-09 10:33:51', N'机构账号6', N'123456', N'机构名称6', N'file/yiliaojigouTouxiang6.jpg', N'19819881116', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'57', N'2025-07-09 10:33:51', N'机构账号7', N'123456', N'机构名称7', N'file/yiliaojigouTouxiang7.jpg', N'19819881117', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'58', N'2025-07-09 10:33:51', N'机构账号8', N'123456', N'机构名称8', N'file/yiliaojigouTouxiang8.jpg', N'19819881118', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'59', N'2025-07-09 10:33:51', N'机构账号9', N'123456', N'机构名称9', N'file/yiliaojigouTouxiang9.jpg', N'19819881119', N'是', N'')
GO

INSERT INTO [dbo].[yiliaojigou] ([id], [addtime], [jigouzhanghao], [mima], [jigoumingcheng], [touxiang], [lianxidianhua], [sfsh], [shhf]) VALUES (N'60', N'2025-07-09 10:33:51', N'机构账号10', N'123456', N'机构名称10', N'file/yiliaojigouTouxiang10.jpg', N'198198811110', N'是', N'')
GO


-- ----------------------------
-- Table structure for yishengzuozhen
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[yishengzuozhen]') AND type IN ('U'))
	DROP TABLE [dbo].[yishengzuozhen]
GO

CREATE TABLE [dbo].[yishengzuozhen] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [touxiang] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [yishenggonghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yishengxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [xingbie] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [zhicheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [keshi] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [shanzhanglingyu] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [lianxifangshi] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [zuozhenshijian] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [guahaofei] float(53)  NULL,
  [keguashuliang] int  NULL,
  [jigouzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigoumingcheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[yishengzuozhen] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'头像',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'touxiang'
GO

EXEC sp_addextendedproperty
'MS_Description', N'医生工号',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'yishenggonghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'医生姓名',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'yishengxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'xingbie'
GO

EXEC sp_addextendedproperty
'MS_Description', N'职称',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'zhicheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'科室',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'keshi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'擅长领域',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'shanzhanglingyu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系方式',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'lianxifangshi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'坐诊时间',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'zuozhenshijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'挂号费',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'guahaofei'
GO

EXEC sp_addextendedproperty
'MS_Description', N'可挂数量',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'keguashuliang'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构账号',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'jigouzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen',
'COLUMN', N'jigoumingcheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'医生坐诊',
'SCHEMA', N'dbo',
'TABLE', N'yishengzuozhen'
GO


-- ----------------------------
-- Records of yishengzuozhen
-- ----------------------------
INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'1', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang1.jpg,file/yishengzuozhenTouxiang2.jpg,file/yishengzuozhenTouxiang3.jpg', N'医生工号1', N'医生姓名1', N'男', N'职称1', N'科室1', N'擅长领域1', N'联系方式1', N'坐诊时间1', N'1', N'1', N'机构账号1', N'机构名称1')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'2', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang2.jpg,file/yishengzuozhenTouxiang3.jpg,file/yishengzuozhenTouxiang4.jpg', N'医生工号2', N'医生姓名2', N'男', N'职称2', N'科室2', N'擅长领域2', N'联系方式2', N'坐诊时间2', N'2', N'2', N'机构账号2', N'机构名称2')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'3', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang3.jpg,file/yishengzuozhenTouxiang4.jpg,file/yishengzuozhenTouxiang5.jpg', N'医生工号3', N'医生姓名3', N'男', N'职称3', N'科室3', N'擅长领域3', N'联系方式3', N'坐诊时间3', N'3', N'3', N'机构账号3', N'机构名称3')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'4', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang4.jpg,file/yishengzuozhenTouxiang5.jpg,file/yishengzuozhenTouxiang6.jpg', N'医生工号4', N'医生姓名4', N'男', N'职称4', N'科室4', N'擅长领域4', N'联系方式4', N'坐诊时间4', N'4', N'4', N'机构账号4', N'机构名称4')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'5', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang5.jpg,file/yishengzuozhenTouxiang6.jpg,file/yishengzuozhenTouxiang7.jpg', N'医生工号5', N'医生姓名5', N'男', N'职称5', N'科室5', N'擅长领域5', N'联系方式5', N'坐诊时间5', N'5', N'5', N'机构账号5', N'机构名称5')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'6', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang6.jpg,file/yishengzuozhenTouxiang7.jpg,file/yishengzuozhenTouxiang8.jpg', N'医生工号6', N'医生姓名6', N'男', N'职称6', N'科室6', N'擅长领域6', N'联系方式6', N'坐诊时间6', N'6', N'6', N'机构账号6', N'机构名称6')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'7', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang7.jpg,file/yishengzuozhenTouxiang8.jpg,file/yishengzuozhenTouxiang9.jpg', N'医生工号7', N'医生姓名7', N'男', N'职称7', N'科室7', N'擅长领域7', N'联系方式7', N'坐诊时间7', N'7', N'7', N'机构账号7', N'机构名称7')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'8', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang8.jpg,file/yishengzuozhenTouxiang9.jpg,file/yishengzuozhenTouxiang10.jpg', N'医生工号8', N'医生姓名8', N'男', N'职称8', N'科室8', N'擅长领域8', N'联系方式8', N'坐诊时间8', N'8', N'8', N'机构账号8', N'机构名称8')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'9', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang9.jpg,file/yishengzuozhenTouxiang10.jpg,file/yishengzuozhenTouxiang11.jpg', N'医生工号9', N'医生姓名9', N'男', N'职称9', N'科室9', N'擅长领域9', N'联系方式9', N'坐诊时间9', N'9', N'9', N'机构账号9', N'机构名称9')
GO

INSERT INTO [dbo].[yishengzuozhen] ([id], [addtime], [touxiang], [yishenggonghao], [yishengxingming], [xingbie], [zhicheng], [keshi], [shanzhanglingyu], [lianxifangshi], [zuozhenshijian], [guahaofei], [keguashuliang], [jigouzhanghao], [jigoumingcheng]) VALUES (N'10', N'2025-07-09 10:33:52', N'file/yishengzuozhenTouxiang10.jpg,file/yishengzuozhenTouxiang11.jpg,file/yishengzuozhenTouxiang12.jpg', N'医生工号10', N'医生姓名10', N'男', N'职称10', N'科室10', N'擅长领域10', N'联系方式10', N'坐诊时间10', N'10', N'10', N'机构账号10', N'机构名称10')
GO


-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[yonghu]') AND type IN ('U'))
	DROP TABLE [dbo].[yonghu]
GO

CREATE TABLE [dbo].[yonghu] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [yonghuzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [yonghumima] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [yonghuxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [touxiang] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [xingbie] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [shoujihaoma] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [nianling] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [zhuzhi] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[yonghu] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'yonghuzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户密码',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'yonghumima'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'yonghuxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'头像',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'touxiang'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'xingbie'
GO

EXEC sp_addextendedproperty
'MS_Description', N'手机号码',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'shoujihaoma'
GO

EXEC sp_addextendedproperty
'MS_Description', N'年龄',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'nianling'
GO

EXEC sp_addextendedproperty
'MS_Description', N'住址',
'SCHEMA', N'dbo',
'TABLE', N'yonghu',
'COLUMN', N'zhuzhi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户',
'SCHEMA', N'dbo',
'TABLE', N'yonghu'
GO


-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'41', N'2025-07-09 10:33:51', N'用户账号1', N'123456', N'用户姓名1', N'file/yonghuTouxiang1.jpg', N'男', N'19819881111', N'年龄1', N'住址1')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'42', N'2025-07-09 10:33:51', N'用户账号2', N'123456', N'用户姓名2', N'file/yonghuTouxiang2.jpg', N'男', N'19819881112', N'年龄2', N'住址2')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'43', N'2025-07-09 10:33:51', N'用户账号3', N'123456', N'用户姓名3', N'file/yonghuTouxiang3.jpg', N'男', N'19819881113', N'年龄3', N'住址3')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'44', N'2025-07-09 10:33:51', N'用户账号4', N'123456', N'用户姓名4', N'file/yonghuTouxiang4.jpg', N'男', N'19819881114', N'年龄4', N'住址4')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'45', N'2025-07-09 10:33:51', N'用户账号5', N'123456', N'用户姓名5', N'file/yonghuTouxiang5.jpg', N'男', N'19819881115', N'年龄5', N'住址5')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'46', N'2025-07-09 10:33:51', N'用户账号6', N'123456', N'用户姓名6', N'file/yonghuTouxiang6.jpg', N'男', N'19819881116', N'年龄6', N'住址6')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'47', N'2025-07-09 10:33:51', N'用户账号7', N'123456', N'用户姓名7', N'file/yonghuTouxiang7.jpg', N'男', N'19819881117', N'年龄7', N'住址7')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'48', N'2025-07-09 10:33:51', N'用户账号8', N'123456', N'用户姓名8', N'file/yonghuTouxiang8.jpg', N'男', N'19819881118', N'年龄8', N'住址8')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'49', N'2025-07-09 10:33:51', N'用户账号9', N'123456', N'用户姓名9', N'file/yonghuTouxiang9.jpg', N'男', N'19819881119', N'年龄9', N'住址9')
GO

INSERT INTO [dbo].[yonghu] ([id], [addtime], [yonghuzhanghao], [yonghumima], [yonghuxingming], [touxiang], [xingbie], [shoujihaoma], [nianling], [zhuzhi]) VALUES (N'50', N'2025-07-09 10:33:51', N'用户账号10', N'123456', N'用户姓名10', N'file/yonghuTouxiang10.jpg', N'男', N'198198811110', N'年龄10', N'住址10')
GO


-- ----------------------------
-- Table structure for yuyueguahao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[yuyueguahao]') AND type IN ('U'))
	DROP TABLE [dbo].[yuyueguahao]
GO

CREATE TABLE [dbo].[yuyueguahao] (
  [id] [bigint]  primary key,
  [addtime] datetime2(0) DEFAULT (getdate()) NULL,
  [yuyuebianhao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yishenggonghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yishengxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [guahaofei] float(53)  NULL,
  [keguashuliang] int  NULL,
  [yuyueshijian] datetime2(0)  NULL,
  [yonghuzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [yonghuxingming] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [ispay] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jiwangbingshi] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigouzhanghao] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [jigoumingcheng] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[yuyueguahao] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'预约编号',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'yuyuebianhao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'医生工号',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'yishenggonghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'医生姓名',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'yishengxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'挂号费',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'guahaofei'
GO

EXEC sp_addextendedproperty
'MS_Description', N'挂号数',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'keguashuliang'
GO

EXEC sp_addextendedproperty
'MS_Description', N'预约时间',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'yuyueshijian'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户账号',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'yonghuzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'yonghuxingming'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否支付',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'ispay'
GO

EXEC sp_addextendedproperty
'MS_Description', N'既往病史',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'jiwangbingshi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构账号',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'jigouzhanghao'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao',
'COLUMN', N'jigoumingcheng'
GO

EXEC sp_addextendedproperty
'MS_Description', N'预约挂号',
'SCHEMA', N'dbo',
'TABLE', N'yuyueguahao'
GO


-- ----------------------------
-- Records of yuyueguahao
-- ----------------------------
INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'1', N'2025-07-09 10:33:52', N'1111111111', N'医生工号1', N'医生姓名1', N'1', N'1', N'2025-07-09 10:33:52', N'用户账号1', N'用户姓名1', N'未支付', N'既往病史1', N'机构账号1', N'机构名称1')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'2', N'2025-07-09 10:33:52', N'2222222222', N'医生工号2', N'医生姓名2', N'2', N'2', N'2025-07-09 10:33:52', N'用户账号2', N'用户姓名2', N'未支付', N'既往病史2', N'机构账号2', N'机构名称2')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'3', N'2025-07-09 10:33:52', N'3333333333', N'医生工号3', N'医生姓名3', N'3', N'3', N'2025-07-09 10:33:52', N'用户账号3', N'用户姓名3', N'未支付', N'既往病史3', N'机构账号3', N'机构名称3')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'4', N'2025-07-09 10:33:52', N'4444444444', N'医生工号4', N'医生姓名4', N'4', N'4', N'2025-07-09 10:33:52', N'用户账号4', N'用户姓名4', N'未支付', N'既往病史4', N'机构账号4', N'机构名称4')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'5', N'2025-07-09 10:33:52', N'5555555555', N'医生工号5', N'医生姓名5', N'5', N'5', N'2025-07-09 10:33:52', N'用户账号5', N'用户姓名5', N'未支付', N'既往病史5', N'机构账号5', N'机构名称5')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'6', N'2025-07-09 10:33:52', N'6666666666', N'医生工号6', N'医生姓名6', N'6', N'6', N'2025-07-09 10:33:52', N'用户账号6', N'用户姓名6', N'未支付', N'既往病史6', N'机构账号6', N'机构名称6')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'7', N'2025-07-09 10:33:52', N'7777777777', N'医生工号7', N'医生姓名7', N'7', N'7', N'2025-07-09 10:33:52', N'用户账号7', N'用户姓名7', N'未支付', N'既往病史7', N'机构账号7', N'机构名称7')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'8', N'2025-07-09 10:33:52', N'8888888888', N'医生工号8', N'医生姓名8', N'8', N'8', N'2025-07-09 10:33:52', N'用户账号8', N'用户姓名8', N'未支付', N'既往病史8', N'机构账号8', N'机构名称8')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'9', N'2025-07-09 10:33:52', N'9999999999', N'医生工号9', N'医生姓名9', N'9', N'9', N'2025-07-09 10:33:52', N'用户账号9', N'用户姓名9', N'未支付', N'既往病史9', N'机构账号9', N'机构名称9')
GO

INSERT INTO [dbo].[yuyueguahao] ([id], [addtime], [yuyuebianhao], [yishenggonghao], [yishengxingming], [guahaofei], [keguashuliang], [yuyueshijian], [yonghuzhanghao], [yonghuxingming], [ispay], [jiwangbingshi], [jigouzhanghao], [jigoumingcheng]) VALUES (N'10', N'2025-07-09 10:33:52', N'11111111110', N'医生工号10', N'医生姓名10', N'10', N'10', N'2025-07-09 10:33:52', N'用户账号10', N'用户姓名10', N'未支付', N'既往病史10', N'机构账号10', N'机构名称10')
GO


-- ----------------------------
-- Primary Key structure for table chat
-- ----------------------------
ALTER TABLE [dbo].[chat] ADD CONSTRAINT [PK__chat__3213E83F4F7CD00D] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table chathelper
-- ----------------------------
ALTER TABLE [dbo].[chathelper] ADD CONSTRAINT [PK__chathelp__3213E83F5441852A] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table config
-- ----------------------------
ALTER TABLE [dbo].[config] ADD CONSTRAINT [PK__config__3213E83F59063A47] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table jiankangshuju
-- ----------------------------
ALTER TABLE [dbo].[jiankangshuju] ADD CONSTRAINT [PK__jiankang__3213E83F5DCAEF64] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table keshi
-- ----------------------------
ALTER TABLE [dbo].[keshi] ADD CONSTRAINT [PK__keshi__3213E83F628FA481] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE [dbo].[menu] ADD CONSTRAINT [PK__menu__3213E83F6754599E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table news
-- ----------------------------
ALTER TABLE [dbo].[news] ADD CONSTRAINT [PK__news__3213E83F6C190EBB] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table popup_remind
-- ----------------------------
ALTER TABLE [dbo].[popup_remind] ADD CONSTRAINT [PK__popup_re__3213E83F70DDC3D8] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table quxiaoyuyue
-- ----------------------------
ALTER TABLE [dbo].[quxiaoyuyue] ADD CONSTRAINT [PK__quxiaoyu__3213E83F75A278F5] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table storeup
-- ----------------------------
ALTER TABLE [dbo].[storeup] ADD CONSTRAINT [PK__storeup__3213E83F7A672E12] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table system_notice
-- ----------------------------
ALTER TABLE [dbo].[system_notice] ADD CONSTRAINT [PK__system_n__3213E83F7F2BE32F] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tijianbaogao
-- ----------------------------
ALTER TABLE [dbo].[tijianbaogao] ADD CONSTRAINT [PK__tijianba__3213E83F03F0984C] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tijianleixing
-- ----------------------------
ALTER TABLE [dbo].[tijianleixing] ADD CONSTRAINT [PK__tijianle__3213E83F08B54D69] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tijianxiangmu
-- ----------------------------
ALTER TABLE [dbo].[tijianxiangmu] ADD CONSTRAINT [PK__tijianxi__3213E83F0D7A0286] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tijianxinxi
-- ----------------------------
ALTER TABLE [dbo].[tijianxinxi] ADD CONSTRAINT [PK__tijianxi__3213E83F123EB7A3] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tijianyuyue
-- ----------------------------
ALTER TABLE [dbo].[tijianyuyue] ADD CONSTRAINT [PK__tijianyu__3213E83F17036CC0] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE [dbo].[users] ADD CONSTRAINT [PK__users__3213E83F1BC821DD] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table yiliaojigou
-- ----------------------------
ALTER TABLE [dbo].[yiliaojigou] ADD CONSTRAINT [PK__yiliaoji__3213E83F208CD6FA] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table yishengzuozhen
-- ----------------------------
ALTER TABLE [dbo].[yishengzuozhen] ADD CONSTRAINT [PK__yishengz__3213E83F25518C17] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table yonghu
-- ----------------------------
ALTER TABLE [dbo].[yonghu] ADD CONSTRAINT [PK__yonghu__3213E83F2A164134] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table yuyueguahao
-- ----------------------------
ALTER TABLE [dbo].[yuyueguahao] ADD CONSTRAINT [PK__yuyuegua__3213E83F2EDAF651] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


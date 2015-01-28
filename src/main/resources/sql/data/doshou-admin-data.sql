truncate table `sys_user`;
/*默认admin/123456*/
insert into `sys_user`
(`id`,`username`,`email`,`mobile_phone_number`,`password`,`salt`,`create_date`,`status`,`deleted`,`admin`)
values
(1,'admin','admin@doshou.me','13412345671','ec21fa1738f39d5312c6df46002d403d','yDd1956wn1',sysdate(),'normal',0,1);

truncate table `sys_organization`;
insert into `sys_organization`(`id`, `parent_id`, `parent_ids`, weight, `name`, `is_show`) values (1, 0, '0/', 1, '组织机构', true);

truncate table `sys_job`;
insert into `sys_job`(`id`, `parent_id`, `parent_ids`, weight, `name`, `is_show`) values (1, 0, '0/', 1, '职务', true);

truncate table `sys_resource`;
insert into `sys_resource`(`id`, `parent_id`, `parent_ids`, weight, `name`, `identity`, `icon`, `url`, `is_show`) values
(1, 0, '0/', 1, '资源', '', '', '', 1),
(2, 1, '0/1/', 2, '系统管理', 'sys', 'fa-puzzle-piece', '', 1),
(3, 2, '0/1/2/', 1, '用户管理', '', 'fa-users', '', 1),
(4, 3, '0/1/2/3/', 1, '用户列表', 'user', '', '/admin/sys/user/main', 1),
(5, 3, '0/1/2/3/', 2, '在线用户列表', 'userOnline', '', '/admin/sys/user/online', 1),
(6, 3, '0/1/2/3/', 3, '状态变更历史列表', 'userStatusHistory', '', '/admin/sys/user/statusHistory', 1),
(7, 3, '0/1/2/3/', 4, '用户最后在线历史列表', 'userLastOnline', '', '/admin/sys/user/lastOnline', 1),
(8, 2, '0/1/2/', 2, '组织机构管理', '', 'fa-sitemap', '', 1),
(9, 8, '0/1/2/8/', 1, '组织机构列表', 'organization', '', '/admin/sys/organization/organization', 1),
(10, 8, '0/1/2/8/', 2, '工作职务列表', 'job', '', '/admin/sys/organization/job', 1),
(11, 2, '0/1/2/', 3, '分组列表', 'group', '', '/admin/sys/group', 1),
(12, 2, '0/1/2/', 4, '资源列表', 'resource', '', '/admin/sys/resource', 1),
(13, 2, '0/1/2/', 5, '权限管理', '', 'fa-shield', '', 1),
(14, 13, '0/1/2/13/', 1, '权限列表', 'permission', '', '/admin/sys/permission/permission', 1),
(15, 13, '0/1/2/13/', 2, '授权权限给角色', 'role', '', '/admin/sys/permission/role', 1),
(16, 13, '0/1/2/13/', 3, '授权角色给实体', 'auth', '', '/admin/sys/auth', 1),
(17, 1, '0/1/', 4, '个人中心', '', 'fa-users', '', 1),
(18, 17, '0/1/17/', 1, '我的消息', '', '', '/admin/personal/message', 1),
(19, 17, '0/1/17/', 2, '我的通知', '', '', '/admin/personal/notification', 1),
(20, 1, '0/1/', 5, '开发维护', 'maintain', 'fa-cubes', '', 1),
(21, 20, '0/1/20/', 1, '网站维护', '', 'fa-upload', '', 1),
(22, 21, '0/1/20/21/', 1, '商品列表', 'websiteProduct', '', '/admin/maintain/website/product', 1),
(23, 21, '0/1/20/21/', 2, '商铺列表', 'websiteStore', '', '/admin/maintain/website/store', 1),
(24, 21, '0/1/20/21/', 3, '类别列表', 'websiteCategory', '', '/admin/maintain/website/category', 1),
(25, 20, '0/1/20/', 2, '通知模板', 'notificationTemplate', '', '/admin/maintain/notification/template', 1),
(26, 20, '0/1/20/', 3, '图标管理', 'icon', '', '/admin/maintain/icon', 1),
(27, 20, '0/1/20/', 4, '键值对', 'keyvalue', '', '/admin/maintain/keyvalue', 1),
(28, 20, '0/1/20/', 5, '静态资源版本控制', 'staticResource', '', '/admin/maintain/staticResource', 1),
(29, 20, '0/1/20/', 6, '在线编辑', 'onlineEditor', '', '/admin/maintain/editor', 1),
(30, 20, '0/1/33/', 7, '任务调度', 'dynamicTask', '', '/admin/maintain/dynamicTask', 1),
(31, 1, '0/1/', 6, '系统监控', 'monitor', 'fa-heart', '', 1),
(32, 27, '0/1/31/', 1, '在线用户列表', 'userOnline', '', '/admin/sys/user/online', 1),
(33, 27, '0/1/31/', 2, '数据库监控', 'db', '', '/admin/monitor/druid/index.html', 1),
(34, 27, '0/1/31/', 3, 'hibernate监控', 'hibernate', '', '/admin/monitor/hibernate', 1),
(35, 27, '0/1/31/', 4, '执行SQL/JPA QL', 'ql', '', '/admin/monitor/db/sql', 1),
(36, 27, '0/1/31/', 5, 'ehcache监控', 'ehcache', '', '/admin/monitor/ehcache', 1),
(37, 27, '0/1/31/', 6, 'jvm监控', 'jvm', '', '/admin/monitor/jvm', 1);

truncate table `sys_permission`;
insert into `sys_permission` (`id`, `name`, `permission`, `description`, `is_show`) values
(1, '所有', '*', '所有数据操作的权限', 1),
(2, '新增', 'create', '新增数据操作的权限', 1),
(3,  '修改', 'update', '修改数据操作的权限', 1),
(4,  '删除', 'delete', '删除数据操作的权限', 1),
(5,  '查看', 'view', '查看数据操作的权限', 1),
(6,  '审核', 'audit', '审核数据操作的权限', 1);

truncate table `sys_role`;
insert into `sys_role` (`id`, `name`, `role`, `description`, `is_show`) values
(1,  '超级管理员', 'admin', '拥有所有权限', 1),
(2,  '系统管理员', 'sys_admin', '拥有系统管理的所有权限', 1),
(3,  '维护管理员', 'conf_admin', '拥有维护管理的所有权限', 1),
(4,  '新增管理员', 'create_admin', '拥有新增/查看管理的所有权限', 1),
(5,  '修改管理员', 'update_admin', '拥有修改/查看管理的所有权限', 1),
(6,  '删除管理员', 'delete_admin', '拥有删除/查看管理的所有权限', 1),
(7,  '查看管理员', 'view_admin', '拥有查看管理的所有权限', 1),
(8,  '审核管理员', 'audit_admin', '拥有审核管理的所有权限', 1),
(9,  '监控管理员', 'audit_admin', '拥有审核管理的所有权限', 1);

truncate table `sys_role_resource_permission`;
insert into `sys_role_resource_permission` (`id`, `role_id`, `resource_id`, `permission_ids`) values
(1, 1, 2, '1'),
(2, 1, 20, '1'),
(3, 1, 27, '1'),
(4, 2, 2, '1'),
(5, 3, 20, '1'),
(6, 4, 2, '2,5'),
(7, 4, 20, '2,5'),
(8, 4, 27, '2,5'),
(9, 5, 2, '3,5'),
(10, 5, 20, '3,5'),
(11, 5, 27, '3,5'),
(12, 6, 2, '4,5'),
(13, 6, 20, '4,5'),
(14, 6, 27, '4,5'),
(15, 7, 2, '5'),
(16, 7, 20, '5'),
(17, 7, 27, '5'),
(18, 9, 27, '1');

truncate table `sys_auth`;
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
values(1, 0, 0, 1, 0, '1', 'user');

truncate table `maintain_notification_template`;
insert into `maintain_notification_template` (`id`, `name`, `system`, `title`, `template`, `deleted`) values
(1, 'excelInitDataSuccess', 'excel', '初始化Excel数据完成', '初始化Excel数据已完成，耗时{seconds}秒钟，可以尝试导入/导出操作啦！', false),
(2, 'excelImportSuccess', 'excel', '导入Excel成功', '导入Excel成功，耗时{seconds}秒钟，<a onclick="$($.find(\'#menu a:contains(Excel导入/导出)\')).click();$(\'.notification-list .close-notification-list\').click();">点击前往查看</a>', false),
(3, 'excelImportError', 'excel', '导入Excel失败', '导入Excel失败了，请把错误报告给管理员，可能的失败原因：文件格式不对；错误码：{error}', false),
(4, 'excelExportSuccess', 'excel', '导出Excel成功', '导出Excel成功，耗时{seconds}秒钟，<a href="{ctx}{url}" target="_blank">点击下载</a>（注意：导出的文件只保留3天，请尽快下载，过期将删除）', false),
(5, 'excelExportError', 'excel', '导出Excel失败', '导出Excel失败了，请把错误报告给管理员，可能的失败原因：文件格式不对；错误码：{error}', false);

truncate table `maintain_icon`;
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(1, 'fa fa-adjust', 'fa fa-adjust', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(2, 'fa fa-anchor', 'fa fa-anchor', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(3, 'fa fa-archive', 'fa fa-archive', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(4, 'fa fa-area-chart', 'fa fa-area-chart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(5,  'fa fa-arrows', 'fa fa-arrows', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(6,  'fa fa-arrows-h', 'fa fa-arrows-h', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(7,  'fa fa-arrows-v', 'fa fa-arrows-v', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(8,  'fa fa-asterisk', 'fa fa-asterisk', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(9,  'fa fa-at', 'fa fa-at', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(10,  'fa fa-automobile', 'fa fa-automobile', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(11, 'fa fa-ban', 'fa fa-ban', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(12, 'fa fa-bank', 'fa fa-bank', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(13, 'fa fa-bar-chart', 'fa fa-bar-chart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(14, 'fa fa-bar-chart-o', 'fa fa-bar-chart-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(15, 'fa fa-barcode', 'fa fa-barcode', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(16, 'fa fa-bars', 'fa fa-bars', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(17, 'fa fa-beer', 'fa fa-beer', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(18, 'fa fa-bell', 'fa fa-bell', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(19, 'fa fa-bell-o', 'fa fa-bell-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(20, 'fa fa-bell-slash', 'fa fa-bell-slash', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(21, 'fa fa-bell-slash-o', 'fa fa-bell-slash-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(22, 'fa fa-bicycle', 'fa fa-bicycle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(23, 'fa fa-binoculars', 'fa fa-binoculars', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(24, 'fa fa-birthday-cake', 'fa fa-birthday-cake', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(25, 'fa fa-bomb', 'fa fa-bomb', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(26, 'fa fa-book', 'fa fa-book', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(27, 'fa fa-bookmark', 'fa fa-bookmark', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(28, 'fa fa-bookmark-o', 'fa fa-bookmark-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(29, 'fa fa-briefcase', 'fa fa-briefcase', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(30, 'fa fa-bug', 'fa fa-bug', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(31, 'fa fa-building', 'fa fa-building', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(32, 'fa fa-building-o', 'fa fa-building-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(33, 'fa fa-bullhorn', 'fa fa-bullhorn', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(34, 'fa fa-bullseye', 'fa fa-bullseye', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(35, 'fa fa-bus', 'fa fa-bus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(36, 'fa fa-bolt', 'fa fa-bolt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(37, 'fa fa-cab', 'fa fa-cab', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(38, 'fa fa-calculator', 'fa fa-calculator', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(39, 'fa fa-calendar-o', 'fa fa-calendar-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(40, 'fa fa-camera', 'fa fa-camera', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(41, 'fa fa-camera-retro', 'fa fa-camera-retro', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(42, 'fa fa-car', 'fa fa-car', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(43, 'fa fa-caret-square-o-down', 'fa fa-fa-caret-square-o-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(44, 'fa fa-caret-square-o-left', 'fa fa-fa-caret-square-o-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(45, 'fa fa-caret-square-o-right', 'fa fa-fa-caret-square-o-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(46, 'fa fa-caret-square-o-up', 'fa fa-fa-caret-square-o-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(47, 'fa fa-cc', 'fa fa-fa-cc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(48, 'fa fa-certificate', 'fa fa-certificate', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(49, 'fa fa-check', 'fa fa-check', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(50, 'fa fa-check-circle', 'fa fa-check-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(51, 'fa fa-check-circle-o', 'fa fa-check-circle-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(52, 'fa fa-check-square', 'fa fa-check-circle-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(53, 'fa fa-check-square-o', 'fa fa-check-circle-square-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(54, 'fa fa-child', 'fa fa-child', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(55, 'fa fa-circle', 'fa fa-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(56, 'fa fa-circle-o', 'fa fa-circle-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(57, 'fa fa-circle-o-notch', 'fa fa-circle-o-notch', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(58, 'fa fa-circle-thin', 'fa fa-circle--thin', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(59, 'fa fa-clock-o', 'fa fa-clock-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(60, 'fa fa-close', 'fa fa-close', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(61, 'fa fa-cloud', 'fa fa-cloud', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(62, 'fa fa-cloud-download', 'fa fa-cloud-download', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(63, 'fa fa-cloud-upload', 'fa fa-cloud-upload', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(64, 'fa fa-code', 'fa fa-code', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(65, 'fa fa-code-fork', 'fa fa-code-fork', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(66, 'fa fa-coffee', 'fa fa-coffee', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(67, 'fa fa-cog', 'fa fa-cog', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(68, 'fa fa-cogs', 'fa fa-cogs', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(69, 'fa fa-comment', 'fa fa-comment', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(70, 'fa fa-comment-o', 'fa fa-comment-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(71, 'fa fa-comments', 'fa fa-comments', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(72, 'fa fa-comments-o', 'fa fa-comments-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(73, 'fa fa-compass', 'fa fa-compass', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(74, 'fa fa-copyright', 'fa fa-copyright', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(75, 'fa fa-credit-card', 'fa fa-credit-card', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(76, 'fa fa-crop', 'fa fa-crop', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(77, 'fa fa-crosshairs', 'fa fa-crosshairs', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(78, 'fa fa-cube', 'fa fa-cube', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(79, 'fa fa-cubes', 'fa fa-cubes', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(80, 'fa fa-cutlery', 'fa fa-cutlery', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(81, 'fa fa-dashboard', 'fa fa-dashboard', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(83, 'fa fa-database', 'fa fa-database', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(84, 'fa fa-desktop', 'fa fa-desktop', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(85, 'fa fa-dot-circle-o', 'fa fa-dot-circle-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(86, 'fa fa-download', 'fa fa-download', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(87, 'fa fa-edit', 'fa fa-edit', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(88, 'fa fa-ellipsis-h', 'fa fa-ellipsis-h', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(89, 'fa fa-ellipsis-v', 'fa fa-ellipsis-v', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(90, 'fa fa-envelope', 'fa fa-envelope', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(91, 'fa fa-envelope-o', 'fa fa-envelope-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(92, 'fa fa-envelope-square', 'fa fa-envelope-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(93, 'fa fa-eraser', 'fa fa-eraser', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(94, 'fa fa-exchange', 'fa fa-exchange', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(95, 'fa fa-exclamation', 'fa fa-exclamation', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(96, 'fa fa-exclamation-circle', 'fa fa-exclamation-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(97, 'fa fa-exclamation-triangle', 'fa fa-exclamation-triangle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(98, 'fa fa-external-link', 'fa fa-external-link', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(99, 'fa fa-external-link-square', 'fa fa-external-link-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(100, 'fa fa-eye', 'fa fa-eye', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(101, 'fa fa-eye-slash', 'fa fa-eye-slash', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(102, 'fa fa-eyedropper', 'fa fa-eyedropper', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(103, 'fa fa-fax', 'fa fa-fax', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(104, 'fa fa-female', 'fa fa-female', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(105, 'fa fa-fighter-jet', 'fa fa-fighter-jet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(106, 'fa fa-file-archive-o', 'fa fa-file-archive-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(107, 'fa fa-file-audio-o', 'fa fa-file-audio-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(108, 'fa fa-file-code-o', 'fa fa-file-code-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(109, 'fa fa-file-excel-o', 'fa fa-file-excel-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(110, 'fa fa-file-image-o', 'fa fa-file-image-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(111, 'fa fa-file-movie-o', 'fa fa-file-movie-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(112, 'fa fa-file-pdf-o', 'fa fa-file-pdf-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(113, 'fa fa-file-photo-o', 'fa fa-file-photo-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(114, 'fa fa-file-picture-o', 'fa fa-file-picture-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(115, 'fa fa-file-powerpoint-o', 'fa fa-file-powerpoint-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(116, 'fa fa-file-sound-o', 'fa fa-file-sound-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(117, 'fa fa-file-video-o', 'fa fa-file-video-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(118, 'fa fa-file-word-o', 'fa fa-file-word-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(119, 'fa fa-file-zip-o', 'fa fa-file-zip-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(120, 'fa fa-film', 'fa fa-film', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(121, 'fa fa-filter', 'fa fa-filter', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(122, 'fa fa-fire', 'fa fa-fire', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(123, 'fa fa-fire-extinguisher', 'fa fa-fire-extinguisher', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(124, 'fa fa-flag', 'fa fa-flag', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(125, 'fa fa-flag-o', 'fa fa-flag-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(126, 'fa fa-flag-checkered', 'fa fa-flag-checkered', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(127, 'fa fa-flash', 'fa fa-flash', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(128, 'fa fa-flask', 'fa fa-flask', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(129, 'fa fa-folder', 'fa fa-folder', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(130, 'fa fa-folder-o', 'fa fa-folder-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(131, 'fa fa-folder-open', 'fa fa-folder-open', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(132, 'fa fa-folder-open-o', 'fa fa-folder-open-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(133, 'fa fa-frown-o', 'fa fa-frown-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(134, 'fa fa-futbol-o', 'fa fa-futbol-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(135, 'fa fa-gamepad', 'fa fa-gamepad', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(136, 'fa fa-gift', 'fa fa-gift', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(137, 'fa fa-glass', 'fa fa-glass', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(138, 'fa fa-globe', 'fa fa-globe', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(139, 'fa fa-graduation-cap', 'fa fa-graduation-cap', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(140, 'fa fa-group', 'fa fa-group', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(141, 'fa fa-hdd-o', 'fa fa-hdd-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(142, 'fa fa-headphones', 'fa fa-headphones', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(143, 'fa fa-heart', 'fa fa-heart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(144, 'fa fa-heart-o', 'fa fa-heart-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(145, 'fa fa-history', 'fa fa-history', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(146, 'fa fa-home', 'fa fa-home', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(147, 'fa fa-image', 'fa fa-image', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(148, 'fa fa-inbox', 'fa fa-inbox', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(149, 'fa fa-info', 'fa fa-info', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(150, 'fa fa-info-circle', 'fa fa-info-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(151, 'fa fa-institution', 'fa fa-institution', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(152, 'fa fa-key', 'fa fa-key', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(153, 'fa fa-keyboard-o', 'fa fa-keyboard-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(154, 'fa fa-language', 'fa fa-language', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(155, 'fa fa-laptop', 'fa fa-laptop', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(156, 'fa fa-leaf', 'fa fa-leaf', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(157, 'fa fa-legal', 'fa fa-legal', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(158, 'fa fa-lemon-o', 'fa fa-lemon-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(159, 'fa fa-level-down', 'fa fa-level-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(160, 'fa fa-level-up', 'fa fa-level-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(161, 'fa fa-life-bouy', 'fa fa-life-bouy', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(162, 'fa fa-life-buoy', 'fa fa-life-buoy', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(163, 'fa fa-life-ring', 'fa fa-life-ring', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(164, 'fa fa-life-saver', 'fa fa-life-saver', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(165, 'fa fa-lightbulb-o', 'fa fa-lightbulb-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(166, 'fa fa-line-chart', 'fa fa-line-chart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(167, 'fa fa-location-arrow', 'fa fa-location-arrow', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(168, 'fa fa-lock', 'fa fa-lock', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(169, 'fa fa-magic', 'fa fa-magic', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(170, 'fa fa-magnet', 'fa fa-magnet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(171, 'fa fa-mail-forward', 'fa fa-mail-forward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(172, 'fa fa-mail-reply', 'fa fa-mail-reply', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(173, 'fa fa-mail-reply-all', 'fa fa-mail-reply-all', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(174, 'fa fa-male', 'fa fa-male', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(175, 'fa fa-map-marker', 'fa fa-map-marker', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(176, 'fa fa-meh-o', 'fa fa-meh-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(177, 'fa fa-microphone', 'fa fa-microphone', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(178, 'fa fa-microphone-slash', 'fa fa-microphone-slash', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(179, 'fa fa-minus', 'fa fa-minus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(180, 'fa fa-minus-circle', 'fa fa-minus-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(181, 'fa fa-minus-square', 'fa fa-minus-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(182, 'fa fa-minus-square-o', 'fa fa-minus-square-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(183, 'fa fa-mobile', 'fa fa-mobile', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(184, 'fa fa-mobile-phone', 'fa fa-mobile-phone', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(185, 'fa fa-money', 'fa fa-money', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(186, 'fa fa-moon-o', 'fa fa-moon-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(187, 'fa fa-music', 'fa fa-music', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(188, 'fa fa-navicon', 'fa fa-navicon', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(189, 'fa fa-newspaper', 'fa fa-newspaper', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(190, 'fa fa-paint-brush', 'fa fa-paint-brush', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(191, 'fa fa-paper-plane', 'fa fa-paper-plane', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(192, 'fa fa-paper-plane-o', 'fa fa-paper-plane-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(193, 'fa fa-paw', 'fa fa-paw', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(194, 'fa fa-pencil', 'fa fa-pencil', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(195, 'fa fa-pencil-square', 'fa fa-pencil-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(196, 'fa fa-pencil-square-o', 'fa fa-pencil-square-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(197, 'fa fa-phone', 'fa fa-phone', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(198, 'fa fa-phone-square', 'fa fa-phone-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(199, 'fa fa-photo', 'fa fa-photo', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(200, 'fa fa-picture-o', 'fa fa-picture-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(201, 'fa fa-pie-chart', 'fa fa-pie-chart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(202, 'fa fa-plane', 'fa fa-plane', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(203, 'fa fa-plug', 'fa fa-plug', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(204, 'fa fa-plus', 'fa fa-plus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(205, 'fa fa-plus-circle', 'fa fa-plus-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(206, 'fa fa-plus-square', 'fa fa-plus-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(207, 'fa fa-plus-square-o', 'fa fa-plus-square-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(208, 'fa fa-power-off', 'fa fa-power-off', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(209, 'fa fa-print', 'fa fa-print', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(210, 'fa fa-puzzle-piece', 'fa fa-puzzle-piece', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(211, 'fa fa-qrcode', 'fa fa-qrcode', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(212, 'fa fa-question', 'fa fa-question', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(213, 'fa fa-question-circle', 'fa fa-question-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(214, 'fa fa-quote-left', 'fa fa-quote-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(215, 'fa fa-quote-right', 'fa fa-quote-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(216, 'fa fa-random', 'fa fa-random', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(217, 'fa fa-recycle', 'fa fa-recycle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(218, 'fa fa-refresh', 'fa fa-refresh', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(219, 'fa fa-remove', 'fa fa-remove', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(220, 'fa fa-reorder', 'fa fa-reorder', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(221, 'fa fa-reply', 'fa fa-reply', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(222, 'fa fa-reply-all', 'fa fa-reply-all', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(223, 'fa fa-retweet', 'fa fa-retweet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(224, 'fa fa-road', 'fa fa-road', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(225, 'fa fa-rocket', 'fa fa-rocket', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(226, 'fa fa-rss', 'fa fa-rss', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(227, 'fa fa-rss-square', 'fa fa-rss-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(228, 'fa fa-search', 'fa fa-search', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(229, 'fa fa-search-minus', 'fa fa-search-minus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(230, 'fa fa-search-plus', 'fa fa-search-plus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(231, 'fa fa-send', 'fa fa-send', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(232, 'fa fa-send-o', 'fa fa-send-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(233, 'fa fa-share', 'fa fa-share', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(234, 'fa fa-share-alt', 'fa fa-share-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(235, 'fa fa-share-alt-square', 'fa fa-share-alt-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(236, 'fa fa-share-square', 'fa fa-share-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(237, 'fa fa-share-square-o', 'fa fa-share-square-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(238, 'fa fa-shield', 'fa fa-shield', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(239, 'fa fa-shopping-cart', 'fa fa-shopping-cart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(240, 'fa fa-sign-in', 'fa fa-sign-in', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(241, 'fa fa-sign-out', 'fa fa-sign-out', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(242, 'fa fa-signal', 'fa fa-signal', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(243, 'fa fa-sitemap', 'fa fa-sitemap', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(244, 'fa fa-sliders', 'fa fa-sliders', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(245, 'fa fa-smile-o', 'fa fa-smile-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(246, 'fa fa-soccer-ball-o', 'fa fa-soccer-ball-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(247, 'fa fa-sort', 'fa fa-sort', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(248, 'fa fa-sort-alpha-asc', 'fa fa-sort-alpha-asc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(249, 'fa fa-sort-alpha-desc', 'fa fa-sort-alpha-desc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(250, 'fa fa-sort-amount-asc', 'fa fa-sort-amount-asc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(251, 'fa fa-sort-amount-desc', 'fa fa-sort-amount-desc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(252, 'fa fa-sort-asc ', 'fa fa-sort-asc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(253, 'fa fa-sort-desc ', 'fa fa-sort-desc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(254, 'fa fa-sort-down', 'fa fa-sort-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(255, 'fa fa-sort-numeric-asc', 'fa fa-numeric-asc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(256, 'fa fa-sort-numeric-desc', 'fa fa-numeric-desc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(257, 'fa fa-sort-up', 'fa fa-sort-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(258, 'fa fa-space-shuttle', 'fa fa-space-shuttle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(259, 'fa fa-spinner', 'fa fa-spinner', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(260, 'fa fa-spoon', 'fa fa-spoon', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(261, 'fa fa-square', 'fa fa-square', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(262, 'fa fa-square-o', 'fa fa-square-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(263, 'fa fa-star', 'fa fa-star', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(264, 'fa fa-star-o', 'fa fa-star-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(265, 'fa fa-star-half', 'fa fa-star-half', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(266, 'fa fa-star-half-o', 'fa fa-star-half-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(267, 'fa fa-star-half-full', 'fa fa-star-half-full', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(268, 'fa fa-suitcase', 'fa fa-suitcase', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(269, 'fa fa-sun-o', 'fa fa-sun-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(270, 'fa fa-support', 'fa fa-support', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(271, 'fa fa-tablet', 'fa fa-tablet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(272, 'fa fa-tachometer', 'fa fa-tachometer', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(273, 'fa fa-tag', 'fa fa-tag', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(274, 'fa fa-tags', 'fa fa-tags', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(275, 'fa fa-tasks', 'fa fa-tasks', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(276, 'fa fa-taxi', 'fa fa-taxi', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(277, 'fa fa-terminal', 'fa fa-terminal', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(278, 'fa fa-thumbs-tack', 'fa fa-thumbs-tack', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(279, 'fa fa-thumbs-down', 'fa fa-thumbs-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(280, 'fa fa-thumbs-o-down', 'fa fa-thumbs-o-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(281, 'fa fa-thumbs-up', 'fa fa-thumbs-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(282, 'fa fa-thumbs-o-up', 'fa fa-thumbs-o-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(283, 'fa fa-ticket', 'fa fa-ticket', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(284, 'fa fa-times', 'fa fa-times', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(285, 'fa fa-times-circle', 'fa fa-times-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(286, 'fa fa-times-circle-o', 'fa fa-times-circle-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(287, 'fa fa-tint', 'fa fa-tint', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(288, 'fa fa-toggle-down', 'fa fa-toggle-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(289, 'fa fa-toggle-left', 'fa fa-toggle-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(290, 'fa fa-toggle-off', 'fa fa-toggle-off', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(291, 'fa fa-toggle-on', 'fa fa-toggle-on', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(292, 'fa fa-toggle-right', 'fa fa-toggle-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(293, 'fa fa-toggle-up', 'fa fa-toggle-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(294, 'fa fa-trash', 'fa fa-trash', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(295, 'fa fa-trash-o', 'fa fa-trash-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(296, 'fa fa-tree', 'fa fa-tree', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(297, 'fa fa-trophy', 'fa fa-trophy', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(298, 'fa fa-truck', 'fa fa-truck', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(299, 'fa fa-tty', 'fa fa-tty', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(300, 'fa fa-umbrella', 'fa fa-umbrella', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(301, 'fa fa-university', 'fa fa-university', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(302, 'fa fa-unlock', 'fa fa-unlock', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(303, 'fa fa-unlock-alt', 'fa fa-unlock-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(304, 'fa fa-unsorted', 'fa fa-unsorted', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(305, 'fa fa-upload', 'fa fa-upload', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(306, 'fa fa-user', 'fa fa-user', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(307, 'fa fa-users', 'fa fa-users', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(308, 'fa fa-video-camera', 'fa video-camera', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(309, 'fa fa-volume-down', 'fa fa-volume-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(310, 'fa fa-volume-off', 'fa fa-volume-off', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(311, 'fa fa-volume-up', 'fa fa-volume-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(312, 'fa fa-warning', 'fa fa-warning', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(313, 'fa fa-wheelchair', 'fa fa-wheelchair', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(314, 'fa fa-wifi', 'fa fa-wifi', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(315, 'fa fa-wrench', 'fa fa-wrench', 'css_class');

insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(316, 'fa fa-bitcoin', 'fa fa-bitcoin', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(317, 'fa fa-btc', 'fa fa-btc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(318, 'fa fa-cny', 'fa fa-cny', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(319, 'fa fa-dollar', 'fa fa-dollar', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(320, 'fa fa-eur', 'fa fa-eur', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(321, 'fa fa-euro', 'fa fa-euro', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(322, 'fa fa-gbp', 'fa fa-gbp', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(323, 'fa fa-ils', 'fa fa-ils', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(324, 'fa fa-inr', 'fa fa-inr', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(325, 'fa fa-jpy', 'fa fa-jpy', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(326, 'fa fa-krw', 'fa fa-krw', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(327, 'fa fa-mortar-board', 'fa fa-mortar-board', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(328, 'fa fa-rmb', 'fa fa-rmb', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(329, 'fa fa-rouble', 'fa fa-rouble', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(330, 'fa fa-rub', 'fa fa-rub', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(331, 'fa fa-ruble', 'fa fa-ruble', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(332, 'fa fa-rupee', 'fa fa-rupee', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(333, 'fa fa-shekel', 'fa fa-shekel', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(334, 'fa fa-sheqel', 'fa fa-sheqel', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(335, 'fa fa-try', 'fa fa-try', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(336, 'fa fa-turkish-lira', 'fa fa-turkish-lira', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(337, 'fa fa-usd', 'fa fa-usd', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(338, 'fa fa-won', 'fa fa-won', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(339, 'fa fa-yen', 'fa fa-yen', 'css_class');

insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(340, 'fa fa-align-center', 'fa fa-align-center', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(341, 'fa fa-align-justify', 'fa fa-align-justify', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(342, 'fa fa-align-left', 'fa fa-align-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(343, 'fa fa-align-right', 'fa fa-align-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(344, 'fa fa-bold', 'fa fa-bold', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(345, 'fa fa-chain', 'fa fa-chain', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(346, 'fa fa-chain-broken', 'fa fa-chain-broken', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(347, 'fa fa-clipboard', 'fa fa-clipboard', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(348, 'fa fa-columns', 'fa fa-columns', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(349, 'fa fa-copy', 'fa fa-copy', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(350, 'fa fa-cut', 'fa fa-cut', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(351, 'fa fa-dedent', 'fa fa-dedent', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(352, 'fa fa-link', 'fa fa-link', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(353, 'fa fa-file', 'fa fa-file', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(354, 'fa fa-file-o', 'fa fa-file-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(355, 'fa fa-file-text', 'fa fa-file-text', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(356, 'fa fa-file-text-o', 'fa fa-file-text-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(357, 'fa fa-files-o', 'fa fa-files-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(358, 'fa fa-floppy-o', 'fa fa-floppy-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(359, 'fa fa-font', 'fa fa-font', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(360, 'fa fa-header', 'fa fa-header', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(361, 'fa fa-indent', 'fa fa-indent', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(362, 'fa fa-italic', 'fa fa-italic', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(363, 'fa fa-list', 'fa fa-list', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(364, 'fa fa-list-alt', 'fa fa-list-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(365, 'fa fa-list-ol', 'fa fa-list-ol', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(366, 'fa fa-list-ul', 'fa fa-list-ul', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(367, 'fa fa-outdent', 'fa fa-outdent', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(368, 'fa fa-paperclip', 'fa fa-paperclip', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(369, 'fa fa-paragraph', 'fa fa-paragraph', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(370, 'fa fa-paste', 'fa fa-paste', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(371, 'fa fa-repeat', 'fa fa-repeat', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(372, 'fa fa-rotate-left', 'fa fa-rotate-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(373, 'fa fa-rotate-right', 'fa fa-rotate-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(374, 'fa fa-save', 'fa fa-save', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(375, 'fa fa-strikethrough', 'fa fa-strikethrough', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(376, 'fa fa-subscript', 'fa fa-subscript', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(377, 'fa fa-table', 'fa fa-table', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(378, 'fa fa-text-height', 'fa fa-text-height', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(379, 'fa fa-text-width', 'fa fa-text-width', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(380, 'fa fa-th', 'fa fa-th', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(381, 'fa fa-th-large', 'fa fa-th-large', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(382, 'fa fa-th-list', 'fa fa-th-list', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(383, 'fa fa-underline', 'fa fa-underline', 'css_class');

insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(384, 'fa fa-angle-double-down', 'fa fa-angle-double-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(385, 'fa fa-angle-double-left', 'fa fa-angle-double-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(386, 'fa fa-angle-double-right', 'fa fa-angle-double-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(387, 'fa fa-angle-double-up', 'fa fa-angle-double-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(388, 'fa fa-angle-down', 'fa fa-angle-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(389, 'fa fa-angle-left', 'fa fa-angle-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(390, 'fa fa-angle-right', 'fa fa-angle-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(391, 'fa fa-angle-up', 'fa fa-angle-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(392, 'fa fa-arrow-circle-down', 'fa fa-arrow-circle-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(393, 'fa fa-arrow-circle-left', 'fa fa-arrow-circle-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(394, 'fa fa-arrow-circle-o-down', 'fa fa-arrow-circle-o-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(395, 'fa fa-arrow-circle-o-left', 'fa fa-arrow-circle-o-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(396, 'fa fa-arrow-circle-o-right', 'fa fa-arrow-circle-o-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(397, 'fa fa-arrow-circle-o-up', 'fa fa-arrow-circle-o-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(398, 'fa fa-arrow-circle-right', 'fa fa-arrow-circle-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(399, 'fa fa-arrow-circle-up', 'fa fa-arrow-circle-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(400, 'fa fa-arrow-down', 'fa fa-arrow-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(401, 'fa fa-arrow-left', 'fa fa-arrow-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(402, 'fa fa-arrow-right', 'fa fa-arrow-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(403, 'fa fa-arrow-up', 'fa fa-arrow-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(404, 'fa fa-undo', 'fa fa-undo', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(405, 'fa fa-arrows-alt', 'fa fa-arrows-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(406, 'fa fa-backward', 'fa fa-backward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(407, 'fa fa-scissors', 'fa fa-scissors', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(408, 'fa fa-caret-down', 'fa fa-caret-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(409, 'fa fa-caret-left', 'fa fa-caret-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(410, 'fa fa-caret-right', 'fa fa-caret-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(411, 'fa fa-caret-up', 'fa fa-caret-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(412, 'fa fa-chevron-circle-down', 'fa fa-chevron-circle-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(413, 'fa fa-chevron-circle-left', 'fa fa-chevron-circle-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(414, 'fa fa-chevron-circle-right', 'fa fa-chevron-circle-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(415, 'fa fa-chevron-circle-up', 'fa fa-chevron-circle-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(416, 'fa fa-chevron-down', 'fa fa-chevron-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(417, 'fa fa-chevron-left', 'fa fa-chevron-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(418, 'fa fa-chevron-right', 'fa fa-chevron-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(419, 'fa fa-chevron-up', 'fa fa-chevron-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(420, 'fa fa-hand-o-down', 'fa fa-hand-o-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(421, 'fa fa-hand-o-left', 'fa fa-hand-o-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(422, 'fa fa-hand-o-right', 'fa fa-hand-o-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(423, 'fa fa-hand-o-up', 'fa fa-hand-o-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(424, 'fa fa-long-arrow-down', 'fa fa-long-arrow-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(425, 'fa fa-long-arrow-left', 'fa fa-long-arrow-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(426, 'fa fa-long-arrow-right', 'fa fa-long-arrow-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(427, 'fa fa-long-arrow-up', 'fa fa-long-arrow-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(428, 'fa fa-medkit', 'fa fa-medkit', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(429, 'fa fa-hospital-o', 'fa fa-hospital-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(430, 'fa fa-stethoscope', 'fa fa-stethoscope', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(431, 'fa fa-user-md', 'fa fa-user-md', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(432, 'fa fa-compress', 'fa fa-compress', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(433, 'fa fa-eject', 'fa fa-eject', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(434, 'fa fa-expand', 'fa fa-expand', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(435, 'fa fa-fast-backward', 'fa fa-fast-backward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(436, 'fa fa-fast-forward', 'fa fa-fast-forward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(437, 'fa fa-forward', 'fa fa-forward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(438, 'fa fa-pause', 'fa fa-pause', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(439, 'fa fa-play', 'fa fa-play', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(440, 'fa fa-play-circle', 'fa fa-play-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(441, 'fa fa-play-circle-o', 'fa fa-play-circle-o', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(442, 'fa fa-step-backward', 'fa fa-step-backward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(443, 'fa fa-step-forward', 'fa fa-step-forward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(444, 'fa fa-stop', 'fa fa-stop', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(445, 'fa fa-youtube-play', 'fa fa-youtube-play', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(446, 'fa fa-ambulance', 'fa fa-ambulance', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(447, 'fa fa-h-square', 'fa fa-h-square', 'css_class');



insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1001, 'ztree_root_close', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/1_close.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1002, 'ztree_root_open', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/1_open.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1003, 'ztree_edit', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/2.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1004, 'ztree_star', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/3.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1005, 'ztree_calendar', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/4.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1006, 'ztree_heart', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/5.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1007, 'ztree_save', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/6.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1008, 'ztree_msg', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/7.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1009, 'ztree_report', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/8.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1010, 'ztree_setting', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/9.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1011, 'ztree_file', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/file.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1012, 'ztree_folder', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/folder.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1013, 'ztree_branch', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/branch.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1014, 'ztree_leaf', 'static/admin/comp/zTree/css/zTreeStyle/img/diy/leaf.png', 'upload_file', 16, 16);



insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1500, 'ztree_folder_open', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 0);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1501, 'ztree_folder_close', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 17 );
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1502, 'ztree_file2', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 32);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1503, 'ztree_edit2', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 48);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1504, 'ztree_delete', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 64);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1505, 'ztree_arrow', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 80);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1506, 'ztree_plus', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 13, 13, 79, 75);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1507, 'ztree_minus', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 13, 13, 98, 75);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1508, 'ztree_add', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 0);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1509, 'ztree_cicle_arrow_left1', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 15);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1510, 'ztree_cicle_arrow_right1', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 32);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1511, 'ztree_cicle_arrow_left2', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 48);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1512, 'ztree_cicle_arrow_right2', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 64);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1513, 'ztree_cicle_arrow', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 127, 48);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1514, 'ztree_star_light', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 127, 64);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1515, 'ztree_star_dark', 'static/admin/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 127, 80);
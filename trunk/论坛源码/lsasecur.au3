#include-once

; We have only two years to remedy our mistake.
; Please pay a much of attention to protecting the environment and, all the creatures.
; For ourselves, and for the world.

; #### Header Information ####
; ============================================================================================================
; Title	: Lsasecur
; Description	: This library is used regarding the system security of local computer.
; Requirement(s)	:
;		: AutoIt Version	- v3 ++
;		: Minimum Client	- Win 2000 Profressional
;		: System Library	- AdvApi32.dll, Crypt32.dll, Kernel32.dll, Netapi32.dll, Ntdll.dll
; Author	: Pusofalse, 12/11/2010, kanxinqi@yahoo.com.cn
; ============================================================================================================

; #### Lsasecur's structures definition ####
; ============================================================================================================
Const $tagSE_BUFFERW = "word Length;word MaxLength;ptr BufferW"
Const $tagSE_SID_ATTRIBUTES = "ptr Sid;dword Attributes"
Const $tagSE_LUID_ATTRIBUTES = "int64 Luid;dword Attributes"
Const $tagSE_PRIV_SET = "dword Count;dword Control;" & $tagSE_LUID_ATTRIBUTES
Const $tagSE_ACCESS_HEADER = "byte AceType;byte AceFlags;word AceSize"
Const $tagSE_ACCESS_ACE = $tagSE_ACCESS_HEADER & ";ptr AccessMask;dword SidStart"
Const $tagSE_TRUSTEE = "ptr MultiTrustee;dword MultiTrusteeOperation;dword TrusteeFrom;dword TrusteeType;ptr Name"
Const $tagSE_EXPLICIT_ACCESS = "ptr AccessMask;dword AccessMode;dword Inheritance;" & $tagSE_TRUSTEE
Const $tagSE_ACCESS_CONTROL_LIST = "word Revision;word AclSize;dword AceCount;" & $tagSE_ACCESS_ACE
Const $tagSE_ABSOLUTE_DESCRIPTOR = "word Revision;word ControlFlags;ptr Owner;ptr Group;ptr Sacl;ptr Dacl"
Const $tagSE_SELF_RELATIVE_DESCRIPTOR = "word Revision;word ControlFlags;dword Owner;dword Group;dword Sacl;dword Dacl"
Const $tagSE_GENERIC_MAPPING = "dword GenericRead;dword GenericWrite;dword GenericExecute;dword GenericAll"
Const $tagSE_TOKEN_STATISTICS = "int64 TokenId;int64 AuthenticationId;int64 ExpirationTime;long TokenType;long ImpersonationLevel;dword DynamicCharged;dword DynamicAvailable;dword GroupCount;dword PrivilegeCount;int64 ModifiedId"

Const $tagSE_PROCESS_INFO = "handle Process;handle Thread;dword ProcessId;dword ThreadId"
Const $tagSE_STARTUP_INFO = "dword Length;ptr Reserved;ptr Desktop;ptr Title;dword X;dword Y;dword XSize;dword YSize;dword XCountChars;dword YCountChars;dword FillAttributes;dword Flags;word ShowWindow;word Reserved2;ptr Reserved3;handle StdInput;handle StdOuput;handle StdError"

Const $tagSE_TREE_RESET_SECUR = "ptr Object;long ObjType;long SecurInfo;ptr Owner;ptr Group;ptr Dacl;ptr Sacl;bool KeepExplicit;ptr CallBack;ulong Invoke;ptr Context;wchar wzObject[260]"
Const $tagSE_MEMORY_NOTIFY = "ptr BaseAddress;dword Length;ptr CallBack;dword Equaled;hWnd Reserved"
Const $tagSE_SECURITY_QOS = "dword Length;dword ImpersonationLevel;bool ContextTrackingMode;boolean EffectiveOnly"
Const $tagSE_SECUR_ATTRIB = "dword Length;handle RootDir;ptr BufferW;ulong Attributes;ptr Securitydescriptor;ptr SecurityQos"
; ============================================================================================================

; #### Handle to Heap ####
; ============================================================================================================
Const $SE_PROCESSHEAP = _SeProcessHeap()
; ============================================================================================================

; #### Security Information ####
; ============================================================================================================
Const $SE_INFO_INVALID = 0
Const $SE_INFO_OWNER = 1
Const $SE_INFO_GROUP = 2
Const $SE_INFO_DACL = 4
Const $SE_INFO_SACL = 8
Const $SE_INFO_ALL = 15
; ============================================================================================================

; #### Non-existent components for Securty Descriptor ####
; ============================================================================================================
Const $SE_NULL_OWNER = 0
Const $SE_NULL_GROUP = 0
Const $SE_NULL_DACL = 0
Const $SE_NULL_SACL = 0
; ============================================================================================================

; #### Generic Access Rights ####
; ============================================================================================================
Const $SE_MAXIMUM_ALLOWED = 0x02000000
Const $SE_GENERIC_ALL = 0x10000000
Const $SE_GENERIC_EXECUTE = 0x20000000
Const $SE_GENERIC_WRITE = 0x40000000
Const $SE_GENERIC_READ = 0x80000000
; ============================================================================================================

; #### Standard Security Access Rights ####
; ============================================================================================================
Const $SE_DELETE = 0x10000
Const $SE_READ_CONTROL = 0x20000
Const $SE_WRITE_DAC = 0x40000
Const $SE_WRITE_OWNER = 0x80000
Const $SE_SYNCHRONIZE = 0x100000
Const $SE_ACCESS_SYSTEM = 0x1000000	; Read or write SACL.
; ============================================================================================================

; #### Access rights for Token Object ####
; ============================================================================================================
Const $SE_TOKEN_ASSIGN_PRIMARY = 1
Const $SE_TOKEN_DUPLICATE = 2
Const $SE_TOKEN_IMPERSONATE = 4
Const $SE_TOKEN_QUERY = 8
Const $SE_TOKEN_QUERY_SOURCE = 16
Const $SE_TOKEN_ADJUST_PRIVILEGES = 32
Const $SE_TOKEN_ADJUST_GROUPS = 64
Const $SE_TOKEN_ADJUST_DEFAULT = 128
Const $SE_TOKEN_ADJUST_SESSIONID = 256
Const $SE_TOKEN_EXECUTE = 0x20000
Const $SE_TOKEN_READ = BitOR($SE_TOKEN_QUERY, $SE_TOKEN_EXECUTE)
Const $SE_TOKEN_WRITE = 0x200e0
Const $SE_TOKEN_ALL_ACCESS = 0xF01FF
; ============================================================================================================

; #### Access Rights for Thread Object ####
; ============================================================================================================
Const $SE_THREAD_TERMINATE = 1
Const $SE_THREAD_SUSPEND_RESUME = 2
Const $SE_THREAD_GET_CONTEXT = 8
Const $SE_THREAD_SET_CONTEXT = 16
Const $SE_THREAD_SET_INFORMATION = 32
Const $SE_THREAD_QUERY_INFORMATION = 64
Const $SE_THREAD_SET_THREAD_TOKEN = 128
Const $SE_THREAD_IMPERSONATE = 256
Const $SE_THREAD_DIRECT_IMPERSONATION = 512
Const $SE_THREAD_SET_LIMITED_INFORMATION = 1024
Const $SE_THREAD_QUERY_LIMITED_INFORMATION = 2048
Const $SE_THREAD_ALL_ACCESS = 0x1F03FF
; ============================================================================================================

; #### User Right / Token Privilege Constants ####
; ============================================================================================================
Const $SE_CREATE_TOKEN_PRIV = "SeCreateTokenPrivilege"
Const $SE_ASSIGNPRIMARYTOKEN_PRIV = "SeAssignPrimaryTokenPrivilege"
Const $SE_LOCK_MEMORY_PRIV = "SeLockMemoryPrivilege"
Const $SE_INCREASE_QUOTA_PRIV = "SeIncreaseQuotaPrivilege"
Const $SE_UNSOLICITED_INPUT_PRIV = "SeUnsolicitedInputPrivilege"
Const $SE_MACHINE_ACCOUNT_PRIV = "SeMachineAccountPrivilege"
Const $SE_TCB_PRIV = "SeTcbPrivilege"
Const $SE_SECURITY_PRIV = "SeSecurityPrivilege"
Const $SE_TAKE_OWNERSHIP_PRIV = "SeTakeOwnershipPrivilege"
Const $SE_LOAD_DRIVER_PRIV = "SeLoadDriverPrivilege"
Const $SE_SYSTEM_PROFILE_PRIV = "SeSystemProfilePrivilege"
Const $SE_SYSTEMTIME_PRIV = "SeSystemtimePrivilege"
Const $SE_PROF_SINGLE_PROCESS_PRIV = "SeProfileSingleProcessPrivilege"
Const $SE_INC_BASE_PRIORITY_PRIV = "SeIncreaseBasePriorityPrivilege"
Const $SE_CREATE_PAGEFILE_PRIV = "SeCreatePagefilePrivilege"
Const $SE_CREATE_PERMANENT_PRIV = "SeCreatePermanentPrivilege"
Const $SE_BACKUP_PRIV = "SeBackupPrivilege"
Const $SE_RESTORE_PRIV = "SeRestorePrivilege"
Const $SE_SHUTDOWN_PRIV = "SeShutdownPrivilege"
Const $SE_DEBUG_PRIV = "SeDebugPrivilege"
Const $SE_AUDIT_PRIV = "SeAuditPrivilege"
Const $SE_SYSTEM_ENVIRONMENT_PRIV = "SeSystemEnvironmentPrivilege"
Const $SE_CHANGE_NOTIFY_PRIV = "SeChangeNotifyPrivilege"
Const $SE_REMOTE_SHUTDOWN_PRIV = "SeRemoteShutdownPrivilege"
Const $SE_UNDOCK_PRIV = "SeUndockPrivilege"
Const $SE_TRUSTED_CREDMAN_ACCESS_PRIV = "SeTrustedCredManAccessPrivilege"
Const $SE_IMPERSONATE_PRIV = "SeImpersonatePrivilege"
Const $SE_CREATE_GLOBAL_PRIV = "SeCreateGlobalPrivilege"
Const $SE_PROFILE_SINGLE_PROCESS_PRIV = "SeProfileSingleProcessPrivilege"
Const $SE_MANAGE_VOLUME_PRIV = "SeManageVolumePrivilege"
; ============================================================================================================

; #### User Rights Constants ####
; ============================================================================================================
; Required for an account to log on using the batch logon type.
Const $SE_BATCH_LOGON_RIGHT ="SeBatchLogonRight"

; Explicitly denies an account the right to log on using the batch logon type.
Const $SE_DENY_BATCH_LOGON_RIGHT ="SeDenyBatchLogonRight"

; Explicitly denies an account the right to log on using the interactive logon type.
Const $SE_DENY_INTERACTIVE_LOGON_RIGHT ="SeDenyInteractiveLogonRight"

; Explicitly denies an account the right to log on using the network logon type.
Const $SE_DENY_NETWORK_LOGON_RIGHT ="SeDenyNetworkLogonRight"

; Explicitly denies an account the right to log on remotely using the interactive logon type.
Const $SE_DENY_REMOTE_INTERACTIVE_LOGON_RIGHT ="SeDenyRemoteInteractiveLogonRight"

; Explicitly denies an account the right to log on using the service logon type.
Const $SE_DENY_SERVICE_LOGON_RIGHT ="SeDenyServiceLogonRight"

; Required for an account to log on using the interactive logon type.
Const $SE_INTERACTIVE_LOGON_RIGHT ="SeInteractiveLogonRight"

; Required for an account to log on using the network logon type.
Const $SE_NETWORK_LOGON_RIGHT ="SeNetworkLogonRight"

; Required for an account to log on remotely using the interactive logon type.
Const $SE_REMOTE_INTERACTIVE_LOGON_RIGHT ="SeRemoteInteractiveLogonRight"

; Required for an account to log on using the service logon type.
Const $SE_SERVICE_LOGON_RIGHT = "SeServiceLogonRight"
; ============================================================================================================

; #### Flag for SE_PRIV_SET.Control ####
; ============================================================================================================
Const $SE_PRIV_SET_ALL_NECESSARY = 1
; ============================================================================================================

; #### Flags for SE_SID_ATTRIBUTES.Attributes ####
; ============================================================================================================
Const $SE_GROUP_MANDATORY = 0x00000001
Const $SE_GROUP_ENABLED_BY_DEFAULT = 0x00000002
Const $SE_GROUP_ENABLED = 0x00000004
Const $SE_GROUP_OWNER = 0x00000008
Const $SE_GROUP_USE_FOR_DENY_ONLY = 0x00000010
Const $SE_GROUP_INTEGRITY = 0x00000020
Const $SE_GROUP_INTEGRITY_ENABLED = 0x00000040
Const $SE_GROUP_LOGON_ID = 0xC0000000
Const $SE_GROUP_RESOURCE = 0x20000000
; ============================================================================================================

; #### Flags for _SeCreateRestrictedToken.Flags ####
; ============================================================================================================
Const $SE_DISABLE_MAX_PRIVILEGE = 1
Const $SE_SANDBOX_INERT = 2
Const $SE_LUA_TOKEN = 4
Const $SE_WRITE_RESTRICTED = 8 ; The value of this constants is 4 on Win XP SP2 and later.
; ============================================================================================================

; #### Flags for SE_LUID_ATTRIBUTES.Attributes ####
; ============================================================================================================
Const $SE_PRIV_DISABLED = 0
Const $SE_PRIV_ENABLED_BY_DEFAULT = 1
Const $SE_PRIV_ENABLED = 2
Const $SE_PRIV_DEFAULT_ENABLED = BitOR($SE_PRIV_ENABLED_BY_DEFAULT, $SE_PRIV_ENABLED)
Const $SE_PRIV_REMOVED = 4
Const $SE_PRIV_USED_FOR_ACCESS = 0x80000000
; ============================================================================================================

; #### Securable Object Inheritance ####
; ============================================================================================================
Const $SE_NO_INHERITANCE = 0
Const $SE_OBJECT_INHERIT_ACE = 1
Const $SE_CONTAINER_INHERIT_ACE = 2
Const $SE_NO_PROPAGATE_INHERIT_ACE = 4
Const $SE_INHERIT_ONLY_ACE = 8
Const $SE_INHERITED_ACE = 16
Const $SE_SUCCESSFUL_ACCESS_ACE_FLAG = 64
Const $SE_FAILED_ACCESS_ACE_FLAG = 128
; ============================================================================================================

; #### Inheritance options for Explicit Access Entries ####
; ============================================================================================================
Const $SE_SUB_OBJECTS_ONLY_INHERIT = 1
Const $SE_SUB_CONTAINERS_ONLY_INHERIT = 2
Const $SE_SUB_CONTAINERS_AND_OBJECTS_INHERIT = 3
Const $SE_INHERIT_NO_PROPAGATE = 4
Const $SE_INHERIT_ONLY = 8
Const $SE_INHERITED_ACCESS_ENTRY = 16
Const $SE_INHERITED_PARENT = 0x10000000
Const $SE_INHERITED_GRAND_PARENT = 0x20000000
; ============================================================================================================

; #### File Object Inheritance ####
; ============================================================================================================
Const $SE_INHERIT_FILE = 0
Const $SE_INHERIT_FOLDER = 0
Const $SE_INHERIT_FOLDER_SUBFOLDER_SUBFILE = BitOR($SE_INHERIT_FOLDER, $SE_OBJECT_INHERIT_ACE, $SE_CONTAINER_INHERIT_ACE)
Const $SE_INHERIT_FOLDER_SUBFOLDER = BitOR($SE_INHERIT_FOLDER, $SE_CONTAINER_INHERIT_ACE)
Const $SE_INHERIT_FOLDER_SUBFILE = BitOR($SE_INHERIT_FOLDER, $SE_OBJECT_INHERIT_ACE)
Const $SE_INHERIT_SUBFOLDER_SUBFILE = BitOR($SE_OBJECT_INHERIT_ACE, $SE_CONTAINER_INHERIT_ACE, $SE_INHERIT_ONLY_ACE)
Const $SE_INHERIT_SUBFOLDER = BitOR($SE_CONTAINER_INHERIT_ACE, $SE_INHERIT_ONLY_ACE)
Const $SE_INHERIT_SUBFILE = BitOR($SE_OBJECT_INHERIT_ACE, $SE_INHERIT_ONLY_ACE)
; ============================================================================================================

; #### Registry Key Inheritance ####
; ============================================================================================================
Const $SE_INHERIT_KEY = 0
Const $SE_INHERIT_KEY_SUBKEY = BitOR($SE_INHERIT_KEY, $SE_CONTAINER_INHERIT_ACE)
Const $SE_INHERIT_SUBKEY = BitOR($SE_INHERIT_KEY, $SE_CONTAINER_INHERIT_ACE, $SE_INHERIT_ONLY_ACE)
; ============================================================================================================

; #### Access ACE Types ####
; ============================================================================================================
Const $SE_ALLOWED_ACE_TYPE = 0
Const $SE_DENIED_ACE_TYPE = 1
Const $SE_AUDIT_ACE_TYPE = 2
; ============================================================================================================

; #### Flags for SE_TRUSTEE.TrusteeFrom ####
; ============================================================================================================
Const $SE_TRUSTEE_IS_SID = 0
Const $SE_TRUSTEE_IS_NAME = 1
Const $SE_TRUSTEE_IS_BAD = 2
Const $SE_TRUSTEE_IS_OBJS_AND_SID = 3
Const $SE_TRUSTEE_IS_OBJS_AND_NAME = 4
; ============================================================================================================

; #### Flags for SE_EXPLICIT_ACCESS.AccessMode ####
; ============================================================================================================
Const $SE_INVALID_ACCESS = 0
Const $SE_GRANT_ACCESS = 1
Const $SE_SET_ACCESS = 2
Const $SE_DENY_ACCESS = 3
Const $SE_REVOKE_ACCESS = 4
Const $SE_AUDIT_SUCCESS = 5
Const $SE_AUDIT_FAILURE = 6
; ============================================================================================================

; #### Flags for _SeAddAuditAccessAceEx ####
; ============================================================================================================
Const $SE_AUDIT_ACCESS_SUCCESS = 1
Const $SE_AUDIT_ACCESS_FAILURE = 2
Const $SE_AUDIT_ACCESS_ALL = BitOR($SE_AUDIT_ACCESS_SUCCESS, $SE_AUDIT_ACCESS_FAILURE)
; ============================================================================================================

; #### ACL Information Class Constants ####
; ============================================================================================================
Const $SE_ACL_INFO_REVISION = 1
Const $SE_ACL_INFO_ACE_COUNT = 2
Const $SE_ACL_INFO_BYTES_INUSE = 3
Const $SE_ACL_INFO_BYTES_FREE = 4
; ============================================================================================================

; #### Control flags for Security Descriptor ####
; ============================================================================================================
Const $SE_OWNER_DEFAULTED = 0x0001
Const $SE_GROUP_DEFAULTED = 0x0002
Const $SE_DACL_PRESENT = 0x0004
Const $SE_DACL_DEFAULTED = 0x0008
Const $SE_SACL_PRESENT = 0x0010
Const $SE_SACL_DEFAULTED = 0x0020
Const $SE_DACL_AUTO_INHERIT_REQ = 0x0100
Const $SE_SACL_AUTO_INHERIT_REQ = 0x0200
Const $SE_DACL_AUTO_INHERITED = 0x0400
Const $SE_SACL_AUTO_INHERITED = 0x0800
Const $SE_DACL_PROTECTED = 0x1000
Const $SE_SACL_PROTECTED = 0x2000
Const $SE_RM_CONTROL_VALID = 0x4000
Const $SE_SELF_RELATIVE = 0x8000
; ============================================================================================================

; #### Invoke settings for _SeTreeResetNamedSecurtyInfo ####
; ============================================================================================================
Const $SE_TREE_SECUR_INVOKE_NEVER = 1
Const $SE_TREE_SECUR_INVOKE_EVERY_OBJECT = 2
Const $SE_TREE_SECUR_INVOKE_ON_ERROR = 3
Const $SE_TREE_SECUR_INVOKE_PRE_POST_ERROR = 6
; ============================================================================================================

; #### Return values of __SeTreeResetNamedSecurityCallBack ####
; ============================================================================================================
Const $SE_TREE_RESET_SECUR_CANCEL = 4
Const $SE_TREE_RESET_SECUR_RETRY = 5
; ============================================================================================================

; #### Access Rights for Local Policy ####
; ============================================================================================================
Const $SE_POLICY_VIEW_LOCAL_INFORMATION = 1
Const $SE_POLICY_VIEW_AUDIT_INFORMATION = 2
Const $SE_POLICY_GET_PRIVATE_INFORMATION = 4
Const $SE_POLICY_TRUST_ADMIN = 8
Const $SE_POLICY_CREATE_ACCOUNT = 16
Const $SE_POLICY_CREATE_SECRET = 32
Const $SE_POLICY_CREATE_PRIVILEGE = 64
Const $SE_POLICY_SET_DEFAULT_QUOTA_LIMITS = 128
Const $SE_POLICY_SET_AUDIT_REQUIREMENTS = 256
Const $SE_POLICY_AUDIT_LOG_ADMIN = 512
Const $SE_POLICY_SERVER_ADMIN = 1024
Const $SE_POLICY_LOOKUP_NAMES = 2048
Const $SE_POLICY_NOTIFICATION = 4096
; ============================================================================================================

; #### Policy Information Class ####
; ============================================================================================================
Const $SE_POLICY_AUDIT_LOG_INFO  = 1
Const $SE_POLICY_AUDIT_EVENTS_INFO = 2
Const $SE_POLICY_PRIMARY_DOMAIN_INFO = 3
Const $SE_POLICY_PD_ACCOUNT_INFO = 4
Const $SE_POLICY_ACCOUNT_DOMAIN_INFO = 5
Const $SE_POLICY_LSA_SERVER_ROLE_INFO = 6
Const $SE_POLICY_REPLICA_SOURCE_INFO = 7
Const $SE_POLICY_DEFAULT_QUOTA_INFO = 8
Const $SE_POLICY_MODIFICATION_INFO = 9
Const $SE_POLICY_AUDIT_FULL_SET_INFO = 10
Const $SE_POLICY_AUDIT_FULL_QUERY_INFO = 11
Const $SE_POLICY_DNS_DOMAIN_INFO = 12
; ============================================================================================================

; #### Security Setting for Audit Events ####
; ============================================================================================================
Const $SE_POLICY_AUDIT_EVENT_UNCHANGED = 0
Const $SE_POLICY_AUDIT_EVENT_SUCCESS = 1
Const $SE_POLICY_AUDIT_EVENT_FAILURE = 2
Const $SE_POLICY_AUDIT_EVENT_NONE = 4
; ============================================================================================================

; #### Audit Events ####
; ============================================================================================================
Const $SE_POLICY_AUDIT_SYSTEM = "AuditCategorySystem"
Const $SE_POLICY_AUDIT_LOGON = "AuditCategoryLogon"
Const $SE_POLICY_AUDIT_OBJECT_ACCESS = "AuditCategoryObjectAccess"
Const $SE_POLICY_AUDIT_PRIVILEGE_USE = "AuditCategoryPrivilegeUse"
Const $SE_POLICY_AUDIT_DETAILTRACKING = "AuditCategoryDetailedTracking"
Const $SE_POLICY_AUDIT_POLICY_CHANGE = "AuditCategoryPolicyChange"
Const $SE_POLICY_AUDIT_ACCOUNT_MANAGE = "AuditCategoryAccountManagement"
Const $SE_POLICY_AUDIT_DIRECTORY_SERVICE_ACCESS = "AuditCategoryDirectoryServiceAccess"
Const $SE_POLICY_AUDIT_ACCOUNT_LOGON = "AuditCategoryAccountLogon"
; ============================================================================================================

; #### Token Type ####
; ============================================================================================================
Const $SE_TOKEN_PRIMARY = 1
Const $SE_TOKEN_IMPERSONATION = 2
; ============================================================================================================

; #### Flags for _SeDuplicateHandle.Flags ####
; ============================================================================================================
Const $SE_DUP_CLOSE_SOURCE = 1
Const $SE_DUP_SAME_ACCESS = 2
; ============================================================================================================

; #### Flags for _SeDuplicateTokenEx.DesiredAccess ####
; ============================================================================================================
Const $SE_TOKEN_SAME_ACCESS = 0
Const $SE_TOKEN_MAXIMUM_ALLOWED = 0x2000000
; ============================================================================================================

; #### Security Impersonation Level ####
; ============================================================================================================
Const $SE_SECUR_ANONYMOUS = 0
Const $SE_SECUR_IDENTIFICATION = 1
Const $SE_SECUR_IMPERSONATION = 2
Const $SE_SECUR_DELEGATION = 3
; ============================================================================================================

; #### Context Tracking Mode for _SeInitSecurityQos ####
; ============================================================================================================
Const $SE_SECUR_STATIC_TRACKING = 0
Const $SE_SECUR_DYNAMIC_TRACKING = 1
; ============================================================================================================

; #### Flags for _SeEnumLocalUsers ####
; ============================================================================================================
Const $SE_FILTER_ALL_USER_ACCOUNTS = 0
Const $SE_FILTER_TEMP_DUPLICATE_ACCOUNT = 1
Const $SE_FILTER_NORMAL_ACCOUNT = 2
Const $SE_FILTER_PROXY_ACCOUNT = 4
Const $SE_FILTER_INTERDOMAIN_TRUST_ACCOUNT = 8
Const $SE_FILTER_WORKSTATION_TRUST_ACCOUNT = 0x10
Const $SE_FILTER_SERVER_TRUST_ACCOUNT = 0x20
; ============================================================================================================

; #### Netapi structures ####
; ============================================================================================================
Const $tagSE_LOCALGROUP_INFO_1 = "ptr GroupName;ptr GroupComment"
Const $tagSE_USER_INFO_20 = "ptr UserName;ptr FullName;ptr Comment;ptr UserFlags;ptr UserRid"
Const $tagSE_USER_INFO_01 = "ptr UserName;ptr Password;dword PswdAge;dword Priv;ptr HomeDir;ptr Comment;dword Flags;ptr ScriptPath;wchar szUserName[21];wchar szPassword[64];wchar szHomeDir[260];wchar szComment[260];wchar szScriptPath[260]"

Const $tagSE_USER_MODALS_INFO_0 = "dword MinPswdLen;dword MaxPswdAge;dword MinPswdAge;dword ForceLogoff;dword PswdHistoryLen"
Const $tagSE_USER_MODALS_INFO_1 = "dword Role;ptr Primary"
Const $tagSE_USER_MODALS_INFO_2 = "ptr DomainName;ptr DomainSid"
Const $tagSE_USER_MODALS_INFO_3 = "dword LockoutDuration;dword LockoutObservationWindow;dword LockoutThreshold"
; ============================================================================================================

; #### Sid Type Constants ####
; ============================================================================================================
Const $SE_SID_TYPE_USER = 1
Const $SE_SID_TYPE_GROUP = 2
Const $SE_SID_TYPE_DOMAIN = 3
Const $SE_SID_TYPE_ALIAS = 4
Const $SE_SID_TYPE_WELLKNOWN_GROUP = 5
Const $SE_SID_TYPE_DELETED_ACCOUNT = 6
Const $SE_SID_TYPE_INVALID = 7
Const $SE_SID_TYPE_UNKNOWN = 8
Const $SE_SID_TYPE_COMPUTER = 9
Const $SE_SID_TYPE_LABEL = 10
; ============================================================================================================

; #### Relative Ids ####
; ============================================================================================================
Const $SE_DOMAIN_USER_RID_ADMIN = 0x000001F4
Const $SE_DOMAIN_USER_RID_GUEST = 0x000001F5

Const $SE_DOMAIN_GROUP_RID_ADMINS = 0x00000200
Const $SE_DOMAIN_GROUP_RID_USERS = 0x00000201
Const $SE_DOMAIN_GROUP_RID_GUESTS = 0x00000202

Const $SE_DOMAIN_ALIAS_RID_ADMINS = 0x00000220
Const $SE_DOMAIN_ALIAS_RID_USERS = 0x00000221
Const $SE_DOMAIN_ALIAS_RID_GUESTS = 0x00000222
Const $SE_DOMAIN_ALIAS_RID_POWER_USERS = 0x00000223
Const $SE_DOMAIN_ALIAS_RID_ACCOUNT_OPS = 0x00000224
Const $SE_DOMAIN_ALIAS_RID_SYSTEM_OPS = 0x00000225
Const $SE_DOMAIN_ALIAS_RID_PRINT_OPS = 0x00000226
Const $SE_DOMAIN_ALIAS_RID_BACKUP_OPS = 0x00000227
Const $SE_DOMAIN_ALIAS_RID_REPLICATOR = 0x00000228
; ============================================================================================================

; #### NT Well-Known Authorities ####
; ============================================================================================================
Const $SE_SECURITY_DIALUP_RID = 0x00000001
Const $SE_SECURITY_NETWORK_RID = 0x00000002
Const $SE_SECURITY_BATCH_RID = 0x00000003
Const $SE_SECURITY_INTERACTIVE_RID = 0x00000004
Const $SE_SECURITY_SERVICE_RID = 0x00000006
Const $SE_SECURITY_ANONYMOUS_LOGON_RID = 0x00000007
Const $SE_SECURITY_PROXY_RID = 0x00000008
Const $SE_SECURITY_SERVER_LOGON_RID = 0x00000009

Const $SE_SECURITY_LOGON_IDS_RID = 0x00000005
Const $SE_SECURITY_LOGON_IDS_RID_COUNT = 3
Const $SE_SECURITY_LOCAL_SYSTEM_RID = 0x00000012
Const $SE_SECURITY_NT_NON_UNIQUE = 0x00000015
Const $SE_SECURITY_BUILTIN_DOMAIN_RID = 0x00000020
; ============================================================================================================

; #### Flags for _SeGetWellKnownAccountSid ####
; ============================================================================================================
Const $SE_WELLKNOWN_ADMIN = -1
Const $SE_WELLKNOWN_GUEST = -2
Const $SE_WELLKNOWN_POWER_USERS = -3
Const $SE_WELLKNOWN_USERS = -4
Const $SE_WELLKNOWN_ADMINS = -5
Const $SE_WELLKNOWN_GUESTS = -6
; ============================================================================================================

; #### SID Authority Ids ####
; ============================================================================================================
Const $SE_NULL_SID_AUTHORITY = 0
Const $SE_WORLD_SID_AUTHORITY = 1
Const $SE_LOCAL_SID_AUTHORITY = 2
Const $SE_CREATOR_SID_AUTHORITY = 3
Const $SE_NON_UNIQUE_AUTHORITY = 4
Const $SE_NT_AUTHORITY = 5
Const $SE_RESOURCE_MANAGER_AUTHORITY = 9
; ============================================================================================================

; #### Maximum SID size ####
; ============================================================================================================
Const $SE_MAX_SID_SIZE = 68
; ============================================================================================================

; #### Securable Object Types ####
; ============================================================================================================
Const $SE_UNKNOWN_OBJECT_TYPE = 0
Const $SE_FILE_OBJECT = 1
Const $SE_SERVICE = 2
Const $SE_PRINTER = 3
Const $SE_REGISTRY_KEY = 4
Const $SE_LMSHARE = 5
Const $SE_KERNEL_OBJECT = 6
Const $SE_WINDOW_OBJECT = 7
Const $SE_DS_OBJECT = 8
Const $SE_DS_OBJECT_ALL = 9
Const $SE_PROVIDER_DEFINED_OBJECT = 10
Const $SE_WMIGUID_OBJECT = 11
Const $SE_REGISTRY_WOW64_32KEY = 12
; ============================================================================================================

; #### Flags for USER_INFO_?.Priv ####
; ============================================================================================================
Const $SE_USER_PRIV_GUEST = 0
Const $SE_USER_PRIV_USER = 1
Const $SE_USER_PRIV_ADMIN = 2
; ============================================================================================================

; #### Attributes for Local User ####
; ============================================================================================================
Const $SE_UF_SCRIPT = 0x000001
Const $SE_UF_ACCOUNTDISABLE = 0x000002
Const $SE_UF_HOMEDIR_REQUIRED = 0x000008
Const $SE_UF_LOCKOUT = 0x000010
Const $SE_UF_PASSWD_NOTREQD = 0x000020
Const $SE_UF_PASSWD_CANT_CHANGE = 0x000040
Const $SE_UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 0x000080
Const $SE_UF_TEMP_DUPLICATE_ACCOUNT = 0x000100
Const $SE_UF_NORMAL_ACCOUNT = 0x000200
Const $SE_UF_INTERDOMAIN_TRUST_ACCOUNT = 0x000800
Const $SE_UF_WORKSTATION_TRUST_ACCOUNT = 0x001000
Const $SE_UF_SERVER_TRUST_ACCOUNT = 0x002000
Const $SE_UF_DONT_EXPIRE_PASSWD = 0x010000
Const $SE_UF_MNS_LOGON_ACCOUNT = 0x020000
Const $SE_UF_SMARTCARD_REQUIRED = 0x040000
Const $SE_UF_TRUSTED_FOR_DELEGATION = 0x080000
Const $SE_UF_NOT_DELEGATED = 0x100000
Const $SE_UF_USE_DES_KEY_ONLY = 0x200000
Const $SE_UF_DONT_REQUIRE_PREAUTH = 0x400000
Const $SE_UF_PASSWORD_EXPIRED = 0x800000
; ============================================================================================================

; #### Flags for _SeOpenUserBrowser.Flags ####
; ============================================================================================================
Const $SE_USER_BROWSER_INCLUDE_ALIASES = 1
Const $SE_USER_BROWSER_INCLUDE_GROUPS = 2
Const $SE_USER_BROWSER_INCLUDE_USER_BUTTONS = 4
Const $SE_USER_BROWSER_INCLUDE_USERS = 8
Const $SE_USER_BROWSER_INCLUDE_NETWORK = 16
Const $SE_USER_BROWSER_INCLUDE_INTERACTIVE = 32
Const $SE_USER_BROWSER_INCLUDE_EVERYONE = 64
Const $SE_USER_BROWSER_INCLUDE_CREATOR_OWNER = 128
Const $SE_USER_BROWSER_NO_LOCAL_DOMAIN = 256
Const $SE_USER_BROWSER_SINGLE_SELECTION = 0x1000
Const $SE_USER_BROWSER_INCLUDE_SYSTEM = 0x10000
Const $SE_USER_BROWSER_DEFAULT = BitOR($SE_USER_BROWSER_INCLUDE_ALIASES, $SE_USER_BROWSER_INCLUDE_GROUPS, _
		$SE_USER_BROWSER_INCLUDE_USERS, $SE_USER_BROWSER_INCLUDE_SYSTEM, _
		$SE_USER_BROWSER_INCLUDE_NETWORK, $SE_USER_BROWSER_INCLUDE_INTERACTIVE, _
		$SE_USER_BROWSER_INCLUDE_EVERYONE, $SE_USER_BROWSER_INCLUDE_CREATOR_OWNER)
; ============================================================================================================

; #### Structures for _SeOpenUserBrowser ####
; ============================================================================================================
Const $tagSE_USER_BROWSER = "dword Size;int Cancelled;long Unknown;hWnd hWnd;ptr Title;ptr Domain;dword Flags;dword HelpId;ptr HeapFile;wchar szTitle[64];wchar szDomain[64];wchar szHeapFile[520]"
Const $tagSE_ENUM_USER_SELECTION = "dword SidType;ptr Sid1;ptr Sid2;ptr FullName;ptr UserName;ptr DisplayName;ptr Domain;ptr Description;ubyte Buffer[1024]"
; ============================================================================================================

; #### Flags for _SeProtectMemory ####
; ============================================================================================================
Const $SE_ENCRYPT_SAME_PROCESS = 0
Const $SE_ENCRYPT_CROSS_PROCESS = 1
Const $SE_ENCRYPT_SAME_LOGON = 2
; ============================================================================================================

; #### DPAPI structures ####
; ============================================================================================================
Const $tagSE_DATA_BLOB = "dword Length;ptr Data"
Const $tagSE_CRYPT_PROMPT = "dword Size;dword PromptFlags;hWnd HWndParent;ptr Prompt"
; ============================================================================================================

; #### Protection flags for DPAPI ####
; ============================================================================================================
Const $SE_CRYPTPROTECT_CREATOR = 0
Const $SE_CRYPTPROTECT_UI_FORBIDDEN = 1
Const $SE_CRYPTPROTECT_LOCAL_MACHINE = 4
Const $SE_CRYPTPROTECT_AUDIT = 16
Const $SE_CRYPTPROTECT_VERIFY_PROTECTION = 64
; ============================================================================================================

; #### Prompt flags for DPAPI ####
; ============================================================================================================
Const $SE_CRYPTPROTECT_NOPROMPT = 0
Const $SE_CRYPTPROTECT_ON_UNPROTECT = 1
Const $SE_CRYPTPROTECT_ON_PROTECT = 2
; ============================================================================================================

; #### AlgIds for _SeHashCertificate ####
; ============================================================================================================
Const $SE_CALG_CRC32 = 0x7777
Const $SE_CALG_3DES = 0x6603
Const $SE_CALG_3DES_112 = 0x6609
Const $SE_CALG_AES = 0x6611
Const $SE_CALG_AES_128 = 0x660e
Const $SE_CALG_MD2 = 0x8001
Const $SE_CALG_MD4 = 0x8002
Const $SE_CALG_MD5 = 0x8003
Const $SE_CALG_SHA = 0x8004
Const $SE_CALG_SHA1 = $SE_CALG_SHA
Const $SE_CALG_MAC = 0x8005
Const $SE_CALG_SHA_256 = 0x800c
Const $SE_CALG_SHA_384 = 0x800d
Const $SE_CALG_SHA_512 = 0x800e
Const $SE_CALG_RC2 = 0x6602
Const $SE_CALG_RC4 = 0x6801
Const $SE_CALG_RC5 = 0x660d
Const $SE_CALG_RSA_KEYX = 0xa400
Const $SE_CALG_RSA_SIGN = 0x2400
; ============================================================================================================

; #### Logon Providers ####
; ============================================================================================================
Const $SE_LOGON32_PROVIDER_DEFAULT = 0
Const $SE_LOGON32_PROVIDER_WINNT35 = 1
Const $SE_LOGON32_PROVIDER_WINNT40 = 2	; Use the NTLM logon provider.
Const $SE_LOGON32_PROVIDER_WINNT50 = 3	; Use the negotiate logon provider. 
; ============================================================================================================

; #### Logon type Constants ####
; ============================================================================================================
Const $SE_LOGON32_LOGON_INTERACTIVE = 2
Const $SE_LOGON32_LOGON_NETWORK = 3
Const $SE_LOGON32_LOGON_BATCH = 4
Const $SE_LOGON32_LOGON_SERVICE = 5
; ============================================================================================================

; #### Logon Options for _SeCreateLogonProcess ####
; ============================================================================================================
Const $SE_LOGON_DEFAULT = 0
Const $SE_LOGON_WITH_PROFILE = 1
Const $SE_LOGON_NETCREDENTIALS_ONLY = 2
; ============================================================================================================

; #### LSA Secret Object Desired Access ####
; ============================================================================================================
Const $SE_SECRET_WRITE = 1
Const $SE_SECRET_READ = 2
Const $SE_SECRET_ALL_ACCESS = BitOR($SE_SECRET_READ, $SE_SECRET_WRITE)
; ============================================================================================================

; #### Flags for _SeBinaryToString.Flags ####
; ============================================================================================================
Const $SE_STRING_BASE64_HEADER = 0
Const $SE_STRING_BASE64 = 1
Const $SE_STRING_BINARY = 2
Const $SE_STRING_BASE64_REQUEST_HEADER = 3
Const $SE_STRING_HEX = 4
Const $SE_STRING_HEX_ASCII = 5
Const $SE_STRING_BASE64_X509_CRL_HEADER = 9
Const $SE_STRING_HEX_ADDR = 10
Const $SE_STRING_HEX_ASCII_ADDR = 11
Const $SE_STRING_HEX_RAW = 12
Const $SE_STRING_STRICT = 0x10000000

Const $SE_STRING_NO_CRLF = 0x40000000
Const $SE_STRING_NO_CR = 0x80000000
; ============================================================================================================

; #### Flags for __SeCertGetNameText.Type ####
; ============================================================================================================
Const $SE__CERT_NAME_EMAIL_TYPE = 1
Const $SE__CERT_NAME_SIMPLE_DISPLAY_TYPE = 4
Const $SE__CERT_NAME_URL_TYPE = 7
; ============================================================================================================

; #### Flags for __SeCertGetNameText.Flags ####
; ============================================================================================================
Const $SE__CERT_NAME_ISSUER_FLAG = 1
; ============================================================================================================

; #### Flags for __SeCertNameToText.Flags ####
; ============================================================================================================
Const $SE__CERT_X500_NAME_STR = 3
Const $SE__CERT_NAME_STR_REVERSE_FLAG = 0x02000000
Const $SE__CERT_NAME_STR_CRLF_FLAG = 0x08000000
Const $SE__CERT_NAME_STR_NO_QUOTING_FLAG = 0x10000000
Const $SE__CERT_NAME_TO_STR_DEFAULT = BitOR($SE__CERT_NAME_STR_REVERSE_FLAG, $SE__CERT_NAME_STR_CRLF_FLAG, _
				$SE__CERT_NAME_STR_NO_QUOTING_FLAG, $SE__CERT_X500_NAME_STR)
; ============================================================================================================

; #### Object Ids for __SeDecodeObject ####
; ============================================================================================================
Const $SE__PKCS7_SIGNER_INFO = 500
Const $SE__OID_RSA_signingTime = "1.2.840.113549.1.9.5"
; ============================================================================================================

; #### Flags for __SeQueryObject.ContentType ####
; ============================================================================================================
Const $SE__CERT_QUERY_CONTENT_SERIALIZED_STORE = 4
Const $SE__CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED = 10
Const $SE__CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED = BitShift(1, -$SE__CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED)
; ============================================================================================================

; #### Flags for __SeQueryObject.FormatType ####
; ============================================================================================================
Const $SE__CERT_QUERY_FORMAT_BINARY = 1
Const $SE__CERT_QUERY_FORMAT_BASE64_ENCODED = 2
; ============================================================================================================

; #### Flags for __SeMsgGetParam.ParamType ####
; ============================================================================================================
Const $SE__CMSG_SIGNER_INFO_PARAM = 6
; ============================================================================================================

; #### Flags for __SeMsgClose.Flags ####
; ============================================================================================================
Const $SE__CERT_CLOSE_STORE_FORCE_FLAG = 1
Const $SE__CERT_CLOSE_STORE_CHECK_FLAG = 2
; ============================================================================================================

; #### Flags for __SeCertFindCertificateInStore.Flags ####
; ============================================================================================================
Const $SE__CERT_INFO_ISSUER_FLAG = 4
Const $SE__CERT_COMPARE_NAME = 2
Const $SE__CERT_FIND_ISSUER_NAME = BitOR(BitShift($SE__CERT_COMPARE_NAME, -16), $SE__CERT_INFO_ISSUER_FLAG)
; ============================================================================================================

; #### Encoding Type ####
; ============================================================================================================
Const $SE__X509_ASN_ENCODING = 1
Const $SE__PKCS_7_ASN_ENCODING = 0x00010000
; ============================================================================================================

; #### Structures used for SEH ####
; ============================================================================================================
Const $tagSE_SAFE_ADDRESS = "ptr ExceptionRecord;ptr Context;dword_ptr Parameter"
Const $tagSE_STACK = "ptr ReturnAddress;ptr CurrentAddressParam;ptr CallAddress;ptr ReturnAddressParam"
Const $tagSE_SEH_TIB = "ptr PrevSeh;ptr Handler;ptr SafeAddress;ptr SafeAddressParam;ptr ReturnAddress;ptr ReturnAddressParam;ptr Esp;ptr Ebp"
Const $tagSE_EXCEPTION_RECORD = "long ExceptionCode;long ExceptionFlag;ptr ExceptionRecord;ptr ExceptionAddress;dword ParamCount;ulong_ptr ParamList[15]"
Const $tagSE_THREAD_CONTEXT = "dword ContextFlags;ptr Dr0;ptr Dr1;ptr Dr2;ptr Dr3;ptr Dr6;" & _
		"ptr Dr7;ptr ControlWord;ptr StatusWord;ptr TagWord;ptr ErrorOffset;" & _
		"ptr ErrorSelector;ptr DataOffset;ptr DataSelector;byte RegisterArea[80];" & _
		"ptr Cr0NpxState;ptr SegGs;ptr SegFs;ptr SegEs;ptr SegDs;ptr Edi;" & _
		"ptr Esi;ptr Ebx;ptr Edx;ptr Ecx;ptr Eax;ptr Ebp;ptr Eip;ptr SegCs;" & _
		"ptr EFlags;ptr Esp;ptr SegS"
; ============================================================================================================

; #### Exception Handler Return Code ####
; ============================================================================================================
Const $SE_EXCEPTION_CONTINUE_EXECUTION = 0
Const $SE_EXCEPTION_CONTINUE_SEARCH = 1
Const $SE_EXCEPTION_NESTED_EXCEPTION = 2
Const $SE_EXCEPTION_COLLIDED_UNWIND = 3
; ============================================================================================================

; #### Name of the Semaphore object ####
; ============================================================================================================
Const $SE_SEMAPHORE_INSTANCE = "\lsasecur"
; ============================================================================================================

; #### Flags For _SeSaferCreateLevel.LevelId ###
; ============================================================================================================
Const $SE_LEVEL_DISALLOWED = 0
Const $SE_LEVEL_UNTRUSTED = 0x1000
Const $SE_LEVEL_CONSTRAINED = 0x10000
Const $SE_LEVEL_NORMAL_USER = 0x20000
Const $SE_LEVEL_FULLY_TRUSTED = 0x40000
; ============================================================================================================

; #### Flags for _SeSaferCreateLevel.ScopeId ####
; ============================================================================================================
Const $SE_SAFER_SCOPEID_MACHINE = 1
Const $SE_SAFER_SCOPEID_USER = 2
; ============================================================================================================

; #### System-defined Authorization Id ####
; ============================================================================================================
Const $SE_LUID_NETWORK_SERVICE = 0x3E4
Const $SE_LUID_LOCAL_SERVICE = 0x3E5
Const $SE_LUID_ANONYMOUS_LOGON = 0x3E6
Const $SE_LUID_SYSTEM = 0x3E7
; ============================================================================================================

; #### Flags for _SeQuerySecurityObject.InfoClass ####
; ============================================================================================================
Const $SE_OBJ_BASIC_INFO = 0
Const $SE_OBJ_NAME_INFO = 1
Const $SE_OBJ_TYPE_INFO = 2
Const $SE_OBJ_ALL_INFO = 3
Const $SE_OBJ_DATA_INFO = 4
; ============================================================================================================

; #### Structures for Credentials ####
; ============================================================================================================
Const $tagSE_CREDENTIAL = "dword Flags;dword Type;ptr TargetName;ptr Comment;int64 LastWritten;dword CredentialBlobSize;ptr CredentialBlob;dword Persist;dword AttributesCount;ptr Attributes;ptr TargetAlias;ptr UserName"
Const $tagSE_CREDENTIAL_WRITE = $tagSE_CREDENTIAL & ";wchar wzTargetName[256];wchar wzComment[256];ubyte bCredentialBlob[512];wchar wzTargetAlias[256];wchar wzUserName[513]"
Const $tagSE_CREDENTIAL_ATTRIBUTES = "ptr Keyword;dword Flags;dword ValueSize;ptr Value"
Const $tagSE_CREDENTIAL_ATTRIBUTES_WRITE = $tagSE_CREDENTIAL_ATTRIBUTES & ";wchar wzKeyword[256];ubyte bValue[256]"
; ============================================================================================================

; #### Flags for SE_CREDENTIAL.Flags ####
; ============================================================================================================
Const $SE_CRED_FLAGS_DEFAULT = 0
Const $SE_CRED_FLAGS_PROMPT_NOW = 2
Const $SE_CRED_FLAGS_USERNAME_TARGET = 4
; ============================================================================================================

; #### Credential Type ####
; ============================================================================================================
Const $SE_CRED_TYPE_GENERIC = 1
Const $SE_CRED_TYPE_DOMAIN_PASSWORD = 2
Const $SE_CRED_TYPE_DOMAIN_CERTIFICATE = 3
Const $SE_CRED_TYPE_DOMAIN_VISIBLE_PASSWORD = 4
Const $SE_CRED_TYPE_DOMAIN_EXTENDED = 6
; ============================================================================================================

; #### Persist for Credential ####
; ============================================================================================================
Const $SE_CRED_PERSIST_SESSION = 1
Const $SE_CRED_PERSIST_LOCAL_MACHINE = 2
Const $SE_CRED_PERSIST_ENTERPRISE = 3
; ============================================================================================================

; ### God's constant ####
; ============================================================================================================
Const $SE_GOD_CONSTANT = 0x077CB531
; ============================================================================================================

; #### Structures for Authentication ####
; ============================================================================================================
Const $tagSE_SECURITY_PKG = "ptr Capabilities;ptr VersionRpcId;ptr MaxToken;ptr Name;ptr Comment"
Const $tagSE_SECURITY_LOGON_SESSION = "align 4;ulong Size;int64 LogonId;ubyte UserName[8];ubyte LogonDomain[8];ubyte AuthenticationPkg[8];ulong LogonType;ulong Session;ptr Sid;int64 LogonTime;ubyte LogonServer[8];ubyte DnsDomainName[8];ubyte Upn[8]"
; ============================================================================================================

; #### Flags for SE_SECURITY_LOGON_SESSION.LogonType ####
; ============================================================================================================
Const $SE_LOGON_TYPE_INTERACTIVE = 2
Const $SE_LOGON_TYPE_NETWORK = 3
Const $SE_LOGON_TYPE_BATCH = 4
Const $SE_LOGON_TYPE_SERVICE = 5
Const $SE_LOGON_TYPE_PROXY = 6
Const $SE_LOGON_TYPE_UNLOCK = 7
Const $SE_LOGON_TYPE_NETWORK_CLEARTEXT = 8
Const $SE_LOGON_TYPE_NEW_CREDENTIALS = 9
Const $SE_LOGON_TYPE_REMOTE_INTERACTIVE = 10
Const $SE_LOGON_TYPE_CACHED_INTERACTIVE = 11
Const $SE_LOGON_TYPE_CACHED_REMOTE_INTERACTIVE = 12
Const $SE_LOGON_TYPE_CACHED_UNLOCK = 13
; ============================================================================================================

; #### Flags for SE_SECURITY_PKG.Capabilities ####
; ============================================================================================================
Const $SE_SECPKG_FLAG_INTEGRITY = 0x1
Const $SE_SECPKG_FLAG_PRIVACY = 0x2
Const $SE_SECPKG_FLAG_TOKEN_ONLY = 0x4
Const $SE_SECPKG_FLAG_DATAGRAM = 0x8
Const $SE_SECPKG_FLAG_CONNECTION = 0x10
Const $SE_SECPKG_FLAG_MULTI_REQUIRED = 0x20
Const $SE_SECPKG_FLAG_CLIENT_ONLY = 0x40
Const $SE_SECPKG_FLAG_EXTENDED_ERROR = 0x80
Const $SE_SECPKG_FLAG_IMPERSONATION = 0x100
Const $SE_SECPKG_FLAG_ACCEPT_WIN32_NAME = 0x200
Const $SE_SECPKG_FLAG_STREAM = 0x400
Const $SE_SECPKG_FLAG_NEGOTIABLE = 0x800
Const $SE_SECPKG_FLAG_GSS_COMPATIBLE = 0x1000
Const $SE_SECPKG_FLAG_LOGON = 0x2000
Const $SE_SECPKG_FLAG_ASCII_BUFFERS = 0x4000
Const $SE_SECPKG_FLAG_FRAGMENT = 0x8000
Const $SE_SECPKG_FLAG_MUTIAL_AUTH = 0x10000
Const $SE_SECPKG_FLAG_DELEGATION = 0x20000
Const $SE_SECPKG_FLAG_READONLY_WITH_CHECKSUM = 0x40000
Const $SE_SECPKG_FLAG_RESTRICTED_TOKENS = 0x80000
Const $SE_SECPKG_FLAG_NEGO_EXTENDER = 0x100000
Const $SE_SECPKG_FLAG_NEGOTIABLE2 = 0x200000
; ============================================================================================================

; #### Structures for System-Call Authentication ####
; ============================================================================================================
Const $tagSE_VERIFY_SYSTEM_CALL = "ptr Procedure;ubyte Opcode[8]"
; ============================================================================================================

; #### FUNCTIONS ####
; ============================================================================================================
; ___SeReleaseSemaphoreInstance
; ___SeSEHDefaultHandler
; __SeCertCloseStore
; __SeCertFindCertificateInStore
; __SeCertGetNameText
; __SeCertNameToText
; __SeCreateSemaphore
; __SeCreateThread
; __SeDecodeObject
; __SeFileTimeToSystemTime
; __SeGetExitCodeThread
; __SeGetProcAddress
; __SeLongPtrToBytes
; __SeMsgClose
; __SeMsgGetParam
; __SeQueryObject
; __SeReleaseSemaphore
; __SeSEHDefaultHandler
; __SeStringToBytesA
; __SeTreeResetSecurityCallBack
; __SeVirtualAlloc
; __SeWaitForObject
; _SeAddAccessAllowedAceEx
; _SeAddAccessDeniedAceEx
; _SeAddAccountRight
; _SeAddAce
; _SeAddAuditAccessAceEx
; _SeAddLocalGroupMembers
; _SeAdjustTokenPrivs
; _SeAllocAndInitSid
; _SeAllocGUID
; _SeAllocLUID
; _SeApiBufferFree
; _SeAreAllAccessesGranted
; _SeAreAnyAccessesGranted
; _SeBackupPassword
; _SeBinaryToString
; _SeCheckTokenMembership
; _SeCipherDes16
; _SeCloseHandle
; _SeClosePolicy
; _SeCompareUserRight
; _SeCompareUserRightEx
; _SeConvertDesiredAccess
; _SeConvertSDToStringSD
; _SeConvertSidToSSid
; _SeConvertSSidToSid
; _SeConvertStringSDToSD
; _SeCopyMemory
; _SeCopySid
; _SeCreateAce
; _SeCreateBuffer
; _SeCreateLocalGroup
; _SeCreateLocalUser
; _SeCreateLogonProcess
; _SeCreateSecret
; _SeCreateSecurityDescriptor
; _SeCreateServiceSid
; _SeCreateSystemProcess
; _SeCreateUserProcess
; _SeCreateWellKnownSid
; _SeDeleteAce
; _SeDeleteLocalGroup
; _SeDeleteLocalGroupMembers
; _SeDeleteLocalUser
; _SeDuplicateAcl
; _SeDuplicateHandle
; _SeDuplicateSD
; _SeDuplicateToken
; _SeDuplicateTokenEx
; _SeEnumAccountRights
; _SeEnumAccounts
; _SeEnumAccountsWithUserRight
; _SeEnumEntriesFromAcl
; _SeEnumExplicitEntriesFromAcl
; _SeEnumInheritedEntriesFromAcl
; _SeEnumLocalGroupMembers
; _SeEnumLocalGroups
; _SeEnumLocalUsers
; _SeEnumPrivateData
; _SeEnumPrivs
; _SeEnumTokenGroups
; _SeEnumTokenPrivs
; _SeEnumUserLocalGroups
; _SeEnumWellKnownSids
; _SeEqualDomainSid
; _SeEqualPrefixSid
; _SeEqualSid
; _SeEqualToken
; _SeExportSecurityDescriptor
; _SeFillMemory
; _SeFormatMsg
; _SeFreeMemory
; _SeFreeSid
; _SeGenRandom
; _SeGetAce
; _SeGetAceDetails
; _SeGetAclInformation
; _SeGetEffectiveRightsFromAcl
; _SeGetFileSecurity
; _SeGetFileSignature
; _SeGetInheritanceSource
; _SeGetKernelObjectSecurity
; _SeGetLengthSid
; _SeGetLocalGroupInfo
; _SeGetLocalUserInfo
; _SeGetNamedAccessRights
; _SeGetNamedSecurityInfo
; _SeGetRegKeySecurity
; _SeGetSecretSecurity
; _SeGetSecurityDescriptorControl
; _SeGetSecurityDescriptorDacl
; _SeGetSecurityDescriptorGroup
; _SeGetSecurityDescriptorLength
; _SeGetSecurityDescriptorOwner
; _SeGetSecurityDescriptorSacl
; _SeGetSecurityInfo
; _SeGetServiceSecurity
; _SeGetShareObjectDacl
; _SeGetSidIdentifierAuthority
; _SeGetSidSubAuthority
; _SeGetSidSubAuthorityCount
; _SeGetTokenInformation
; _SeGetTokenType
; _SeGetTokenUser
; _SeGetUserAccountSid
; _SeGetUserModals
; _SeGetUserName
; _SeGetWellKnownAccountSid
; _SeHashCertificate
; _SeHashFile
; _SeHeapAlloc
; _SeHeapFree
; _SeHeapSize
; _SeImpersonateLoggedOnUser
; _SeImpersonateProcessPath
; _SeImpersonateSystemContext
; _SeImportSecurityDescriptor
; _SeInitAcl
; _SeInitBufferW
; _SeInitExplicitEntries
; _SeInitObjAttrib
; _SeInitSecurityDescriptor
; _SeInitSecurityQos
; _SeInitSid
; _SeIsEntryInheritable
; _SeIsPrivEnabled
; _SeIsPrivsEnabled
; _SeIsSelfRelativeSD
; _SeIsTokenRestricted
; _SeIsUserAdmin
; _SeIsUserAdminEx
; _SeIsValidAce
; _SeIsValidAcl
; _SeIsValidHandle
; _SeIsValidSecurityDescriptor
; _SeIsValidSid
; _SeIsWellKnownSid
; _SeLastError
; _SeLocalFree
; _SeLogonUser
; _SeLongToDWORD
; _SeLookupAccountName
; _SeLookupAccountSid
; _SeLookupPrivDescription
; _SeLookupPrivName
; _SeLookupPrivsFromDacl
; _SeLookupPrivValue
; _SeMakeAbsoluteSD
; _SeMakeSelfRelativeSD
; _SeNetBuffer
; _SeNetBufferSize
; _SeOpenPolicy
; _SeOpenProcess
; _SeOpenProcessToken
; _SeOpenRegKey
; _SeOpenSecret
; _SeOpenService
; _SeOpenUserBrowser
; _SePolicyQueryAuditEvent
; _SePolicyQueryInformation
; _SePolicyQueryLsaServerRole
; _SePolicySetAuditEvent
; _SePolicySetInformation
; _SeProcessHeap
; _SeProtectData
; _SeProtectMemory
; _SeProtectObjectFromClose
; _SeQuerySecret
; _SeReadBytes
; _SeReadProcessMemory
; _SeRegisterExceptionHandler
; _SeRegisterMemoryNotify
; _SeRemoveAccountRight
; _SeRetrievePrivateData
; _SeRevertToSelf
; _SeSetEntriesInAcl
; _SeSetEntriesInAcl1
; _SeSetEntriesOrder
; _SeSetFileInheritSecurity
; _SeSetFileSecurity
; _SeSetKernelObjectSecurity
; _SeSetLocalUserInfo
; _SeSetNamedSecurityInfo
; _SeSetRegKeySecurity
; _SeSetSecret
; _SeSetSecurityDescriptorControl
; _SeSetSecurityDescriptorDacl
; _SeSetSecurityDescriptorGroup
; _SeSetSecurityDescriptorOwner
; _SeSetSecurityDescriptorSacl
; _SeSetSecurityInfo
; _SeSetServiceSecurity
; _SeSetShareObjectDacl
; _SeSetTokenInformation
; _SeSetUserModals
; _SeSingletonEx
; _SeStorePrivateData
; _SeStringToBinary
; _SeTreeResetNamedSecurityInfo
; _SeTreeResetNamedSecurityInfoEx
; _SeUnprotectData
; _SeUnprotectMemory
; _SeWriteBytes
; _SeWriteProcessMemory
; snts
; ============================================================================================================

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeHeapAlloc
; Description	: This function allocates a block of memory from the process heap.
; Parameter(s)	: $iBytesToAlloc	- Specifies the bytes to allocate.
; Return values	: Base address allocated is returned if succeeds, zero otherwise.
; Author	: Pusofalse
; ============================================================================================================
Func _SeHeapAlloc($iBytesToAlloc = 8)
	If ($iBytesToAlloc < 1) Then Return 0

	Local $iResult
	$iResult = DllCall("Kernel32.dll", "ptr", "HeapAlloc", "handle", $SE_PROCESSHEAP, _
			"int", 8, "int", $iBytesToAlloc)
	Return SetExtended($iBytesToAlloc, $iResult[0])
EndFunc	;==>_SeHeapAlloc

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeHeapFree
; Description	: Free the memory allocated by _SeHeapAlloc.
; Parameter(s)	: $pBuffer	- Base address.
;		: $iError	- Specify the @error of this function.
;		: $iExtended	- Specify the @extended of this function.
; Return values	: TRUE if succeeds, FALSE otherwise.
; Author	: Pusofalse
; ============================================================================================================
Func _SeHeapFree($pBuffer, $iError = @error, $iExtended = @extended)
	If $pBuffer < 1 Then Return SetError($iError, $iExtended, 0)

	Local $iResult
	$iResult = DllCall("Kernel32.dll", "bool", "HeapFree", "handle", $SE_PROCESSHEAP, _
			"int", 0, "ptr", $pBuffer)
	Return SetError($iError, $iExtended, $iResult[0])
EndFunc	;==>_SeHeapFree

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeHeapSize
; Description	: Retrieve the size of a buffer allocated by _SeHeapAlloc.
; Parameter(s)	: $pBuffer	- A pointer to a buffer.
; Return values	: Length, in bytes, of the $pBuffer.
; Author	: Pusofalse
; ============================================================================================================
Func _SeHeapSize($pBuffer)
	If $pBuffer  = 0 Then Return 0

	Local $iResult
	$iResult = DllCall("Kernel32.dll", "long", "HeapSize", "handle", $SE_PROCESSHEAP, _
			"int", 0, "ptr", $pBuffer)
	Return $iResult[0]
EndFunc	;==>_SeHeapSize

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeProcessHeap
; Description	: Retrieves the handle to the process heap.
; Parameter(s)	: none.
; Return values	: Handle to the process heap.
; Author	: Pusofalse
; Remarks	: This function is internal used only.
; ============================================================================================================
Func _SeProcessHeap()
	Local $iResult = DllCall("Kernel32.dll", "handle", "GetProcessHeap")
	Return $iResult[0]
EndFunc	;==>_SeProcessHeap

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCopySid
; Description	: Duplicates a SID structure.
; Parameter(s)	: $pSid		- A pointer to a SID, source SID.
; Return values	: A pointer to a duplicated SID.
; Author	: Pusofalse
; Remarks	: Use _SeIsValidSid function to check the validity of the SID.
; ============================================================================================================
Func _SeCopySid($pSid)
	If Not _SeIsValidSid($pSid) Then Return SetError(@error, 0, 0)

	Local $iResult, $iLength, $pCopySid

	$iLength = _SeGetLengthSid($pSid)
	$pCopySid = _SeHeapAlloc($iLength)

	$iResult = DllCall("Advapi32.dll", "bool", "CopySid", "int", $iLength, _
			"ptr", $pCopySid, "ptr", $pSid)

	If ($iResult[0]) Then
		Return SetError(0, 0, $pCopySid)
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pCopySid), 0)
	EndIf
EndFunc	;==>_SeCopySid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeLastError
; Description	: Retrieves the last error code (only for current thread).
; Parameter(s)	: none
; Return values	: Last error code.
; Author	: Pusofalse
; Remarks	: Pass the return value to _SeFormatMsg for error message.
; ============================================================================================================
Func _SeLastError()
	Local $iResult = DllCall("Kernel32.dll", "long", "GetLastError")
	Return $iResult[0]
EndFunc	;==>_SeLastError

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeLookupAccountName
; Description	: Retrieves the SID for an account, group, or a computer.
; Parameter(s)	: $sUserName		- An optional name of the object.
;		: $sSystem	- System on which the function executes.
; Return values	: A pointer to a SID is returned if succeeds, else returns NULL.
; Author	: Pusofalse
; Remarks	: $pReturnedSid + $SE_MAX_SID_SIZE is the base address of the domain SID.
; ============================================================================================================
Func _SeLookupAccountName($sUserName = @UserName, $sSystem = "")
	Local $iResult, $pBuffer = _SeHeapAlloc($SE_MAX_SID_SIZE * 2)

	$iResult = DllCall("Advapi32.dll", "bool", "LookupAccountName", "str", $sSystem, _
			"str", $sUserName, "ptr", $pBuffer, "dword*", $SE_MAX_SID_SIZE, _
			"ptr", $pBuffer + $SE_MAX_SID_SIZE, "dword*", $SE_MAX_SID_SIZE, "long*", 0)
	If ($iResult[0]) Then
		Return SetError(0, $iResult[7], $pBuffer)
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer) * 0 + $iResult[7], 0)
	EndIf
EndFunc	;==>_SeLookupAccountName

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeLookupAccountSid
; Description	: Return the name of the securable object mapped into the specified SID.
; Parameter(s)	: $pSid	- A pointer to a SID.
;		: $sSystem	- System on which the function is executed, default to local.
; Return values	: Name of the securable object, in text format, returned if success. Otherwise returns NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeLookupAccountSid($pSid, $sSystem = "")
	Local $iResult, $sReturn

	$iResult = DllCall("Advapi32.dll", "bool", "LookupAccountSid", "str", $sSystem, _
			"ptr", $pSid, "str", "", "dword*", 256, "str", "", "dword*", 256, _
			"long*", 0)
	If ($iResult[0]) Then
		If ($iResult[3]) Then
			If ($iResult[5]) Then
				$sReturn = $iResult[5] & "\" & $iResult[3]
			Else
				$sReturn = $iResult[3]
			EndIf
		Else
			If ($iResult[5]) Then
				$sReturn = $iResult[5]
			EndIf
		EndIf
		Return SetError(0, $iResult[7], $sReturn)
	Else
		Return SetError(_SeLastError(), $iResult[7], "")
	EndIf
EndFunc	;==>_SeLookupAccountSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetLengthSid
; Description	: Return the length of the SID.
; Parameter(s)	: $pSid		- A pointer to a SID.
; Return values	: Length of the $pSid, in bytes.
; Author	: Pusofalse
; Remarks	: Use _SeIsValidSid function to check the validity of the $pSid.
; ============================================================================================================
Func _SeGetLengthSid($pSid)
	Local $iResult = DllCall("AdvApi32.dll", "long", "GetLengthSid", "ptr", $pSid)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeGetLengthSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsValidAcl
; Description	: Validate an ACL structure.
; Parameter(s)	: $pAcl		- A pointer to an ACL (access control list).
; Return values	: If $pAcl is valid, the function returns TRUE, else returns FALSE, and sets @error to ERROR_INVALID_ACL (1336).
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsValidAcl($pAcl)
	Local $iResult = DllCall("AdvApi32.dll", "bool", "IsValidAcl", "ptr", $pAcl)
	If $iResult[0] Then
		Return 1
	Else
		Return SetError(1336, 0, 0)
	EndIf
EndFunc	;==>_SeIsValidAcl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsValidSid
; Description	: Validate a SID.
; Parameter(s)	: $pSid	- SID to check.
; Return values	: If $pSid is point to a valid SID, this function returns TRUE, otherwise returns FALSE and sets @error to ERROR_INVALID_SID (1337).
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsValidSid($pSid)
	Local $iResult = DllCall("AdvApi32.dll", "bool", "IsValidSid", "ptr", $pSid)
	If $iResult[0] Then
		Return 1
	Else
		Return SetError(1337, 0, 0)
	EndIf
EndFunc	;==>_SeIsValidSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsValidSecurityDescriptor
; Description	: Validate a security descriptor.
; Parameter(s)	: $pSecurDescr	- A security descriptor to be checked.
; Return values	: If $pSecurDescr is point to a valid security descriptor, this function returns TRUE, otherwise returns FALSE and sets @error to ERROR_INVALID_SECUR_DESCR (1338).
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsValidSecurityDescriptor($pSecurDescr)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "IsValidSecurityDescriptor", "ptr", $pSecurDescr)
	If $iResult[0] Then
		Return 1
	Else
		Return SetError(1338, 0, 0)
	EndIf
EndFunc	;==>_SeIsValidSecurityDescriptor

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCreateWellKnownSid
; Description	: Creates a well-known SID.
; Parameter(s)	: $iWellKnown	- The well-known ID.
;		: $pDomainSid	- An optional domain SID.
; Return values	: If succeeds, the function returns a pointer to the well-known SID, otherwise returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeCreateWellKnownSid($iWellKnown, $pDomainSid = 0)
	Local $iResult, $pSid = _SeHeapAlloc($SE_MAX_SID_SIZE)

	$iResult = DllCall("AdvApi32.dll", "bool", "CreateWellKnownSid", "long", $iWellKnown, _
			"ptr", $pDomainSid, "ptr", $pSid, "dword*", $SE_MAX_SID_SIZE)
	If ($iResult[0]) Then
		Return SetError(0, $iResult[4], $pSid)
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pSid) * 0, 0)
	EndIf
EndFunc	;==>_SeCreateWellKnownSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeEqualSid
; Description	: Determine two SIDs whether are equaled.
; Parameter(s)	: $pSid1	- 1st SID.
;		: $pSid2	- 2nd SID.
; Return values	: If $pSid1 and $pSid2 are equaled, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; Remarks	: Use _SeIsValidSid to check the validity of the SID before calling this function.
; ============================================================================================================
Func _SeEqualSid($pSid1, $pSid2)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "EqualSid", "ptr", $pSid1, "ptr", $pSid2)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeEqualSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeEqualDomainSid
; Description	: Determines whether two SIDs are from the same domain.
; Parameter(s)	: $pSid1	- 1st SID to be checked.
;		: $pSid2	- 2nd SID to be checked.
; Return values	: If two SIDs are from the same domain, the return value is TRUE. If they are not equal or the function fails, the return value is FALSE.
; Author	: Pusofalse
; Remarks	: $pSid1 and $pSid2 must be either an account domain SID or a BUILTIN SID.
; ============================================================================================================
Func _SeEqualDomainSid($pSid1, $pSid2)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "EqualDomainSid", _
			"ptr", $pSid1, "ptr", $pSid2, "bool*", 0)
	If ($iResult[0]) Then
		Return $iResult[3]
	Else
		Return SetError(_SeLastError(), 0, 0)
	EndIf
EndFunc	;==>_SeEqualDomainSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeEqualPrefixSid
; Description	: Determines whether two SIDs have the same prefix Id.
; Parameter(s)	: $pSid1	- 1st SID to check.
;		: $pSid2	- 2nd SID to check.
; Return values	: TRUE if two SIDs have the same prefix Id, or FALSE otherwise.
; Author	: Pusofalse
; ============================================================================================================
Func _SeEqualPrefixSid($pSid1, $pSid2)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "EqualPrefixSid", "ptr", $pSid1, "ptr", $pSid2)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeEqualPrefixSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSecurityDescriptorLength
; Description	: Retrieves the length for a security descriptor.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor.
; Return values	: The length, in bytes, of the security descriptor.
; Author	: Pusofalse
; Remarks	: Use _SeIsValidSecurityDescriptor to check the validity of the security descriptor before calling this function.
; ===========================================================================================================
Func _SeGetSecurityDescriptorLength($pSecurDescr)

	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "dword", "GetSecurityDescriptorLength", "ptr", $pSecurDescr)
	Return $iResult[0]
EndFunc	;==>_SeGetSecurityDescriptorLength

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSidSubAuthority
; Description	: Retrieves the sub-authority Id for a SID.
; Parameter(s)	: $pSid	- A pointer to a SID.
;		: $iSubAuthority	- Zero-based index of the sub-authority to be retrieved.
; Return values	: Sub-authority Id, in a DWORD.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetSidSubAuthority($pSid, $iSubAuthority = 0)
	Local $iResult, $iRelativeId

	$iResult = DllCall("AdvApi32.dll", "ptr", "GetSidSubAuthority", "ptr", $pSid, "dword", $iSubAuthority) 
	Return SetError(_SeLastError(), 0, _SeReadBytes($iResult[0]))
EndFunc	;==>_SeGetSidSubAuthority

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSidSubAuthorityCount
; Description	: Retrieves the count of the sub-authority for a SID.
; Parameter(s)	: $pSid	- A pointer to a SID.
; Return values	: Count of sub-authority of the specified SID.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetSidSubAuthorityCount($pSid)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "ptr", "GetSidSubAuthorityCount", "ptr", $pSid)
	Return SetError(_SeLastError(), 0, _SeReadBytes($iResult[0], "ubyte", 1))
EndFunc	;==>_SeGetSidSubAuthorityCount

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSidIdentifierAuthority
; Description	: Get the top-level authority of a SID.
; Parameter(s)	: $pSid	- A pointer to a SID for which the top-level authority is returned.
; Return values	: If succeeds, the top-level authority of the specified SID is returned, if fails, returns NULL. This function does not handle the SID that are not valid, call _SeIsValidSid to verify the SID before calling this funciton.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetSidIdentifierAuthority($pSid)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "ptr", "GetSidIdentifierAuthority", "ptr", $pSid)
	Return SetError(_SeLastError(), 0, _SeReadBytes($iResult[0] + 5, "ubyte", 1))
EndFunc	;==>_SeGetSidIdentifierAuthority

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeImpersonateLoggedOnUser
; Description	: This function lets the calling thread impersonate the security context of a logged-on user. 
; Parameter(s)	: A handle to a primary or impersonation access token that represents a logged-on user.
; Return values	: If succeeds, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeImpersonateLoggedOnUser($hToken)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "ImpersonateLoggedOnUser", "handle", $hToken)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeImpersonateLoggedOnUser

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeImpersonateSelf
; Description	: This function obtains an access token that impersonates the security context of the calling process. The token is assigned to the calling thread.
; Parameter(s)	: $iLevel	- Supplies the impersonation level of the new token.
; Return values	: If succeeds, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeImpersonateSelf($iLevel = $SE_SECUR_IMPERSONATION)
	Local $iResult = DllCall("AdvApi32.dll", "bool", "ImpersonateSelf", "long", $iLevel)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeImpersonateSelf

Func _SeImpersonateNamedPipeClient($hNamedPipe)
	Local $iResult = DllCall("AdvApi32.dll", "bool", "ImpersonateNamedPipeClient", "handle", $hNamedPipe)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeImpersonateNamedPipeClient

Func _SeImpersonateThread($hThread, $hThreadToImpersonate, $pSecurQos)
	Local $iResult

	$iResult = DllCall("Ntdll.dll", "long", "NtImpersonateThread", "handle", $hThread, _
			"handle", $hThreadToImpersonate, "ptr", $pSecurQos)
	Return SetError(snts($iResult[0]), 0, $iResult[0] = 0)
EndFunc	;==>_SeImpersonateThread

; ============================================================================================================
; Name	: _SeAccessCheck
; Description	: This function checks whether a security descriptor grants a specified set of access rights to the client. Typically, server application use this function to check access to a private object.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor against which access is checked.
;		: $hHandle	- A handle identifies the client, can be a handle to the thread, token, or named pipe.
;		: $pGenericMapping	- A pointer to a $SE_GENERIC_MAPPING structure associated with the object for which the access is being checked.
;		: $iDesiredAccess	- Access mask that specifies the access rights to check. If this parameter is $SE_MAXIMUM_ALLOWED, the function returns the granted access rights the security descriptor allows the client.
; Return values	: The function returns the access rights that the security descriptor grants to the client.
; Author	: Pusofalse
; ============================================================================================================
Func _SeAccessCheck($pSecurDescr, $hHandle, $pGenericMapping, $iDesiredAccess = $SE_MAXIMUM_ALLOWED)
	Local $hToken, $pPrivBuffer, $iResult, $pBuffer, $iError

	If ($hHandle = -1) Or ($hHandle = -2) Then
		$iResult = _SeImpersonateSelf($SE_SECUR_IMPERSONATION)
	Else
		$pBuffer = _SeQuerySecurityObject($hHandle, $SE_OBJ_TYPE_INFO)
		If (@error) Then
			Return SetError(@error, 0, 0)
		Else
			Switch _SeInitBufferW($pBuffer)
			Case "Token"
				$iResult = _SeImpersonateLoggedOnUser($hHandle)
			Case "Thread"
				$iResult = _SeImpersonateThread(-2, $hHandle, _SeInitSecurityQos())
			Case "File"
				$iResult = _SeImpersonateNamedPipeClient($hHandle)
			Case Else
				Return SetError(6, _SeHeapFree($pBuffer) * 0, 0)
			EndSwitch
		EndIf

		_SeHeapFree($pBuffer)
	EndIf

	If ($iResult = 0) Then Return SetError(@error, 0, 0)

	$hToken = _SeOpenThreadToken(-2, $SE_TOKEN_QUERY, 1)
	If ($hToken = 0) Then Return SetError(@error, _SeRevertToSelf() * 0, 0)

	$pPrivBuffer = _SeHeapAlloc(1024)

	$iResult = DllCall("AdvApi32.dll", "bool", "AccessCheck", "ptr", $pSecurDescr, _
			"handle", $hToken, "dword", $iDesiredAccess, "ptr", $pGenericMapping, _
			"ptr", $pPrivBuffer, "dword*", 1024, "dword*", 0, "bool*", 0)

	If ($iResult[0] = 0) Then $iError = _SeLastError()

	_SeRevertToSelf()
	_SeCloseHandle($hToken)
	_SeHeapFree($pPrivBuffer)

	Return SetError($iError, $iResult[8], $iResult[7])
EndFunc	;==>_SeAccessCheck

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetTokenInformation
; Description	: Sets the informaion for an access token.
; Parameter(s)	: $hToken	- Handle to an access token, must opened with $SE_TOKEN_WRITE access right.
;		: $iInfoClass	- Information to be set.
;		: $vBuffer	- A buffer contains the data to set.
;		: $iBufferSize	- Specifies the size of the buffer.
;		: $sBufferType	- Specifies the variable type of the $vBuffer parameter, default as a pointer.
; Return values	: If succeeds, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetTokenInformation($hToken, $iInfoClass, $vBuffer, $iBufferSize, $sBufferType = "ptr")
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "SetTokenInformation", "handle", $hToken, _
			"long", $iInfoClass, $sBufferType, $vBuffer, "dword", $iBufferSize)

	If @error Then
		Return SetError(87, 1, 0)
	Else
		Return SetError(_SeLastError(), 0, $iResult[0])
	EndIf
EndFunc	;==>_SeSetTokenInformation

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetTokenInformation
; Description	: Retrieves the informaiton requested for an access token.
; Parameter(s)	: $hToken	- Handle To the access token.
;		: $iInfoClass	- Information requested.
; Return values	: If succeeds, the function returns a pointer to a buffer containing the information of the access token. If fails, the function return values is NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetTokenInformation($hToken, $iInfoClass)
	Local $iResult, $pBuffer

	$iResult = DllCall("AdvApi32.dll", "bool", "GetTokenInformation", "handle", $hToken, _
			"long", $iInfoClass, "ptr", 0, "dword", 0, "dword*", 0)

	If ($iResult[5] = 0) Then Return SetError(_SeLastError(), 0, 0)

	$pBuffer = _SeHeapAlloc($iResult[5])

	$iResult = DllCall("AdvApi32.dll", "bool", "GetTokenInformation", "handle", $hToken, _
			"long", $iInfoClass, "ptr", $pBuffer, "dword", $iResult[5], "dword*", 0)

	If ($iResult[0]) Then
		Return $pBuffer
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer) * 0, 0)
	EndIf
EndFunc	;==>_SeGetTokenInformation

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetTokenUser
; Description	: This function retrieves the name of the user associated with specified access token.
; Parameter(s)	: $hToken	- Handle to the access token, must opened with $SE_TOKEN_QUERY access right.
; Return values	: If succeeds, the function returns a pointer to SID indicate the user of the access token. Otherwise, returns NULL an sets @error to a system error code.
; Author	: Pusofalse
; Remarks	: When you no longer use the returned SID, call _SeHeapFree function to free it.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetTokenUser($hToken)
	Local $tSidAttrib, $pUser, $iFlags, $pSid

	$pUser = _SeGetTokenInformation($hToken, 1)
	If ($pUser = 0) Then Return SetError(@error, 0, 0)

	$tSidAttrib = DllStructCreate($tagSE_SID_ATTRIBUTES, $pUser)
	$iFlags = DllStructGetData($tSidAttrib, "Attributes")
	$pSid = _SeCopySid(DllStructGetData($tSidAttrib, "Sid"))

	Return SetError(_SeHeapFree($pUser) * 0, $iFlags, $pSid)
EndFunc	;==>_SeGetTokenUser

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetTokenOwner
; Description	: Retrieves the SID of the owner of an access token.
; Parameter(s)	: $hToken	- Handle to an access token.
; Return values	: If succeeds, the function returns a pointer to SID indicates the owner of the specified access token, if fails, the function returns NULL and sets @error to the reason of the failure.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetTokenOwner($hToken)
	Local $pTokenOwner = _SeGetTokenInformation($hToken, 4)
	If ($pTokenOwner = 0) Then Return SetError(@error, 0, 0)

	Local $pOwner = _SeCopySid(_SeReadBytes($pTokenOwner, "ptr"))
	Return SetError(0, _SeHeapFree($pTokenOwner), $pOwner)
EndFunc	;==>_SeGetTokenOwner

Func _SeGetTokenLogonSid($hToken = -1)
	Local $iFlags, $pGroups, $tGroup, $pSid = 0

	If ($hToken = -1) Then
		$hToken = _SeOpenProcessToken(-1, $SE_TOKEN_QUERY)
		If ($hToken = 0) Then Return SetError(@error, 0, 0)

		$iFlags = 1

	EndIf

	$pGroups = _SeGetTokenInformation($hToken, 2)
	If ($pGroups = 0) Then
		If $iFlags Then
			Return SetError(@error, _SeCloseHandle($hToken), 0)
		Else
			Return SetError(@error, 0, 0)
		EndIf
	EndIf

	For $i = 0 To _SeReadBytes($pGroups) - 1
		$tGroup = DllStructCreate($tagSE_SID_ATTRIBUTES, $pGroups + 4 + ($i * 8))
		If BitAnd($SE_GROUP_LOGON_ID, DllStructGetData($tGroup, "Attributes")) Then
			$pSid = _SeCopySid(DllStructGetData($tGroup, "Sid"))
			ExitLoop
		EndIf
	Next

	If $iFlags Then _SeCloseHandle($hToken)
	Return SetError(0, _SeHeapFree($pGroups), $pSid)
EndFunc	;==>_SeGetTokenLogonSid

Func _SeGetTokenStatistics($hToken)
	Local $pStatistics, $tStatistics, $aResult[10]

	$pStatistics = _SeGetTokenInformation($hToken, 10)
	If ($pStatistics = 0) Then Return SetError(@error, 0, $aResult)

	$tStatistics = DllStructCreate($tagSE_TOKEN_STATISTICS, $pStatistics)

	$aResult[0] = DllStructGetData($tStatistics, "TokenId")
	$aResult[1] = DllStructGetData($tStatistics, "AuthenticationId")
	$aResult[2] = DllStructGetData($tStatistics, "ExpirationTime")
	$aResult[3] = DllStructGetData($tStatistics, "TokenType")
	$aResult[4] = DllStructGetData($tStatistics, "ImpersonationLevel")
	$aResult[5] = DllStructGetData($tStatistics, "DynamicCharged")
	$aResult[6] = DllStructGetData($tStatistics, "DynamicAvailable")
	$aResult[7] = DllStructGetData($tStatistics, "GroupCount")
	$aResult[8] = DllStructGetData($tStatistics, "PrivilegeCount")
	$aResult[9] = DllStructGetData($tStatistics, "ModifiedId")

	Return SetError(0, _SeHeapFree($pStatistics), $aResult)
EndFunc	;==>_SeGetTokenStatistics

Func _SeGetLogonSid()
	Local $pSid, $hDesktop, $iResult, $iError

	$hDesktop = _SeOpenDesktop("Default", $SE_GENERIC_READ)
	If Not $hDesktop Then SetError(@error, 0, 0)

	$pSid = _SeHeapAlloc($SE_MAX_SID_SIZE)

	$iResult = DllCall("User32.dll", "bool", "GetUserObjectInformation", "handle", $hDesktop, _
			"int", 4, "ptr", $pSid, "dword", $SE_MAX_SID_SIZE, "long*", 0)

	If Not $iResult[0] Then $iError = _SeLastError()
	_SeCloseHandle($hDesktop)

	If $iResult[0] Then
		Return $pSid
	Else
		Return SetError($iError, _SeHeapFree($pSid), 0)
	EndIf
EndFunc	;==>_SeGetLogonSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeEqualToken
; Description	; Determines two access tokens whether they are equal.
; Parameter(s)	: $hToken1	- Handle to the 1st access token.
;		: $hToken2	- Handle to the 2nd access token.
; Return values	: If $hToken1 is equaled to $hToken2, the function returns TRUE. If $hToken1 is not equaled to $hToken2, or the function fails, the function returns FALSE and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeEqualToken($hToken1, $hToken2)
	Local $iResult

	$iResult = DllCall("Ntdll.dll", "dword", "NtCompareTokens", _
			"handle", $hToken1, "handle", $hToken2, "bool*", 0)

	If (@error) Then
		Return SetError(1, 0, 0)
	Else
		If ($iResult[0]) Then
			Return SetError(snts($iResult[0]), 0, 0)
		Else
			Return $iResult[3]
		EndIf
	EndIf
EndFunc	;==>_SeEqualToken

; #### FUNCTION ####
; ============================================================================================================
; Name	: snts
; Description	: Converts a NTSTATUS to a system error code.
; Parameter(s)	: $iNtStatus	- NTSTATUS to be converted.
;		: $iError	- @error of this function.
;		: $iExtended	- @extended of this function.
; Return values	: Converted system error code.
; Author	: Pusofalse
; ============================================================================================================
Func snts($iNtStatus = @error, $iError = @error, $iExtended = @extended)
	Local $iResult
	$iResult = DllCall("Ntdll.dll", "long", "RtlNtStatusToDosError", "dword", $iNtStatus)
	Return SetError($iError, $iExtended, $iResult[0])
EndFunc	;==>snts

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsPrivsEnabled
; Description	: Determines a set of privileges whether they are enabled for specified access token.
; Parameter(s)	: $hToken	- Handle to a access token.
;		: $aPrivilege	- A 2D array in the form:
;		:	$aPrivilege[0][0]	- 1st privilege name.
;		:	$aPrivilege[0][1]	- Reserved for this function uses.
;		:	$aPrivilege[1][0]	- 2nd privilege name.
;		:	$aPrivilege[1][1]	- Reserved for this function uses.
;		:	... ...
;		: $fRequireAll	- If TRUE, the function returns TRUE only if the all privileges are enabled for specified access token, default to TRUE.
; Return values	: If the function fails, the return value is FALSE, and @error is set to the failure reason. If the function succeeds, and $fRequireAll parameter is TRUE, the function returns a BOOLEAN value defines the enable or disable for specified access token, of all privileges, and the value of the input $aPrivilege[n][1] is set a non-zero value. If $fRequireAll is FALSE, the function returns TRUE if any privilege represents by $aPrivilege[n][0] is enable d for access token.
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsPrivsEnabled($hToken, ByRef $aPrivilege, $fRequireAll = 1)
	If UBound($aPrivilege, 0) <> 2 Then Return SetError(87, 0, 0)
	If UBound($aPrivilege, 2) <> 2 Then Return SetError(87, 0, 0)

	Local $tBuffer, $pBuffer, $iUBound, $iResult

	$iUBound = UBound($aPrivilege)
	$pBuffer = _SeHeapAlloc(8 + $iUBound * 12)

	_SeWriteBytes($pBuffer, $iUBound)
	If $fRequireAll Then _SeWriteBytes($pBuffer + 4, $SE_PRIV_SET_ALL_NECESSARY)

	For $i = 0 To $iUBound - 1
		$tBuffer = DllStructCreate($tagSE_LUID_ATTRIBUTES, $pBuffer + 8 + ($i * 12))
		DllStructSetData($tBuffer, "Luid", _SeLookupPrivValue($aPrivilege[$i][0]))

		$tBuffer = 0
	Next

	$iResult = DllCall("AdvApi32.dll", "bool", "PrivilegeCheck", _
			"handle", $hToken, "ptr", $pBuffer, "bool*", 0)

	If ($iResult[0] = 0) Then
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer) * 0, 0)
	Else
		For $i = 0 To $iUBound - 1
			$aPrivilege[$i][1] = _SeReadBytes($pBuffer + 8 + (($i + 1) * 12) - 4, "ptr")
		Next
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer), $iResult[3])
	EndIf
EndFunc	;==>_SeIsPrivsEnabled

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsPrivEnabled
; Description	: Determines the specified privilege whether is enabled for the specified access token.
; Parameter(s)	: $hToken	- Handle to the access token to be checked.
;		: $sPrivName	- Name of the privilege.
; Return values	: If the token enables the specified privilege, the function returns TRUE. If the token does not enable the privilege or the function fails, the return value is FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsPrivEnabled($hToken, $sPrivName)
	Local $aPriv[1][2] = [[$sPrivName, 0]]

	If _SeIsPrivsEnabled($hToken, $aPriv, 1) Then
		Return $SE_PRIV_USED_FOR_ACCESS
	Else
		Return SetError(@error, 0, 0)
	EndIf
EndFunc	;==>_SeIsPrivEnabled

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsTokenRestricted
; Description	: Checks an access token whether is restricted.
; Parameter(s)	: $hToken	- Handle to the access token.
; Return values	: If the token is restricted, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsTokenRestricted($hToken)
	Local $iResult = DllCall("AdvApi32.dll", "bool", "IsTokenRestricted", "handle", $hToken)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeIsTokenRestricted

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsTokenUntrusted
; Description	: Determines an access token whether is untrusted.
; Parameter(s)	: $hToken	- Handle to an access token.
; Return values	: If the token is untrusted, the function returns TRUE. If the token is not untrusted or the function fails, the function returns FALSE, to determine the error code, reference @error macro.
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsTokenUntrusted($hToken)
	Local $iResult = DllCall("AdvApi32.dll", "bool", "IsTokenUntrusted", "handle", $hToken)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeIsTokenUntrusted

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeRevertToSelf
; Description	: Terminates the impersonation of a client application.
; Parameter(s)	: None
; Return values	: TRUE indicates success, FALSE otherwise.
; Author	: Pusofalse
; ============================================================================================================
Func _SeRevertToSelf()
	Local $iResult = DllCall("AdvApi32.dll", "bool", "RevertToSelf")
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeRevertToSelf

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetFileSecurity
; Description	: Sets the security information for an NTFS file.
; Parameter(s)	: $sFileName	- File path.
;		: $iSecurInfo	- Security information to be set.
;		: $pSecurDescr	- A pointer to a security descriptor containing the security data to set.
; Return values	: TRUE indicates success, FALSE indicates failure.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetFileSecurity($sFileName, $iSecurInfo, $pSecurDescr)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "SetFileSecurity", "str", $sFileName, _
			"long", $iSecurInfo, "ptr", $pSecurDescr)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSetFileSecurity

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetNamedSecurityInfo
; Description	: Sets the security information for a named securable object.
; Parameter(s)	: $sObjName	- Name of the object.
;		: $iObjType	- Type of the object.
;		: $iSecurInfo	- A DWORD indicates the security information flags to set.
;		: $pOwner	- An optional pointer to the SID, as the owner of the object.
;		: $pGroup	- An optional pointer to the SID, as the primary group of the object.
;		: $pDacl	- An optional pointer to a DACL, as the Access Permissoins of the object.
;		: $pSacl	- An optional pointer to a SACL, as the System Auditing of the object.
; Return values	: If succeeds, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetNamedSecurityInfo($sObjName, $iObjType, $iSecurInfo, $pOwner, $pGroup, $pDacl, $pSacl = 0)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "dword", "SetNamedSecurityInfo", "str", $sObjName, _
			"long", $iObjType, "long", $iSecurInfo, "ptr", $pOwner, "ptr", $pGroup, _
			"ptr", $pDacl, "ptr", $pSacl)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_SeSetNamedSecurityInfo

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeEnumWellKnownSids
; Description	: This function lists the well-known accounts in specified system.
; Parameter(s)	: $sSystem	- Supplies a computer on which the function is to execute, default is local.
; Return values	: An array in the form:
;		:	$aArray[0][0]	- The number of well-known accounts returned.
;		:	$aArray[1][0]	- 1st well-known account's name.
;		:	$aArray[1][1]	- 1st well-known account's SID, in text format.
;		:	$aArray[1][2]	- 1st well-known account's ID.
;		:	$aArray[n][0]	- nth well-known account's name.
;		: If fails, the value of $aArray[0][0] is set to zero.
; Author	: Pusofalse
; ============================================================================================================
Func _SeEnumWellKnownSids($sSystem = "")

	Local $aResult[1][3] = [[0]], $pSid, $pDomainSid

	If ($sSystem) Then
		$pDomainSid = _SeLookupAccountName($sSystem, $sSystem)
		If ($pDomainSid = 0) Then Return SetError(@error, 0, $aResult)
	EndIf

	For $i = 0 To 78
		$pSid = _SeCreateWellKnownSid($i, $pDomainSid)
		If ($pSid = 0) Then ContinueLoop

		$aResult[0][0] += 1
		Redim $aResult[$aResult[0][0] + 1][3]
		$aResult[$aResult[0][0]][0] = _SeLookupAccountSid($pSid, $sSystem)
		$aResult[$aResult[0][0]][1] = _SeConvertSidToSSid($pSid)
		$aResult[$aResult[0][0]][2] = $i

		_SeHeapFree($pSid)
	Next

	If ($sSystem) Then _SeHeapFree($pDomainSid)
	Return $aResult
EndFunc	;==>_SeEnumWellKnownSids

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeConvertSidToSSid
; Description	: Converts a SID to a string.
; Parameter(s)	: $pSid	- A pointer to the SID.
; Return values	: SID in the text format is returned if succeeds, or NULL if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeConvertSidToSSid($pSid)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "ConvertSidToStringSid", "ptr", $pSid, "ptr*", 0)
	If ($iResult[0]) Then
		Return _SeReadBytes($iResult[2], "str", 256)
	Else
		Return SetError(_SeLastError(), 0, "")
	EndIf
EndFunc	;==>_SeConvertSidToSSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeConvertSSidToSid
; Description	: Converts a string SID to a binary SID.
; Parameter(s)	: $sStringSid	- Specify a string SID.
; Return values	: If succeeds, the function returns a pointer to the binary SID, otherwise returns NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeConvertSSidToSid($sStringSid)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "ConvertStringSidToSid", "str", $sStringSid, "ptr*", 0)
	Return SetError(_SeLastError(), 0, $iResult[2])
EndFunc	;==>_SeConvertSSidToSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetUserAccountSid
; Description	: Specifies an user account's name, returns its SID in string format.
; Parameter(s)	: $sUserName	- Name of the user account.
;		: $sSystem	- System on which the function is to execute, default to local.
; Return values	: If succeeds, the function returns the SID mapped to the specified user account, or NULL if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetUserAccountSid($sUserName, $sSystem = "")
	Local $pSid, $sStringSid

	$pSid = _SeLookupAccountName($sUserName, $sSystem)
	If ($pSid = 0) Then Return SetError(@error, 0, "")

	$sStringSid = _SeConvertSidToSSid($pSid)
	Return SetError(@error, _SeHeapFree($pSid), $sStringSid)
EndFunc	;==>_SeGetUserAccountSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsWellKnownSid
; Description	: Determines a SID whether is a well-known SID.
; Parameter(s)	: $pSid	- A pointer to a SID.
;		: $iWellKnown	- An optional LONG value indicates the well-known ID of the $pSid.
; Return values	: TRUE indicates the $pSid is a well-known SID, FALSE otherwise. If TRUE, @extended is set to the Id of the well-known types.
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsWellKnownSid($pSid, $iWellKnown = -1)
	Local $iResult

	If ($iWellKnown = -1) Then
		For $i = 0 To 78
			$iResult = DllCall("AdvApi32.dll", "bool", "IsWellKnownSid", "ptr", $pSid, "long", $i)
			If ($iResult[0]) Then Return SetExtended($i, 1)
		Next
		Return SetExtended(-1, 0)
	Else
		$iResult = DllCall("AdvApi32.dll", "bool", "IsWellKnownSid", "ptr", $pSid, "long", $iWellKnown)
		If ($iResult[0]) Then
			Return SetExtended($iWellKnown, 1)
		Else
			Return SetExtended(-1, 0)
		EndIf
	EndIf
EndFunc	;==>_SeIsWellKnownSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeLookupPrivName
; Description	: Retrieves the name of the specified privilege.
; Parameter(s)	: $iPrivLuid	- LUID of the privilege.
;		: $sSystem	- System on which the function is to execute.
; Return values	: If succeeds, the function returns the name of the specified privilege, or NULL If fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeLookupPrivName($iPrivLuid, $sSystem = "")
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "LookupPrivilegeName", "str", $sSystem, _
			"int64*", $iPrivLuid, "str", "", "dword*", 128)
	Return SetError(_SeLastError(), 0, $iResult[3])
EndFunc	;==>_SeLookupPrivName

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeLookupPrivValue
; Description	: Retrieves LUID of the specified privilege.
; Parameter(s)	: $sPrivName	- Name of the privilege for which the LUID is returned.
;		: $sSystem	- System on which the function is to execute.
; Return values	: If succeeds, the function returns a non-zero DWORD indicates the LUID of the specified privilege, or zero is returned if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeLookupPrivValue($sPrivName, $sSystem = "")
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "LookupPrivilegeValue", _
			"str", $sSystem, "str", $sPrivName, "int64*", 0)
	Return SetError(_SeLastError(), 0, $iResult[3])
EndFunc	;==>_SeLookupPrivValue

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeLookupPrivDescription
; Description	: Returns the description of the specified privilege.
; Parameter(s)	: $sPrivName	- Privilege name.
;		: $sSystem	- System on which the function is to execute.
; Return values	: If succeeds, the function returns a string contains the description of the privilege, or NULL if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeLookupPrivDescription($sPrivName, $sSystem = "")
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "LookupPrivilegeDisplayName", "str", $sSystem, _
			"str", $sPrivName, "str", "", "dword*", 4096, "dword*", 0)
	Return SetError(_SeLastError(), $iResult[5], $iResult[3])
EndFunc	;==>_SeLookupPrivDescription

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeOpenProcess
; Description	: Opens a process and retrieves its handle for sub-sequent calls.
; Parameter(s)	: $iProcessId	- Id of the process to be opened.
;		: $iDesiredAccess	- Desired access masks.
;		: $fInherit	- If TRUE, the returned handle can be inherited by the child process.
; Return values	: If succeeds, the return value is the handle to the specified process, or NULL if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeOpenProcess($iProcessId, $iDesiredAccess = 0x1F0FFF, $fInherit = 0)
	If ($iProcessId = -1) Then $iProcessId = @AutoItPid

	$iProcessId = ProcessExists($iProcessId)
	If ($iProcessId = 0) Then Return SetError(2, 0, 0)

	Local $iResult

	$iResult = DllCall("Kernel32.dll", "handle", "OpenProcess", "dword", $iDesiredAccess, _
			"bool", $fInherit, "ulong", $iProcessId)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeOpenProcess

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeOpenProcessToken
; Description	: Opens an access token, and retrieves its handle.
; Parameter(s)	: $iProcessId	- Id of the process from which to retrieves the access token.
;		: $iDesiredAccess	- Specifies an access mask that specifies the requested types of access to the access token.
; Return values	: A valid handle to the access token associated with the specified process is returned if succeeds, or NULL is returned if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeOpenProcessToken($iProcessId, $iDesiredAccess = $SE_TOKEN_ALL_ACCESS)
	Local $hProcess, $iResult

	$hProcess = _SeOpenProcess($iProcessId, 0x400) ; PROCESS_QUERY_INFORMATION
	If ($hProcess < 1) Then Return SetError(@error, 0, 0)

	$iResult = DllCall("AdvApi32.dll", "bool", "OpenProcessToken", "handle", $hProcess, _
			"dword", $iDesiredAccess, "handle*", 0)
	If ($iResult[0]) Then
		Return SetError(0, _SeCloseHandle($hProcess), $iResult[3])
	Else
		Return SetError(_SeLastError(), _SeCloseHandle($hProcess), 0)
	EndIf
EndFunc	;==>_SeOpenProcessToken

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeOpenThread
; Description	: This function retrieves a handle to the requested thread.
; Parameter(s)	: $iThreadId	- The identifier of the thread to be opened.
;		: $iDesiredAccess	- The access to the thread object. This access right is checked against the security descriptor for the thread.
;		: $fInherit	- If TRUE, the processes created by this process will inherit the handle.
; Return values	: If succeeds, the function returns the handle to the thread. If fails, the function returns NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeOpenThread($iThreadId, $iDesiredAccess = $SE_THREAD_ALL_ACCESS, $fInherit = 0)
	Local $iResult
	$iResult = DllCall("Kernel32.dll", "handle", "OpenThread", "dword", $iDesiredAccess, _
			"bool", $fInherit, "dword", $iThreadId)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeOpenThread

; #### FUNCTION ####
; ============================================================================================================
; Name	; _SeOpenThreadToken
; Description	: This function opens the access token associated with a thread.
; Parameter(s)	: $hThread	- Handle to the thread of which the access token is opened.
;		: $iDesiredAccess	- Specifes an ACCESS MASK that specifies the requested type of access to the access token, for a list of possible values, see "Access rights for Token Object".
;		: $fAsSelf	- TRUE indicates the access check is to be made against the process-level security context, FALSE if the access check is to be made against the current security context of the thread calling the function.
; Return values	: If the function succeeds, returns the handle to the access token assiocated with the specified thread. If the function fails, returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeOpenThreadToken($hThread, $iDesiredAccess = $SE_TOKEN_ALL_ACCESS, $fAsSelf = 1)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "OpenThreadToken", "handle", $hThread, _
			"dword", $SE_TOKEN_ALL_ACCESS, "bool", $fAsSelf, "handle*", 0)
	Return SetError(_SeLastError(), 0, $iResult[4])
EndFunc	;==>_SeOpenThreadToken

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetThreadToken
; Description	: This function assigns an impersonation token to a thread, can also cause a thread to stop using an impersonation token.
; Parameter(s)	: $hThread	- Supplies a handle to a thread to which the function assigns the impersonation token, must opened with $SE_THREAD_SET_THREAD_TOKEN access right. This parameter is typically returned by a call to _SeOpenThread function.
;		: $hToken	- Supplies a handle to an IMPERSONATION (not PRIMARY) token to assign to the thread, must opened with $SE_TOKEN_IMPERSONATE access right. If NULL, the function causes the thread to stop using an impersonation token.
; Return values	: If succeeds, the function returns TRUE. If fails, the function returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetThreadToken($hThread = 0, $hToken = 0)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "SetThreadToken", _
			"handle*", $hThread, "handle", $hToken)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSetThreadToken

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCreateToken
; Description	: This function creates an access token with specified token parameter.
; Parameter(s)	: $iTokenLuid	- Specifies an authentication Id assigned to the session the access token represents.
;		: $iTokenType	- Specifies the type of the access token, can be either $SE_TOKEN_PRIMARY which indicates that to create a primary token, or $SE_TOKEN_IMPERSONATION indicates to create an impersonation token. Default to create a primary token.
;		: $pTokenUser	- An optional pointer to a pointer to SID indicates the user associated the token.
;		: $pTokenGroups	- An optional pointer to $tagSE_SID_ATTRIBUTES structures indicates that groups the access token contains.
;		: $pTokenPivs	- An optional pointer to $tagSE_LUID_ATTRIBUTES structures indicates the privileges assigned to the access token.
;		: $pTokenOwner	- An optional pointer to a pointer to  SID indicates the owner of the access token.
;		: $pTokenPrimaryGroup	- An optional pointer to a pointer to SID specifies the primary group that the access token belongs.
;		: $pTokenDefaultDacl	- An optional pointer to a pointer to a DACL assigned to the access token.
;		: $pTokenSource	- An optional pointer to a string indicates the source of the access token.
; Return values	: If success, the function returns the handle to the newly created access token, if fails, the function returns NULL and sets @error to the failure reason.
; Author	: Pusofalse
; Remarks	: This function requires the $SE_CREATE_TOKEN_PRIV privilege.
; ============================================================================================================
Func _SeCreateToken($iTokenLuid, $iTokenType = $SE_TOKEN_PRIMARY, $pTokenUser = -1, _
		$pTokenGroups = -1, $pTokenPrivs = -1, $pTokenOwner = -1, _
		$pTokenPrimaryGroup = -1, $pTokenDefaultDacl = -1, $pTokenSource = -1)

	If ($iTokenType < 1) Or ($iTokenType > 2) Then Return SetError(87, 0, 0)

	Local $hToken, $iResult, $iFlags

	$hToken = _SeOpenProcessToken(-1)

	If $pTokenUser = -1 Then
		$iFlags = BitOR($iFlags, 1)
		$pTokenUser = _SeGetTokenInformation($hToken, 1)
	EndIf

	If $pTokenGroups = -1 Then
		$iFlags = BitOR($iFlags, 2)
		$pTokenGroups = _SeGetTokenInformation($hToken, 2)
	EndIf

	If $pTokenPrivs = -1 Then
		$iFlags = BitOR($iFlags, 4)
		$pTokenPrivs = _SeGetTokenInformation($hToken, 3)
	EndIf

	If $pTokenOwner = -1 Then
		$iFlags = BitOR($iFlags, 8)
		$pTokenOwner = _SeGetTokenInformation($hToken, 4)
	EndIf

	If $pTokenPrimaryGroup = -1 Then
		$iFlags = BitOR($iFlags, 16)
		$pTokenPrimaryGroup = _SeGetTokenInformation($hToken, 5)
	EndIf

	If $pTokenDefaultDacl = -1 Then
		$iFlags = BitOR($iFlags, 32)
		$pTokenDefaultDacl = _SeGetTokenInformation($hToken, 6)
	EndIf

	If $pTokenSource = -1 Then
		$iFlags = BitOR($iFlags, 64)
		$pTokenSource = _SeGetTokenInformation($hToken, 7)
	EndIf

	$iResult = DllCall("Ntdll.dll", "dword", "NtCreateToken", _
			"handle*", 0, _
			"dword", $SE_TOKEN_ALL_ACCESS, _
			"ptr", 0, _
			"long", $iTokenType, _
			"int64*", $iTokenLuid, _
			"int64*", -1, _
			"ptr", $pTokenUser, _
			"ptr", $pTokenGroups, _
			"ptr", $pTokenPrivs, _
			"ptr", $pTokenOwner, _
			"ptr", $pTokenPrimaryGroup, _
			"ptr", $pTokenDefaultDacl, _
			"ptr", $pTokenSource)

	If BitAnd($iFlags, 1) Then _SeHeapFree($pTokenUser)
	If BitAnd($iFlags, 2) Then _SeHeapFree($pTokenGroups)
	If BitAnd($iFlags, 4) Then _SeHeapFree($pTokenPrivs)
	If BitAnd($iFlags, 8) Then _SeHeapFree($pTokenOwner)
	If BitAnd($iFlags, 16) Then _SeHeapFree($pTokenPrimaryGroup)
	If BitAnd($iFlags, 32) Then _SeHeapFree($pTokenDefaultDacl)
	If BitAnd($iFlags, 64) Then _SeHeapFree($pTokenSource)

	Return SetError(snts($iResult[0]), _SeCloseHandle($hToken), $iResult[1])
EndFunc	;==>_SeCreateToken

Func _SeCreateTrustedToken()
#CS
Token user:
NT AUTHORITY\SYSTEM

Token groups:
BUILTIN\Administrators			(0xE) SE_GROUP_ENABLED_BY_DEFAULT | SE_GROUP_ENABLED | SE_GROUP_OWNER
Everyone				(0x7) SE_GROUP_ENABLED_BY_DEFAULT | SE_GROUP_ENABLED | SE_GROUP_MANDATORY
NT AUTHORITY\Authenticated Users	(0x7) SE_GROUP_ENABLED_BY_DEFAULT | SE_GROUP_ENABLED | SE_GROUP_MANDATORY

Token owner:
BUILTIN\Administrators

Primary group:
NT AUTHORITY\SYSTEM

Restricted SIDs:
(none)

Default Dacl:
NT AUTHORITY\SYSTEM	ACCESS_ALLOWED_ACE	(0x10000000) GENERIC_ALL
BUILTIN\Administrators	ACCESS_ALLOWED_ACE	(0xA0020000) GENERIC_READ | GENERIC_EXECUTE | READ_CONTROL

Source:
"*SYSTEM*"
#CE

	Local $pTokenUser, $pTokenGroups, $pTokenPrivs, $tTokenPrivs, $pTokenOwner, $pTokenPrimaryGroup
	Local $pTokenDefaultDacl, $pTokenSource, $aList[2][4], $aPriv[24][2], $hToken, $iError

	$pTokenUser = _SeHeapAlloc(4)
	_SeWriteBytes($pTokenUser, _SeLookupAccountName("NT AUTHORITY\SYSTEM"))

	$pTokenOwner = _SeHeapAlloc(4)
	_SeWriteBytes($pTokenOwner, _SeGetWellKnownAccountSid($SE_WELLKNOWN_ADMINS))

	$pTokenPrimaryGroup = _SeHeapAlloc(4)
	_SeWriteBytes($pTokenPrimaryGroup, _SeReadBytes($pTokenUser))

	$aList[0][0] = _SeReadBytes($pTokenUser)
	$aList[0][1] = $SE_GENERIC_ALL
	$aList[0][2] = $SE_GRANT_ACCESS
	$aList[0][3] = $SE_NO_INHERITANCE

	$aList[1][0] = _SeReadBytes($pTokenOwner)
	$aList[1][1] = BitOR($SE_GENERIC_READ, $SE_GENERIC_EXECUTE, $SE_READ_CONTROL)
	$aList[1][2] = $SE_GRANT_ACCESS
	$aList[1][3] = $SE_NO_INHERITANCE

	$pTokenDefaultDacl = _SeHeapAlloc(4)
	_SeWriteBytes($pTokenDefaultDacl, _SeSetEntriesInAcl($aList))

	$pTokenSource = _SeHeapAlloc(16)
	_SeWriteBytes($pTokenSource, "*SYSTEM*", "str", 9)

	$pTokenGroups = _SeHeapAlloc(3 * 8 + 4)
	_SeWriteBytes($pTokenGroups, 3)
	_SeWriteBytes($pTokenGroups + 4, _SeReadBytes($pTokenOwner))
	_SeWriteBytes($pTokenGroups + 8, BitOR($SE_GROUP_ENABLED_BY_DEFAULT, $SE_GROUP_ENABLED, $SE_GROUP_OWNER))
	_SeWriteBytes($pTokenGroups + 12, _SeCreateWellKnownSid(1))
	_SeWriteBytes($pTokenGroups + 16, BitOR($SE_GROUP_MANDATORY, $SE_GROUP_ENABLED_BY_DEFAULT, $SE_GROUP_ENABLED))
	_SeWriteBytes($pTokenGroups + 20, _SeLookupAccountName("NT AUTHORITY\Authenticated Users"))
	_SeWriteBytes($pTokenGroups + 24, BitOR($SE_GROUP_MANDATORY, $SE_GROUP_ENABLED_BY_DEFAULT, $SE_GROUP_ENABLED))

	$aPriv[0][0] = "SeTcbPrivilege"
	$aPriv[0][1] = 3
	$aPriv[1][0] = "SeCreateTokenPrivilege"
	$aPriv[1][1] = 0
	$aPriv[2][0] = "SeTakeOwnershipPrivilege"
	$aPriv[2][1] = 0
	$aPriv[3][0] = "SeCreatePagefilePrivilege"
	$aPriv[3][1] = 3
	$aPriv[4][0] = "SeLockMemoryPrivilege"
	$aPriv[4][1] = 3
	$aPriv[5][0] = "SeAssignPrimaryTokenPrivilege"
	$aPriv[5][1] = 0
	$aPriv[6][0] = "SeIncreaseQuotaPrivilege"
	$aPriv[6][1] = 0
	$aPriv[7][0] = "SeIncreaseBasePriorityPrivilege"
	$aPriv[7][1] = 3
	$aPriv[8][0] = "SeCreatePermanentPrivilege"
	$aPriv[8][1] = 3
	$aPriv[9][0] = "SeDebugPrivilege"
	$aPriv[9][1] = 3
	$aPriv[10][0] = "SeAuditPrivilege"
	$aPriv[10][1] = 3
	$aPriv[11][0] = "SeSecurityPrivilege"
	$aPriv[11][1] = 0
	$aPriv[12][0] = "SeSystemEnvironmentPrivilege"
	$aPriv[12][1] = 0
	$aPriv[13][0] = "SeChangeNotifyPrivilege"
	$aPriv[13][1] = 3
	$aPriv[14][0] = "SeBackupPrivilege"
	$aPriv[14][1] = 0
	$aPriv[15][0] = "SeRestorePrivilege"
	$aPriv[15][1] = 0
	$aPriv[16][0] = "SeShutdownPrivilege"
	$aPriv[16][1] = 0
	$aPriv[17][0] = "SeLoadDriverPrivilege"
	$aPriv[17][1] = 0
	$aPriv[18][0] = "SeProfileSingleProcessPrivilege"
	$aPriv[18][1] = 3
	$aPriv[19][0] = "SeSystemtimePrivilege"
	$aPriv[19][1] = 0
	$aPriv[20][0] = "SeUndockPrivilege"
	$aPriv[20][1] = 0
	$aPriv[21][0] = "SeManageVolumePrivilege"
	$aPriv[21][1] = 0
	$aPriv[22][0] = "SeImpersonatePrivilege"
	$aPriv[22][1] = 3
	$aPriv[23][0] = "SeCreateGlobalPrivilege"
	$aPriv[23][1] = 3

	$pTokenPrivs = _SeHeapAlloc(4 + UBound($aPriv) * 12)
	_SeWriteBytes($pTokenPrivs, UBound($aPriv))

	For $i = 0 To UBound($aPriv) - 1
		$tTokenPrivs = DllStructCreate($tagSE_LUID_ATTRIBUTES, $pTokenPrivs + 4 + ($i * 12))
		DllStructSetData($tTokenPrivs, "Luid", _SeLookupPrivValue($aPriv[$i][0]))
		DllStructSetData($tTokenPrivs, "Attributes", $aPriv[$i][1])
	Next

	$hToken = _SeCreateToken($SE_LUID_SYSTEM, $SE_TOKEN_PRIMARY, $pTokenUser, $pTokenGroups, _
			$pTokenPrivs, $pTokenOwner, $pTokenPrimaryGroup, $pTokenDefaultDacl, _
			$pTokenSource)

	$iError = @error

	_SeLocalFree(_SeReadBytes($pTokenDefaultDacl))
	_SeHeapFree($pTokenPrivs)
	_SeHeapFree($pTokenSource)
	_SeHeapFree($pTokenDefaultDacl)
	_SeHeapFree($pTokenPrimaryGroup)
	_SeHeapFree(_SeReadBytes($pTokenGroups + 12))
	_SeHeapFree(_SeReadBytes($pTokenGroups + 20))
	_SeHeapFree(_SeReadBytes($pTokenUser))
	_SeHeapFree(_SeReadBytes($pTokenOwner))
	_SeHeapFree($pTokenUser)
	_SeHeapFree($pTokenGroups)
	_SeHeapFree($pTokenOwner)

	Return SetError($iError, 0, $hToken)
EndFunc	;==>_SeCreateTrustedToken

Func _SeCreateRestrictedToken($hToken, $iFlags = 0, $aSidsToDisable = 0, $aPrivsToDelete = 0, $aSidsToRestrict = 0)
	Local $tSidsToDisable, $pSidsToDisable, $tPrivsToDelete, $pPrivsToDelete
	Local $tSidsToRestrict, $pSidsToRestrict, $iResult, $iError

	If IsArray($aSidsToDisable) Then
		If UBound($aSidsToDisable, 0) <> 1 Then Return SetError(86, 0, 0)

		$pSidsToDisable = _SeHeapAlloc(8 * UBound($aSidsToDisable))

		For $i = 0 To UBound($aSidsToDisable) - 1
			$tSidsToDisable = DllStructCreate($tagSE_SID_ATTRIBUTES, $pSidsToDisable + ($i * 8))
			DllStructSetData($tSidsToDisable, "Sid", $aSidsToDisable[$i])
		Next
	EndIf

	If IsArray($aPrivsToDelete) Then
		If UBound($aPrivsToDelete, 0) <> 1 Then Return SetError(86, 0, 0)

		$pPrivsToDelete = _SeHeapAlloc(12 * UBound($aPrivsToDelete))

		For $i = 0 To UBound($aPrivsToDelete) - 1
			$tPrivsToDelete = DllStructCreate($tagSE_LUID_ATTRIBUTES, $pPrivsToDelete + ($i * 12))
			DllStructSetData($tPrivsToDelete, "Luid", _SeLookupPrivValue($aPrivsToDelete[$i]))
		Next
	EndIf

	If IsArray($aSidsToRestrict) Then
		If UBound($aSidsToRestrict, 0) <> 1 Then Return SetError(86, 0, 0)

		$pSidsToRestrict = _SeHeapAlloc(8 * UBound($aSidsToRestrict))

		For $i = 0 To UBound($aSidsToRestrict) - 1
			$tSidsToRestrict = DllStructCreate($tagSE_SID_ATTRIBUTES, $pSidsToRestrict + ($i * 8))
			DllStructSetData($tSidsToRestrict, "Sid", $aSidsToRestrict[$i])

		Next
	EndIf

	$iResult = DllCall("AdvApi32.dll", "bool", "CreateRestrictedToken", _
			"handle", $hToken, _
			"dword", $iFlags, _
			"dword", UBound($aSidsToDisable), _
			"ptr", $pSidsToDisable, _
			"dword", UBound($aPrivsToDelete), _
			"ptr", $pPrivsToDelete, _
			"dword", UBound($aSidsToRestrict), _
			"ptr", $pSidsToRestrict, _
			"handle*", 0)

	$iError = _SeLastError()

	If $pSidsToDisable Then _SeHeapFree($pSidsToDisable)
	If $pPrivsToDelete Then _SeHeapFree($pPrivsToDelete)
	If $pSidsToRestrict Then _SeHeapFree($pSidsToRestrict)

	Return SetError($iError, $iResult[0], $iResult[9])
EndFunc	;==>_SeCreateRestrictedToken

Func _SeCreateUntrustedToken($hToken)
	Local $hUntrusted, $pTokenGroup, $iLogonFlags
	Local $iError, $aSidToDisable[4], $aSidToRestrict[5]

	$aSidToDisable[0] = _SeLookupAccountName("None")
	$aSidToDisable[1] = _SeGetWellKnownAccountSid($SE_WELLKNOWN_ADMINS)
	$aSidToDisable[2] = _SeCreateWellKnownSid(2)

	$aSidToRestrict[0] = _SeLookupAccountName("Restricted")
	$aSidToRestrict[1] = _SeLookupAccountName("Everyone")
	$aSidToRestrict[2] = _SeLookupAccountName("Interactive")
	$aSidToRestrict[3] = _SeLookupAccountName("Authenticated Users")
	$aSidToRestrict[4] = _SeGetWellKnownAccountSid($SE_WELLKNOWN_USERS)

	$pTokenGroup = _SeGetTokenInformation($hToken, 2)

	For $i = 0 To _SeReadBytes($pTokenGroup) - 1
		$iLogonFlags = _SeReadBytes($pTokenGroup + 8 + ($i * 8))
		If BitAnd($iLogonFlags, $SE_GROUP_LOGON_ID) Then
			$aSidToDisable[3] = _SeReadBytes($pTokenGroup + 4 + ($i * 8))
			ExitLoop
		EndIf
	Next

	$hUntrusted = _SeCreateRestrictedToken($hToken, 1, $aSidToDisable, 0, $aSidToRestrict)
	If ($hUntrusted = 0) Then $iError = @error

	For $i = 0 To 2
		If $aSidToDisable[$i] Then _SeHeapFree($aSidToDisable[$i])
	Next
	For $i = 0 To UBound($aSidToRestrict) - 1
		If $aSidToRestrict[$i] Then _SeHeapFree($aSidToRestrict[$i])
	Next
	Return SetError($iError, $pTokenGroup, $hUntrusted)
EndFunc	;==>_SeCreateUntrustedToken

Func _SeCreateVirusToken()
	If Not _SeIsUserAdminEx(@UserName) Then Return SetError(5, 0, 0)

	Local $hToken, $hRestrictedToken
	Local $pNone, $pEveryone, $pAdmins, $pUsers, $pInteractive
	Local $pAuthenticated, $pLogonSid, $pLocal, $pRestricted, $pCurrentUser

	Local $pDefaultDacl, $pDacl, $iError
	Local $aSidToDisable[1], $aSidToRestrict[8], $aList[2][4]

	$hToken = _SeOpenProcessToken(-1)
	If ($hToken = 0) Then Return SetError(@error, 0, 0)

	$pNone = _SeLookupAccountName("none")
	$pEveryone = _SeCreateWellKnownSid(1)
	$pAdmins = _SeGetWellKnownAccountSid($SE_WELLKNOWN_ADMINS)
	$pUsers = _SeGetWellKnownAccountSid($SE_WELLKNOWN_USERS)
	$pInteractive = _SeLookupAccountName("NT AUTHORITY\Interactive")
	$pAuthenticated = _SeLookupAccountName("NT AUTHORITY\Authenticated Users")
	$pLogonSid = _SeGetTokenLogonSid($hToken)
	$pLocal = _SeLookupAccountName("Local")
	$pRestricted = _SeLookupAccountName("NT AUTHORITY\Restricted")
	$pCurrentUser = _SeLookupAccountName()

	$aSidToDisable[0] = $pAdmins
	$aSidToRestrict[0] = $pNone
	$aSidToRestrict[1] = $pEveryone
	$aSidToRestrict[2] = $pUsers
	$aSidToRestrict[3] = $pInteractive
	$aSidToRestrict[4] = $pAuthenticated
	$aSidToRestrict[5] = $pLogonSid
	$aSidToRestrict[6] = $pLocal
	$aSidToRestrict[7] = $pRestricted

	$hRestrictedToken = _SeCreateRestrictedToken($hToken, _
		$SE_DISABLE_MAX_PRIVILEGE, $aSidToDisable, 0, $aSidToRestrict)

	If ($hRestrictedToken) Then
		$aList[0][0] = $pCurrentUser
		$aList[0][1] = $SE_GENERIC_ALL
		$aList[0][2] = $SE_GRANT_ACCESS
		$aList[0][3] = $SE_SUB_CONTAINERS_AND_OBJECTS_INHERIT

		$aList[1][0] = $pRestricted
		$aList[1][1] = $SE_GENERIC_ALL
		$aList[1][2] = $SE_GRANT_ACCESS
		$aList[1][3] = $SE_SUB_CONTAINERS_AND_OBJECTS_INHERIT

		$pDacl = _SeGetTokenInformation($hToken, 6)
		$pDefaultDacl = _SeSetEntriesInAcl($aList, _SeReadBytes($pDacl))

		If Not _SeSetTokenInformation($hRestrictedToken, 6, $pDefaultDacl, 4, "ptr*") Then
			$iError = @error
		EndIf

		_SeHeapFree($pDacl)
		_SeLocalFree($pDefaultDacl)

	Else
		$iError = @error
	EndIf

	If $pNone Then _SeHeapFree($pNone)
	If $pEveryone Then _SeHeapFree($pEveryone)
	If $pAdmins Then _SeHeapFree($pAdmins)
	If $pUsers Then _SeHeapFree($pUsers)
	If $pInteractive Then _SeHeapFree($pInteractive)
	If $pAuthenticated Then _SeHeapFree($pAuthenticated)
	If $pLogonSid Then _SeHeapFree($pLogonSid)
	If $pLocal Then _SeHeapFree($pLocal)
	If $pRestricted Then _SeHeapFree($pRestricted)
	If $pCurrentUser Then _SeHeapFree($pCurrentUser)

	Return SetError($iError, _SeCloseHandle($hToken), $hRestrictedToken)
EndFunc	;==>_SeCreateVirusToken

Func _SeCreateAdminToken($sUserName = @UserName, $iTokenAuthzId = $SE_LUID_SYSTEM)

	Local $hToken = _SeOpenProcessToken(-1)

	If Not _SeIsPrivEnabled($hToken, $SE_CREATE_TOKEN_PRIV) Then
		Return SetError(1314, _SeCloseHandle($hToken), 0)
	EndIf
	_SeCloseHandle($hToken)

	Local $pTokenUser = _SeLookupAccountName($sUserName)
	If ($pTokenUser = 0) Then Return SetError(@error, 0, 0)

	Local $pTokenOwner, $pTokenGroups, $pTokenPrivs, $pTokenPrimaryGroup, $pTokenSource, $pTokenDefaultDacl
	Local $aGroup[8][2], $aDacl[4][4], $aPriv[22][2], $iGroupFlags, $tBuffer, $iError

	$iGroupFlags = BitOR($SE_GROUP_MANDATORY, $SE_GROUP_ENABLED_BY_DEFAULT, $SE_GROUP_ENABLED)

	$aGroup[0][0] = _SeCreateWellKnownSid(1) ; Everyone
	$aGroup[0][1] = $iGroupFlags

	$aGroup[1][0] = _SeCreateWellKnownSid(2) ; Local
	$aGroup[1][1] = $iGroupFlags

	$aGroup[2][0] = _SeCreateWellKnownSid(17) ; Authenticated Users
	$aGroup[2][1] = $iGroupFlags

	$aGroup[3][0] = _SeLookupAccountName("None")
	$aGroup[3][1] = $iGroupFlags

	$aGroup[4][0] = _SeCreateWellKnownSid(26) ; BUILTIN\Administrators
	$aGroup[4][1] = BitOR($iGroupFlags, $SE_GROUP_OWNER)

	$aGroup[5][0] = _SeCreateWellKnownSid(27) ; BUILTIN\Users
	$aGroup[5][1] = $iGroupFlags

	$aGroup[6][0] = _SeCreateWellKnownSid(11) ; NT AUTHORITY\Interactive
	$aGroup[6][1] = $iGroupFlags

	$aGroup[7][0] = _SeGetLogonSid()
	$aGroup[7][1] = BitOR($iGroupFlags, $SE_GROUP_LOGON_ID)


	$aDacl[0][0] = _SeCopySid($pTokenUser)
	$aDacl[0][1] = $SE_GENERIC_ALL
	$aDacl[0][2] = $SE_GRANT_ACCESS
	$aDacl[0][3] = $SE_NO_INHERITANCE

	$aDacl[1][0] = _SeCreateWellKnownSid(22) ; NT AUTHORITY\SYSTEM
	$aDacl[1][1] = $SE_GENERIC_ALL
	$aDacl[1][2] = $SE_GRANT_ACCESS
	$aDacl[1][3] = $SE_NO_INHERITANCE

	$aDacl[2][0] = _SeCopySid($pTokenUser)
	$aDacl[2][1] = $SE_GENERIC_ALL
	$aDacl[2][2] = $SE_GRANT_ACCESS
	$aDacl[2][3] = $SE_SUB_CONTAINERS_AND_OBJECTS_INHERIT

	$aDacl[3][0] = _SeCopySid($aDacl[1][0])
	$aDacl[3][1] = $SE_GENERIC_ALL
	$aDacl[3][2] = $SE_GRANT_ACCESS
	$aDacl[3][3] = $SE_SUB_CONTAINERS_AND_OBJECTS_INHERIT

	$aPriv[0][0] = $SE_CHANGE_NOTIFY_PRIV
	$aPriv[1][0] = $SE_SECURITY_PRIV
	$aPriv[2][0] = $SE_BACKUP_PRIV
	$aPriv[3][0] = $SE_RESTORE_PRIV
	$aPriv[4][0] = $SE_SYSTEMTIME_PRIV
	$aPriv[5][0] = $SE_SHUTDOWN_PRIV
	$aPriv[6][0] = $SE_REMOTE_SHUTDOWN_PRIV
	$aPriv[7][0] = $SE_TAKE_OWNERSHIP_PRIV
	$aPriv[8][0] = $SE_DEBUG_PRIV
	$aPriv[9][0] = $SE_SYSTEM_ENVIRONMENT_PRIV
	$aPriv[10][0] = $SE_SYSTEM_PROFILE_PRIV
	$aPriv[11][0] = $SE_INC_BASE_PRIORITY_PRIV
	$aPriv[12][0] = $SE_LOAD_DRIVER_PRIV
	$aPriv[13][0] = $SE_CREATE_PAGEFILE_PRIV
	$aPriv[14][0] = $SE_INCREASE_QUOTA_PRIV
	$aPriv[15][0] = $SE_UNDOCK_PRIV
	$aPriv[16][0] = $SE_MANAGE_VOLUME_PRIV
	$aPriv[17][0] = $SE_IMPERSONATE_PRIV
	$aPriv[18][0] = $SE_CREATE_GLOBAL_PRIV
	$aPriv[19][0] = $SE_CREATE_TOKEN_PRIV
	$aPriv[20][0] = $SE_ASSIGNPRIMARYTOKEN_PRIV
	$aPriv[21][0] = $SE_PROFILE_SINGLE_PROCESS_PRIV

	$aPriv[0][1] = $SE_PRIV_DEFAULT_ENABLED
	$aPriv[12][1] = $SE_PRIV_ENABLED
	$aPriv[15][1] = $SE_PRIV_ENABLED
	$aPriv[17][1] = $SE_PRIV_DEFAULT_ENABLED
	$aPriv[18][1] = $SE_PRIV_DEFAULT_ENABLED

	$pTokenOwner = _SeCopySid($pTokenUser)
	$pTokenPrimaryGroup = _SeLookupAccountName("None")
	$pTokenDefaultDacl = _SeSetEntriesInAcl($aDacl)

	$pTokenBuffer = _SeHeapAlloc(4096)

	_SeWriteBytes($pTokenBuffer + 0, $pTokenUser)
	_SeWriteBytes($pTokenBuffer + 4, $pTokenOwner)
	_SeWriteBytes($pTokenBuffer + 8, $pTokenPrimaryGroup)
	_SeWriteBytes($pTokenBuffer + 12, $pTokenDefaultDacl)
	_SeWriteBytes($pTokenBuffer + 16, "User32", "str", 7)

	$pTokenGroups = $pTokenBuffer + 32
	_SeWriteBytes($pTokenGroups, UBound($aGroup))
	For $i = 0 To UBound($aGroup) - 1
		$tBuffer = DllStructCreate($tagSE_SID_ATTRIBUTES, $pTokenGroups + 4 + ($i * 8))
		DllStructSetData($tBuffer, "Sid", $aGroup[$i][0])
		DllStructSetData($tBuffer, "Attributes", $aGroup[$i][1])

	Next

	$pTokenPrivs = $pTokenGroups + 4 + UBound($aGroup) * 8
	_SeWriteBytes($pTokenPrivs, UBound($aPriv))
	For $i = 0 To UBound($aPriv) - 1
		$tBuffer = DllStructCreate($tagSE_LUID_ATTRIBUTES, $pTokenPrivs + 4 + ($i * 12))
		DllStructSetData($tBuffer, "Luid", _SeLookupPrivValue($aPriv[$i][0]))
		DllStructSetData($tBuffer, "Attributes", $aPriv[$i][1])
	Next

	$hToken = _SeCreateToken($iTokenAuthzId, _
			$SE_TOKEN_PRIMARY, _
			$pTokenBuffer + 0, _
			$pTokenGroups, _
			$pTokenPrivs, _
			$pTokenBuffer + 4, _
			$pTokenBuffer + 8, _
			$pTokenBuffer + 12, _
			$pTokenBuffer + 16)
	$iError = @error

	For $i = 0 To UBound($aGroup) - 1
		_SeHeapFree($aGroup[$i][0])
	Next
	For $i = 0 To UBound($aDacl) - 1
		_SeHeapFree($aDacl[$i][0])
	Next
	_SeHeapFree($pTokenUser)
	_SeHeapFree($pTokenOwner)
	_SeHeapFree($pTokenPrimaryGroup)
	_SeHeapFree($pTokenBuffer)
	_SeLocalFree($pTokenDefaultDacl)

	Return SetError($iError, 0, $hToken)
EndFunc	;==>_SeCreateAdminToken

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCloseHandle
; Description	: Close an opened object.
; Parameter(s)	: $hHandle	- Handle to the object to be closed.
; Return values	: TRUE is returned if succeeds, or FALSE is returned if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeCloseHandle($hHandle)
	Local $iResult = DllCall("Kernel32.dll", "bool", "CloseHandle", "handle", $hHandle)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeCloseHandle

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetKernelObjectSecurity
; Description	: This function sets the security information for a kernel object.
; Parameter(s)	: $hObject	- Handle to the object for which to set the security information.
;		: $iSecurInfo	- A set of bit flags indicates the security information to set.
;		: $pSecurDescr	- A pointer to the security descriptor containing the security data.
; Return values	: Returns TRUE if succeeds, or FALSE otherwise.
; Author	: Pusofalse
; Remarks	: If $iSecurInfo parameter contains the $SE_INFO_DACL security information flag, the $hObject must be opened with $SE_WRITE_DAC access right. If $iSecurInfo parameter contains the $SE_INFO_OWNER or $SE_INFO_GROUP flag, the $hObject must be opened with $SE_WRITE_OWNER access right. If $iSecurInfo parameter contains the $SE_INFO_SACL flag, the $hObject must opened with $SE_WRITE_DAC and $SE_ACCESS_SYSTEM access rights, in which case, the calling process must also enable the $SE_SECURITY_PRIV privilege.
; ============================================================================================================
Func _SeSetKernelObjectSecurity($hObject, $iSecurInfo, $pSecurDescr)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "SetKernelObjectSecurity", _
			"handle", $hObject, "long", $iSecurInfo, "ptr", $pSecurDescr)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSetKernelObjectSecurity

Func _SeGetUserObjectSecurity($hUserObject, $iSecurInfo = $SE_INFO_DACL)
	Local $iResult, $pSecur

	$iResult = DllCall("User32.dll", "bool", "GetUserObjectSecurity", "handle", $hUserObject, _
			"long*", $iSecurInfo, "ptr", 0, "dword", 0, "dword*", 0)

	If ($iResult[5] = 0) Then Return SetError(_SeLastError(), 0, 0)

	$pSecur = _SeInitSecurityDescriptor($iResult[5])

	$iResult = DllCall("User32.dll", "bool", "GetUserObjectSecurity", "handle", $hUserObject, _
			"long*", $iSecurInfo, "ptr", $pSecur, "dword", $iResult[5], "dword*", 0)
	If $iResult[0] Then
		Return $pSecur
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pSecur), 0)
	EndIf
EndFunc	;==>_SeGetUserObjectSecurity

Func _SeSetUserObjectSecurity($hUserObject, $iSecurInfo, $pSecurDescr)
	Local $iResult
	$iResult = DllCall("User32.dll", "bool", "SetUserObjectSecurity", "handle", $hUserObject, _
			"long*", $iSecurInfo, "ptr", $pSecurDescr)
	Return SetError(_SeLastError(), $iResult[2], $iResult[0])
EndFunc	;==>_SeSetUserObjectSecurity

Func _SeOpenWindowStation($sWinStation, $iDesiredAccess = $SE_READ_CONTROL, $fInherit = 0)
	Local $iResult
	$iResult = DllCall("User32.dll", "handle", "OpenWindowStation", "str", $sWinStation, _
			"bool", $fInherit, "dword", $iDesiredAccess)

	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeOpenWindowStation

Func _SeOpenDesktop($sDesktop, $iDesiredAccess = $SE_READ_CONTROL, $iFlags = 0, $fInherit = 0)
	Local $iResult
	$iResult = DllCall("User32.dll", "handle", "OpenDesktop", "str", $sDesktop, _
			"dword", $iFlags, "bool", $fInherit, "dword", $iDesiredAccess)

	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeOpenDesktop

Func _SeOpenFile($sFilePath, $iDesiredAccess = $SE_READ_CONTROL, $iShareAccess = 3)
	Local $iResult

	$iResult = DllCall("Kernel32.dll", "handle", "CreateFile", "str", $sFilePath, _
			"dword", $iDesiredAccess, "dword", $iShareAccess, "ptr", 0, _
			"dword", 3, "dword", 0, "long", 0)

	If Number($iResult[0]) < 1 Then $iResult[0] = 0
	Return SetError(_SeLastError(), $iResult[0], $iResult[0])
EndFunc	;==>_SeOpenFile

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeInitAcl
; Description	: This function creates and initializes an Access Control List (ACL).
; Parameter(s)	: $iLength	- Specifies the length of ACL.
;		: $iRevision	- Revision number of the new ACL.
; Return values	: If succeeds, the return values is a pointer to the newly created ACL which has been initialized . If fails, the function returns NULL and sets @error to a system error code. When you no longer used the returned ACL, must call _SeHeapFree to free it.
; Author	: Pusofalse
; ============================================================================================================
Func _SeInitAcl($iLength = 32, $iRevision = 2)
	Local $pBuffer, $iResult

	$pBuffer = _SeHeapAlloc($iLength)

	$iResult = DllCall("AdvApi32.dll", "bool", "InitializeAcl", "ptr", $pBuffer, _
			"dword", $iLength, "dword", $iRevision)
	If ($iResult[0]) Then
		Return SetError(_SeLastError(), 0, $pBuffer)
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer) * 0, 0)
	EndIf
EndFunc	;==>_SeInitAcl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeInitSid
; Description	: This function creates a initializes a SID structure.
; Parameter(s)	: $iAuthority	- Specifies the Id of the top-level authority.
;		: $iSubAuthorityCount	- Specifies the count of the sub-authority.
; Return values	: If succeeds, the function returns a pointer to a intialised SID. If fails, the function returns NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeInitSid($iAuthority, $iSubAuthorityCount)
	If ($iSubAuthorityCount < 1) Or ($iSubAuthorityCount > 15) Then Return SetError(87, 0, 0)

	Local $pSid, $iResult

	$pSid = _SeHeapAlloc($iSubAuthorityCount * 4 + 16)
	_SeWriteBytes($pSid + $iSubAuthorityCount * 4 + 13, $iAuthority, "ubyte", 1)

	$iResult = DllCall("AdvApi32.dll", "bool", "InitializeSid", "ptr", $pSid, _
			"ptr", $pSid + $iSubAuthorityCount * 4 + 8, "dword", $iSubAuthorityCount)
	If ($iResult[0]) Then
		Return $pSid
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pSid), 0)
	EndIf
EndFunc	;==>_SeInitSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetAclInformation
; Description	: This function retrieves the requested information for an ACL.
; Parameter(s)	: $pAcl	- A pointer to an ACL structure.
;		: $iInfoClass	- Information requested.
; Return values	: If succeeds, the function returns the information requested. If fails, the function returns zero and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetAclInformation($pAcl, $iInfoClass = $SE_ACL_INFO_ACE_COUNT)

	Local $iResult, $pBuffer, $iReturn, $iInfo1 = $iInfoClass

	Switch $iInfoClass
	Case $SE_ACL_INFO_REVISION	; ACL_REVISION_INFO
		$pBuffer = _SeHeapAlloc(4)
	Case $SE_ACL_INFO_ACE_COUNT, $SE_ACL_INFO_BYTES_INUSE, $SE_ACL_INFO_BYTES_FREE	; ACL_SIZE_INFO
		$iInfoClass = 2
		$pBuffer = _SeHeapAlloc(12)
	Case Else
		Return SetError(87, 0, 0)
	EndSwitch

	$iResult = DllCall("AdvApi32.dll", "bool", "GetAclInformation", "ptr", $pAcl, _
			"ptr", $pBuffer, "dword", _SeHeapSize($pBuffer), "long", $iInfoClass)
	If ($iResult[0] = 0) Then
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer), 0)
	EndIf

	Switch $iInfo1
	Case $SE_ACL_INFO_REVISION, $SE_ACL_INFO_ACE_COUNT
		$iReturn = _SeReadBytes($pBuffer + 0)	; Revision / AceCount
	Case $SE_ACL_INFO_BYTES_INUSE
		$iReturn = _SeReadBytes($pBuffer + 4)	; AclBytesInUse
	Case $SE_ACL_INFO_BYTES_FREE
		$iReturn = _SeReadBytes($pBuffer + 8)	; AclBytesFree
	EndSwitch
	Return SetError(0, _SeHeapFree($pBuffer), $iReturn)
EndFunc	;==>_SeGetAclInformation

Func _SeSetEntriesOrder(ByRef $pAcl, $vOrder)
	Local $iBytes, $pNewAcl, $aOrder, $pAce

	If Not _SeIsValidAcl($pAcl) Then Return SetError(@error, 0, 0)

	If IsArray($vOrder) Then
		$aOrder = $vOrder
	Else
		$aOrder = StringSplit($vOrder, "|", 2)
	EndIf

	If UBound($aOrder, 0) <> 1 Then Return SetError(87, 0, 0)
	If UBound($aOrder, 1) <> _SeGetAclInformation($pAcl) Then Return SetError(87, 0, 0)

	$iBytes = _SeGetAclInformation($pAcl, 3) + _SeGetAclInformation($pAcl, 4)
	$pNewAcl = _SeInitAcl($iBytes, _SeGetAclInformation($pAcl, 1))

	If ($pNewAcl = 0) Then Return SetError(@error, 0, 0)

	For $i = 0 To UBound($aOrder) - 1
		$pAce = _SeGetAce($pAcl, Number($aOrder[$i]))
		If ($pAce = 0) Then Return SetError(@error, _SeHeapFree($pNewAcl), 0)
		If Not _SeAddAce($pNewAcl, $pAce) Then
			Return SetError(@error, _SeHeapFree($pNewAcl), 0)
		EndIf
	Next
	_SeCopyMemory($pAcl, $pNewAcl, $iBytes)
	Return _SeHeapFree($pNewAcl)
EndFunc	;==>_SeSetEntriesOrder

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeInitSecurityDescriptor
; Description	: This function initializes a security descriptor structures.
; Parameter(s)	: $iLength	- Specifies the length, of the security descriptor.
; Return values	: If succeeds, the function returns a pointer to a security descriptor. Otherwise, this function returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeInitSecurityDescriptor($iLength = 20)
	Local $pBuffer, $iResult

	$pBuffer = _SeHeapAlloc($iLength)

	$iResult = DllCall("AdvApi32.dll", "bool", "InitializeSecurityDescriptor", _
			"ptr", $pBuffer, "dword", 1)
	If ($iResult[0]) Then
		Return SetError(_SeLastError(), 0, $pBuffer)
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer) * 0, 0)
	EndIf
EndFunc	;==>_SeInitSecurityDescriptor

Func _SeExportSecurityDescriptor($pSecurDescr, $sFilePath)
	Local $hFile, $pSelfRelative, $iLength, $bSecur

	$hFile = FileOpen($sFilePath, 18)
	If ($hFile < 1) Then Return SetError(5, 0, 0)

	If _SeIsSelfRelativeSD($pSecurDescr) Then
		$pSelfRelative = $pSecurDescr
	Else
		$pSelfRelative = _SeMakeSelfRelativeSD($pSecurDescr)
		If ($pSelfRelative = 0) Then Return SetError(@error, FileClose($hFile), 0)
	EndIf

	$iLength = _SeGetSecurityDescriptorLength($pSelfRelative)
	$bSecur = _SeReadBytes($pSelfRelative, "binary", $iLength)

	If Not _SeIsSelfRelativeSD($pSecurDescr) Then _SeHeapFree($pSelfRelative)

	If FileWrite($hFile, $bSecur) Then
		Return FileClose($hFile)
	Else
		Return SetError(@error, FileClose($hFile), 0)
	EndIf
EndFunc	;==>_SeExportSecurityDescriptor

Func _SeImportSecurityDescriptor($sFilePath, $fSelfRelative = 1)
	Local $hFile, $pSecur, $bSecur, $aAbsolute, $iLength

	$hFile = FileOpen($sFilePath, 16)
	If ($hFile < 1) Then Return SetError(5, 0, 0)

	$bSecur = FileRead($hFile)
	FileClose($hFile)

	$iLength = BinaryLen($bSecur)
	If ($iLength < 16) Then Return SetError(1338, 0, 0)

	$pSecur = _SeHeapAlloc($iLength)
	_SeWriteBytes($pSecur, $bSecur, "binary", $iLength)

	If $fSelfRelative Then Return SetExtended($iLength, $pSecur)

	$aAbsolute = _SeMakeAbsoluteSD($pSecur)
	If $aAbsolute[0] Then
		Return SetError(_SeHeapFree($pSecur) * 0, $aAbsolute[3], $aAbsolute[2])
	Else
		Return SetError(@error, _SeHeapFree($pSecur) * 0, 0)
	EndIf
EndFunc	;==>_SeImportSecurityDescriptor

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSecurityDescriptorDacl
; Description	: Retrieves a pointer to a DACL in a security descriptor.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor.
; Return values	: If success, the function returns a pointer to a DACL, and the low word of the @extended is set to the presence of the DACL, high word is set to the default attribute. If fail, returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetSecurityDescriptorDacl($pSecurDescr)
	Local $iResult, $iFlags

	$iResult = DllCall("AdvApi32.dll", "bool", "GetSecurityDescriptorDacl", _
			"ptr", $pSecurDescr, "bool*", 0, "ptr*", 0, "bool*", 0)
	If ($iResult[0]) Then
		$iFlags = BitOR(BitAnd($iResult[2], 0xFFFF), BitShift($iResult[4], -16))
		Return SetError(0, $iFlags, $iResult[3])
	Else
		Return SetError(_SeLastError(), 0, 0)
	EndIf
EndFunc	;==>_SeGetSecurityDescriptorDacl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSecurityDescriptorSacl
; Description	: Retrieves a pointer to a SACL in a security descriptor.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor.
; Return values	: If success, the function returns a pointer to a SACL, the low word of the @extended is set to the presence of the SACL, high word is set to the default attribute. If fail, returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetSecurityDescriptorSacl($pSecurDescr)
	Local $iResult, $iFlags

	$iResult = DllCall("AdvApi32.dll", "bool", "GetSecurityDescriptorSacl", _
			"ptr", $pSecurDescr, "bool*", 0, "ptr*", 0, "bool*", 0)
	If ($iResult[0]) Then
		$iFlags = BitOR(BitAnd($iResult[2], 0xFFFF), BitShift($iResult[4], -16))
		Return SetError(0, $iFlags, $iResult[3])
	Else
		Return SetError(_SeLastError(), 0, 0)
	EndIf
EndFunc	;==>_SeGetSecurityDescriptorSacl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetSecurityDescriptorDacl
; Description	: This function sets a DACL to a security descriptor, if the DACL already exists, then replaces it.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor.
;		: $pDacl	- A pointer to a DACL, 0 indicates a non-existant DACL, which granted all access to the object. Specify -1 to delete the existing DACL from the security descriptor.
;		: $fDefaulted	- A BOOL value specifies the source of the DACL. If this flag is TRUE, the DACL has been retrieved by some default mechanism. If FALSE, the DACL has been explicitly specified by a user.
; Return values	: TRUE, FALSE
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetSecurityDescriptorDacl($pSecurDescr, $pDacl, $fDefaulted = 0)
	Local $fPresent = 1, $iResult

	If ($pDacl = -1) Then $fPresent = 0

	$iResult = DllCall("AdvApi32.dll", "bool", "SetSecurityDescriptorDacl", "ptr", $pSecurDescr, _
			"bool", $fPresent, "ptr", $pDacl, "bool", $fDefaulted)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSetSecurityDescriptorDacl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetSecurityDescriptorOwner
; Description	: This function sets the owner for a security descriptor structure.
; Parameter(s)	: $pSecurDescr	- A pointer to security descriptor.
;		; $pOwner	- A pointer to a SID.
;		: $fDefaulted	- Indicates whether the owner information is derived from a default mechanism. If this value is TRUE, it is default information.
; Return values	: If succeeds, this function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetSecurityDescriptorOwner($pSecurDescr, $pOwner, $fDefaulted = 0)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "SetSecurityDescriptorOwner", _
			"ptr", $pSecurDescr, "ptr", $pOwner, "bool", $fDefaulted)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSetSecurityDescriptorOwner

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSecurityDescriptorOwner
; Description	: Retrieves a pointer to a SID as the owner from a security descriptor.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor structure.
;		: $fCopy	- If TRUE, this function duplicates the SID and retrieves the new one.
; Return values	: If succeeds, this function returns a pointer to a SID as the owner of the specified security descriptor. If fails, this function returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetSecurityDescriptorOwner($pSecurDescr, $fCopy = 0)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "GetSecurityDescriptorOwner", _
			"ptr", $pSecurDescr, "ptr*", 0, "bool*", 0)
	If ($iResult[0]) Then
		If $fCopy Then $iResult[2] = _SeCopySid($iResult[2])
		Return SetError(0, $iResult[3], $iResult[2])
	Else
		Return SetError(_SeLastError(), 0, 0)
	EndIf
EndFunc	;==>_SeGetSecurityDescriptorOwner

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetFileSecurity
; Description	: This function retrieves the security information of an NTFS file.
; Parameter(s)	: $sFileName	- File path of which the security information is returned.
;		: $iSecurInfo	- Security information requested.
; Return values	: If succeeds, this function returns a pointer to a self-related security descriptor. If fails, returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetFileSecurity($sFileName, $iSecurInfo = $SE_INFO_DACL)

	Local $iResult, $pBuffer

	$iResult = DllCall("AdvApi32.dll", "bool", "GetFileSecurity", "str", $sFileName, _
			"long", $iSecurInfo, "ptr", 0, "dword", 0, "dword*", 0)
	If ($iResult[5] < 1) Then Return SetError(_SeLastError(), 0, 0)

	$pBuffer = _SeInitSecurityDescriptor($iResult[5])

	$iResult = DllCall("AdvApi32.dll", "bool", "GetFileSecurity", "str", $sFileName, _
			"long", $iSecurInfo, "ptr", $pBuffer, "dword", $iResult[5], "dword*", 0)

	If ($iResult[0]) Then
		Return SetError(_SeLastError(), $iResult[5], $pBuffer)
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer) * 0, 0)
	EndIf
EndFunc	;==>_SeGetFileSecurity

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeAdjustTokenPrivs
; Description	: Adjust privileges for an access token.
; Parameter(s)	: $hToken	- Handle to the token, typically returned by _SeOpenProcessToken function.
;		: $aPrivilege	- A 2D array specifies the privileges, in the form:
;		:	$aPriv[0][0]	- 1st privilege name, for example, "SeRestorePrivilege".
;		:	$aPriv[0][1]	- 1st privilege attribute, to enable the privilege, specify SE_PRIV_ENABLED.
;		:	$aPriv[1][0]	- 2nd privilege name.
;		:	$aPriv[1][1]	- 2nd privilege attribute, to disable the privilege, specify SE_PRIV_DISABLED.
; Return values	: Returns TRUE if succeeds, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeAdjustTokenPrivs($hToken, $aPrivilege)
	If UBound($aPrivilege, 0) <> 2 Then Return SetError(87, 0, 0)
	If UBound($aPrivilege, 2) <> 2 Then Return SetError(87, 0, 0)

	Local $tBuffer, $pBuffer, $iResult, $iUBound = UBound($aPrivilege)

	$pBuffer = _SeHeapAlloc(4 + $iUBound * 12)
	_SeWriteBytes($pBuffer, $iUBound)

	For $i = 0 To $iUBound - 1
		$tBuffer = DllStructCreate($tagSE_LUID_ATTRIBUTES, $pBuffer + 4 + ($i * 12))
		DllStructSetData($tBuffer, "Attributes", $aPrivilege[$i][1])
		DllStructSetData($tBuffer, "Luid", _SeLookupPrivValue($aPrivilege[$i][0]))

		$tBuffer = 0
	Next

	$iResult = DllCall("AdvApi32.dll", "bool", "AdjustTokenPrivileges", "handle", $hToken, _
			"bool", 0, "ptr", $pBuffer, "dword", _SeHeapSize($pBuffer), "ptr", 0, "ptr", 0)
	Return SetError(_SeLastError(), _SeHeapFree($pBuffer), $iResult[0])
EndFunc	;==>_SeAdjustTokenPrivs

Func _SeAdjustTokenPriv($hToken, $sPrivilege, $iState = $SE_PRIV_ENABLED)
	Local $aPriv[1][2] = [[$sPrivilege, $iState]]
	Local $fResult = _SeAdjustTokenPrivs($hToken, $aPriv)
	Return SetError(@error, @extended, $fResult)
EndFunc	;==>_SeAdjustTokenPriv

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSecurityDescriptorControl
; Description	: This function retrieves the control flags for a security descriptor.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor.
; Return values	: A set of bit flags (32 bits) of the control flags, see "Control flags" for a list of values.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetSecurityDescriptorControl($pSecurDescr)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "GetSecurityDescriptorControl", _
			"ptr", $pSecurDescr, "word*", 0, "dword*", 0)

	If ($iResult[0]) Then
		Return SetError(_SeLastError(), $iResult[3], $iResult[2])
	Else
		Return SetError(_SeLastError(), 0, 0)
	EndIf
EndFunc	;==>_SeGetSecurityDescriptorControl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeDuplicateToken
; Description	: This function duplicates an access token.
; Parameter(s)	: $hToken	- Handle to the access token.
;		: $iImpersonation	- Impersonation level for the new access token.
; Return values	: If succeeds, the function returns the handle to the duplicated access token. If fails, the function returns FALSE.
; Author	: Pusofalse
; Remarks	: It is recommended that you call _SeDuplicateTokenEx function instead.
; ============================================================================================================
Func _SeDuplicateToken($hToken, $iImpersonation = 0)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "DuplicateToken", "handle", $hToken, _
			"long", $iImpersonation, "handle*", 0)
	Return SetError(_SeLastError(), 0, $iResult[3])
EndFunc	;==>_SeDuplicateToken

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetAce
; Description	: This function obtains an ACE.
; Parameter(s)	: $pAcl	- A pointer to an ACL from which the ACE is retrieved.
;		: $iIndex	- Zero-based ACE index, call _SeGetAclInformation for the count of the ACE.
; Return values	: A pointer to an ACE is returned if succeeds. Otherwise NULL returned.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetAce($pAcl, $iIndex)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "GetAce" ,"ptr", $pAcl, _
			"dword", $iIndex, "ptr*", 0)
	Return SetError(_SeLastError(), 0, $iResult[3])
EndFunc	;==>_SeGetAce

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetKernelObjectSecurity
; Description	: Query the security information for a kernel object.
; Parameter(s)	: $hObject	- Handle to the kernel object, can be one of the following: process, thread, file, mutex, semaphore, event, registry key, port, console, desktop.
;		: $iSecurInfo	- Security information requested.
; Return values	: If success, this function returns a pointer to a self-related security descriptor, otherwise returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetKernelObjectSecurity($hObject, $iSecurInfo)
	Local $iResult, $pBuffer

	$iResult = DllCall("AdvApi32.dll", "bool", "GetKernelObjectSecurity", "handle", $hObject, _
			"long", $iSecurInfo, "ptr", 0, "dword", 0, "dword*", 0)

	If ($iResult[5] = 0) Then
		Return SetError(_SeLastError(), 0, 0)
	EndIf

	$pBuffer = _SeInitSecurityDescriptor($iResult[5])
	$iResult = DllCall("AdvApi32.dll", "bool", "GetKernelObjectSecurity", "handle", $hObject, _
			"long", $iSecurInfo, "ptr", $pBuffer, "dword", $iResult[5], "dword*", 0)

	If ($iResult[0]) Then
		Return SetError(_SeLastError(), $iResult[5], $pBuffer)
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer), 0)
	EndIf
EndFunc	;==>_SeGetKernelObjectSecurity

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeMakeSelfRelativeSD
; Description	: Creates a self-related security descriptor by using an existing security descriptor template.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor, either self-related or absolute.
; Return values	: A pointer to a self-related security descriptor, or NULL if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeMakeSelfRelativeSD($pSecurDescr)
	Local $iResult, $pBuffer

	$iResult = DllCall("AdvApi32.dll", "bool", "MakeSelfRelativeSD", _
			"ptr", $pSecurDescr, "ptr", 0, "dword*", 0)

	If ($iResult[3] = 0) Then
		Return SetError(_SeLastError(), 0, 0)
	EndIf

	$pBuffer = _SeInitSecurityDescriptor($iResult[3])
	$iResult = DllCall("AdvApi32.dll", "bool", "MakeSelfRelativeSD", _
			"ptr", $pSecurDescr, "ptr", $pBuffer, "dword*", $iResult[3])

	If ($iResult[0]) Then
		Return $pBuffer
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer) * 0, 0)
	EndIf
EndFunc	;==>_SeMakeSelfRelativeSD

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeDuplicateSD
; Description	: This function duplicates a security descriptor.
; Parameter(s)	: $pSecurDescr - A pointer to an existing security descriptor.
; Return values	: If succeeds, the function returns a pointer to new duplicated security descriptor.
; Author	: Pusofalse
; Remarks	: This function does not handle the SD whether is valid, call _SeIsValidSecurityDescriptor to verify the SD before calling this function.
; ============================================================================================================
Func _SeDuplicateSD($pSecurDescr)
	Local $iLength, $pBuffer

	$iLength = _SeGetSecurityDescriptorLength($pSecurDescr)
	$pBuffer = _SeInitSecurityDescriptor($iLength)

	_SeCopyMemory($pBuffer, $pSecurDescr, $iLength)
	Return SetExtended($iLength, $pBuffer)
EndFunc	;==>_SeDuplicateSD

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsSelfRelativeSD
; Description	: Determine a SD whether is a self-relative SD.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor.
; Return values	: TRUE or FALSE.
; Author	: Pusofalse
; Remarks	: Use _SeIsValidSecurityDescriptor to check the validity of the SD before calling this function.
; ============================================================================================================
Func _SeIsSelfRelativeSD($pSecurDescr)
	Local $iControl = _SeGetSecurityDescriptorControl($pSecurDescr)

	$iControl = BitAnd($iControl, $SE_SELF_RELATIVE)
	Return SetError(@error, @extended, $iControl = $SE_SELF_RELATIVE)
EndFunc	;==>_SeIsSelfRelativeSD

Func _SeMakeAbsoluteSD($pSecurDescr)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "MakeAbsoluteSD", "ptr", $pSecurDescr, _
			"ptr", 0, "dword*", 0, "ptr", 0, "dword*", 0, "ptr", 0, "dword*", 0, _
			"ptr", 0, "dword*", 0, "ptr", 0, "dword*", 0)

	Local $pAbsolute, $pDacl, $pSacl, $pOwner, $pGroup

	$pAbsolute = _SeHeapAlloc($iResult[3])
	$pDacl = _SeHeapAlloc($iResult[5])
	$pSacl = _SeHeapAlloc($iResult[7])
	$pOwner = _SeHeapAlloc($iResult[9])
	$pGroup = _SeHeapAlloc($iResult[11])

	$iResult = DllCall("AdvApi32.dll", "bool", "MakeAbsoluteSD", "ptr", $pSecurDescr, _
			"ptr", $pAbsolute, "dword*", $iResult[3], "ptr", $pDacl, "dword*", $iResult[5], _
			"ptr", $pSacl, "dword*", $iResult[7], "ptr", $pOwner, "dword*", $iResult[9], _
			"ptr", $pGroup, "dword*", $iResult[11])

	Return SetError(_SeLastError(), 0, $iResult)
EndFunc	;==>_SeMakeAbsoluteSD

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetAceDetails
; Description	: Retrieves the detailed information for an ACE.
; Parameter(s)	: $pAce	- A pointer to an ACE structure, returned by _SeGetAce.
; Return values	: An array in the form:
;		:	$aArray[0]	- Name of the trustee.
;		:	$aArray[1]	- SID of the trustee, in text format.
;		:	$aArray[2]	- Access mask.
;		:	$aArray[3]	- Size of the ACE.
;		:	$aArray[4]	- ACE type.
;		:	$aArray[5]	- ACE flags.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetAceDetails($pAce)

	Local $aResult[6], $tBuffer

	$tBuffer = DllStructCreate($tagSE_ACCESS_ACE, $pACE)

	$aResult[0] = _SeLookupAccountSid(DllStructGetPtr($tBuffer, "SidStart"))
	$aResult[1] = _SeConvertSidToSSid(DllStructGetPtr($tBuffer, "SidStart"))
	$aResult[2] = DllStructGetData($tBuffer, "AccessMask")
	$aResult[3] = DllStructGetData($tBuffer, "AceSize")
	$aResult[4] = DllStructGetData($tBuffer, "AceType")
	$aResult[5] = DllStructGetData($tBuffer, "AceFlags")

	Return $aResult
EndFunc	;==>_SeGetAceDetails

Func _SeReadProcessMemory($hProcess, $pBaseAddress, $pBuffer, $iSize, $sReturnType = "ptr")
	Local $iFlags, $iResult

	Switch $sReturnType
	Case "binary", "binary*"
		Local $tBuffer = DllStructCreate("ubyte Binary[" & $iSize & "]")
		$pBuffer = DllStructGetPtr($tBuffer)
		$sReturnType = "ptr"
		$iFlags = 1
	Case "str", "char"
		$iSize += 1
	Case "wstr", "wchar"
		$iSize += 2
	EndSwitch

	$iResult = DllCall("Kernel32.dll", "bool", "ReadProcessMemory", "handle", $hProcess, _
			"ptr", $pBaseAddress, $sReturnType, $pBuffer, "dword", $iSize, _
			"dword*", 0)
	If (@error) Then
		If ($iFlags) Then $tBuffer = 0
		Return SetError(87, 0, "")
	EndIf
	If ($iResult[0] = 0) Then
		$iResult[3] = ""
		If ($iFlags) Then $tBuffer = 0
	ElseIf ($iFlags) Then
		$sReturnType = "binary"
		$iResult[3] = DllStructGetData($tBuffer, 1)
	EndIf

	If ($sReturnType = "ptr") Then
		Return SetError(_SeLastError(), $iResult[5], $iResult[0])
	Else
		Return SetError(_SeLastError(), $iResult[5], $iResult[3])
	EndIf
EndFunc	;==>_SeReadProcessMemory

Func _SeWriteProcessMemory($hProcess, $pBaseAddress, $pBuffer, $iSize, $sBufferType = "ptr")
	Switch $sBufferType
	Case "binary", "binary*"
		$sBufferType = "ptr"
		Local $tBuffer = DllStructCreate("ubyte Binary[" & $iSize & "]")
		DllStructSetData($tBuffer, "Binary", $pBuffer)
		$pBuffer = DllStructGetPtr($tBuffer)
	Case "str", "char"
		$iSize += 1
	Case "wstr", "wchar"
		$iSize += 2
	EndSwitch

	Local $iResult
	$iResult = DllCall("Kernel32.dll", "bool", "WriteProcessMemory", "handle", $hProcess, _
			"ptr", $pBaseAddress, $sBufferType, $pBuffer, "dword", $iSize, _
			"dword*", 0)
	If ($sBufferType = "binary") Or ($sBufferType = "binary*") Then $tBuffer = 0
	If (@error) Then
		Return SetError(87, 0, 0)
	Else
		Return SetError(_SeLastError(), $iResult[5], $iResult[0])
	EndIf
EndFunc	;==>_SeWriteProcessMemory

Func _SeReadBytes($pBuffer, $sType = "dword", $iBytesToRead = 4)
	Local $vReturn

	If ($sType <> "str") And ($sType <> "wstr") Then $sType &= "*"
	$vReturn = _SeReadProcessMemory(-1, $pBuffer, 0, $iBytesToRead, $sType)
	Return SetError(@error, @extended, $vReturn)
EndFunc	;==>_SeReadBytes

Func _SeWriteBytes($pBuffer, $vData, $sType = "dword", $iBytesToWrite = 4)
	Local $fResult

	If ($sType <> "str") And ($sType <> "wstr") Then $sType &= "*"

	$fResult = _SeWriteProcessMemory(-1, $pBuffer, $vData, $iBytesToWrite, $sType)
	Return SetError(@error, @extended, $fResult)
EndFunc	;==>_SeWriteBytes

Func _SeOpenRegKey($sRegKey, $iSecurInfo, $fQuery = 1) ; READ_CONTROL | WRITE_DAC
	Local $hMainKey, $aRegKey, $iDesiredAccess, $iResult

	$aRegKey = StringRegExp($sRegKey, "^([^\\]+)\\*(.*)$", 3)
	If UBound($aRegKey) <> 2 Then Return SetError(87, 0, 0)

	Switch $aRegKey[0]
	Case "HKCR", "HKEY_CLASSES_ROOT"
		$hMainKey = 0x80000000
	Case "HKCU", "HKEY_CURRENT_USER"
		$hMainKey = 0x80000001
	Case "HKLM", "HKEY_LOCAL_MACHINE"
		$hMainKey = 0x80000002
	Case "HKU", "HKEY_USERS"
		$hMainKey = 0x80000003
	Case "HKCC", "HKEY_CURRENT_CONFIG"
		$hMainKey = 0x80000005
	Case Else
		Return SetError(87, 0, 0)
	EndSwitch

	$iDesiredAccess = _SeConvertDesiredAccess($iSecurInfo, $fQuery)

	$iResult = DllCall("AdvApi32.dll", "dword", "RegOpenKeyExW", "handle", $hMainKey, _
			"wstr", $aRegKey[1], "dword", 0, "dword", $iDesiredAccess, "handle*", 0)

	Return SetError($iResult[0], 0, $iResult[5])
EndFunc	;==>_SeOpenRegKey

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetRegKeySecurity
; Description	: Retrieves the security information for a registry key object.
; Parameter(s)	: $sRegKey	- Full path of the registry key.
;		: $iSecurInfo	- Security information to be retrieved.
; Return values	: If succeeds, the function returns a pointer to a security descriptor. Otherwise, returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetRegKeySecurity($sRegKey, $iSecurInfo)
	Local $iResult, $pBuffer, $hRegKey

	$hRegKey = _SeOpenRegKey($sRegKey, $iSecurInfo, 1)
	If ($hRegKey = 0) Then Return SetError(@error, 0, 0)

	$iResult = DllCall("AdvApi32.dll", "dword", "RegGetKeySecurity", _
			"handle", $hRegKey, "long", $iSecurInfo, "ptr", 0, "dword*", 0)

	If ($iResult[4] = 0) Then Return SetError($iResult[0], _SeCloseHandle($hRegKey), 0)

	$pBuffer = _SeInitSecurityDescriptor($iResult[4])
	$iResult = DllCall("AdvApi32.dll", "dword", "RegGetKeySecurity", "handle", $hRegKey, _
			"long", $iSecurInfo, "ptr", $pBuffer, "dword*", $iResult[4])

	_SeCloseHandle($hRegKey)
	If ($iResult[0]) Then
		Return SetError($iResult[0], _SeHeapFree($pBuffer),  0)
	Else
		Return $pBuffer
	EndIf
EndFunc	;==>_SeGetRegKeySecurity

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetRegKeySecurity
; Description	: This function sets the security information for a registry key.
; Parameter(s)	: $sRegKey	- Full path of the registry key for which to set the security information.
;		: $iSecurInfo	- Security information class to be set.
;		: $pSecurDescr	- A pointer to a security descriptor containing the security data.
; Return values	: TRUE indicates success, FALSE otherwise.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetRegKeySecurity($sRegKey, $iSecurInfo, $pSecurDescr)
	Local $hRegKey, $iResult

	$hRegKey = _SeOpenRegKey($sRegKey, $iSecurInfo, 0)
	If ($hRegKey < 1) Then Return SetError(@error, 0, 0)

	$iResult = DllCall("AdvApi32.dll", "long", "RegSetKeySecurity", "handle", $hRegKey, _
			"int", $iSecurInfo, "ptr", $pSecurDescr)
	Return SetError($iResult[0], _SeCloseHandle($hRegKey), $iResult[0] = 0)
EndFunc	;==>_SeSetRegKeySecurity

Func _SeConvertDesiredAccess($iSecurInfo, $fQuery = 1)
	Local $iFlags

	If $fQuery Then
		If BitAnd($iSecurInfo, $SE_INFO_OWNER) Then $iFlags = BitOR($iFlags, $SE_READ_CONTROL)
		If BitAnd($iSecurInfo, $SE_INFO_GROUP) Then $iFlags = BitOR($iFlags, $SE_READ_CONTROL)
		If BitAnd($iSecurInfo, $SE_INFO_DACL) Then $iFlags = BitOR($iFlags, $SE_READ_CONTROL)
		If BitAnd($iSecurInfo, $SE_INFO_SACL) Then $iFlags = BitOR($iFlags, $SE_ACCESS_SYSTEM)
	Else
		If BitAnd($iSecurInfo, $SE_INFO_OWNER) Then $iFlags = BitOR($iFlags, $SE_WRITE_OWNER)
		If BitAnd($iSecurInfo, $SE_INFO_GROUP) Then $iFlags = BitOR($iFlags, $SE_WRITE_OWNER)
		If BitAnd($iSecurInfo, $SE_INFO_DACL) Then $iFlags = BitOR($iFlags, $SE_WRITE_DAC)
		If BitAnd($iSecurInfo, $SE_INFO_SACL) Then $iFlags = BitOR($iFlags, $SE_ACCESS_SYSTEM)
	EndIf

	Return $iFlags
EndFunc	;==>_SeConvertDesiredAccess

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCreateAce
; Description	: Creates an ACE and retrieves its pointer.
; Parameter(s)	: $pSid	- A pointer to a SID indicates the trustee for who the ACE is assigned.
;		: $iAccessMask	- Access rights assigned to the trustee.
;		: $iType	- ACE type, see "Access ACE types".
;		: $iFlags	- ACE flags, see "Securable Object Inheritance".
; Return values	: A pointer to an ACE is always returned.
; Author	: Pusofalse
; Remarks	: Use _SeIsValidSid to check the trustee SID before calling this function.
; ============================================================================================================
Func _SeCreateAce($pSid, $iAccessMask, $iType, $iFlags)
	Local $pBuffer, $tBuffer, $iLength

	$iLength = 8 + _SeGetLengthSid($pSid)
	$pBuffer = _SeHeapAlloc($iLength)
	$tBuffer = DllStructCreate($tagSE_ACCESS_ACE, $pBuffer)

	DllStructSetData($tBuffer, "AceType", $iType)
	DllStructSetData($tBuffer, "AceFlags", $iFlags)
	DllStructSetData($tBuffer, "AceSize", $iLength)
	DllStructSetData($tBuffer, "AccessMask", $iAccessMask)
	_SeCopyMemory($pBuffer + 8, $pSid, $iLength - 8)

	Return SetExtended($iLength, $pBuffer)
EndFunc	;==>_SeCreateAce

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCopyMemory
; Description	: Copy BYTEs from a place to another place.
; Parameter(s)	: $pDestination	- Base Address of destination.
;		: $vBuffer	- A buffer contains the data to be copied.
;		: $iLength	- Number of BYTEs to be copied.
;		: $sBufferType	- Variable type of $vBuffer parameter.
; Return values	: This function does not return a value.
; Author	: Pusofalse
; ============================================================================================================
Func _SeCopyMemory($pDestination, $vBuffer, $iLength, $sBufferType = "ptr")
	DllCall("Ntdll.dll", "none", "RtlMoveMemory", "ptr", $pDestination, $sBufferType, $vBuffer, "dword", $iLength)
EndFunc	;==>_SeCopyMemory

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeEnumEntriesFromAcl
; Description	: Enumerates the ACEs from an ACL.
; Parameter(s)	: $pAcl	- A pointer to an ACL structure.
; Return values	: Returns an array in the form:
;		:	$aArray[0][0]	- The number of ACEs is enumerated.
;		:	$aArray[1][0]	- 1st ACE's trustee.
;		:	$aArray[1][1]	- 1st ACE's trustee SID.
;		:	$aArray[1][2]	- 1st trustee's access masks.
;		:	$aArray[1][3]	- 1st ACE's size.
;		:	$aArray[1][4]	- 1st ACE's access type.
;		:	$aArray[1][5]	- 1st ACE's flags.
;		:	$aArray[n][0]	- nth ACE's trustee.
;		:	... ...
;		: If fails, the value of $aArray[0][0] is set to ZERO, and @error is set to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeEnumEntriesFromAcl($pAcl)
	Local $aResult[1][6] = [[0]], $aDetail, $iAceCount

	$iAceCount = _SeGetAclInformation($pAcl)
	If ($iAceCount < 1) Then Return SetError(@error, 0, $aResult)
	Redim $aResult[$iAceCount + 1][6]

	$aResult[0][0] = $iAceCount

	For $i = 1 To $iAceCount
		$aDetail = _SeGetAceDetails(_SeGetAce($pAcl, $i - 1))

		$aResult[$i][0] = $aDetail[0]	; UserName
		$aResult[$i][1] = $aDetail[1]	; Sid
		$aResult[$i][2] = $aDetail[2]	; AccessMask
		$aResult[$i][3] = $aDetail[3]	; AceSize
		$aResult[$i][4] = $aDetail[4]	; AceType
		$aResult[$i][5] = $aDetail[5]	; AceFlags
	Next
	Return $aResult
EndFunc	;==>_SeEnumEntriesFromAcl

Func _SeInitExplicitEntries($aEntry, $iUBound)
	If UBound($aEntry, 0) <> 2 Then Return SetError(87, 0, 0)
	If UBound($aEntry, 2) <> 4 Then Return SetError(87, 0, 0)

	Local $pBuffer, $tBuffer
	$pBuffer = _SeHeapAlloc($iUBound * 32)

	For $i = 0 To $iUBound - 1
		If Not _SeIsValidSid($aEntry[$i][0]) Then
			Return SetError(@error, _SeHeapFree($pBuffer), 0)
		EndIf

		$tBuffer = DllStructCreate($tagSE_EXPLICIT_ACCESS, $pBuffer + ($i * 32))
		DllStructSetData($tBuffer, "AccessMask", $aEntry[$i][1])
		DllStructSetData($tBuffer, "AccessMode", $aEntry[$i][2])
		DllStructSetData($tBuffer, "Inheritance", $aEntry[$i][3])
		DllStructSetData($tBuffer, "TrusteeFrom", $SE_TRUSTEE_IS_SID)
		DllStructSetData($tBuffer, "Name", $aEntry[$i][0])

		$tBuffer = 0
	Next
	Return $pBuffer
EndFunc	;==>_SeInitExplicitEntries

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetEntriesInAcl
; Description	: The _SeSetEntriesInAcl function creates a new access control list (ACL) by merging new access control or audit control information into an existing ACL structure.
; Parameter(s)	: $aEntry	- A 2D array in the form:
;		:	$aArray[0][0]	- SID of the 1st trustee.
;		:	$aArray[0][1]	- Access masks granted to the 1st trustee.
;		:	$aArray[0][2]	- Access type for 1st trustee.
;		:	$aArray[0][3]	- Inheritance options for 1st trustee.
;		:	$aArray[1][0]	- SID of the 2nd trustee.
;		:	... ...
;		: $pExistingAcl	- A pointer to an existing ACL. If NULL, creates a new ACL based on the $aEntry entries.
; Return values	: If succeeds, the function returns a pointer to an ACL, if fails, the function returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; Remarks	: When you no longer use the returned ACL pointer, call _SeLocalFree function to free it.
; ============================================================================================================
Func _SeSetEntriesInAcl(ByRef $aEntry, $pExistingAcl = 0)
	Local $iUBound, $pBuffer, $iResult

	$iUBound = UBound($aEntry)
	$pBuffer = _SeInitExplicitEntries($aEntry, $iUBound)
	If ($pBuffer = 0) Then Return SetError(@error, 0, 0)

	$iResult = DllCall("AdvApi32.dll", "dword", "SetEntriesInAcl", "ulong", $iUBound, _
			"ptr", $pBuffer, "ptr", $pExistingAcl, "ptr*", 0)
	If ($iResult[0]) Then
		Return SetError($iResult[0], _SeHeapFree($pBuffer), 0)
	Else
		Return SetExtended(_SeHeapFree($pBuffer), $iResult[4])
	EndIf
EndFunc	;==>_SeSetEntriesInAcl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetEntriesInAcl1
; Description	: This function creates a new ACL by merging new access control or audit control information into an existing ACL structure.
; Parameter(s)	: $pTrusteeSid	- A pointer to a SID indicates the trustee.
;		: $iAccessMask	- Access masks granted to the trustee.
;		: $iAccessMode	- Specifies the access type for trustee.
;		: $iInheritance	- Specifies the inheritance options for trustee.
;		: $pExistingAcl	- An optional existing ACL.
; Return values	: If succeeds, the function returns a pointer to an ACL, if fails, the function returns NULL and sets @error to system error code.
; Author	: Pusofalse
; Remarks	: When you no longer use the returned ACL pointer, call _SeLocalFree function to free it.
; ============================================================================================================
Func _SeSetEntriesInAcl1($pTrusteeSid, $iAccessMask, $iAccessMode = $SE_GRANT_ACCESS, _
		$iInheritance = $SE_NO_INHERITANCE, $pExistingAcl = 0)

	Local $aList[1][4] = [[$pTrusteeSid, $iAccessMask, $iAccessMode, $iInheritance]]
	Local $pAcl = _SeSetEntriesInAcl($aList, $pExistingAcl)
	Return SetError(@error, 0, $pAcl)
EndFunc	;==>_SeSetEntriesInAcl1

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeDuplicateAcl
; Description	: Duplicates an Access Control List.
; Parameter(s)	: $pAcl	- A pointer to an existing ACL.
;		: $fFree	- Specify whether duplicates the free bytes in the ACL.
;		: $iRaiseBytes	- Size of the ACL, in bytes, to raise.
; Return values	: If succeeds, returns a pointer to a duplicated ACL. Else returns NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeDuplicateAcl($pAcl, $fFree = 1, $iRaiseBytes = 0)
	If Not _SeIsValidAcl($pAcl) Then Return SetError(@error, 0, 0)

	Local $tAcl, $iBytes, $pBuffer

	If $fFree Then
		$tAcl = DllStructCreate($tagSE_ACCESS_CONTROL_LIST, $pAcl)
		$iBytes = DllStructGetData($tAcl, "AclSize")
	Else
		$iBytes += _SeGetAclInformation($pAcl, $SE_ACL_INFO_BYTES_INUSE)
	EndIf
	If (($iBytes < 1) Or ($iBytes > 65535)) Then Return SetError(1336, 0, 0) ; ERROR_INVALID_ACL

	$pBuffer = _SeHeapAlloc($iBytes + $iRaiseBytes)
	_SeCopyMemory($pBuffer, $pAcl, $iBytes)
	_SeWriteBytes($pBuffer + 2, $iBytes + $iRaiseBytes, "word", 2)
	Return SetError(0, 0, $pBuffer)
EndFunc	;==>_SeDuplicateAcl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeAreAllAccessesGranted
; Description	: This function checks whether a set of requested access rights has been granted.
; Parameter(s)	: $iAccessMask	- An access mask that specifies the access rights that have been granted.
;		: $iDesiredAccess	- An access mask that specifies the access rights that have been requested.
; Return values	: If all requested access rights have been granted, the return value is TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeAreAllAccessesGranted($iAccessMask, $iDesiredAccess)
	Return BitAnd($iAccessMask, $iDesiredAccess) = $iDesiredAccess
EndFunc	;==>_SeAreAllAccessesGranted

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeAreAnyAccessesGranted
; Description	: This function tests whether any of a set of requested access rights has been granted.
; Parameter(s)	: $iAccessMask	- An access mask that specifies the access rights that have been granted.
;		: $iDesiredAccess	- An acces mask that specifies the access rights that have been requested.
; Return values	: If any of the requested access rights have been granted, the return value is TRUE, otherwise FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeAreAnyAccessesGranted($iAccessMask, $iDesiredAccess)
	Return BitAnd($iAccessMask, $iDesiredAccess) <> 0
EndFunc	;==>_SeAreAnyAccessesGranted

Func _SeAddAccessAllowedAceEx($pDacl, $pSid, $iAccessMask, $iFlags, $iRevision = 2)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "AddAccessAllowedAceEx", "ptr", $pDacl, _
			"dword", $iRevision, "dword", $iFlags, "dword", $iAccessMask, "ptr", $pSid)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeAddAccessAllowedAceEx

Func _SeAddAccessDeniedAceEx($pDacl, $pSid, $iAccessMask, $iFlags, $iRevision = 2)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "AddAccessDeniedAceEx", "ptr", $pDacl, _
			"dword", $iRevision, "dword", $iFlags, "dword", $iAccessMask, "ptr", $pSid)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeAddAccessDeniedAceEx

Func _SeAddAuditAccessAceEx($pSacl, $pSid, $iAccessMask, $iFlags, _
			$iAuditFlags = $SE_AUDIT_ACCESS_FAILURE, $iRevision = 2)

	Local $iResult, $fSuccess, $fFailure

	If BitAnd($iAuditFlags, $SE_AUDIT_ACCESS_SUCCESS) Then $fSuccess = 1
	If BitAnd($iAuditFlags, $SE_AUDIT_ACCESS_FAILURE) Then $fFailure = 1

	$iResult = DllCall("AdvApi32.dll", "bool", "AddAuditAccessAceEx", "ptr", $pSacl, _
			"dword", $iRevision, "dword", $iFlags, "dword", $iAccessMask, _
			"ptr", $pSid, "bool", $fSuccess, "bool", $fFailure)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeAddAuditAccessAceEx

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeAddAce
; Description	: This function adds an Access Control Entry (ACE) to an Access Control List (ACL).
; Parameter(s)	: $pAcl	- A pointer to an existing ACL to where the ACE is added.
;		: $pAce	- A pointer to an ACE to be added.
;		: $iIndex	- Specifies the position in the ACL's list of ACEs at which to add new ACEs.
; Return values	: Returns TRUE if succeeds, or FALSE if fails.
; Author	: Pusofalse
; ============================================================================================================
Func _SeAddAce($pAcl, $pAce, $iIndex = -1, $iRevision = 2)
	Local $iResult, $iAceSize

	$iAceSize = _SeReadBytes($pAce + 2, "word", 2)

	$iResult = DllCall("AdvApi32.dll", "bool", "AddAce", "ptr", $pAcl, _
			"dword", $iRevision, "dword", $iIndex, "ptr", $pAce, _
			"dword", $iAceSize)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeAddAce

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeDeleteAce
; Description	: This function deletes an ACE from the specified ACL.
; Parameter(s)	: $pAcl	- A pointer to an ACL from which the ACE is deleted.
;		: $iIndex	- Zero-based index of the ACE to be deleted.
; Return values	: If succeeds, the function returns TRUE. Or FALSE otherwise.
; Author	: Pusofalse
; ============================================================================================================
Func _SeDeleteAce($pAcl, $iIndex)
	Local $iResult = DllCall("AdvApi32.dll", "bool", "DeleteAce", "ptr", $pAcl, "dword", $iIndex)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeDeleteAce

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeConvertSDToStringSD
; Description	: This function converts a security descriptor to a security descriptor in text format.
; Parameter(s)	: $pSecurDescr	- A pointer to a security descriptor.
;		: $iSecurInfo	- Security information requested.
; Return values	: If succeeds, the function returns a string contains the security information requested. If fails, the function returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeConvertSDToStringSD($pSecurDescr, $iSecurInfo = 4)
	Local $iResult, $sStringSD

	$iResult = DllCall("AdvApi32.dll", "bool", "ConvertSecurityDescriptorToStringSecurityDescriptor", _
			"ptr", $pSecurDescr, "dword", 1, "dword", $iSecurInfo, "ptr*", 0, "ulong*", 0)
	If ($iResult[0]) Then
		$sStringSD = _SeReadBytes($iResult[4], "str", $iResult[5])
		Return SetError(0, _SeLocalFree($iResult[4]), $sStringSD)
	Else
		Return SetError(_SeLastError(), 0, "")
	EndIf
EndFunc	;==>_SeConvertSDToStringSD

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeLocalFree
; Description	: Frees a memory buffer.
; Parameter(s)	: $pBuffer	- Base address of the buffer to be freed.
; Return values	: If succeeds, the return values is NULL, otherwise the input $pBuffer is returned.
; Author	: Pusofalse
; ============================================================================================================
Func _SeLocalFree($pBuffer)
	Local $iResult = DllCall("Kernel32.dll", "ptr", "LocalFree", "ptr", $pBuffer)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeLocalFree

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeConvertStringSDToSD
; Description	; Converts a security descriptor in text format to a binary security descriptor.
; Parameter(s)	: $sStringSD	- A security descriptor in text format.
; Return values	: If succeeds, the return values is a pointer to the security descriptor described by $sStringSD. If fails, the return value is NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeConvertStringSDToSD($sStringSD)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "ConvertStringSecurityDescriptorToSecurityDescriptor", _
			"str", $sStringSD, "dword", 1, "ptr*", 0, "ulong*", 0)
	Return SetError(_SeLastError(), $iResult[4], $iResult[3])
EndFunc	;==>_SeConvertStringSDToSD

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCheckTokenMembership
; Description	: This function determines whether a specified security identifier (SID) is enabled in an access token.
; Parameter(s)	: $pSid	- A pointer to a SID.
;		: $hToken	- A handle to an access token, if NULL, _SeCheckTokenMembership uses the impersonation token of the calling thread.
; Return values	: If the specified SID is enabled in specified access token, the function returns TRUE. If the fails, or the specified SID is not enabled in the access token, the function returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeCheckTokenMembership($pSid, $hToken = 0)
	Local $iResult

	If Not _SeIsValidSid($pSid) Then Return SetError(@error, 0, 0)

	$iResult = DllCall("AdvApi32.dll", "bool", "CheckTokenMembership", _
			"handle", $hToken, "ptr", $pSid, "bool*", 0)
	Return SetError(_SeLastError(), 0, $iResult[3])
EndFunc	;==>_SeCheckTokenMembership

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeAllocLUID
; Description	: This function allocates a locally unique Id.
; Parameter(s)	: None.
; Return values	: If succeeds, this function returns a LONGLONG, otherwise, returns zero.
; Author	: Pusofalse
; ============================================================================================================
Func _SeAllocLUID()
	Local $iResult = DllCall("AdvApi32.dll", "bool", "AllocateLocallyUniqueId", "int64*", 0)
	Return SetError(_SeLastError(), 0, $iResult[1])
EndFunc	;==>_SeAllocLUID

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeAllocGUID
; Description	: This function retrieves a globally unique Id.
; Parameter(s)	: $fPointer	- If TRUE, the function returns a pointer to the GUID, otherwise, returns a string.
; Return values	: If succeeds, the function returns a non-NULL value, depending on the value of $fPointer parameter.
; Author	: Pusofalse
; ============================================================================================================
Func _SeAllocGUID($fPointer = 1)
	Local $iResult, $pBuffer = _SeHeapAlloc(16)

	$iResult = DllCall("Ole32.dll", "int", "CoCreateGuid", "ptr", $pBuffer)

	If ($iResult[0]) Then
		If ($fPointer) Then
			Return SetError($iResult[0], _SeHeapFree($pBuffer), 0)
		Else
			Return SetError($iResult[0], _SeHeapFree($pBuffer), "")
		EndIf
	EndIf

	If ($fPointer) Then Return $pBuffer

	$iResult = DllCall("Ole32.dll", "int", "StringFromGUID2", "ptr", $pBuffer, "wstr", "", "int", 128)
	Return SetError(0, _SeHeapFree($pBuffer), $iResult[2])
EndFunc	;==>_SeAllocGUID

Func _SeAllocAndInitSid($iAuthorityId, $iAuth0, $iAuth1 = 0, $iAuth2 = 0, $iAuth3 = 0, _
		$iAuth4 = 0, $iAuth5 = 0, $iAuth6 = 0, $iAuth7 = 0)

	Local $pAuthority, $iResult

	$pAuthority = _SeHeapAlloc(6)
	_SeWriteBytes($pAuthority + 5, $iAuthorityId, "byte", 1)

	$iResult = DllCall("AdvApi32.dll", "bool", "AllocateAndInitializeSid", "ptr", $pAuthority, _
			"byte", @NumParams - 1, "dword", $iAuth0, "dword", $iAuth1, "dword", $iAuth2, _
			"dword", $iAuth3, "dword", $iAuth4, "dword", $iAuth5, "dword", $iAuth6, _
			"dword", $iAuth7, "ptr*", 0)

	Return SetError(_SeLastError(), _SeHeapFree($pAuthority), $iResult[11])
EndFunc	;==>_SeAllocAndInitSid

Func _SeGetWellKnownAccountSid($iWellKnown)
	Local $pSid

	Switch $iWellKnown
	Case $SE_WELLKNOWN_ADMIN, $SE_WELLKNOWN_GUEST
#CS
		Local $aUser, $aRid[2] = [500, 501]
		$aUser = _SeEnumLocalUsers($SE_FILTER_NORMAL_ACCOUNT)
		For $i = 1 To $aUser[0][0]
			If $aUser[$i][3] = $aRid[Abs($iWellKnown) - 1] Then
				$pSid = _SeLookupAccountName($aUser[$i][0])
				Return SetError(@error, 0, $pSid)
			EndIf
		Next
		Return 0
#CE

		Local $pDomainSid = _SeLookupAccountName(@ComputerName, @ComputerName)
		$pSid = _SeCreateWellKnownSid(37 + Abs($iWellKnown), $pDomainSid)
		SetError(@error, _SeHeapFree($pDomainSid))

	Case $SE_WELLKNOWN_POWER_USERS
		$pSid = _SeAllocAndInitSid(5, $SE_SECURITY_BUILTIN_DOMAIN_RID, $SE_DOMAIN_ALIAS_RID_POWER_USERS)
	Case $SE_WELLKNOWN_USERS
		$pSid = _SeAllocAndInitSid(5, $SE_SECURITY_BUILTIN_DOMAIN_RID, $SE_DOMAIN_ALIAS_RID_USERS)
	Case $SE_WELLKNOWN_ADMINS
		$pSid = _SeAllocAndInitSid(5, $SE_SECURITY_BUILTIN_DOMAIN_RID, $SE_DOMAIN_ALIAS_RID_ADMINS)
	Case $SE_WELLKNOWN_GUESTS
		$pSid = _SeAllocAndInitSid(5, $SE_SECURITY_BUILTIN_DOMAIN_RID, $SE_DOMAIN_ALIAS_RID_GUESTS)
	Case Else
		$pSid = _SeCreateWellKnownSid($iWellKnown)
	EndSwitch

	Return SetError(@error, 0, $pSid)
EndFunc	;==>_SeGetWellKnownAccountSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsUserAdmin
; Description	: Determines the current user whether is an administrator.
; Parameter(s)	: None.
; Return values	: If current user is an administrator, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsUserAdmin()
	Local $pAdminsSid, $fIsAdmin

	$pAdminsSid = _SeGetWellKnownAccountSid($SE_WELLKNOWN_ADMINS)
	$fIsAdmin = _SeCheckTokenMembership($pAdminsSid, 0)
	Return SetError(@error, _SeFreeSid($pAdminsSid), $fIsAdmin)
EndFunc	;==>_SeIsUserAdmin

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeFreeSid
; Description	: Frees the SID allocated by _SeAllocAndInitSid function.
; Parameter(s)	: $pInitSid	- A pointer to a SID returned by _SeAllocAndInitSid.
; Return values	: If succeeds, the function returns NULL. If fails, the function returns the inputed $pInitSid.
; Author	: Pusofalse
; ============================================================================================================
Func _SeFreeSid($pInitSid)
	Local $iResult = DllCall("AdvApi32.dll", "ptr", "FreeSid", "ptr", $pInitSid)
	Return $iResult[0]
EndFunc	;==>_SeFreeSid

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsUserAdminEx
; Description	: Determines the specified user account whether is an administrator.
; Parameter(s)	: $sUserName	- An optional name of the user account, default to current user.
; Return values	: TRUE is returned if the user is an administrator, or FALSE is returned is returned if the user is not an administrator.
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsUserAdminEx($sUserName = @UserName)
	Local $pDacl, $pSid, $iAccessRights
	Local $aAceList[1][4] = [[_SeGetWellKnownAccountSid($SE_WELLKNOWN_ADMINS), 1, $SE_GRANT_ACCESS]]

	$pSid = _SeLookupAccountName($sUserName)
	$pDacl = _SeSetEntriesInAcl($aAceList)

	$iAccessRights = _SeGetEffectiveRightsFromAcl($pDacl, $pSid)
	Return SetError(@error, _SeLocalFree($pDacl), _SeHeapFree($pSid) * 0 + $iAccessRights)
EndFunc	;==>_SeIsUserAdminEx

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetUserName
; Description	: Retrieves the user name of the calling thread.
; Parameter(s)	: None.
; Return values	: If succeeds, the function returns a string indicates the name of the user account associated with the current thread, in the form: DomainName\UserName or UserName. If fails, the function returns NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetUserName()
	Local $iResult, $sUserName, $sDomain, $sReturn

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaGetUserName", "ptr*", 0, "ptr*", 0)
	If ($iResult[0]) Then Return SetError(snts($iResult[0]), 0, "")

	$sUserName = _SeInitBufferW($iResult[1])
	$sDomain = _SeInitBufferW($iResult[2])

	_SeFreeMemory($iResult[1])
	_SeFreeMemory($iResult[2])

	If ($sDomain) Then
		If $sUserName Then
			$sReturn = $sDomain & "\" & $sUserName
		Else
			$sReturn = $sDomain
		EndIf
	Else
		If $sUserName Then
			$sReturn = $sUserName
		EndIf
	EndIf
	Return $sReturn
EndFunc	;==>_SeGetUserName

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetEffectiveRightsFromAcl
; Description	: This function retrieves the effective access rights that an ACL structure grants to a specified trustee.
; Parameter(s)	: $pDacl	- A pointer to a DACL from which to get the trustee's effective access rights.
;		: $pSid	- A pointer to a SID indicates the trustee.
; Return values	: Effective access rights of the trustee is returned if succeeds. If fails, @error is set to a system error code.
; Author	: Pusofalse
; Remarks	: This function does not handle the validity of the SID, call _SeIsValidSid function before calling this function.
; ============================================================================================================
Func _SeGetEffectiveRightsFromAcl($pDacl, $pSid)
#CS
	If Not _SeIsValidSid($pSid) Then
		Return SetError(@error, 0, 0)
	EndIf
#CE
	Local $tBuffer, $pBuffer, $iResult

	$tBuffer = DllStructCreate($tagSE_TRUSTEE)
	$pBuffer = DllStructGetPtr($tBuffer)
	DllStructSetData($tBuffer, "Name", $pSid)
	DllStructSetData($tBuffer, "TruesteeFrom", $SE_TRUSTEE_IS_SID)

	$iResult = DllCall("AdvApi32.dll", "dword", "GetEffectiveRightsFromAcl", _
			"ptr", $pDacl, "ptr", $pBuffer, "dword*", 0)
	Return SetError($iResult[0], 0, $iResult[3])
EndFunc	;==>_SeGetEffectiveRightsFromAcl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetNamedAccessRights
; Description	: This function retrieves the access rights that a named object grants to the specified user account.
; Parameter(s)	: $sObject	- Name of the securable object.
;		: $iObjType	- Type of the securable object.
;		: $sUserName	- Name of the user account for which to determine the access rights.
; Return values	: If succeeds, the function returns the access rights of the specified user account. If fails, returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetNamedAccessRights($sObject, $iObjType, $sUserName = @UserName)
	Local $aSecur, $pSid, $iAccessRights

	$aSecur = _SeGetNamedSecurityInfo($sObject, $iObjType, $SE_INFO_DACL)
	If @error Then Return SetError(@error, 0, 0)

	$pSid = _SeLookupAccountName($sUserName)
	If ($pSid = 0) Then Return SetError(@error, 0, 0)

	$iAccessRights = _SeGetEffectiveRightsFromAcl($aSecur[6], $pSid)
	Return SetError(@error, _SeHeapFree($pSid), $iAccessRights)
EndFunc	;==>_SeGetNamedAccessRights

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetInheritanceSource
; Description	: This function returns the source of inherited access control entries (ACEs) in an access control list (ACL).
; Parameter(s)	: $sObject	- Path name of the object. Must specify a FULL PATH.
;		: $iObjType	- Type of the object, can be $SE_REGISTRY_KEY or $SE_FILE_OBJECT.
;		: $pAcl	- A pointer to an access control list (ACL).
;		: $fExplicit	- If TRUE, the function also returns the source of an explicit ACE, which the source is empty.
;		: $iSecurInfo	-  Specify the type of the ACL, default as a DACL.
; Return values	: An Array in the following format:
;		:	$aArray[0][0]	- The number of entries returned.
;		:	$aArray[1][0]	- The first, Number of levels, or generations, between the object and the ancestor. Set this to zero for an explicit ACE. If the ancestor cannot be determined for the inherited ACE, set this member to ¨C1.
;		:	$aArray[1][1]	- The first, Name of the ancestor from which the ACE was inherited. For an explicit ACE, set this to NULL.
;		:	$aArray[2][0]	- The second, same to above.
;		:	$aArray[2][1]	- Same to above.
;		: If the function fails, the value of $aArray[0][0] is set to zero, and @error is set to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetInheritanceSource($sObject, $iObjType, $pAcl, $fExplicit = 0, $iSecurInfo = 4)
	Local $iContainer, $tGenericMapping, $pGenericMapping, $pInherit
	Local $iNumInherit, $iResult, $iGenerationGap, $pAncestor, $aResult[1][2] = [[0]]

	Local Const $KEY_READ = 0x20019
	Local Const $KEY_WRITE = 0x20006
	Local Const $KEY_EXECUTE = $KEY_READ
	Local Const $KEY_ALL_ACCESS = 0xF003F

	Local Const $FILE_READ = 0x120089
	Local Const $FILE_WRITE = 0x120116
	Local Const $FILE_EXECUTE = 0x1200A0
	Local Const $FILE_ALL_ACCESS = 0x1F01FF

	$tGenericMapping = DllStructCreate($tagSE_GENERIC_MAPPING)
	$pGenericMapping = DllStructGetPtr($tGenericMapping)

	Switch $iObjType
	Case $SE_FILE_OBJECT
		$iResult = DllCall("Kernel32.dll", "dword", "GetFullPathName", "str", $sObject, _
				"dword", 520, "str", "", "ptr", 0)
		$sObject = $iResult[3]

		If FileExists($sObject & "\") Then $iContainer = 4
		If $fExplicit Then
			DllStructSetData($tGenericMapping, "GenericRead", $FILE_READ)
			DllStructSetData($tGenericMapping, "GenericWrite", $FILE_WRITE)
			DllStructSetData($tGenericMapping, "GenericExecute", $FILE_EXECUTE)
			DllStructSetData($tGenericMapping, "GenericAll", $FILE_ALL_ACCESS)
		EndIf
	Case $SE_REGISTRY_KEY
		$iContainer = 1
		If $fExplicit Then
			DllStructSetData($tGenericMapping, "GenericRead", $KEY_READ)
			DllStructSetData($tGenericMapping, "GenericWrite", $KEY_WRITE)
			DllStructSetData($tGenericMapping, "GenericExecute", $KEY_EXECUTE)
			DllStructSetData($tGenericMapping, "GenericAll", $KEY_ALL_ACCESS)
		EndIf
	Case Else
		Return SetError(87, 0, $aResult)
	EndSwitch

	$pInherit = _SeHeapAlloc(8192)
	_SeFillMemory($pInherit, 8192, -2)

	$iResult = DllCall("AdvApi32.dll", "dword", "GetInheritanceSourceW", "wstr", $sObject, _
			"long", $iObjType, "long", $iSecurInfo, "int", $iContainer, _
			"ptr", 0, "dword", 0, "ptr", $pAcl, "ptr", 0, "ptr", $pGenericMapping, _
			"ptr", $pInherit)
	If @error Then
		Return SetError(1, _SeHeapFree($pInherit) * 0, $aResult)
	EndIf

	If ($iResult[0]) Then
		Return SetError($iResult[0], _SeHeapFree($pInherit) * 0, $aResult)
	EndIf

	For $i = 0 To 4095
		$iGenerationGap = _SeReadBytes($pInherit + ($i * 8), "long")
		If ($iGenerationGap < -1) Then ExitLoop

		$iNumInherit += 1
		If ($iGenerationGap = -1) And (Not $fExplicit) Then ContinueLoop

		$pAncestor = _SeReadBytes($pInherit + 4 + ($i * 8), "ptr")

		$aResult[0][0] += 1
		Redim $aResult[$aResult[0][0] + 1][2]

		$aResult[$aResult[0][0]][0] = $iGenerationGap
		$aResult[$aResult[0][0]][1] = _SeReadBytes($pAncestor, "wstr", 1024)
	Next

	DllCall("AdvApi32.dll", "dword", "FreeInheritedFromArray", "ptr", $pInherit, _
		"dword", $iNumInherit , "ptr", 0)

	Return SetError(0, _SeHeapFree($pInherit), $aResult)
EndFunc	;==>_SeGetInheritanceSource

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetFileInheritSecurity
; Description	: This function sets the DACL security information for a file or directory object, using the inheritable ACEs defined by the parent object, and explicit ACEs by itself.
; Parameter(s)	: $sFilePath	- Full path of the file or directory object.
;		: $fKeepExplicit	- TRUE indicates the object should keep the existing explicit ACEs.
;		: $pNewExplicit	- A pointer to ACL defines the new explicit ACE assigned to the object.
; Return values	: If success, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetFileInheritSecurity($sFilePath, $fKeepExplicit = 1, $pNewExplicit = 0)
	Local $aSecur, $sParent, $pSecur, $pDacl, $tAccessEntry, $iFlags, $iInherit, $iInheritType

	If ($pNewExplicit) And (Not _SeIsValidAcl($pNewExplicit)) Then Return SetError(@error, 0, 0)
	If (Not FileExists($sFilePath)) Then Return SetError(2, 0, 0)

	$sFilePath = DllCall("Kernel32.dll", "dword", "GetFullPathName", "str", $sFilePath, _
			"dword", 512, "str", "", "ptr", 0)
	$sFilePath = $sFilePath[3]

	$sParent = StringRegExpReplace($sFilePath, "(.+)\\([^\\]+)$", "\1")
	$aSecur = _SeGetNamedSecurityInfo($sParent, $SE_FILE_OBJECT, $SE_INFO_DACL)
	If @error Then Return SetError(@error, 0, 0)

	$pDacl = _SeDuplicateAcl($aSecur[6], 1, 1024)

	If FileExists($sFilePath & "\") Then
		$iInheritType = $SE_CONTAINER_INHERIT_ACE
	Else
		$iInheritType = $SE_OBJECT_INHERIT_ACE
	EndIf

	For $i = _SeGetAclInformation($pDacl, $SE_ACL_INFO_ACE_COUNT) - 1 To 0 Step - 1

		$tAccessEntry = DllStructCreate($tagSE_ACCESS_ACE, _SeGetAce($pDacl, $i))
		$iFlags = DllStructGetData($tAccessEntry, "AceFlags")
		$iInherit = _SeIsEntryInheritable($iFlags, $iInheritType)

		If $iInherit Then
			DllStructSetData($tAccessEntry, "AceFlags", $iInherit)
		Else
			_SeDeleteAce($pDacl, $i)
		EndIf
		$tAccessEntry = 0
	Next

	If $fKeepExplicit Then
		$aSecur = _SeGetNamedSecurityInfo($sFilePath, $SE_FILE_OBJECT, $SE_INFO_DACL)

		For $i = _SeGetAclInformation($aSecur[6], $SE_ACL_INFO_ACE_COUNT) - 1 To 0 Step - 1
			$tAccessEntry = DllStructCreate($tagSE_ACCESS_ACE, _SeGetAce($aSecur[6], $i))
			If DllStructGetData($tAccessEntry, "AceFlags") < $SE_INHERIT_NO_PROPAGATE Then
				_SeAddAce($pDacl, _SeGetAce($aSecur[6], $i), 0)
			EndIf
			$tAccessEntry = 0
		Next
	EndIf

	If $pNewExplicit Then
		For $i = _SeGetAclInformation($pNewExplicit, $SE_ACL_INFO_ACE_COUNT) - 1 To 0 Step - 1
			_SeAddAce($pDacl, _SeGetAce($pNewExplicit, $i), 0)
		Next
	EndIf

	If Not _SeIsValidAcl($pDacl) Then Return SetError(@error, 0, 0)

	$pSecur = _SeInitSecurityDescriptor()
	_SeSetSecurityDescriptorDacl($pSecur, $pDacl)

	$iFlags = _SeSetFileSecurity($sFilePath, $SE_INFO_DACL, $pSecur)
	Return SetError(@error, _SeHeapFree($pSecur) * _SeHeapFree($pDacl), $iFlags)
EndFunc	;==>_SeSetFileInheritSecurity

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeIsEntryInheritable
; Description	: This function determines whether an ACE can be inherited by the sub-object.
; Parameter(s)	: $iFlags	- A set of bit flags indicates ACE attributes, typically returned from SE_ACCESS_ACE.AceFlags.
;		: $iInheritType	- Specifies the type of the sub-object, can be $SE_OBJECT_INHERIT_ACE or $SE_CONTAINER_INHERIT_ACE.
; Return values	: If the ACE can be inherited by the sub-object, the function returns the new flags for the ACE which will be inherited by the sub-object. If the ACE can not be inherited by the sub-object, the function returns zero.
; Author	: Pusofalse
; ============================================================================================================
Func _SeIsEntryInheritable($iFlags, $iInheritType)
	If ($iFlags = $SE_INHERITED_ACE) Then Return $iFlags

	Local $fInherited, $fInheritOnly, $iInherit

	$iInherit = BitAnd($iFlags, $iInheritType)
	$fInherited = BitAnd($iFlags, $SE_INHERITED_ACE)
	$fInheritOnly = BitAnd($iFlags, $SE_INHERIT_ONLY_ACE)

	If ($iInheritType = $SE_OBJECT_INHERIT_ACE) Then
		If Not $fInherited And $iInherit Then
			Return $SE_INHERITED_ACE
		EndIf
		If Not $fInheritOnly And $iInherit Then
			Return $SE_INHERITED_ACE
		EndIf
		If Not $iInherit And $fInherited Then
			Return $SE_INHERITED_ACE
		EndIf
	Else
		If $fInherited And $iInherit Then
			Return BitOR($SE_INHERITED_ACE, $iFlags)
		EndIf
		If Not $fInherited And Not $fInheritOnly And Not $iInherit And ($iFlags) Then
			Return BitOR($SE_INHERITED_ACE, $SE_INHERIT_ONLY_ACE, $SE_OBJECT_INHERIT_ACE)
		EndIf
		If Not $fInherited And $fInheritOnly And Not $iInherit And ($iFlags) Then
			Return BitOR($SE_INHERITED_ACE, $SE_INHERIT_ONLY_ACE, $SE_OBJECT_INHERIT_ACE)
		EndIf
		If Not $fInherited And $fInheritOnly And $iInherit Then
			Return BitOR($SE_INHERITED_ACE, BitAnd($iFlags, 3))
		EndIf
		If Not $fInherited And Not $fInheritOnly And $iInherit Then
			Return BitOR($SE_INHERITED_ACE, BitAnd($iFlags, 3))
		EndIf
	EndIf
EndFunc	;==>_SeIsEntryInheritable

Func _SeEnumInheritedEntriesFromAcl($pAcl, $fInherited = 1)
	Local $aList, $aResult[1][6] = [[0]]

	$aList = _SeEnumEntriesFromAcl($pAcl)
	If (@error) Then Return SetError(@error, 0, $aResult)

	For $i = 1 To $aList[0][0]
		If ($fInherited) Then
			If ($aList[$i][5] <> $SE_INHERITED_ACE) Then ContinueLoop
		Else
			If ($aList[$i][5] == $SE_INHERITED_ACE) Then ContinueLoop
		EndIf

		$aResult[0][0] += 1
		Redim $aResult[$aResult[0][0] + 1][6]

		$aResult[$aResult[0][0]][0] = $aList[$i][0]
		$aResult[$aResult[0][0]][1] = $aList[$i][1]
		$aResult[$aResult[0][0]][2] = $aList[$i][2]
		$aResult[$aResult[0][0]][3] = $aList[$i][3]
		$aResult[$aResult[0][0]][4] = $aList[$i][4]
		$aResult[$aResult[0][0]][5] = $aList[$i][5]
	Next
	Return $aResult
EndFunc	;==>_SeEnumInheritedEntriesFromAcl

Func _SeGetNamedSecurityInfo($sObject, $iObjType, $iSecurInfo)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "dword", "GetNamedSecurityInfo", "str", $sObject, _
			"long", $iObjType, "long", $iSecurInfo, "ptr*", 0, "ptr*", 0, _
			"ptr*", 0, "ptr*", 0, "ptr*", 0)
	Return SetError($iResult[0], 0, $iResult)
EndFunc	;==>_SeGetNamedSecurityInfo

Func _SeFillMemory($pBuffer, $iLength, $uByte = 0)
	DllCall("Ntdll.dll", "none", "RtlFillMemory", "ptr", $pBuffer, "dword", $iLength, "ubyte", $uByte)
EndFunc	;==>_SeFillMemory

Func _SeGetSecurityDescriptorGroup($pSecurDescr)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "GetSecurityDescriptorGroup", _
			"ptr", $pSecurDescr, "ptr*", 0, "bool*", 0)
	Return SetError(_SeLastError(), $iResult[3], $iResult[2])
EndFunc	;==>_SeGetSecurityDescriptorGroup

Func _SeSetSecurityDescriptorGroup($pSecurDescr, $pGroup, $fDefaulted = 0)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "SetSecurityDescriptorGroup", _
			"ptr", $pSecurDescr, "ptr", $pGroup, "bool", $fDefaulted)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSetSecurityDescriptorGroup

Func _SeSetSecurityDescriptorSacl($pSecurDescr, $pSacl, $fDefaulted = 0)
	Local $fPresent = 1, $iResult

	If ($pSacl = -1) Then $fPresent = 0
	$iResult = DllCall("AdvApi32.dll", "bool", "SetSecurityDescriptorSacl", "ptr", $pSecurDescr, _
			"bool", $fPresent, "ptr", $pSacl, "bool", $fDefaulted)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSetSecurityDescriptorSacl

Func _SeSetSecurityDescriptorControl($pSecurDescr, $iControlFlags, $fEnable = 1)
	Local $iResult

	If $fEnable Then $fEnable = $iControlFlags

	$iResult = DllCall("AdvApi32.dll", "bool", "SetSecurityDescriptorControl", _
			"ptr", $pSecurDescr, "dword", $iControlFlags, "dword", $fEnable)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSetSecurityDescriptorControl

Func _SeOpenService($sService, $iSecurInfo, $fQuery = 1)
	Local $sSystem, $aService, $hSC, $iResult, $iDesiredAccess, $iError

	$aService = StringSplit($sService, "\")

	Switch $aService[0]
	Case 1
		$sService = $aService[1]
	Case 2
		$sSystem = $aService[1]
		$sService = $aService[2]
	Case Else
		Return SetError(87, 0, 0)
	EndSwitch

	$iDesiredAccess = _SeConvertDesiredAccess($iSecurInfo, $fQuery)

	$hSC = DllCall("AdvApi32.dll", "ptr", "OpenSCManager", "str", $sSystem, "ptr", 0, "dword", 1)
	If $hSC[0] = 0 Then Return SetError(_SeLastError(), 0, 0)

	$iResult = DllCall("AdvApi32.dll", "ptr", "OpenService", "ptr", $hSC[0], _
			"str", $sService, "dword", $iDesiredAccess)

	$iError = _SeLastError()
	DllCall("AdvApi32.dll", "bool", "CloseServiceHandle", $hSC[0])

	If ($iResult[0]) Then
		Return SetError(0, 0, $iResult[0])
	Else
		Return SetError($iError, 0, 0)
	EndIf
EndFunc	;==>_SeOpenService

Func _SeGetServiceSecurity($sService, $iSecurInfo)
	Local $hService, $pBuffer, $iResult, $iError

	$hService = _SeOpenService($sService, $iSecurInfo, 1)
	If ($hService = 0) Then Return SetError(@error, 0, 0)

	$pBuffer = _SeInitSecurityDescriptor(1024)
	$iResult = DllCall("AdvApi32.dll", "bool", "QueryServiceObjectSecurity", "ptr", $hService, _
			"dword", $iSecurInfo, "ptr", $pBuffer, "dword", 1024, "dword*", 0)
	$iError = _SeLastError()
	DllCall("AdvApi32.dll", "bool", "CloseServiceHandle", "ptr", $hService)

	If ($iResult[0]) Then
		Return $pBuffer
	Else
		Return SetError($iError, _SeHeapFree($pBuffer), 0)
	EndIf
EndFunc	;==>_SeGetServiceSecurity

Func _SeSetServiceSecurity($sService, $iSecurInfo, $pSecurDescr)
	Local $hService, $iResult, $iError

	$hService = _SeOpenService($sService, $iSecurInfo, 0)
	If ($hService = 0) Then Return SetError(@error, 0, 0)

	$iResult = DllCall("AdvApi32.dll", "bool", "SetServiceObjectSecurity", _
			"ptr", $hService, "int", $iSecurInfo, "ptr", $pSecurDescr)
	$iError = _SeLastError()
	DllCall("AdvApi32.dll", "bool", "CloseServiceHandle", "ptr", $hService)

	Return SetError($iError, 0, $iResult[0])
EndFunc	;==>_SeSetServiceSecurity

Func _SeCreateServiceSid($sServiceName)
	Local $iResult, $pService, $pSid = _SeHeapAlloc($SE_MAX_SID_SIZE)

	$pService = _SeInitBufferW($sServiceName)

	$iResult = DllCall("Ntdll.dll", "dword", "RtlCreateServiceSid", "ptr", $pService, _
			"ptr", $pSid, "dword*", $SE_MAX_SID_SIZE)

	_SeHeapFree($pService)
	If ($iResult[0]) Then
		Return SetError(snts($iResult[0]), _SeHeapFree($pSid), 0)
	Else
		Return $pSid
	EndIf
EndFunc	;==>_SeCreateServiceSid

Func _SeGetSecurityInfo($hObject, $iObjType, $iSecurInfo = $SE_INFO_DACL)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "dword", "GetSecurityInfo", "handle", $hObject, _
			"long", $iObjType, "long", $iSecurInfo, "ptr*", 0, "ptr*", 0, _
			"ptr*", 0, "ptr*", 0, "ptr*", 0)
	Return SetError($iResult[0], 0, $iResult)
EndFunc	;==>_SeGetSecurityInfo

Func _SeSetSecurityInfo($hObject, $iObjType, $iSecurInfo, $pOwner, $pGroup, $pDacl, $pSacl = 0)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "dword", "SetSecurityInfo", "handle", $hObject, _
			"long", $iObjType, "long", $iSecurInfo, "ptr", $pOwner, "ptr", $pGroup, _
			"ptr", $pDacl, "ptr", $pSacl)

	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_SeSetSecurityInfo

Func _SeImpersonateContext($iProcessId)
	$iProcessId = ProcessExists($iProcessId)
	If Not $iProcessId Then Return SetError(2, 0, 0)

	Local $iResult, $pBuffer, $iOffset, $iThreadId, $hThread

	$iResult = DllCall("Ntdll.dll", "long", "NtQuerySystemInformation", "long", 5, "ptr", 0, "long", 0, "long*", 0)
	If $iResult[4] < 1 Then Return SetError(snts($iResult[0]), 0, 0)

	$pBuffer = _SeHeapAlloc($iResult[4])
	$iResult = DllCall("Ntdll.dll", "long", "NtQuerySystemInformation", "long", 5, _
			"ptr", $pBuffer, "long", $iResult[4], "long*", 0)

	If $iResult[0] Then Return SetError(snts($iResult[0]), _SeHeapFree($pBuffer), 0)

	While 1
		$iOffset = _SeReadBytes($pBuffer)
		If ($iOffset = 0) Then
			ExitLoop
		Else
			If _SeReadBytes($pBuffer + 68, "long") = $iProcessId Then
				$iThreadId = _SeReadBytes($pBuffer + 0xDC)
				ExitLoop
			Else
				$pBuffer += $iOffset
			EndIf
		EndIf
	WEnd
	_SeHeapFree($iResult[2])
	If Not $iThreadId Then Return SetError(2, 0, 0)

	$hThread = _SeOpenThread($iThreadId, $SE_THREAD_DIRECT_IMPERSONATION, 0)
	If Not $hThread Then Return SetError(@error, 0, 0)

	$iResult = _SeImpersonateThread(-2, $hThread, _SeInitSecurityQos())
	Return SetError(@error, _SeCloseHandle($hThread), $iResult)
EndFunc	;==>_SeImpersonateContext

Func _SeImpersonateSystemContext($iSystem = Default)
	If ($iSystem = Default) Then $iSystem = ProcessExists(4)
	If ($iSystem = 0) Then Return SetError(2, 0, 0)

	Local $aOrigSecur, $pNewDacl, $hToken
	Local $aPriv[2][2] = [[$SE_DEBUG_PRIV, $SE_PRIV_ENABLED], [$SE_RESTORE_PRIV, $SE_PRIV_ENABLED]]
	Local $aList[1][4] = [[_SeLookupAccountName(@UserName), 0xF01FF, $SE_GRANT_ACCESS, $SE_NO_INHERITANCE]]

	$hToken = _SeOpenProcessToken(-1)
	_SeAdjustTokenPrivs($hToken, $aPriv)
	_SeCloseHandle($hToken)

	$hToken = _SeOpenProcessToken($iSystem, BitOR($SE_READ_CONTROL, $SE_WRITE_DAC))
	If ($hToken < 1) Then Return SetError(@error, 0, 0)

	$aOrigSecur = _SeGetSecurityInfo($hToken, $SE_KERNEL_OBJECT, $SE_INFO_DACL)
	If (@error) Then Return SetError(@error, _SeCloseHandle($hToken), 0)

	$pNewDacl = _SeSetEntriesInAcl($aList)
	If ($pNewDacl = 0) Then Return SetError(@error, _SeCloseHandle($hToken), 0)

	If Not _SeSetSecurityInfo($hToken, $SE_KERNEL_OBJECT, $SE_INFO_DACL, 0, 0, $pNewDacl, 0) Then
		Return SetError(@error, _SeCloseHandle($hToken), _SeLocalFree($pNewDacl) * 0)
	EndIf

	_SeCloseHandle($hToken)
	_SeLocalFree($pNewDacl)

	$hToken = _SeOpenProcessToken($iSystem, $SE_TOKEN_ALL_ACCESS)
	If ($hToken < 1) Then Return SetError(@error, 0, 0)

	If Not _SeImpersonateLoggedOnUser($hToken) Then Return SetError(@error, 0, 0)

	_SeSetSecurityInfo($hToken, $SE_KERNEL_OBJECT, $SE_INFO_DACL, 0, 0, $aOrigSecur[6], 0)
	Return SetError(@error, _SeHeapFree($aList[0][0]), $hToken)
EndFunc	;==>_SeImpersonateSystemContext

Func _SeCreateUserProcess($hToken, $sApplication = "", $sCommandLine = "", $pProcessAttrib = 0, _
		$pThreadAttrib = 0, $fInherit = 0, $iFlags = Default, $pEnvironment = 0, _
		$sCurrentDir = @WorkingDir, $pStartupInfo = Default)

	If $pStartupInfo = Default Then
		Local $tBuffer = DllStructCreate($tagSE_STARTUP_INFO)
		DllStructSetData($tBuffer, "Flags", 4)
		DllStructSetData($tBuffer, "Length", DllStructGetSize($tBuffer))

		$pStartupInfo = DllStructGetPtr($tBuffer)
	EndIf

	If $iFlags = Default Then $iFlags = 0x20 ; NORMAL_PRIORITY
	If ($sCommandLine) And ($sApplication) Then $sCommandLine = " " & $sCommandLine

	Local $tProcessInfo, $iResult, $tApplication, $tCommandLine, $tCurrentDir
	$tProcessInfo = DllStructCreate($tagSE_PROCESS_INFO)

	If ($sApplication) Then
		$tApplication = DllStructCreate("wchar AppPath[" & StringLen($sApplication) + 1 & "]")
		DllStructSetData($tApplication, "AppPath", $sApplication)
	EndIf
	If ($sCommandLine) Then
		$tCommandLine = DllStructCreate("wchar CmdLine[" & StringLen($sCommandLine) + 1 & "]")
		DllStructSetData($tCommandLine, "CmdLine", $sCommandLine)
	EndIf

	If ($sCurrentDir) Then
		$tCurrentDir = DllStructCreate("wchar CurrentDir[" & StringLen($sCurrentDir) + 1 & "]")
		DllStructSetData($tCurrentDir, "CurrentDir", $sCurrentDir)
	EndIf

	$iResult = DllCall("AdvApi32.dll", "bool", "CreateProcessAsUserW", _
			"handle", $hToken, _
			"ptr", DllStructGetPtr($tApplication), _
			"ptr", DllStructGetPtr($tCommandLine), _
			"ptr", $pProcessAttrib, _
			"ptr", $pThreadAttrib, _
			"bool", $fInherit, _
			"dword", $iFlags, _
			"ptr", $pEnvironment, _
			"ptr", DllStructGetPtr($tCurrentDir), _
			"ptr", $pStartupInfo, _
			"ptr", DllStructGetPtr($tProcessInfo))

	If ($iResult[0] = 0) Then $tProcessInfo = 0
	If ($tCurrentDir) Then $tCurrentDir = 0
	If ($tApplication) Then $tApplication = 0
	If ($tCommandLine) Then $tCommandLine = 0

	Return SetError(_SeLastError(), 0, $tProcessInfo)
EndFunc	;==>_SeCreateUserProcess

Func _SeCreateSystemProcess($sCommandLine, $pProcessAttrib = 0, $pThreadAttrib = 0, _
		$fInherit = 0, $iFlags = Default, $pEnvironment = 0, $sCurrentDir = @WorkingDir, _
		$pStartupInfo = Default)

	Local $hToken, $tProcessInfo, $iError

	$hToken = _SeImpersonateSystemContext()
	If ($hToken < 1) Then Return SetError(@error, 0, 0)

	$tProcessInfo = _SeCreateUserProcess($hToken, "", $sCommandLine, $pProcessAttrib, _
			$pThreadAttrib, $fInherit, $iFlags, $pEnvironment, $sCurrentDir, $pStartupInfo)
	$iError = @error

	_SeCloseHandle($hToken)
	Return SetError($iError, _SeRevertToSelf(), $tProcessInfo)
EndFunc	;==>_SeCreateSystemProcess

Func _SeCreateLogonProcess($sUserName, $sPassword, $sCommandLine, $iLogonFlags = $SE_LOGON_DEFAULT, _
		$iCreationFlags = Default, $pEnvironment = 0, $sCurrentDir = @WorkingDir, $pStartupInfo = 0)

	Local $sDomain, $tCommandLine, $tCurrentDir, $tProcessInfo, $tStatupInfo, $iResult

	If ($pStartupInfo = 0) Then
		$tStartupInfo = DllStructCreate($tagSE_STARTUP_INFO)
		$pStartupInfo = DllStructGetPtr($tStartupInfo)
		DllStructSetData($tStartupInfo, "Flags", 4)
		DllStructSetData($tStartupInfo, "Length", DllStructGetSize($tStartupInfo))

	EndIf

	$tCommandLine = DllStructCreate("wchar CommandLine[" & StringLen($sCommandLine) + 1 & "]")
	DllStructSetData($tCommandLine, "CommandLine", $sCommandLine)

	$tCurrentDir = DllStructCreate("wchar CurrentDir[" & StringLen($sCurrentDir) + 1 & "]")
	DllStructSetData($tCurrentDir, "CurrentDir", $sCurrentDir)

	$tProcessInfo = DllStructCreate($tagSE_PROCESS_INFO)
	If ($iCreationFlags = Default) Then $iCreationFlags = 0x20 ; NORMAL_PRIORITY

	If StringInStr($sUserName, "@") Then
		$sDomain = StringRegExpReplace($sUserName, "(.+)@(.+)", "\2")
		$sUserName = StringRegExpReplace($sUserName, "(.+)@(.+)", "\1")
	EndIf

	$iResult = DllCall("AdvApi32.dll", "bool", "CreateProcessWithLogonW", _
			"wstr", $sUserName, _
			"wstr", $sDomain, _
			"wstr", $sPassword, _
			"dword", $iLogonFlags, _
			"ptr", 0, _
			"ptr", DllStructGetPtr($tCommandLine), _
			"dword", $iCreationFlags, _
			"ptr", $pEnvironment, _
			"ptr", DllStructGetPtr($tCurrentDir), _
			"ptr", $pStartupInfo, _
			"ptr", DllStructGetPtr($tProcessInfo))

	If ($iResult[0] = 0) Then $tProcessInfo = 0
	Return SetError(_SeLastError(), 0, $tProcessInfo)
EndFunc	;==>_SeCreateLogonProcess

Func _SeCreateUserProcessEx($hToken, $sCommandLine, $iParentPid = @AutoItPid, _
		$pProcessAttrib = 0, $pThreadAttrib = 0, $fInherit = 0, $iFlags = Default, _
		$pEnvironment = 0, $sCurrentDir = @WorkingDir, $pStartupInfo = Default)

	Local $hParentProcess, $pVerifySys, $hTrackParams, $pNtCreateProcessEx, $tProcessInfo, $iError

	$hParentProcess = _SeOpenProcess($iParentPid, 0x80) ; PROCESS_CREATE_PROCESS
	If ($hParentProcess = 0) Then Return SetError(@error, 0, 0)

	$pNtCreateProcessEx = __SeGetProcAddress("Ntdll.dll", "NtCreateProcessEx")
	$hTrackParams = DllCallBackRegister("__SeCreateProcessEx", "long", "ptr;dword;ptr;handle;bool;handle;handle;handle;handle")

	$pVerifySys = _SeVerifySystemCall($pNtCreateProcessEx, DllCallBackGetPtr($hTrackParams))

	__SeCreateProcessEx(0, 0, 0, $hParentProcess, 0, $pVerifySys, 0, 0, 0)

	$tProcessInfo = _SeCreateUserProcess($hToken, "", $sCommandLine, $pProcessAttrib, _
				$pThreadAttrib, $fInherit, $iFlags, $pEnvironment, _
				$sCurrentDir, $pStartupInfo)
	$iError = @error

	_SeCloseHandle($hParentProcess)
	DllCallBackFree($hTrackParams)

	Return SetError($iError, 0, $tProcessInfo)
EndFunc	;==>_SeCreateUserProcessEx

Func __SeCreateProcessEx($pProcessHandle, $iDesiredAccess, $pObjAttrib, $hInheritFrom, $fInherit, $hSection, _
		$hDebugPort, $hExceptionPort, $hUnknown)

	Local Static $hParentProcess, $pVerifySys

	If ($pProcessHandle = 0) Then
		$hParentProcess = $hInheritFrom
		$pVerifySys = $hSection
	Else
		Local $iResult

		_SeCompleteVerifySystemCall($pVerifySys)
		$iResult = DllCall("Ntdll.dll", "long", "NtCreateProcessEx", "ptr", $pProcessHandle, _
				"dword", $iDesiredAccess, "ptr", $pObjAttrib, "handle", $hParentProcess, _
				"bool", $fInherit, "handle", $hSection, "handle", $hDebugPort, _
				"handle", $hExceptionPort, "handle", $hUnknown)

		Return $iResult[0]
	EndIf
EndFunc	;==>__SeCreateProcessEx

Func _SeProtectMemory($pBuffer, $iSizeofBuffer, $iFlags = $SE_ENCRYPT_SAME_PROCESS)
	If BitAND($iSizeofBuffer, 15) Then Return SetError(87, 0, False)

	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "dword", "SystemFunction040", "ptr", $pBuffer, _
			"dword", $iSizeofBuffer, "dword", $iFlags)

	If (@error) Then
		Return SetError(1, 0, False)
	Else
		Return SetError(snts($iResult[0]), 0, $iResult[0] = 0)
	EndIf
EndFunc	;==>_SeProtectMemory

Func _SeUnprotectMemory($pBuffer, $iSizeofBuffer, $iFlags = $SE_ENCRYPT_SAME_PROCESS)
	If BitAND($iSizeofBuffer, 15) Then Return SetError(87, 0, False)

	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "dword", "SystemFunction041", "ptr", $pBuffer, _
			"dword", $iSizeofBuffer, "dword", $iFlags)

	If (@error) Then
		Return SetError(1, 0, False)
	Else
		Return SetError(snts($iResult[0]), 0, $iResult[0] = 0)
	EndIf
EndFunc	;==>_SeUnprotectMemory

Func _SeEnumExplicitEntriesFromAcl($pAcl)
	Local $iResult, $tBuffer, $aResult[1][5] = [[0]]

	$iResult = DllCall("AdvApi32.dll", "dword", "GetExplicitEntriesFromAcl", _
			"ptr", $pAcl, "ulong*", 0, "ptr*", 0)

	If ($iResult[0]) Then Return SetError($iResult[0], 0, $aResult)

	$aResult[0][0] = $iResult[2]
	Redim $aResult[$iResult[2] + 1][5]

	For $i = 1 To $iResult[2]
		$tBuffer = DllStructCreate($tagSE_EXPLICIT_ACCESS, $iResult[3] + ($i - 1) * 32)

		$aResult[$i][0] = _SeLookupAccountSid(DllStructGetData($tBuffer, "Name"))
		$aResult[$i][1] = _SeConvertSidToSSid(DllStructGetData($tBuffer, "Name"))
		$aResult[$i][2] = DllStructGetData($tBuffer, "AccessMask")
		$aResult[$i][3] = DllStructGetData($tBuffer, "AccessMode")
		$aResult[$i][4] = DllStructGetData($tBuffer, "Inheritance")

		$tBuffer = 0
	Next
	Return SetError(0, _SeLocalFree($iResult[3]), $aResult)
EndFunc	;==>_SeEnumExplicitEntriesFromAcl

Func _SeInitBufferW($vBuffer, $iReserved = 0)
	#forceref $iReserved

	Local $iLength, $pBuffer

	If IsPtr($vBuffer) Then
		$iLength = _SeReadBytes($vBuffer + 2, "word", 2)
		$pBuffer = _SeReadBytes($vBuffer + 4, "ptr", 4)
		Return _SeReadBytes($pBuffer, "wstr", $iLength)
	Else
		If ($vBuffer = "") Then Return 0

		$iLength = StringLen($vBuffer) * 2
		$pBuffer = _SeHeapAlloc(10 + $iLength)

		_SeWriteBytes($pBuffer + 0, $iLength, "word", 2)
		_SeWriteBytes($pBuffer + 2, $iLength + 2, "word", 2)
		_SeWriteBytes($pBuffer + 4, $pBuffer + 8, "ptr")
		_SeWriteBytes($pBuffer + 8, $vBuffer, "wstr", $iLength)

		Return $pBuffer
	EndIf
EndFunc	;==>_SeInitBufferW

Func _SeOpenPolicy($iDesiredAccess, $sSystem = "")
	Local $pSystem, $pBuffer, $iResult

	$pBuffer = _SeHeapAlloc(24)
	If $sSystem Then $pSystem = _SeInitBufferW($sSystem)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaOpenPolicy", "ptr", $pSystem, _
			"ptr", $pBuffer, "dword", $iDesiredAccess, "ptr*", 0)

	If $sSystem Then _SeHeapFree($pSystem)
	Return SetError(snts($iResult[0]), _SeHeapFree($pBuffer), $iResult[4])
EndFunc	;==>_SeOpenPolicy

Func _SeClosePolicy($hPolicy)
	Local $iResult = DllCall("AdvApi32.dll", "dword", "LsaClose", "ptr", $hPolicy)
	Return SetError(snts($iResult[0]), 0, $iResult[0])
EndFunc	;==>_SeClosePolicy

Func _SeEnumAccountRights($sUserAccount, $sSystem = "")
	Local $hPolicy, $pSid, $pBuffer, $aResult[1][2] = [[0]]

	$hPolicy = _SeOpenPolicy($SE_POLICY_LOOKUP_NAMES, $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, $aResult)

	$pSid = _SeLookupAccountName($sUserAccount, $sSystem)
	If ($pSid = 0) Then Return SetError(@error, 0, $aResult)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaEnumerateAccountRights", "ptr", $hPolicy, _
			"ptr", $pSid, "ptr*", 0, "ulong*", 0)
	_SeHeapFree($pSid)
	_SeClosePolicy($hPolicy)

	If ($iResult[0]) Then
		Return SetError(snts($iResult[0]), 0, $aResult)
	EndIf

	$aResult[0][0] = $iResult[4]
	Redim $aResult[$aResult[0][0] + 1][2]

	For $i = 1 To $aResult[0][0]
		$aResult[$i][0] = _SeInitBufferW($iResult[3] + ($i - 1) * 8)
		$aResult[$i][1] = _SeLookupPrivDescription($aResult[$i][0], $sSystem)
	Next
	Return SetError(0, _SeFreeMemory($iResult[3]), $aResult)
EndFunc	;==>_SeEnumAccountRights

Func _SeFreeMemory($pBuffer)
	Local $iResult = DllCall("AdvApi32.dll", "dword", "LsaFreeMemory", "ptr", $pBuffer)
	Return SetError(snts($iResult[0]), 0, $iResult[0])
EndFunc	;==>_SeFreeMemory

Func _SeAddAccountRight($sUserAccount, $sUserRight, $sSystem = "")
	Local $iResult, $hPolicy, $pUserRight, $pSid

	$pSid = _SeLookupAccountName($sUserAccount, $sSystem)
	If ($pSid = 0) Then Return SetError(@error, 0, 0)

	$hPolicy = _SeOpenPolicy(BitOR($SE_POLICY_LOOKUP_NAMES, $SE_POLICY_CREATE_ACCOUNT), $sSystem)
	If (@error) Then Return SetError(@error, _SeHeapFree($pSid), 0)

	$pUserRight = _SeInitBufferW($sUserRight)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaAddAccountRights", "ptr", $hPolicy, _
			"ptr", $pSid, "ptr", $pUserRight, "ulong", 1)

	_SeHeapFree($pSid)
	_SeHeapFree($pUserRight)
	_SeClosePolicy($hPolicy)
	Return SetError(snts($iResult[0]), 0, $iResult[0] = 0)
EndFunc	;==>_SeAddAccountRight

Func _SeRemoveAccountRight($sUserAccount, $sUserRight, $sSystem = "")
	Local $iResult, $hPolicy, $pSid, $pUserRight

	$hPolicy = _SeOpenPolicy($SE_POLICY_LOOKUP_NAMES, $sSystem)
	If @error Then Return SetError(@error, 0, 0)

	$pSid = _SeLookupAccountName($sUserAccount, $sSystem)
	If ($pSid = 0) Then Return SetError(@error, 0, 0)

	$pUserRight = _SeInitBufferW($sUserRight)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaRemoveAccountRights", "ptr", $hPolicy, _
			"ptr", $pSid, "bool", 0, "ptr", $pUserRight, "ulong", 1)
	_SeHeapFree($pSid)
	_SeHeapFree($pUserRight)
	_SeClosePolicy($hPolicy)

	Return SetError(snts($iResult[0]), 0, $iResult[0] = 0)
EndFunc	;==>_SeRemoveAccountRight

Func _SeEnumPrivateData()
	Local $aSecur, $pDacl, $sKeyName, $sKeyName1, $i, $aResult[1] = [0]
	Local $aList[1][4] = [[_SeLookupAccountName(@UserName), 0xF003F, $SE_GRANT_ACCESS, 3]]

	$sKeyName = "Machine\Security\Policy\Secrets"

	$aSecur = _SeGetNamedSecurityInfo($sKeyName, $SE_REGISTRY_KEY, $SE_INFO_DACL)
	If (@error) Then Return SetError(@error, _SeHeapFree($aList[0][0]), $aResult)

	$pDacl = _SeSetEntriesInAcl($aList)
	If ($pDacl = 0) Then Return SetError(@error, 0, $aResult)

	_SeSetNamedSecurityInfo($sKeyName, $SE_REGISTRY_KEY, $SE_INFO_DACL, 0, 0, $pDacl, 0)
	If (@error) Then Return SetError(@error, _SeLocalFree($pDacl), $aResult)

	While 1
		$i += 1
		$sKeyName1 = RegEnumKey("HKLM\Security\Policy\Secrets", $i)
		If @error Then ExitLoop

		$aResult[0] += 1
		Redim $aResult[$aResult[0] + 1]
		$aResult[$aResult[0]] = $sKeyName1
	WEnd

	_SeLocalFree($pDacl)
	_SeSetNamedSecurityInfo($sKeyName, $SE_REGISTRY_KEY, $SE_INFO_DACL, 0, 0, $aSecur[6], 0)
	Return SetError(@error, _SeHeapFree($aList[0][0]), $aResult)
EndFunc	;==>_SeEnumPrivateData

Func _SeRetrievePrivateData($sPrivateName, $fReturnPointer = 0, $sSystem = "")
	Local $iResult, $hPolicy, $pPrivate, $iLength, $pBuffer, $bBinary

	$hPolicy = _SeOpenPolicy($SE_POLICY_GET_PRIVATE_INFORMATION, $sSystem)
	If (@error) Then Return SetError(@error, 0, "")

	$pPrivate = _SeInitBufferW($sPrivateName)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaRetrievePrivateData", _
			"ptr", $hPolicy, "ptr", $pPrivate, "ptr*", 0)

	_SeHeapFree($pPrivate)
	_SeClosePolicy($hPolicy)

	If ($iResult[0]) Then
		If $fReturnPointer Then
			Return SetError(snts($iResult[0]), 0, 0)
		Else
			Return SetError(snts($iResult[0]), 0, Binary(""))
		EndIf
	EndIf

	If $fReturnPointer Then Return $iResult[3]

	$iLength = _SeReadBytes($iResult[3] + 2, "word", 2)
	$pBuffer = _SeReadBytes($iResult[3] + 4, "ptr")

	$bBinary = _SeReadBytes($pBuffer, "binary", $iLength)
	Return SetError(_SeFreeMemory($iResult[3]), $iLength, $bBinary)
EndFunc	;==>_SeRetrievePrivateData

Func _SeStorePrivateData($sKeyName, $sPrivateData, $sSystem = "")
	Local $hPolicy, $pKeyName, $pPrivateData, $iResult

	$hPolicy = _SeOpenPolicy($SE_POLICY_CREATE_SECRET, $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, 0)

	If IsPtr($sPrivateData) Then
		$pPrivateData = $sPrivateData
	Else
		$pPrivateData = _SeInitBufferW(String($sPrivateData))
	EndIf

	$pKeyName = _SeInitBufferW(String($sKeyName))

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaStorePrivateData", "ptr", $hPolicy, _
			"ptr", $pKeyName, "ptr", $pPrivateData)

	_SeClosePolicy($hPolicy)
	If Not IsPtr($sPrivateData) Then _SeHeapFree($pPrivateData)

	Return SetError(snts($iResult[0]), _SeHeapFree($pKeyName), $iResult[0] = 0)
EndFunc	;==>_SeStorePrivateData

Func _SeEnumAccountsWithUserRight($sUserRight, $sSystem = "")
	Local $iResult, $iDesiredAccess, $hPolicy, $pUserRight, $pSid, $aResult[1][2] = [[0]]

	$iDesiredAccess = BitOR($SE_POLICY_LOOKUP_NAMES, $SE_POLICY_VIEW_LOCAL_INFORMATION)
	$hPolicy = _SeOpenPolicy($iDesiredAccess, $sSystem)
	If @error Then Return SetError(@error, 0, $aResult)

	$pUserRight = _SeInitBufferW($sUserRight)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaEnumerateAccountsWithUserRight", _
			"ptr", $hPolicy, "ptr", $pUserRight, "ptr*", 0, "ulong*", 0)

	_SeClosePolicy($hPolicy)
	_SeHeapFree($pUserRight)

	If ($iResult[0]) Then Return SetError(snts($iResult[0]), 0, $aResult)

	$aResult[0][0] = $iResult[4]
	Redim $aResult[$iResult[4] + 1][2]

	For $i = 1 To $iResult[4]
		$pSid = _SeReadBytes($iResult[3] + ($i - 1) * 4, "ptr")
		$aResult[$i][0] = _SeLookupAccountSid($pSid, $sSystem)
		$aResult[$i][1] = _SeConvertSidToSSid($pSid)
	Next
	Return SetError(0, _SeFreeMemory($iResult[3]), $aResult)
EndFunc	;==>_SeEnumAccountsWithUserRight

Func _SeDuplicateTokenEx($hToken, $iType = $SE_TOKEN_PRIMARY, _
		$iImpersonationLevel = $SE_SECUR_IMPERSONATION, _
		$iDesiredAccess = $SE_TOKEN_SAME_ACCESS, _
		$pSecurAttrib = 0)

	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "DuplicateTokenEx", "handle", $hToken, _
			"dword", $iDesiredAccess, "ptr", $pSecurAttrib, _
			"dword", $iImpersonationLevel, "long", $iType, "handle*", 0)
	Return SetError(_SeLastError(), 0, $iResult[6])
EndFunc	;==>_SeDuplicateTokenEx

Func _SeDuplicateHandle($hSrcProcess, $hHandle, $hTgtProcess = -1, $iFlags = $SE_DUP_SAME_ACCESS, _
		$iDesiredAccess = 0, $fInherit = 0)

	Local $iResult

	$iResult = DllCall("Kernel32.dll", "bool", "DuplicateHandle", "handle", $hSrcProcess, _
			"handle", $hHandle, "handle", $hTgtProcess, "handle*", 0, _
			"dword", $iDesiredAccess, "bool", $fInherit, "dword", $iFlags)
	Return SetError(_SeLastError(), 0, $iResult[4])
EndFunc	;==>_SeDuplicateHandle

Func _SeProtectObjectFromClose($hObject, $fProtect = 1)
	Local $iResult

	$fProtect = BitXOR($fProtect, BitShift($fProtect, 31)) + BitAnd(BitShift($fProtect, 31), 1)
	$fProtect = BitAnd(BitShift(BitNot($fProtect) + 1, 31), 2)

	$iResult = DllCall("Kernel32.dll", "bool", "SetHandleInformation", _
			"handle", $hObject, "dword", 2, "dword", $fProtect)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeProtectObjectFromClose

Func _SeGetTokenType($hToken)
	Local $pBuffer = _SeGetTokenInformation($hToken, 8)
	If $pBuffer = 0 Then Return SetError(@error, 0, 0)

	Local $iType = _SeReadBytes($pBuffer)
	Return SetError(0, _SeHeapFree($pBuffer), $iType)
EndFunc	;==>_SeGetTokenType

Func _SeGetTokenImpersonationLevel($hToken)
	Local $pImpersonation = _SeGetTokenInformation($hToken, 9)
	If $pImpersonation = 0 Then Return SetError(@error, 0, -1)

	Local $iLevel = _SeReadBytes($pImpersonation)
	Return SetError(0, _SeHeapFree($pImpersonation), $iLevel)
EndFunc	;==>_SeGetTokenImpersonationLevel

Func _SeEnumTokenGroups($hToken)
	Local $aResult[1][3] = [[0]], $pBuffer, $pSid

	$pBuffer = _SeGetTokenInformation($hToken, 2)
	If $pBuffer = 0 Then Return SetError(@error, 0, $aResult)

	$aResult[0][0] = _SeReadBytes($pBuffer)
	Redim $aResult[$aResult[0][0] + 1][3]

	For $i = 1 To $aResult[0][0]
		$pSid = _SeReadBytes($pBuffer + 4 + ($i - 1) * 8, "ptr")
		$aResult[$i][0] = _SeLookupAccountSid($pSid)
		$aResult[$i][1] = _SeConvertSidToSSid($pSid)
		$aResult[$i][2] = _SeReadBytes($pBuffer + 8 + ($i - 1) * 8, "ptr")
	Next

	Return SetError(0, _SeHeapFree($pBuffer), $aResult)
EndFunc	;==>_SeEnumTokenGroups

Func _SeEnumTokenPrivs($hToken)
	Local $pBuffer, $aResult[1][4] = [[0]]

	$pBuffer = _SeGetTokenInformation($hToken, 3)
	If ($pBuffer = 0) Then Return SetError(@error, 0, $aResult)

	$aResult[0][0] = _SeReadBytes($pBuffer)
	Redim $aResult[$aResult[0][0] + 1][4]

	For $i = 1 To $aResult[0][0]
		$aResult[$i][2] = _SeReadBytes($pBuffer + 4 + ($i - 1) * 12, "int64", 8)
		$aResult[$i][3] = _SeReadBytes($pBuffer + 12 + ($i - 1) * 12)
		$aResult[$i][0] = _SeLookupPrivName($aResult[$i][2])
		$aResult[$i][1] = _SeLookupPrivDescription($aResult[$i][0])

	Next

	Return SetError(0, _SeHeapFree($pBuffer), $aResult)
EndFunc	;==>_SeEnumTokenPrivs

Func _SeEnumTokenRestrictedSids($hToken)
	Local $pTokenGroups, $tTokenGroups, $iCount, $pSid, $aResult[1][3] = [[0]]

	$pTokenGroups = _SeGetTokenInformation($hToken, 11)
	If ($pTokenGroups = 0) Then Return SetError(@error, 0, $aResult)

	$iCount = _SeReadBytes($pTokenGroups)
	Redim $aResult[$iCount + 1][3]

	$aResult[0][0] = $iCount

	For $i = 1 To $aResult[0][0]
		$tTokenGroups = DllStructCreate($tagSE_SID_ATTRIBUTES, $pTokenGroups + 4 + ($i - 1) * 8)
		$pSid = DllStructGetData($tTokenGroups, "Sid")

		$aResult[$i][0] = _SeLookupAccountSid($pSid)
		$aResult[$i][1] = _SeConvertSidToSSid($pSid)
		$aResult[$i][2] = Ptr(DllStructGetData($tTokenGroups, "Attributes"))

		$tTokenGroups = 0
	Next

	Return SetError(0, _SeHeapFree($pTokenGroups), $aResult)
EndFunc	;==>_SeEnumTokenRestrictedSids

Func __SeGetProcAddress($hModule, $sProcedure)
	Local $iResult

	If IsString($hModule) Then
		$hModule = DllCall("Kernel32.dll", "ptr", "GetModuleHandle", "str", $hModule)
		$hModule = $hModule[0]
	EndIf

	$iResult = DllCall("Kernel32.dll", "ptr", "GetProcAddress", "ptr", $hModule, "str", $sProcedure)
	Return SetError(_SeLastError(), $hModule, $iResult[0])
EndFunc	;==>__SeGetProcAddress

Func __SeVirtualAlloc($iBytesToAlloc = 1024, $hProcess = -1)
	Local $iResult
	$iResult = DllCall("Kernel32.dll", "ptr", "VirtualAllocEx", "handle", $hProcess, _
			"ptr", 0, "dword", $iBytesToAlloc, "dword", 0x1000, "dword", 0x40)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>__SeVirtualAlloc

Func __SeCreateThread($pStartAddr, $pParam = 0, $iFlags = 0, $iStackSize = 0, $pSecurAttrib = 0)
	Local $iResult

	$iResult = DllCall("Kernel32.dll", "handle", "CreateThread", "ptr", $pSecurAttrib, _
			"dword", $iStackSize, "ptr", $pStartAddr, "ptr", $pParam, _
			"dword", $iFlags, "dword*", 0)
	Return SetError(_SeLastError(), $iResult[6], $iResult[0])
EndFunc	;==>__SeCreateThread

Func __SeWaitForObject($hObject, $iTimeout = -1)
	Local $iResult
	$iResult = DllCall("Kernel32.dll", "long", "WaitForSingleObject", _
			"handle", $hObject, "dword", $iTimeout)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>__SeWaitForObject

Func __SeCreateSemaphore($iInitCount, $iMaximumCount, $pObjectAttrib = 0, $iDesiredAccess = 0x1F0003)
	Local $iResult

	$iResult = DllCall("Ntdll.dll", "long", "NtCreateSemaphore", "handle*", 0, _
			"dword", $iDesiredAccess, "ptr", $pObjectAttrib, "ulong", $iInitCount, _
			"ulong", $iMaximumCount)

	If ($iResult[0] = 0xC0000035) Then
		$iResult = DllCall("Ntdll.dll", "long", "NtOpenSemaphore", "handle*", 0, _
				"dword", $iDesiredAccess, "ptr", $pObjectAttrib)

		Return SetError(snts($iResult[0]), 1, $iResult[1])
	Else
		Return SetError(snts($iResult[0]), 0, $iResult[1])
	EndIf
EndFunc	;==>__SeCreateSemaphore

Func __SeReleaseSemaphore($hSemaphore, $iIncrease = 1)
	Local $iResult

	$iResult = DllCall("Ntdll.dll", "long", "NtReleaseSemaphore", "handle", $hSemaphore, _
			"ulong", $iIncrease, "ulong*", 0)
	Return SetError(snts($iResult[0]), $iResult[3], $iResult[0] = 0)
EndFunc	;==>_SeReleaseSemaphore

Func __SeGetExitCodeThread($hThread)
	Local $iResult = DllCall("Kernel32.dll", "bool", "GetExitCodeThread", "handle", $hThread, "long*", 0)
	Return SetError(_SeLastError(), $iResult[0], $iResult[2])
EndFunc	;==>__SeGetExitCodeThread

Func __SeLongPtrToBytes($iLongPtr)
	Return Hex(Binary(Ptr($iLongPtr)))
EndFunc	;==>__SeLongPtrToBytes

Func __SeStringToBytesA($sText)
	Local $tText, $pText, $tBinary

	$tText = DllStructCreate("char [" & StringLen($sText) + 1 & "]")
	$pText = DllStructGetPtr($tText)
	$tBinary = DllStructCreate("ubyte [" & DllStructGetSize($tText) & "]", $pText)

	DllStructSetData($tText, 1, $sText)
	Return StringTrimLeft(DllStructGetData($tBinary, 1), 2)
EndFunc	;==>__SeStringToBytesA

Func _SeIsValidHandle($hHandle)
	Local $iResult, $pBuffer = _SeHeapAlloc(1024)

	$iResult = DllCall("Ntdll.dll", "dword", "NtQueryObject", "handle", $hHandle, _
			"dword", 2, "ptr", $pBuffer, "dword", 1024, "dword*", 0)

	Return SetError(snts($iResult[0]), _SeHeapFree($pBuffer), snts($iResult[0]) <> 6)
EndFunc	;==>_SeIsValidHandle

Func _SeSingletonEx($iMaximum, $fMultipleContexts = 1)
	Local Static $hSemaphore, $pObject, $fRelease, $pSecur

	If $hSemaphore Then Return $fRelease

	If $fMultipleContexts Then
		$pSecur = _SeInitSecurityDescriptor()
		_SeSetSecurityDescriptorDacl($pSecur, $SE_NULL_DACL, 0)
	EndIf

	; OBJ_INHERIT (0x2) | OBJ_OPENIF (0x80)
	$pObject = _SeInitObjAttrib($SE_SEMAPHORE_INSTANCE, 0x82, $pSecur)
	$hSemaphore = __SeCreateSemaphore($iMaximum, $iMaximum, $pObject)

	If ($hSemaphore = 0) Then Return SetError(@error, 0, 1)

	_SeHeapFree($pObject)
	If $pSecur Then _SeHeapFree($pSecur)

	If __SeWaitForObject($hSemaphore, 0) Then
		Return _SeCloseHandle($hSemaphore)
	Else
		$fRelease = 1
		_SeProtectObjectFromClose($hSemaphore, $fRelease)
		OnAutoItExitRegister("___SeReleaseSemaphoreInstance")
		Return 0
	EndIf
EndFunc	;==>_SeSingletonEx

Func ___SeReleaseSemaphoreInstance()
	Local $pObject, $hSemaphore

	; OBJ_INHERIT (0x2) | OBJ_OPENIF (0x80)
	$pObject = _SeInitObjAttrib($SE_SEMAPHORE_INSTANCE, 0x82)
	$hSemaphore = __SeCreateSemaphore(1, 1, $pObject)

	_SeHeapFree($pObject)
	If $hSemaphore Then
		If _SeSingletonEx(0) Then
			__SeReleaseSemaphore($hSemaphore, 1)
		EndIf
		_SeCloseHandle($hSemaphore)
	EndIf
EndFunc	;==>___SeReleaseSemaphoreInstance

Func _SeHashCertificate($bBinaryData, $iAlgId = $SE_CALG_MD5)
	Local $pBuffer, $iLength, $iResult, $pComputed, $bHashed

	$iLength = BinaryLen($bBinaryData)
	$pBuffer = _SeHeapAlloc($iLength)
	_SeWriteBytes($pBuffer, $bBinaryData, "binary", $iLength)

	If ($iAlgId = $SE_CALG_CRC32) Then
		$iResult = DllCall("Ntdll.dll", "dword", "RtlComputeCrc32", _
				"dword", 0, "ptr", $pBuffer, "dword", $iLength)
		Return SetError(0, _SeHeapFree($pBuffer), Hex($iResult[0]))
	EndIf

	$iResult = DllCall("Crypt32.dll", "bool", "CryptHashCertificate", "ptr", 0, _
			"dword", $iAlgId, "dword", 0, "ptr", $pBuffer, "dword", $iLength, _
			"ptr", 0, "dword*", 0)
	If ($iResult[7] = 0) Then
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer), "")
	EndIf

	$pComputed = _SeHeapAlloc($iResult[7])
	$iResult = DllCall("Crypt32.dll", "bool", "CryptHashCertificate", "ptr", 0, _
			"dword", $iAlgId, "dword", 0, "ptr", $pBuffer, "dword", $iLength, _
			"ptr", $pComputed, "dword*", $iResult[7])
	If ($iResult[0] = 0) Then
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer) * _SeHeapFree($pComputed), "")
	EndIf

	_SeHeapFree($pBuffer)
	$bHashed = _SeReadBytes($pComputed, "binary", $iResult[7])

	Return SetError(0, _SeHeapFree($pComputed), $bHashed)
EndFunc	;==>_SeHashCertificate

Func _SeHashFile($sFilePath, $iAlgId = $SE_CALG_MD5)
	Local $hFile, $iFileSize, $hFileMap, $pBaseAddress, $pHashed, $bHashed, $iResult, $iError

	Local Const $PAGE_READONLY = 2
	Local Const $SECTION_MAP_READ = 4

	$hFile = DllCall("Kernel32.dll", "handle", "CreateFile", "str", $sFilePath, _
			"dword", $SE_GENERIC_READ, "dword", 3, "dword", 0, "dword", 3, _
			"dword", 0, "dword", 0)
	If ($hFile[0] < 1) Then Return SetError(_SeLastError(), 0, "")

	$hFile = $hFile[0]
	$iFileSize = DllCall("Kernel32.dll", "bool", "GetFileSizeEx", "handle", $hFile, "int64*", 0)
	$iFileSize = $iFileSize[2]

	$hFileMapping = DllCall("Kernel32.dll", "handle", "CreateFileMapping", "handle", $hFile, _
				"ptr", 0, "dword", $PAGE_READONLY, "dword", 0, "dword", 0, _
				"ptr", 0)

	If ($hFileMapping[0] < 1) Then Return SetError(_SeLastError(), _SeCloseHandle($hFile), "")

	_SeCloseHandle($hFile)
	$hFileMapping = $hFileMapping[0]

	$pBaseAddress = DllCall("Kernel32.dll", "ptr", "MapViewOfFile", "handle", $hFileMapping, _
				"dword", $SECTION_MAP_READ, "dword", 0, "dword", 0, _
				"dword", 0)

	If ($pBaseAddress[0] = 0) Then
		Return SetError(_SeLastError(), _SeCloseHandle($hFileMapping), "")
	EndIf

	_SeCloseHandle($hFileMapping)
	$pBaseAddress = $pBaseAddress[0]

	If ($iAlgId = $SE_CALG_CRC32) Then
		$iResult = DllCall("Ntdll.dll", "dword", "RtlComputeCrc32", "ptr", 0, _
				"ptr", $pBaseAddress, "dword", $iFileSize)

		DllCall("Kernel32.dll", "bool", "UnmapViewOfFile", "ptr", $pBaseAddress)
		Return SetError(0, 0, "0x" & Hex($iResult[0]))
	EndIf

	$iResult = DllCall("Crypt32.dll", "bool", "CryptHashCertificate", "ptr", 0, _
			"dword", $iAlgId, "dword", 0, "ptr", $pBaseAddress, "dword", $iFileSize, _
			"ptr", 0, "dword*", 0)

	If ($iResult[7] = 0) Then
		$iError = _SeLastError()
		DllCall("Kernel32.dll", "bool", "UnmapViewOfFile", "ptr", $pBaseAddress)
		Return SetError($iError, 0,  "")
	EndIf

	$pHashed = _SeHeapAlloc($iResult[7])
	$iResult = DllCall("Crypt32.dll", "bool", "CryptHashCertificate", "ptr", 0, _
			"dword", $iAlgId, "dword", 0, "ptr", $pBaseAddress, "dword", $iFileSize, _
			"ptr", $pHashed, "dword*", $iResult[7])

	$iError = _SeLastError()
	$bHashed = _SeReadBytes($pHashed, "binary", $iResult[7])
	DllCall("Kernel32.dll", "bool", "UnmapViewOfFile", "ptr", $pBaseAddress)

	Return SetError($iError, _SeHeapFree($pHashed), $bHashed)
EndFunc	;==>_SeHashFile

Func __SeTreeResetSecurityCallBack($sObject, $iStatus, $pInvoke, $sCallBack, $fSecuritySet)
	If $sCallBack Then
		Local $iReturn = Call($sCallBack, $sObject, $iStatus, $fSecuritySet)
		If (($iReturn = $SE_TREE_RESET_SECUR_CANCEL) Or ($iReturn = $SE_TREE_RESET_SECUR_RETRY)) Then
			If ($iStatus) Then _SeWriteBytes($pInvoke, $iReturn)
		EndIf
	EndIf
EndFunc	;==>__SeTreeResetSecurityCallBack

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeTreeResetNamedSecurityInfo
; Description	: Resets the specified security information in the security descriptor of a specified tree of objects, This function supports a callback function to track the progress of the tree operation.
; Parameter(s)	: $sObject	- Pull path of the object, can be a registry key or directory of a file object.
;		: $iObjType	- Indicates the type of object named b y the $sObject parameter, can be $SE_REGISTRY_KEY or $SE_FILE_OBJECT.
;		: $iSecurInfo	- Security information to reset.
;		: $pOwner	- Owner assigned to the objects.
;		: $pGroup	- Primary group assigned to the objects.
;		: $pDacl	- DACL.
;		: $pSacl	- SACL.
;		: $sCallBack	- Name of the callback function.
;		: $iInvoke	- Initial setting for the progress function, default is $SE_TREE_SECUR_INVOKE_EVERY_OBJECT.
;		: $fKeepExplicit	- Boolean value that defines whether explicitly defined ACEs are kept or deleted for the sub-tree. If TRUE, then explicitly defined ACEs are kept for each subtree DACL and SACL, and inherited ACEs are replaced by the inherited ACEs from $pDacl and $pSacl. If FALSE, then the explicitly defined ACEs for each sub-tree DACL and SACL are deleted before the inhertied ACEs are replaced by the inherited ACEs from $pDacl and $pSacl.
; Return values	: Returns TRUE if succeeds, otherwise FALSE, in which case, the @error is set to a system error code.
; Author	: Pusofalse
; Remarks	: Definition of the callback function:
;		:  _CallBack($sObject, $iStatus, $fSecuritySet)
;		: Callback function parameters:
;		:	$sObject	- Name of the object just processed.
;		:	$iStatus	- Status of the operation on object, typically is set to a system error code, a value of zero indicates success.
;		:	$fSecuitySet	- Whether security was set.
;		: Return values:
;		:	If an error occurs ($iStatus is non-zero), the callback function should return $SE_TREE_RESET_SECUR_CANCEL to cancel the security reset operation, or return $SE_TREE_RESET_SECUR_RETRY to retry again. Otherwise, the callback function must return zero.
; ============================================================================================================
Func _SeTreeResetNamedSecurityInfo($sObject, $iObjType, $iSecurInfo, $pOwner, $pGroup, _
		$pDacl, $pSacl, $sCallBack = "", $iInvoke = $SE_TREE_SECUR_INVOKE_EVERY_OBJECT, _
		$fKeepExplicit = 1)

	Local $iResult, $hCallBack, $pCallBack

	If ($sCallBack <> "") And ($iInvoke <> $SE_TREE_SECUR_INVOKE_NEVER) Then
		$hCallBack = DllCallBackRegister("__SeTreeResetSecurityCallBack", "int", "wstr;dword;ptr;str;bool")
		$pCallBack = DllCallBackGetPtr($hCallBack)
	EndIf

	$iResult = DllCall("AdvApi32.dll", "dword", "TreeResetNamedSecurityInfoW", "wstr", $sObject, _
			"long", $iObjType, "long", $iSecurInfo, "ptr", $pOwner, "ptr", $pGroup, _
			"ptr", $pDacl, "ptr", $pSacl, "bool", $fKeepExplicit, "ptr", $pCallBack, _
			"ulong", $iInvoke, "str", $sCallBack)

	If ($hCallBack) Then DllCallBackFree($hCallBack)

	If Not IsArray($iResult) Then
		Return SetError(1, 0, 0)
	Else
		Return SetError($iResult[0], 0, $iResult[0] = 0)
	EndIf
EndFunc	;==>_SeTreeResetNamedSecurityInfo

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeTreeResetNamedSecurityInfoEx
; Description	: Creates a thread to set the security information of the tree object.
; Parameter(s)	: $sObject	- Full path of the object, can be a file or registry key.
;		: $iObjType	- Type of the object, can be $SE_FILE_OBJECT or $SE_REGISTRY_KEY.
;		: $iSecurInfo	- Security information to be set.
;		: $pOwner	- A pointer to a SID as the owner of the object.
;		: $pGroup	- Primary group.
;		: $pDacl	- DACL.
;		: $pSacl	- SACL.
;		: $pCallBack	- A pointer to a callback used to track the progress.
;		: $iInvoke	- Invoke options for tracking progress.
;		: $fKeepExplicit	- A BOOLEAN defines whether the object keeps the explicit ACEs.
;		: $pContext	- Optional user defined value.
; Return values	: Handle to the thread is returned is succeeds.
; Author	: Pusofalse
; ============================================================================================================
Func _SeTreeResetNamedSecurityInfoEx($sObject, $iObjType, $iSecurInfo, $pOwner, $pGroup, _
		$pDacl, $pSacl = 0, $pCallBack = 0, $iInvoke = $SE_TREE_SECUR_INVOKE_EVERY_OBJECT, _
		$fKeepExplicit = 1, $pContext = 0)

	Local Static $pStartAddr, $pProcedures, $bCode, $pBuffer, $hThread

	$pBuffer = _SeHeapAlloc(304)
	$tBuffer = DllStructCreate($tagSE_TREE_RESET_SECUR, $pBuffer)

	DllStructSetData($tBuffer, "Object", DllStructGetPtr($tBuffer, "wzObject"))
	DllStructSetData($tBuffer, "ObjType", $iObjType)
	DllStructSetData($tBuffer, "SecurInfo", $iSecurInfo)
	DllStructSetData($tBuffer, "Owner", $pOwner)
	DllStructSetData($tBuffer, "Group", $pGroup)
	DllStructSetData($tBuffer, "Dacl", $pDacl)
	DllStructSetData($tBuffer, "Sacl", $pSacl)
	DllStructSetData($tBuffer, "KeepExplicit", $fKeepExplicit)
	DllStructSetData($tBuffer, "CallBack", $pCallBack)
	DllStructSetData($tBuffer, "Invoke", $iInvoke)
	DllStructSetData($tBuffer, "Context", $pContext)
	DllStructSetData($tBuffer, "wzObject", $sObject)

	If ($pStartAddr) Then
		$hThread = __SeCreateThread($pStartAddr, $pBuffer)
		Return SetError(@error, @extended, $hThread)
	EndIf

	$pStartAddr = __SeVirtualAlloc(1024)
	$pProcedures = $pStartAddr + 68

	$bCode = "0x" & _
		"55" & _					; push	ebp
		"8BEC" & _					; mov	ebp, esp
		"53" & _					; push	ebx
		"BB" & __SeLongPtrToBytes($pProcedures) & _	; mov	ebx, pProcedures
		"56" & _					; push	esi
		"8B7508" & _					; mov	esi, dword ptr [ebp+8]
		"FF7628" & _					; push	dword ptr [esi+28]
		"FF7624" & _					; push	dword ptr [esi+24]
		"FF7620" & _					; push	dword ptr [esi+20]
		"FF761C" & _					; push	dword ptr [esi+1c]
		"FF7618" & _					; push	dword ptr [esi+18]
		"FF7614" & _					; push	dword ptr [esi+14]
		"FF7610" & _					; push	dword ptr [esi+10]
		"FF760C" & _					; push	dword ptr [esi+0c]
		"FF7608" & _					; push	dword ptr [esi+08]
		"FF7604" & _					; push	dword ptr [esi+04]
		"FF36" & _					; push	dword ptr [esi]
		"FF13" & _					; call	dword ptr [ebx]
		"50" & _					; push	eax
		"56" & _					; push	esi
		"6A00" & _					; push	0
		"FF5304" & _					; call	dword ptr [ebx+4]
		"50" & _					; push	eax
		"FF5308" & _					; call	dword ptr [ebx+8]
		"58" & _					; pop	eax
		"5E" & _					; pop	esi
		"5B" & _					; pop	ebx
		"5D" & _					; pop	ebp
		"C20400" & _					; ret	4
		"909090" & _					; nop	(for 4 bytes alignment)
		__SeLongPtrToBytes(__SeGetProcAddress("AdvApi32.dll", "TreeResetNamedSecurityInfoW")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "GetProcessHeap")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "HeapFree"))

	_SeWriteBytes($pStartAddr, $bCode, "binary", BinaryLen($bCode))

	$hThread = __SeCreateThread($pStartAddr, $pBuffer)
	Return SetError(@error, @extended, $hThread)
EndFunc	;==>_SeTreeResetNamedSecurityInfoEx

Func _SeIsValidAce($pAce)
	Local Static $pBuffer, $pStartAddr, $bCode, $hThread, $iResult

	$pBuffer = _SeHeapAlloc(8)
	_SeWriteBytes($pBuffer, $pAce, "ptr")

	If $pStartAddr Then
		$hThread = __SeCreateThread($pStartAddr, $pBuffer)
		__SeWaitForObject($hThread)
		_SeCloseHandle($hThread)

		$iResult = _SeReadBytes($pBuffer + 4)
		Return SetError(0, _SeHeapFree($pBuffer), $iResult)
	EndIf

	$pStartAddr = __SeVirtualAlloc(128)
	Local Const $pIsValidAce = __SeVirtualAlloc(128)
	Local Const $pIsValidSid = __SeGetProcAddress("AdvApi32.dll", "IsValidSid")
	Local Const $pGetLengthSid = __SeGetProcAddress(@Extended, "GetLengthSid")

	$bCode = "0x" & _
		"55" & _					; push	ebp
		"8BEC" & _					; mov	ebp, esp
		"56" & _					; push	esi
		"57" & _					; push	edi
		"8B7508" & _					; mov	esi, dword ptr [ebp+8]
		"85F6" & _					; test	esi, esi
		"74" & Hex(55, 2) & _				; jz	$d+55
		"8A0E" & _					; mov	cl, byte ptr [esi]
		"84C9" & _					; test	cl, cl
		"74" & Hex(8, 2) & _				; jz	$d+8
		"FEC9" & _					; dec	cl
		"74" & Hex(4, 2) & _				; jz	$d+4
		"FEC9" & _					; dec	cl
		"75" & Hex(41, 2) & _				; jnz	$d+41
		"8D7E08" & _					; lea	edi, dword ptr [esi+8]
		"57" & _					; push	edi
		"B8" & __SeLongPtrToBytes($pIsValidSid) & _	; mov	eax, AdvApi32.IsValidSid
		"FFD0" & _					; call	eax
		"85C0" & _					; test	eax, eax
		"74" & Hex(20, 2) & _				; jz	$d+20
		"57" & _					; push	edi
		"B8" & __SeLongPtrToBytes($pGetLengthSid) & _	; mov	eax, AdvApi32.GetLengthSid
		"FFD0" & _					; call	eax
		"83C008" & _					; add	eax, 8
		"66394602" & _					; cmp	word ptr [esi+2], ax
		"7509" & _					; jnz	$+9
		"33C0" & _					; xor	eax, eax
		"40" & _					; inc	eax
		"5F" & _					; pop	edi
		"5E" & _					; pop	esi
		"5D" & _					; pop	ebp
		"C20400" & _					; ret	4
		"33C0" & _					; xor	eax, eax
		"EB" & Hex(-10, 2)				; jmp	$d-10

	_SeWriteBytes($pIsValidAce, $bCode, "binary", BinaryLen($bCode))

	$bCode = "0x" & _
		"55" & _					; push ebp
		"8BEC" & _					; mov ebp, esp
		"8B5D08" & _					; mov ebx, dword ptr [ebp+8]
		"FF33" & _					; push dword ptr [ebx]
		"B8" & __SeLongPtrToBytes($pIsValidAce) & _	; mov eax, IsValidAce
		"FFD0" & _					; call eax
		"894304" & _					; mov dword ptr [ebx+4], eax
		"5D" & _					; pop ebp
		"C20400"

	_SeWriteBytes($pStartAddr, $bCode, "binary", BinaryLen($bCode))

	$hThread = __SeCreateThread($pStartAddr, $pBuffer)
	__SeWaitForObject($hThread)
	_SeCloseHandle($hThread)

	$iResult = _SeReadBytes($pBuffer + 4)
	Return SetError(0, _SeHeapFree($pBuffer), $iResult)
EndFunc	;==>_SeIsValidAce

Func _SeGetUserModals($iInfoClass, $sSystem = "")
	Local $iResult

	$iResult = DllCall("Netapi32.dll", "dword", "NetUserModalsGet", _
			"wstr", $sSystem, "long", $iInfoClass, "ptr*", 0)
	Return SetError($iResult[0], 0, $iResult[3])
EndFunc	;==>_SeGetUserModals

Func _SeSetUserModals($iInfoClass, $vBuffer, $sBufferType = "ptr", $sSystem = "")
	Local $iResult

	$iResult = DllCall("Netapi32.dll", "dword", "NetUserModalsSet", "wstr", $sSystem, _
			"ulong", $iInfoClass, $sBufferType, $vBuffer, "dword*", 0)

	If (@error) Then
		Return SetError(87, 0, 0)
	Else
		Return SetError($iResult[0], 0, $iResult[0] = 0)
	EndIf
EndFunc	;==>_SeSetUserModals

Func _SeEnumLocalGroups($sSystem = "")
	Local $iResult, $aResult[1][2] = [[0]], $tBuffer

	$iResult = DllCall("NetApi32.dll", "dword", "NetLocalGroupEnum", "wstr", $sSystem, _
			"dword", 1, "ptr*", 0, "dword", -1, "dword*", 0, "dword*", 0, "dword*", 0)

	If ($iResult[0]) Or ($iResult[5] = 0) Then
		Return SetError($iResult[0], 0, $aResult)
	EndIf

	$aResult[0][0] = $iResult[5]
	Redim $aResult[$iResult[5] + 1][2]

	For $i = 1 To $aResult[0][0]
		$tBuffer = DllStructCreate($tagSE_LOCALGROUP_INFO_1, $iResult[3] + ($i - 1) * 8)

		$aResult[$i][0] = _SeNetBuffer(DllStructGetData($tBuffer, "GroupName"))
		$aResult[$i][1] = _SeNetBuffer(DllStructGetData($tBuffer, "GroupComment"))

		$tBuffer = 0
	Next
	Return SetError(0, _SeApiBufferFree($iResult[3]), $aResult)
EndFunc	;==>_SeEnumLocalGroups

Func _SeEnumUserLocalGroups($sUserName = @UserName, $sSystem = "")
	Local $iResult, $aResult[1][2] = [[0]], $tBuffer

	$iResult = DllCall("NetApi32.dll", "dword", "NetUserGetLocalGroups", "wstr", $sSystem, _
			"wstr", $sUserName, "dword", 0, "dword", 1, "ptr*", 0, "dword", -1, _
			"dword*", 0, "dword*", 0)

	If ($iResult[0]) Or ($iResult[7] = 0) Then
		Return SetError($iResult[0], 0, $aResult)
	EndIf

	$aResult[0][0] = $iResult[7]
	$aResult[0][1] = $sUserName
	Redim $aResult[$iResult[7] + 1][2]

	For $i = 1 To $aResult[0][0]
		$aResult[$i][0] = _SeNetBuffer(_SeReadBytes($iResult[5] + ($i - 1) * 4, "ptr"))
		$aResult[$i][1] = _SeGetLocalGroupInfo($aResult[$i][0], $sSystem)
	Next

	Return SetError(0, _SeApiBufferFree($iResult[5]), $aResult)
EndFunc	;==>_SeEnumUserLocalGroups

Func _SeAddLocalGroupMembers($sLocalGroup, $vMember, $sSystem = "")
	Local $pBuffer, $aMember, $iUBound

	If IsArray($vMember) Then
		If UBound($vMember, 0) = 1 Then
			$aMember = $vMember
		Else
			Return SetError(87, 0, 0)
		EndIf
	Else
		If StringInStr($vMember, "|") Then
			$aMember = StringSplit($vMember, "|", 2)
		Else
			Local $aMember[1] = [$vMember]
		EndIf
	EndIf

	$iUBound = UBound($aMember)
	Local $aBuffer[$iUBound]

	$pBuffer = _SeHeapAlloc(4 * $iUBound)

	For $i = 0 To $iUBound - 1
		$aBuffer[$i] = DllStructCreate("wchar UserName[" & StringLen($aMember[$i]) + 1 & "]")
		DllStructSetData($aBuffer[$i], "UserName", $aMember[$i])
		_SeWriteBytes($pBuffer + $i * 4, DllStructGetPtr($aBuffer[$i]))
	Next

	$iResult = DllCall("Netapi32.dll", "dword", "NetLocalGroupAddMembers", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "ulong", 3, "ptr", $pBuffer, "dword", $iUBound)
	Return SetError($iResult[0], _SeHeapFree($pBuffer), $iResult[0] = 0)
EndFunc	;==>_SeAddLocalGroupMembers

Func _SeDeleteLocalGroupMembers($sLocalGroup, $vMember, $sSystem = "")
	Local $pBuffer, $aMember, $iUBound

	If IsArray($vMember) Then
		If UBound($vMember, 0) = 1 Then
			$aMember = $vMember
		Else
			Return SetError(87, 0, 0)
		EndIf
	Else
		If StringInStr($vMember, "|") Then
			$aMember = StringSplit($vMember, "|", 2)
		Else
			Local $aMember[1] = [$vMember]
		EndIf
	EndIf

	$iUBound = UBound($aMember)
	Local $aBuffer[$iUBound]

	$pBuffer = _SeHeapAlloc(4 * $iUBound)

	For $i = 0 To $iUBound - 1
		$aBuffer[$i] = DllStructCreate("wchar UserName[" & StringLen($aMember[$i]) + 1 & "]")
		DllStructSetData($aBuffer[$i], "UserName", $aMember[$i])
		_SeWriteBytes($pBuffer + $i * 4, DllStructGetPtr($aBuffer[$i]))
	Next

	$iResult = DllCall("Netapi32.dll", "dword", "NetLocalGroupDelMembers", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "ulong", 3, "ptr", $pBuffer, "dword", $iUBound)
	Return SetError($iResult[0], _SeHeapFree($pBuffer), $iResult[0] = 0)
EndFunc	;==>_SeDeleteLocalGroupMembers

Func _SeEnumLocalGroupMembers($sLocalGroup, $sSystem = "")
	Local $iResult, $aResult[1][3] = [[0]]

	$iResult = DllCall("Netapi32.dll", "dword", "NetLocalGroupGetMembers", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "dword", 1, "ptr*", 0, "dword", -1, _
			"dword*", 0, "dword*", 0, "dword*", 0)

	If ($iResult[0]) Or ($iResult[6] = 0) Then Return SetError($iResult[0], 0, $aResult)

	$aResult[0][0] = $iResult[6]
	Redim $aResult[$aResult[0][0] + 1][3]

	For $i = 1 To $aResult[0][0]
		$aResult[$i][0] = _SeNetBuffer(_SeReadBytes($iResult[4] + ($i - 1) * 12 + 8))
		$aResult[$i][1] = _SeConvertSidToSSid(_SeReadBytes($iResult[4] + ($i - 1) * 12))
		$aResult[$i][2] = _SeReadBytes($iResult[4] + ($i - 1) * 12 + 4)
	Next
	Return SetError(0, _SeApiBufferFree($iResult[4]), $aResult)
EndFunc	;==>_SeEnumLocalGroupMembers

Func _SeGetLocalGroupInfo($sLocalGroup, $sSystem = "")
	Local $iResult, $sComment

	$iResult = DllCall("NetApi32.dll", "dword", "NetLocalGroupGetInfo", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "dword", 1, "ptr*", 0)

	If ($iResult[0]) Or ($iResult[4] = 0) Then
		Return SetError($iResult[0], 0, "")
	EndIf

	$sComment = _SeNetBuffer(_SeReadBytes($iResult[4] + 4, "ptr"))
	Return SetError(0, _SeApiBufferFree($iResult[4]), $sComment)

EndFunc	;==>_SeGetLocalGroupInfo

Func _SeEnumLocalUsers($iFilter = $SE_FILTER_ALL_USER_ACCOUNTS, $sSystem = "")
	Local $aResult[1][5] = [[0]], $iResult, $tBuffer

	$iResult = DllCall("NetApi32.dll", "dword", "NetUserEnum", "wstr", $sSystem, _
			"dword", 20, "dword", $iFilter, "ptr*", 0, "dword", -1, _
			"dword*", 0, "dword*", 0, "dword*", 0)

	If ($iResult[0]) Or ($iResult[6] = 0) Then
		Return SetError($iResult[0], 0, $aResult)
	EndIf

	$aResult[0][0] = $iResult[6]
	Redim $aResult[$iResult[6] + 1][5]

	For $i = 1 To $aResult[0][0]
		$tBuffer = DllStructCreate($tagSE_USER_INFO_20, $iResult[4] + ($i - 1) * 20)

		$aResult[$i][0] = _SeNetBuffer(DllStructGetData($tBuffer, "UserName"))
		$aResult[$i][1] = _SeNetBuffer(DllStructGetData($tBuffer, "FullName"))
		$aResult[$i][2] = _SeNetBuffer(DllStructGetData($tBuffer, "Comment"))
		$aResult[$i][3] = DllStructGetData($tBuffer, "UserRid")
		$aResult[$i][4] = DllStructGetData($tBuffer, "UserFlags")

		$tBuffer = 0
	Next

	Return SetError(0, _SeApiBufferFree($iResult[4]), $aResult)
EndFunc	;==>_SeEnumLocalUsers

Func _SeApiBufferFree($pBuffer)
	Local $iResult
	$iResult = DllCall("NetApi32.dll", "dword", "NetApiBufferFree", "ptr", $pBuffer)
	Return $iResult[0]
EndFunc	;==>_SeApiBufferFree

Func _SeNetBuffer($pBuffer)
	Return _SeReadBytes($pBuffer, "wstr", 1024)
EndFunc	;==>_SeNetBuffer

Func _SeCreateLocalUser($sUserName, $sPassword = "", $iFlags = 0, $sSystem = "")
	Local $tBuffer, $pBuffer, $iResult

	$tBuffer = DllStructCreate($tagSE_USER_INFO_01)
	$pBuffer = DllStructGetPtr($tBuffer)

	DllStructSetData($tBuffer, "UserName", DllStructGetPtr($tBuffer, "szUserName"))
	DllStructSetData($tBuffer, "Password", DllStructGetPtr($tBuffer, "szPassword"))
	DllStructSetData($tBuffer, "Priv", $SE_USER_PRIV_USER)
	DllStructSetData($tBuffer, "Flags", $iFlags)
	DllStructSetData($tBuffer, "szUserName", $sUserName)
	DllStructSetData($tBuffer, "szPassword", $sPassword)

	$iResult = DllCall("Netapi32.dll", "dword", "NetUserAdd", "wstr", $sSystem, _
			"dword", 1, "ptr", $pBuffer, "dword*", 0)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_SeCreateLocalUser

Func _SeDeleteLocalUser($sLocalUser, $sSystem = "")
	Local $iResult
	$iResult = DllCall("Netapi32.dll", "dword", "NetUserDel", _
			"wstr", $sSystem, "wstr", $sLocalUser)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_SeDeleteLocalUser

Func _SeNetBufferSize($pBuffer)
	Local $iResult = DllCall("Netapi32.dll", "dword", "NetApiBufferSize", "ptr", $pBuffer, "long*", 0)
	Return SetError($iResult[0], 0, $iResult[2])
EndFunc	;==>_SeNetBufferSize

Func _SeGetUserPrivilege($sUserName, $sSystem = "")
	Local $pUserInfo = _SeGetLocalUserInfo($sUserName, 1, $sSystem)
	If @error Then Return SetError(@error, 0, -1)

	Local $tUserInfo = DllStructCreate($tagSE_USER_INFO_01, $pUserInfo)
	Local $iUserPriv = DllStructGetData($tUserInfo, "Priv")

	Return SetError(0, _SeApiBufferFree($pUserInfo), $iUserPriv)
EndFunc	;==>_SeGetUserPrivilege

Func _SeGetLocalUserInfo($sUserName, $iLevel = 1, $sSystem = "")
	Local $iResult

	$iResult = DllCall("Netapi32.dll", "dword", "NetUserGetInfo", "wstr", $sSystem, _
			"wstr", $sUserName, "dword", $iLevel, "ptr*", 0)
	Return SetError($iResult[0], 0, $iResult[4])
EndFunc	;==>_SeGetLocalUserInfo

Func _SeSetLocalUserInfo($sUserName, $iLevel, $vBuffer, $sBufType = "ptr", $sSystem = "")
	Local $iResult

	If ($sBufType == 0) Or ($sBufType = "") Or ($sBufType = Default) Then $sBufType = "ptr"

	$iResult = DllCall("Netapi32.dll", "dword", "NetUserSetInfo", "wstr", $sSystem, _
			"wstr", $sUserName, "dword", $iLevel, $sBufType, $vBuffer, "dword*", 0)

	If (@error) Then
		Return SetError(87, 0, 0)
	Else
		Return SetError($iResult[0], 0, $iResult[0] = 0)
	EndIf
EndFunc	;==>_SeSetLocalUserInfo

Func _SeCreateLocalGroup($sLocalGroup, $sComment = "", $sSystem = "")
	Local $iResult, $pBuffer

	$pBuffer = _SeHeapAlloc(12 + (StringLen($sLocalGroup) + StringLen($sComment)) * 2)

	_SeWriteBytes($pBuffer + 0, $pBuffer + 8)
	_SeWriteBytes($pBuffer + 4, $pBuffer + 10 + StringLen($sLocalGroup) * 2)
	_SeWriteBytes($pBuffer + 8, $sLocalGroup, "wstr", StringLen($sLocalGroup) * 2)
	_SeWriteBytes($pBuffer + 10 + StringLen($sLocalGroup) * 2, $sComment, "wstr", StringLen($sComment) * 2)

	$iResult = DllCall("Netapi32.dll", "dword", "NetLocalGroupAdd", "wstr", $sSystem, _
			"long", 1, "ptr", $pBuffer, "dword*", 0)
	Return SetError($iResult[0], _SeHeapFree($pBuffer), $iResult[0] = 0)
EndFunc	;==>_SeCreateLocalGroup

Func _SeDeleteLocalGroup($sLocalGroup, $sSystem = "")
	Local $iResult
	$iResult = DllCall("Netapi32.dll", "dword", "NetLocalGroupDel", _
			"wstr", $sSystem, "wstr", $sLocalGroup)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_SeDeleteLocalGroup

Func _SeCompareUserRight($sUserName1, $sUserName2, $sSystem = "")
	Local $pUserInfo1, $pUserInfo2, $iUserPriv1, $iUserPriv2, $iFlags1, $iFlags2

	$pUserInfo1 = _SeGetLocalUserInfo($sUserName1, 1, $sSystem)
	If (@error) Then Return SetError(@error, 0, "")

	$pUserInfo2 = _SeGetLocalUserInfo($sUserName2, 1, $sSystem)
	If (@error) Then Return SetError(@error, _SeApiBufferFree($pUserInfo1), "")

	$iUserPriv1 = _SeReadBytes($pUserInfo1 + 12)
	$iUserPriv2 = _SeReadBytes($pUserInfo2 + 12)

	$iFlags1 = _SeReadBytes($pUserInfo1 + 24)
	$iFlags2 = _SeReadBytes($pUserInfo2 + 24)

	_SeApiBufferFree($pUserInfo1)
	_SeApiBufferFree($pUserInfo2)

	If ($iUserPriv1 > $iUserPriv2) Then
		Return SetExtended($iUserPriv1, $sUserName1)
	Else
		If ($iUserPriv1 < $iUserPriv2) Then
			Return SetExtended($iUserPriv2, $sUserName2)
		Else
			If BitAnd($iFlags1, $SE_UF_ACCOUNTDISABLE) Then
				If BitAnd($iFlags2, $SE_UF_ACCOUNTDISABLE) Then
					Return SetError(0xFFFFF6E2, 0, "")
				Else
					Return SetExtended($iUserPriv2, $sUserName2)
				EndIf
			Else
				If BitAnd($iFlags2, $SE_UF_ACCOUNTDISABLE) Then
					Return SetExtended($iUserPriv1, $sUserName1)
				Else
					If ($sUserName1 = @UserName) Then
						Return SetExtended($iUserPriv1, $sUserName1)
					Else
						Return SetExtended($iUserPriv2, $sUserName2)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunc	;==>_SeCompareUserRight

Func _SeCompareUserRightEx($aUserName, $sSystem = "")
	If UBound($aUserName, 0) <> 1 Then Return SetError(87, 0, "")

	Local $sUserName = $aUserName[0]
	For $i = 1 To UBound($aUserName) - 1
		$sUserName = _SeCompareUserRight($sUserName, $aUserName[$i], $sSystem)
		If (@error) Then Return SetError(@error, 0, "")
	Next

	Return SetExtended(@Extended, $sUserName)
EndFunc	;==>_SeCompareUserRightEx

Func _SeOpenUserBrowser($sTitle, $sDomain = "", $hWnd = 0, $iFlags = $SE_USER_BROWSER_DEFAULT, $sHeapFile = "")
	Local $tBuffer, $pBuffer, $iResult, $hBrowser, $tEnum, $pEnum, $aResult[1][7]

	If ($iFlags < 1) Or IsKeyword($iFlags) Then $iFlags = $SE_USER_BROWSER_DEFAULT

	$tBuffer = DllStructCreate($tagSE_USER_BROWSER)
	$pBuffer = DllStructGetPtr($tBuffer)

	DllStructSetData($tBuffer, "Size", 36)
	DllStructSetData($tBuffer, "hWnd", $hWnd)
	DllStructSetData($tBuffer, "Flags", $iFlags)

	If $sTitle Then
		DllStructSetData($tBuffer, "szTitle", $sTitle)
		DllStructSetData($tBuffer, "Title", DllStructGetPtr($tBuffer, "szTitle"))
	EndIf

	If $sDomain Then
		DllStructSetData($tBuffer, "szDomain", $sDomain)
		DllStructSetData($tBuffer, "Domain", DllStructGetPtr($tBuffer, "szDomain"))
	EndIf

	If $sHeapFile Then
		DllStructSetData($tBuffer, "szHeapFile", $sHeapFile)
		DllStructSetData($tBuffer, "HeapFile", DllStructGetPtr($tBuffer, "szHeapFile"))
	EndIf

	$iResult = DllCall("Netui2.dll", "int", "OpenUserBrowser", "ptr", $pBuffer)
	If DllStructGetData($tBuffer, "Cancelled") Then
		Return SetError(1223, 0, $aResult)
	Else
		If ($iResult[0] = 0) Then
			Return SetError(_SeLastError(), 0, $aResult)
		EndIf
	EndIf

	$hBrowser = $iResult[0]
	$tEnum = DllStructCreate($tagSE_ENUM_USER_SELECTION)
	$pEnum = DllStructGetPtr($tEnum)

	While 1
		$iResult = DllCall("Netui2.dll", "bool", "EnumUserBrowserSelection", "ptr", $hBrowser, _
				"ptr", $pEnum, "dword*", 1056)

		If ($iResult[0] = 0) Then ExitLoop

		$aResult[0][0] += 1
		Redim $aResult[$aResult[0][0] + 1][7]

		$aResult[$aResult[0][0]][0] = _SeNetBuffer(DllStructGetData($tEnum, "Domain"))
		$aResult[$aResult[0][0]][1] = _SeConvertSidToSSid(DllStructGetData($tEnum, "Sid2"))
		$aResult[$aResult[0][0]][2] = _SeNetBuffer(DllStructGetData($tEnum, "UserName"))
		$aResult[$aResult[0][0]][3] = _SeConvertSidToSSid(DllStructGetData($tEnum, "Sid1"))
		$aResult[$aResult[0][0]][4] = _SeNetBuffer(DllStructGetData($tEnum, "DisplayName"))
		$aResult[$aResult[0][0]][5] = _SeNetBuffer(DllStructGetData($tEnum, "Description"))
		$aResult[$aResult[0][0]][6] = DllStructGetData($tEnum, "SidType")
	WEnd

	DllCall("Netui2.dll", "none", "CloseUserBrowser", "ptr", $hBrowser)
	Return SetError(0, 0, $aResult)
EndFunc	;==>_SeOpenUserBrowser

Func _SeProtectData($vData, $vEntropy = "", $iFlags = $SE_CRYPTPROTECT_CREATOR, _
			$sDescr = "", $iPromptFlags = $SE_CRYPTPROTECT_NOPROMPT, _
			$sPrompt = "", $hWnd = 0)

	Local $tEntropy, $tEntrypyData, $tData, $tDataProtect, $tPrompt
	Local $tPromptData, $tOutput, $tBinary, $pBinary, $bBinary

	If ($vEntropy <> "") Then
		$tEntropyData = _SeCreateBuffer($vEntropy)
		$tEntropy = DllStructCreate($tagSE_DATA_BLOB)
		DllStructSetData($tEntropy, "Length", DllStructGetSize($tEntropyData))
		DllStructSetData($tEntropy, "Data", DllStructGetPtr($tEntropyData))
	EndIf

	If ($iPromptFlags <> $SE_CRYPTPROTECT_NOPROMPT) Then
		$tPrompt = DllStructCreate($tagSE_CRYPT_PROMPT)
		DllStructSetData($tPrompt, "Size", 16)
		DllStructSetData($tPrompt, "PromptFlags", $iPromptFlags)
		DllStructSetData($tPrompt, "HWndParent", $hWnd)

		$tPromptData = DllStructCreate("wchar Prompt[" & StringLen($sPrompt) + 1 & "]")
		DllStructSetData($tPrompt, "Prompt", DllStructGetPtr($tPromptData))
		DllStructSetData($tPromptData, "Prompt", $sPrompt)
	EndIf

	$tDataProtect = _SeCreateBuffer($vData)
	$tData = DllStructCreate($tagSE_DATA_BLOB)
	$tOutput = DllStructCreate($tagSE_DATA_BLOB)

	DllStructSetData($tData, "Length", DllStructGetSize($tDataProtect))
	DllStructSetData($tData, "Data", DllStructGetPtr($tDataProtect))

	$iResult = DllCall("Crypt32.dll", "bool", "CryptProtectData", _
				"ptr", DllStructGetPtr($tData), _
				"wstr", $sDescr, _
				"ptr", DllStructGetPtr($tEntropy), _
				"ptr", 0, _
				"ptr", DllStructGetPtr($tPrompt), _
				"dword", $iFlags, _
				"ptr", DllStructGetPtr($tOutput))

	If ($iResult[0] = 0) Then Return SetError(_SeLastError(), 0, Binary(""))

	$pBinary = DllStructGetData($tOutput, "Data")
	$tBinary = DllStructCreate("byte Binary[" & DllStructGetData($tOutput, "Length") & "]", $pBinary)
	$bBinary = DllStructGetData($tBinary, "Binary")
	Return SetError(0, _SeLocalFree($pBinary), $bBinary)
EndFunc	;==>_SeProtectData

Func _SeUnprotectData($bBinary, $vEntropy = "", $iFlags = $SE_CRYPTPROTECT_CREATOR, _
		$iPromptFlags = $SE_CRYPTPROTECT_NOPROMPT, $sPrompt = "", $hWnd = 0)

	Local $tEntropyData, $tEntropy, $tBinary, $tPrompt
	Local $tPromptData, $tOutput, $tReturn, $pReturn, $bReturn

	If ($vEntropy <> "") Then
		$tEntropyData = _SeCreateBuffer($vEntropy)
		$tEntropy = DllStructCreate($tagSE_DATA_BLOB)
		DllStructSetData($tEntropy, "Length", DllStructGetSize($tEntropyData))
		DllStructSetData($tEntropy, "Data", DllStructGetPtr($tEntropyData))

	EndIf

	If ($iPromptFlags <> $SE_CRYPTPROTECT_NOPROMPT) Then
		$tPrompt = DllStructCreate($tagSE_CRYPT_PROMPT)
		DllStructSetData($tPrompt, "Size", 16)
		DllStructSetData($tPrompt, "PromptFlags", $iPromptFlags)
		DllStructSetData($tPrompt, "hWndParent", $hWnd)

		$tPromptData = DllStructCreate("wchar Prompt[" & StringLen($sPrompt) + 1 & "]")
		DllStructSetData($tPrompt, "Prompt", DllStructGetPtr($tPromptData))
		DllStructSetData($tPromptData, "Prompt", $sPrompt)
	EndIf

	$tBinary = DllStructCreate($tagSE_DATA_BLOB & ";ubyte Binary[" & BinaryLen($bBinary) & "]")
	DllStructSetData($tBinary, "Length", BinaryLen($bBinary))
	DllStructSetData($tBinary, "Data", DllStructGetPtr($tBinary, "Binary"))
	DllStructSetData($tBinary, "Binary", $bBinary)

	$tOutput = DllStructCreate($tagSE_DATA_BLOB)

	$iResult = DllCall("Crypt32.dll", "bool", "CryptUnprotectData", _
			"ptr", DllStructGetPtr($tBinary), _
			"wstr", "", _
			"ptr", DllStructGetPtr($tEntropy), _
			"ptr", 0, _
			"ptr", DllStructGetPtr($tPrompt), _
			"dword", $iFlags, _
			"ptr", DllStructGetPtr($tOutput))

	If ($iResult[0] = 0) Then Return SetError(_SeLastError(), 0, Binary(""))

	$pReturn = DllStructGetData($tOutput, "Data")
	$tReturn = DllStructCreate("ubyte Binary[" & DllStructGetData($tOutput, "Length") & "]", $pReturn)
	$bReturn = DllStructGetData($tReturn, "Binary")

	Return SetError(0, _SeLocalFree($pReturn), $bReturn)
EndFunc	;==>_SeUnprotectData

Func _SeCreateBuffer($vData, $fAlign = 0)
	Local $tBuffer, $sType, $iLen

	Switch VarGetType($vData)
	Case "int32"
		$sType = "long"
	Case "ptr", "hwnd", "handle"
		$sType = "ptr"
	Case "int64"
		$sType = "int64"
	Case "float", "double"
		$sType = "double"
	Case "bool", "keyword"
		$sType = "bool"
	Case "binary"
		$iLen = BinaryLen($vData) 
		If $fAlign Then $iLen = Int($iLen / 4) * 4 + (BitAnd($iLen, 3) <> 0) * 4
		$sType = "ubyte[" & $iLen & "]"

	Case "string"
		$iLen = StringLen($vData) + 1
		If $fAlign Then $iLen = Int($iLen / 4) * 4 + (BitAnd($iLen, 3) <> 0) * 4

		If StringIsAscii($vData) Then
			$sType = "char[" & $iLen & "]"
		Else
			$sType = "wchar[" & $iLen & "]"
		EndIf
	Case "DllStruct"
		Return $vData
	Case Else
		Return SetError(87, 0, 0)
	EndSwitch

	$tBuffer = DllStructCreate($sType)
	DllStructSetData($tBuffer, 1, $vData)

	Return SetError(@error, DllStructGetSize($tBuffer), $tBuffer)
EndFunc	;==>_SeCreateBuffer

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeFormatMsg
; Description	: Specifies an error code, returns an error message.
; Parameter(s)	: $sFuction	- An optional prefix of the returned message.
;		: $iError	- Error code to be formated, default to the last @error.
;		: $sLibrary	- Optional string indicates the path of the library on where the error message is defined.
; Return values	: If succeeds, the function returns an error message corresponds to specified error code. If fails, the function returns NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeFormatMsg($sFunction = "", $iError = @error, $sLibrary = "")
	Local $pLibrary, $iFlags, $iResult

	Local Const $FORMAT_MESSAGE_IGNORE_INSERTS = 0x200
	Local Const $FORMAT_MESSAGE_FROM_HMODULE = 0x800
	Local Const $FORMAT_MESSAGE_FROM_SYSTEM = 0x1000

	$iFlags = BitOR($FORMAT_MESSAGE_FROM_SYSTEM, $FORMAT_MESSAGE_IGNORE_INSERTS)

	If ($sLibrary) Then
		$pLibrary = DllCall("Kernel32.dll", "ptr", "LoadLibraryEx", "str", $sLibrary, "handle", 0, "dword", 2)
		If ($pLibrary[0]) Then
			$pLibrary = $pLibrary[0]
			$iFlags = BitOR($iFlags, $FORMAT_MESSAGE_FROM_HMODULE)
		Else
			$pLibrary = 0
		EndIf
	EndIf

	If BitShift($iError, 16) Then $iError = snts($iError)

	$iResult = DllCall("Kernel32.dll", "dword", "FormatMessageA", "dword", $iFlags, _
			"ptr", $pLibrary, "dword", $iError, "dword", 1024, "str", "", _
			"dword", 4096, "ptr", 0)

	If $pLibrary Then DllCall("Kernel32.dll", "bool", "FreeLibrary", "ptr", $pLibrary)

	If $iResult[5] Then
		$iResult[5] = StringReplace($iResult[5], @CRLF, "")
	Else
		$iResult[5] = StringFormat("General failure (0x%08X)", $iError)
	EndIf

	If Not ($sFunction == "") Then
		Return StringFormat("%s: %s", $sFunction, $iResult[5])
	Else
		Return $iResult[5]
	EndIf
EndFunc	;==>_SeFormatMsg

Func _SeLookupPrivsFromDacl($pDacl1, $pDacl2, $pSid = 0)
	Local $iMask1, $iMask2

	If ($pSid = 0) Then $pSid = _SeLookupAccountName(@UserName)

	$iMask1 = _SeGetEffectiveRightsFromAcl($pDacl1, $pSid)
	$iMask2 = _SeGetEffectiveRightsFromAcl($pDacl2, $pSid)

	$iMask1 = BitAnd($iMask1, 0x55555555) + BitAnd(BitShift($iMask1, 1), 0x55555555)
	$iMask1 = BitAnd($iMask1, 0x33333333) + BitAnd(BitShift($iMask1, 2), 0x33333333)
	$iMask1 = BitAnd($iMask1, 0x0F0F0F0F) + BitAnd(BitShift($iMask1, 4), 0x0F0F0F0F)
	$iMask1 = BitAnd($iMask1, 0x00FF00FF) + BitAnd(BitShift($iMask1, 8), 0x00FF00FF)
	$iMask1 = BitAnd($iMask1, 0x0000FFFF) + BitAnd(BitShift($iMask1, 16), 0x000FFFF)

	$iMask2 = BitAnd($iMask2, 0x55555555) + BitAnd(BitShift($iMask2, 1), 0x55555555)
	$iMask2 = BitAnd($iMask2, 0x33333333) + BitAnd(BitShift($iMask2, 2), 0x33333333)
	$iMask2 = BitAnd($iMask2, 0x0F0F0F0F) + BitAnd(BitShift($iMask2, 4), 0x0F0F0F0F)
	$iMask2 = BitAnd($iMask2, 0x00FF00FF) + BitAnd(BitShift($iMask2, 8), 0x00FF00FF)
	$iMask2 = BitAnd($iMask2, 0x0000FFFF) + BitAnd(BitShift($iMask2, 16), 0x000FFFF)

	If ($iMask1 > $iMask2) Then
		Return $pDacl1
	Else
		Return $pDacl2
	EndIf
EndFunc	;==>_SeLookupPrivsFromDacl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetShareObjectDacl
; Description	: This function retrieves the access permissions of a specified shared object.
; Parameter(s)	: $sObject	- Name of the share object.
; Return values	: If succeeds, the function returns a pointer to DACL of the shared object. If fails, the function returns NULL and sets @error to the reason of the failure.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetShareObjectDacl($sObject)
	Local $aSecur

	$aSecur = _SeGetNamedSecurityInfo($sObject, $SE_LMSHARE, $SE_INFO_DACL)
	Return SetError(@error, 0, $aSecur[6])
EndFunc	;==>_SeGetShareObjectDacl

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetShareObjectDacl
; Description	: This function sets the DACL for a shared resource.
; Parameter(s)	: $sObject	- Name of the share resource.
;		: $pDacl	- A pointer to a DACL.
; Return values	: If success, the function returns TRUE, otherwise FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetShareObjectDacl($sObject, $pDacl)
	Local $fResult

	$fResult = _SeSetNamedSecurityInfo($sObject, $SE_LMSHARE, $SE_INFO_DACL, 0, 0, $pDacl, 0)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_SeSetShareObjectDacl

Func _SeBinaryToString($vBinary, $iFlags = $SE_STRING_BASE64)
	Local $tBuffer, $pBuffer, $iSizeofBuffer, $iResult, $tOutput, $pOutput, $sOutput

	$tBuffer = _SeCreateBuffer($vBinary)
	If Not IsDllStruct($tBuffer) Then Return SetError(@error, 0, "")

	$pBuffer = DllStructGetPtr($tBuffer)
	$iSizeofBuffer = DllStructGetSize($tBuffer)

	$iResult = DllCall("Crypt32.dll", "bool", "CryptBinaryToString", "ptr", $pBuffer, _
			"dword", $iSizeofBuffer, "dword", $iFlags, "ptr", 0, "dword*", 0)

	If ($iResult[5] = 0) Then Return SetError(_SeLastError(), 0, "")

	$tOutput = DllStructCreate("char Text[" & $iResult[5] & "]")
	$pOutput = DllStructGetPtr($tOutput)

	$iResult = DllCall("Crypt32.dll", "bool", "CryptBinaryToString", "ptr", $pBuffer, _
			"dword", $iSizeofBuffer, "dword", $iFlags, "ptr", $pOutput, "dword*", $iResult[5])
	$tBuffer = 0

	Return SetError(0, $iResult[5], DllStructGetData($tOutput, "Text"))
EndFunc	;==>_SeBinaryToString

Func _SeStringToBinary($sString, $iFlags = $SE_STRING_BASE64)
	Local $iResult, $tBinary, $pBinary, $tText, $pText, $iText

	$tText = _SeCreateBuffer($sString)
	$pText = DllStructGetPtr($tText)
	$iText = DllStructGetSize($tText)

	$iResult = DllCall("Crypt32.dll", "bool", "CryptStringToBinary", "ptr", $pText, _
			"dword", $iText, "dword", $iFlags, "ptr", 0, "dword*", 0, "dword*", 0, "dword*", 0)

	If ($iResult[5] = 0) Then Return SetError(_SeLastError(), 0, Binary(""))

	$tBinary = DllStructCreate("ubyte Binary[" & $iResult[5] & "]")
	$pBinary = DllStructGetPtr($tBinary)

	$iResult = DllCall("Crypt32.dll", "bool", "CryptStringToBinary", "ptr", $pText, _
			"dword", 0, "dword", $iFlags, "ptr", $pBinary, "dword*", $iResult[5], _
			"dword*", 0, "dword*", 0)

	Return SetError(0, $iResult[7], DllStructGetData($tBinary, "Binary"))
EndFunc	;==>_SeStringToBinary

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeBackupPassword
; Description	: This function displays a "Forgotten Password Wizard" dialog, and prompt user to backup the password of the current user, by using a blank U-style drive.
; Parameter(s)	: $hWnd	- Handle to a parent window that owns the dialog box, if NULL specified, the current active window is used.
;		: $fWait	- If TRUE, the function does not return until the backup is completed. If FALSE, the function displays the wizard and returns immediately.
; Return values	: If the function fails, the returns value is NULL. Otherwise, if $fWait is specified to TRUE, the return value is a BOOLEAN value that defines the success of failure of the backup operation; if $fWait is specified to FALSE, the return value is a handle to the thread which is to backup the password, caller can use this returned handle to handle the backup operation, and pass the handle to __SeGetExitCodeThread to determine the success or failure.
; Author	: Pusofalse
; Remarks	: Anyone can use the "password reset" disk to reset to the password, and therefore have access to current user.
; ============================================================================================================
Func _SeBackupPassword($hWnd = 0, $fWait = 1)
	If ($hWnd) And (0 = WinExists($hWnd)) Then Return 0

	Local Static $pStartAddr, $bCode, $pProcedures, $hThread, $fSuccess

	If ($pStartAddr) Then
		$hThread = __SeCreateThread($pStartAddr, $hWnd)
		If ($fWait) Then
			__SeWaitForObject($hThread)
			$fSuccess = __SeGetExitCodeThread($hThread)
			Return SetError(@error, _SeCloseHandle($hThread), $fSuccess)
		Else
			Return $hThread
		EndIf
	EndIf

	$pStartAddr = __SeVirtualAlloc(256)
	$pProcedures = $pStartAddr + 72

	$bCode = "0x" & _
		"55" & _						; push	ebp
		"8BEC" & _						; mov	ebp, esp
		"51" & _						; push	ecx
		"53" & _						; push	ebx
		"BB" & __SeLongPtrToBytes($pProcedures) & _		; mov	ebx, pProcedures
		"68" & __SeLongPtrToBytes($pProcedures + 12) & _	; push	*("KeyMgr.dll")
		"FF13" & _						; call	dword ptr [ebx]
		"85C0" & _						; test	eax, eax
		"74" & Hex(33, 2) & _					; jz	$+21
		"8945FC" & _						; mov	dword ptr [ebp-4], eax
		"68" & __SeLongPtrToBytes($pProcedures + 24) & _	; push	*("PRShowSaveWizardExW")
		"50" & _						; push	eax
		"FF5304" & _						; call	dword ptr [ebx+4]
		"85C0" & _						; test	eax, eax
		"74" & Hex(22, 2) & _					; jz	$+16
		"6A00" & _						; push	0
		"6A00" & _						; push	0
		"6A00" & _						; push	0
		"FF7508" & _						; push	dword ptr [ebp+8]
		"FFD0" & _						; call	eax
		"FF75FC" & _						; push	dword ptr [ebp-4]
		"FF5308" & _						; call 	dword ptr [ebx+8]
		"5B" & _						; pop	ebx
		"C9" & _						; leave
		"C20400" & _						; ret	4
		"FF75FC" & _						; push	dword ptr [ebp-4]
		"FF5308" & _						; call	dword ptr [ebx+8]
		"33C0" & _						; xor	eax, eax
		"EB" & Hex(-15, 2) & _					; jmp	$-f
		"909090" & _						; nop	(for 4 bytes alignment)
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "LoadLibraryA")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "GetProcAddress")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "FreeLibrary")) & _
		__SeStringToBytesA("KeyMgr.dll") & "00" & _
		__SeStringToBytesA("PRShowSaveWizardExW") & "0000"

	_SeWriteBytes($pStartAddr, $bCode, "binary", BinaryLen($bCode))

	$hThread = __SeCreateThread($pStartAddr, $hWnd)
	If ($fWait) Then
		__SeWaitForObject($hThread)
		$fSuccess = __SeGetExitCodeThread($hThread)
		Return SetError(@error, _SeCloseHandle($hThread), $fSuccess)
	Else
		Return $hThread
	EndIf
EndFunc	;==>_SeBackupPassword

Func _SePolicyQueryInformation($hPolicy, $iInfoClass)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaQueryInformationPolicy", _
			"ptr", $hPolicy, "long", $iInfoClass, "ptr*", 0)
	Return SetError(snts($iResult[0]), 0, $iResult[3])
EndFunc	;==>_SePolicyQueryInformation

Func _SePolicyQueryAuditEvent($sSystem = "")
	Local $pAuditEvent, $hPolicy, $pEventOptions, $aResult[1][2] = [[0]]

	$hPolicy = _SeOpenPolicy($SE_POLICY_VIEW_AUDIT_INFORMATION, $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, $aResult)

	$pAuditEvent = _SePolicyQueryInformation($hPolicy, $SE_POLICY_AUDIT_EVENTS_INFO)
	If (@error) Then Return SetError(@error, _SeClosePolicy($hPolicy), $aResult)

	Local $aEventType[9] = [$SE_POLICY_AUDIT_SYSTEM, _
				$SE_POLICY_AUDIT_LOGON, $SE_POLICY_AUDIT_OBJECT_ACCESS, _
				$SE_POLICY_AUDIT_PRIVILEGE_USE, $SE_POLICY_AUDIT_DETAILTRACKING, _
				$SE_POLICY_AUDIT_POLICY_CHANGE, $SE_POLICY_AUDIT_ACCOUNT_MANAGE, _
				$SE_POLICY_AUDIT_DIRECTORY_SERVICE_ACCESS, $SE_POLICY_AUDIT_ACCOUNT_LOGON]

	$aResult[0][0] = _SeReadBytes($pAuditEvent + 8)
	$aResult[0][1] = _SeReadBytes($pAuditEvent + 0)
	$pEventOptions = _SeReadBytes($pAuditEvent + 4)

	Redim $aResult[$aResult[0][0] + 1][2]

	For $i = 1 To $aResult[0][0]
		$aResult[$i][0] = $aEventType[$i - 1]
		$aResult[$i][1] = _SeReadBytes($pEventOptions + ($i - 1) * 4)
	Next
	Return SetError(_SeClosePolicy($hPolicy) * 0, _SeFreeMemory($pAuditEvent), $aResult)
EndFunc	;==>_SePolicyQueryAuditEvent

Func _SePolicySetInformation($hPolicy, $iInfoClass, $vBuffer, $sBufferType = "ptr")
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaSetInformationPolicy", _
			"ptr", $hPolicy, "long", $iInfoClass, $sBufferType, $vBuffer)
	If (@error) Then
		Return SetError(87, 0, False)
	Else
		Return SetError(snts($iResult[0]), 0, $iResult[0] = 0)
	EndIf
EndFunc	;==>_SePolicySetInformation

Func _SePolicySetAuditEvent($aEventOption, $sSystem = "")
	If UBound($aEventOption, 0) <> 2 Then Return SetError(87, 0, 0)
	If UBound($aEventOption, 2) <> 2 Then Return SetError(87, 0, 0)
	If UBound($aEventOption, 1)  > 9 Then Return SetError(87, 0, 0)

	Local $hPolicy, $pAuditEvent, $pEventOptions, $fResult

	$hPolicy = _SeOpenPolicy($SE_POLICY_SET_AUDIT_REQUIREMENTS, $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, 0)

	Local $aEventType[9] = [$SE_POLICY_AUDIT_SYSTEM, _
				$SE_POLICY_AUDIT_LOGON, $SE_POLICY_AUDIT_OBJECT_ACCESS, _
				$SE_POLICY_AUDIT_PRIVILEGE_USE, $SE_POLICY_AUDIT_DETAILTRACKING, _
				$SE_POLICY_AUDIT_POLICY_CHANGE, $SE_POLICY_AUDIT_ACCOUNT_MANAGE, _
				$SE_POLICY_AUDIT_DIRECTORY_SERVICE_ACCESS, $SE_POLICY_AUDIT_ACCOUNT_LOGON]

	$pAuditEvent = _SeHeapAlloc(48)
	$pEventOptions = $pAuditEvent + 12

	For $i = 0 To UBound($aEventOption) - 1
		For $j = 0 To 8
			If ($aEventOption[$i][0] = $aEventType[$j]) Then
				_SeWriteBytes($pEventOptions + $j * 4, $aEventOption[$j][1])
				ExitLoop
			EndIf
		Next
	Next

	_SeWriteBytes($pAuditEvent + 0, 1)
	_SeWriteBytes($pAuditEvent + 8, 9)
	_SeWriteBytes($pAuditEvent + 4, $pEventOptions)

	$fResult = _SePolicySetInformation($hPolicy, 2, $pAuditEvent)
	Return SetError(@error, _SeClosePolicy($hPolicy) * _SeHeapFree($pAuditEvent), $fResult)
EndFunc	;==>_SePolicySetAuditEvent

Func _SePolicyQueryLsaServerRole($sSystem = "")
	Local $hPolicy, $pServerRole, $iServerRole

	$hPolicy = _SeOpenPolicy($SE_POLICY_VIEW_LOCAL_INFORMATION, $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, 0)

	$pServerRole = _SePolicyQueryInformation($hPolicy, $SE_POLICY_LSA_SERVER_ROLE_INFO)
	If (@error) Then Return SetError(@error, _SeClosePolicy($hPolicy), 0)

	$iServerRole = _SeReadBytes($pServerRole)
	Return SetError(_SeFreeMemory($pServerRole), _SeClosePolicy($hPolicy), $iServerRole)
EndFunc	;==>_SePolicyQueryLsaServerRole

; _CallBack($pBaseAddress, $iLength, $pBackup, $iEqualed)
Func _SeRegisterMemoryNotify($pBaseAddress, $iLength, $pCallBack)
	If (($pBaseAddress * $iLength * $pCallBack) = 0) Then Return SetError(87, 0, 0)

	If ($iLength > 1024 * 64) Then Return SetError(234, 0, 0)

	Local $tBuffer, $pBuffer, $hThread
	Local Static $pStartAddr, $bCode, $pProcedures, $hWnd

	If Not $hWnd Then
		$pStartAddr = __SeVirtualAlloc(1024)
		$pProcedures = $pStartAddr + 148

	$bCode = "0x" & _
		"55" & _						; push	ebp
		"8BEC" & _						; mov	ebp, esp
		"53" & _						; push	ebx
		"BB" & __SeLongPtrToBytes($pProcedures) & _		; mov	ebx, pProcedures
		"56" & _						; push	esi
		"8B7508" & _						; mov	esi, dword ptr [ebp+8]
		"57" & _						; push	edi
		"2B6604" & _						; sub	esp, dword ptr [esi+4]
		"8BFC" & _						; mov	edi, esp
		"FF7604" & _						; push	dword ptr [esi+4]
		"FF36" & _						; push	dword ptr [esi]
		"57" & _						; push	edi
		"FF13" & _						; call	dword ptr [&ebx:RtlMoveMemory]
		"6A07" & _						; push	7
		"FF5314" & _						; call	dword ptr [&ebx+14:Sleep]
		"FF7604" & _						; push	dword ptr [esi+4]
		"FF36" & _						; push	dword ptr [esi]
		"57" & _						; push	edi
		"FF5304" & _						; call	dword ptr [&ebx+4:RtlCompareMemory]
		"3B4604" & _						; cmp	eax, dword ptr [esi+4]
		"74" & Hex(-19, 2) & _					; jz	$-13
		"89460C" & _						; mov	dword ptr [esi+c], eax
		"56" & _						; push	esi
		"57" & _						; push	edi
		"687C3F0000" & _					; push	3f7c
		"FF7610" & _						; push	dword ptr [esi+10]
		"FF5308" & _						; call	dword ptr [&ebx+8:SendMessageW]
		"85C0" & _						; test	eax, eax
		"75" & Hex(-39, 2) & _					; jnz	$-27
		"036604" & _						; add	esp, dword ptr [esi+4]
		"56" & _						; push	esi
		"6A00" & _						; push	0
		"FF530C" & _						; call	dword ptr [&ebx+c:GetProcessHeap]
		"50" & _						; push	eax
		"FF5310" & _						; call	dword ptr [&ebx+10:RtlFreeHeap]
		"5F" & _						; pop	edi
		"5E" & _						; pop	esi
		"5B" & _						; pop	ebx
		"5D" & _						; pop	ebp
		"C20400" & _						; ret	4
		"9090" & _						; nop	(for 4 bytes alignment)
		"55" & _						; push	ebp
		"8BEC" & _						; mov	ebp, esp
		"817D0C7C3F0000" & _					; cmp	dword ptr [ebp+c], 3f7c
		"74" & Hex(28, 2) & _					; jz	$+1c
		"FF7514" & _						; push	dword ptr [ebp+14]
		"FF7510" & _						; push	dword ptr [ebp+10]
		"FF750C" & _						; push	dword ptr [ebp+c]
		"FF7508" & _						; push	dword ptr [ebp+8]
		"FF35" & __SeLongPtrToBytes($pProcedures + 1020) & _	; push	dword ptr [???]
		"FF15" & __SeLongPtrToBytes($pProcedures + 24) & _	; call	dword ptr [&CallWindowProcW]
		"5D" & _						; pop	ebp
		"C21000" & _						; ret	10
		"8B4514" & _						; mov	eax, dword ptr [ebp+14]
		"FF700C" & _						; push	dword ptr [eax+c]
		"FF7510" & _						; push	dword ptr [ebp+10]
		"FF7004" & _						; push	dword ptr [eax+4]
		"FF30" & _						; push	dword ptr [eax]
		"FF5008" & _						; call	dword ptr [eax+8]
		"EB" & Hex(-23, 2) & _					; jmp	$-17
		"90" & _						; nop
		__SeLongPtrToBytes(__SeGetProcAddress("Ntdll.dll", "RtlMoveMemory")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Ntdll.dll", "RtlCompareMemory")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("User32.dll", "SendMessageW")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "GetProcessHeap")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "HeapFree")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "Sleep")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("User32.dll", "CallWindowProcW"))

		$hWnd = GUICreate("", 7, 7)
		_SeWriteBytes($pStartAddr, $bCode, "binary", BinaryLen($bCode))

	Local $p = DllCall("User32.dll", "ptr", "SetWindowLong", "hWnd", $hWnd, "int", -4, "ptr", $pStartAddr + 88)
		_SeWriteBytes($pStartAddr + 1020, $p[0], "ptr", 4)
	EndIf

	$pBuffer = _SeHeapAlloc(20)

	$tBuffer = DllStructCreate($tagSE_MEMORY_NOTIFY, $pBuffer)
	DllStructSetData($tBuffer, "BaseAddress", $pBaseAddress)
	DllStructSetData($tBuffer, "Length", $iLength)
	DllStructSetData($tBuffer, "CallBack", $pCallBack)
	DllStructSetData($tBuffer, "Reserved", $hWnd)

	$hThread = __SeCreateThread($pStartAddr, $pBuffer, 0, 1024 * 128)
	Return SetError(@error, 0, $hThread)
EndFunc	;==>_SeRegisterMemoryNotify

Func _SeCreateSecurityDescriptor(ByRef $pSecur, $iSecurInfo, $fDefault, _
		$pOwner = 0, $pGroup = 0, $pDacl = 0, $pSacl = 0)

	If $pSecur = 0 Then $pSecur = _SeInitSecurityDescriptor()

	If BitAnd($iSecurInfo, $SE_INFO_DACL) And Not _SeSetSecurityDescriptorDacl($pSecur, $pDacl, $fDefault) Then
		Return SetError(@error, _SeHeapFree($pSecur), 0)
	EndIf

	If BitAnd($iSecurInfo, $SE_INFO_SACL) And Not _SeSetSecurityDescriptorSacl($pSecur, $pSacl, $fDefault) Then
		Return SetError(@error, _SeHeapFree($pSecur), 0)
	EndIf

	If BitAnd($iSecurInfo, $SE_INFO_OWNER) And Not _SeSetSecurityDescriptorOwner($pSecur, $pOwner, $fDefault) Then
		Return SetError(@error, _SeHeapFree($pSecur), 0)
	EndIf

	If BitAnd($iSecurInfo, $SE_INFO_GROUP) And Not _SeSetSecurityDescriptorGroup($pSecur, $pGroup, $fDefault) Then
		Return SetError(@error, _SeHeapFree($pSecur), 0)
	EndIf

	Return SetError(0, 0, $pSecur)
EndFunc	;==>_SeCreateSecurityDescriptor

Func _SeLogonUser($sUserName, $sPassword, $iType = $SE_LOGON32_LOGON_INTERACTIVE, _
			$iProvider = $SE_LOGON32_PROVIDER_DEFAULT, $sDomain = "")

	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "LogonUser", "str", $sUserName, _
			"str", $sDomain, "str", $sPassword, "dword", $iType, "dword", $iProvider, _
			"handle*", 0)
	Return SetError(_SeLastError(), $iResult[0], $iResult[6])
EndFunc	;==>_SeLogonUser

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGenRandom
; Description	: This function generates random bytes.
; Parameter(s)	: $iLength	- Length of the random bytes.
; Return values	: If succeeds, the function returns a pointer to a buffer contains the random bytes. Or NULL if the function fails.
; Author	: Pusofalse
; Remarks	: When you no longer use the returned buffer, call _SeHeapFree function to free it.
; ============================================================================================================
Func _SeGenRandom($iLength = 4)
	If $iLength = 0 Then $iLength = 4

	Local $iResult, $pBuffer = _SeHeapAlloc($iLength)

	$iResult = DllCall("AdvApi32.dll", "bool", "SystemFunction036", "ptr", $pBuffer, "ulong", $iLength)

	If @error Then
		Return SetError(1, _SeHeapFree($pBuffer), 0)
	Else
		If ($iResult[0]) Then
			Return $pBuffer
		Else
			Return SetError(_SeLastError(), _SeHeapFree($pBuffer), 0)
		EndIf
	EndIf
EndFunc	;==>_SeGenRandom

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCipherDes16
; Description	: Encrypts or decrypts two DES blocks with a 32 bits key.
; Parameter(s)	: $pBuffer	- A pointer to a buffer contains the data to encrypt or decrypt, 16 bytes.
;		: $iKey32	- A key value used to encrypt or decrypt, 4 bytes.
;		: $fEncrypt	- TRUE to encrypt, FALSE to decrypt.
; Return values	: Returns TRUE if succeeds, otherwise returns FALSE, and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeCipherDes16($pBuffer, $iKey32, $fEncrypt = 1)
	Local $iResult, $pOutput = _SeHeapAlloc(16)

	If $fEncrypt Then
		$iResult = DllCall("AdvApi32.dll", "dword", "SystemFunction025", _
				"ptr", $pBuffer, "dword*", $iKey32, "ptr", $pOutput)
	Else
		$iResult = DllCall("AdvApi32.dll", "dword", "SystemFunction026", _
				"ptr", $pBuffer, "dword*", $iKey32, "ptr", $pOutput)
	EndIf

	If (@error) Then
		Return SetError(1, _SeHeapFree($pOutput), 0)
	Else
		If ($iResult[0]) Then
			Return SetError(snts($iResult[0]), _SeHeapFree($pOutput), 0)
		Else
			Return SetExtended(_SeCopyMemory($pBuffer, $pOutput, 16), _SeHeapFree($pOutput))
		EndIf
	EndIf
EndFunc	;==>_SeCipherDes16

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeInitObjAttrib
; Description	: This function initializes a OBJECT_ATTRIBUTES structure.
; Parameter(s)	: $sObject	- Object name.
;		: $iAttrib	- Attribute flags.
;		: $pSecurDescr	- Optional security descriptor.
;		: $hRootDir	- Handle to the root object related to the $sObject.
;		: $pSecurQos	- Optional pointer to SECURITY_QOS structure.
; Return values	: Pointer to the OBJECT_ATTRIBUTES structure.
; Author	: Pusofalse
; ============================================================================================================
Func _SeInitObjAttrib($sObject, $iAttrib = 0, $pSecurDescr = 0, $hRootDir = 0, $pSecurQos = 0)
	Local $pObjAttrib, $tObjAttrib

	$pObjAttrib = _SeHeapAlloc(24)
	$tObjAttrib = DllStructCreate($tagSE_SECUR_ATTRIB, $pObjAttrib)

	DllStructSetData($tObjAttrib, "Length", 24)
	DllStructSetData($tObjAttrib, "RootDir", $hRootDir)
	DllStructSetData($tObjAttrib, "BufferW", _SeInitBufferW($sObject))
	DllStructSetData($tObjAttrib, "Attributes", $iAttrib)
	DllStructSetData($tObjAttrib, "Securitydescriptor", $pSecurDescr)
	DllStructSetData($tObjAttrib, "SecurityQos", $pSecurQos)

	Return $pObjAttrib
EndFunc	;==>_SeInitObjAttrib

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeInitSecurityQos
; Description	: This function initializes a $SE_SECURITY_QOS structure.
; Parameter(s)	: $iImpersonationLevel	- Impersonation level.
;		: $fContextTrackingMode	- Tracking Mode.
;		: $fEffectiveOnly	- Effective option.
; Return values	: This function always returns a pointer to a $SE_SECURITY_QOS structure.
; Author	: Pusofalse
; Remarks	: When you no longer use the returned pointer, call _SeHeapFree function to free it.
; ============================================================================================================
Func _SeInitSecurityQos($iImpersonationLevel = $SE_SECUR_IMPERSONATION, _
		$fContextTrackingMode = $SE_SECUR_STATIC_TRACKING, _
		$fEffectiveOnly = 0)

	Local $pSecurQos = _SeHeapAlloc(16), $tSecurQos

	$tSecurQos = DllStructCreate($tagSE_SECURITY_QOS, $pSecurQos)
	DllStructSetData($tSecurQos, "Length", 16)
	DllStructSetData($tSecurQos, "ImpersonationLevel", $iImpersonationLevel)
	DllStructSetData($tSecurQos, "ContextTrackingMode", $fContextTrackingMode)
	DllStructSetData($tSecurQos, "EffectiveOnly", $fEffectiveOnly)

	Return $pSecurQos
EndFunc	;==>_SeInitSecurityQos

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeOpenSecret
; Description	: Opens a secret object and retrieves its handle.
; Parameter(s)	: $sSecret	- Name of the secret.
;		: $iDesiredAccess	- Access rights.
;		: $sSystem	- System on which the secret is stored.
; Return values	: Handle to the secret is returned if succeeds, else NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeOpenSecret($sSecret, $iDesiredAccess = $SE_SECRET_ALL_ACCESS, $sSystem = "")
	Local $iResult, $hPolicy, $pSecret

	$hPolicy = _SeOpenPolicy($SE_POLICY_GET_PRIVATE_INFORMATION, $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, 0)

	$pSecret = _SeInitBufferW($sSecret)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaOpenSecret", "ptr", $hPolicy, _
			"ptr", $pSecret, "dword", $iDesiredAccess, "ptr*", 0)
	Return SetError(snts($iResult[0]), _SeClosePolicy($hPolicy) * _SeHeapFree($pSecret), $iResult[4])
EndFunc	;==>_SeOpenSecret

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeCreateSecret
; Description	: This function creates a new secret object and retrieves its handle for subsequent calls.
; Parameter(s)	: $sSecret	- Specifies the name of the secret to be created.
;		: $iDesiredAccess	- Specifies the access rights.
;		: $sSystem	- System on which the function is to execute, default to local computer.
; Return values	: If succeeds, the function returns a handle to the newly created secret, otherwise, the function returns FALSE and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeCreateSecret($sSecret, $iDesiredAccess = $SE_SECRET_ALL_ACCESS, $sSystem = "")
	Local $iResult, $hPolicy, $pSecret

	$hPolicy = _SeOpenPolicy($SE_POLICY_CREATE_SECRET, $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, 0)

	$pSecret = _SeInitBufferW($sSecret)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaCreateSecret", "ptr", $hPolicy, _
			"ptr", $pSecret, "dword", $iDesiredAccess, "ptr*", 0)

	Return SetError(snts($iResult[0]), _SeHeapFree($pSecret) * _SeClosePolicy($hPolicy), $iResult[4])
EndFunc	;==>_SeCreateSecret

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeQuerySecret
; Description	: Query the detailed value of a secret object.
; Parameter(s)	: $hSecret	- Handle to the secret, typically returned by _SeOpenSecret or _SeCreateSecret.
; Return values	: An array in the form:
;		:	$aArray[0]	- Current modify time, in the form: YYYY/MM/DD  ww  hh:mm:ss
;		:	$aArray[1]	- Last modify time, in the form: YYYY/MM/DD  ww  hh:mm:ss
;		:	$aArray[2]	- Current value, in binary format.
;		:	$aArray[3]	- Last value, in binary format.
;		: If fails, all elements of the returned array are set to NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeQuerySecret($hSecret)
	Local $iResult, $aResult[4]

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaQuerySecret", "ptr", $hSecret, _
			"ptr*", 0, "int64*", 0, "ptr*", 0, "int64*", 0)

	If ($iResult[0]) Then Return SetError(snts($iResult[0]), 0, $aResult)

	$aResult[0] = __SeFileTimeToSystemTime($iResult[3])
	$aResult[1] = __SeFileTimeToSystemTime($iResult[5])
	$aResult[2] = _SeReadBytes(_SeReadBytes($iResult[2] + 4), "binary", _SeReadBytes($iResult[2] + 2, "word", 2))
	$aResult[3] = _SeReadBytes(_SeReadBytes($iResult[4] + 4), "binary", _SeReadBytes($iResult[4] + 2, "word", 2))

	Return SetError(_SeFreeMemory($iResult[2]), _SeFreeMemory($iResult[4]), $aResult)
EndFunc	;==>_SeQuerySecret

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeSetSecret
; Description	: This function sets the current value and old value for a secret.
; Parameter(s)	: $hSecret	- Handle to the secret, must opened with SE_SECRET_READ access right.
;		: $sCurValue	- A pointer or a string contains the CurrentValue for the secret.
;		: $sOldValue	- A pointer or a string contains the OldValue for the secret.
; Return values	: If succeeds, the function returns TRUE. If fails, the function returns FALSE. To get extended error, reference @error macro.
; Author	: Pusofalse
; ============================================================================================================
Func _SeSetSecret($hSecret, $sCurValue = Default, $sOldValue = Default)
	Local $pCurValue, $pOldValue, $iResult

	If Not IsKeyword($sCurValue) Then
		If IsPtr($sCurValue) Then
			$pCurValue = $sCurValue
		Else
			$pCurValue = _SeInitBufferW($sCurValue)
		EndIf
	EndIf
	If Not IsKeyword($sOldValue) Then
		If IsPtr($sOldValue) Then
			$pOldValue = $sOldValue
		Else
			$pOldValue = _SeInitBufferW($sOldValue)
		EndIf
	EndIf

	If ($pCurValue = 0) And ($pOldValue = 0) Then Return SetError(87, 0, 0)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaSetSecret", "ptr", $hSecret, _
			"ptr", $pCurValue, "ptr", $pOldValue)

	If Not IsPtr($sCurValue) Then _SeHeapFree($pCurValue)
	If Not IsPtr($sOldValue) Then _SeHeapFree($pOldValue)

	Return SetError(snts($iResult[0]), 0, $iResult[0] = 0)
EndFunc	;==>_SeSetSecret

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetSecretSecurity
; Description	: This function retrieves a copy of security descriptor of a secret object.
; Parameter(s)	: $sSecret	- Name of the secret object.
;		: $iSecurInfo	- Specifies the security information requested, must be $SE_INFO_DACL.
; Return values	: If succeeds, the function returns a pointer to a security descriptor. Otherwise, the function returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetSecretSecurity($sSecret, $iSecurInfo = 4)
	#forceref $iSecurInfo ; BitXOR(10, BitOR($iSecurInfo, $SE_INFO_GROUP, $SE_INFO_SACL))

	Local $aSecur, $hRegKey, $sRegKey, $pSecur, $pDacl, $iResult
	Local $aList[1][4] = [[0, 0xF003F, $SE_GRANT_ACCESS, 3]]

	$sRegKey = "Machine\SECURITY\Policy\Secrets\" & $sSecret
	$aSecur = _SeGetNamedSecurityInfo($sRegKey, $SE_REGISTRY_KEY, $SE_INFO_DACL)
	If @error Then Return SetError(@error, 0, 0)

	$aList[0][0] = _SeLookupAccountName("Everyone")
	$pDacl = _SeSetEntriesInAcl($aList)
	If ($pDacl = 0) Then Return SetError(@error, _SeHeapFree($aList[0][0]), 0)

	_SeSetNamedSecurityInfo($sRegKey, $SE_REGISTRY_KEY, $SE_INFO_DACL, 0, 0, $pDacl, 0)
	If @error Then Return SetError(@error, _SeHeapFree($aList[0][0]), _SeLocalFree($pDacl) * 0)

	_SeLocalFree($pDacl)
	_SeHeapFree($aList[0][0])

	$hRegKey = DllCall("AdvApi32.dll", "dword", "RegOpenKeyExW", "handle", 0x80000002, _
			"wstr", StringTrimLeft($sRegKey, 8) & "\SecDesc", "dword", 0, _
			"dword", 0xF003F, "handle*", 0)

	_SeSetNamedSecurityInfo($sRegKey, $SE_REGISTRY_KEY, $SE_INFO_DACL, 0, 0, $aSecur[6], 0)
	If $hRegKey[0] Then Return SetError($hRegKey[0], @error, 0)

	$hRegKey = $hRegKey[5]

	$iResult = DllCall("Advapi32.dll", "dword", "RegQueryValueEx", "handle", $hRegKey, _
			"ptr", 0, "ptr", 0, "dword*", 0, "ptr", 0, "dword*", 0)

	If ($iResult[6] = 0) Then
		DllCall("Advapi32.dll", "dword", "RegCloseKey", "handle", $hRegKey)
		Return SetError($iResult[0], 0, 0)
	EndIf

	$pSecur = _SeHeapAlloc($iResult[6])

	$iResult = DllCall("Advapi32.dll", "dword", "RegQueryValueEx", "handle", $hRegKey, _
				"ptr", 0, "ptr", 0, "dword*", 0, "ptr", $pSecur, "dword*", $iResult[6])
	DllCall("Advapi32.dll", "dword", "RegCloseKey", "handle", $hRegKey)

	If ($iResult[0]) Then
		Return SetError($iResult[0], _SeHeapFree($pSecur), 0)
	Else
		Return $pSecur
	EndIf
EndFunc	;==>_SeGetSecretSecurity

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeImpersonateProcessPath
; Description	: This function set the current process to impersonate a process by using a file path.
; Parameter(s)	: $sProcessPath	- Specifies the full path of the process file.
;		: $sCommand	- Specifies the command line for current process.
; Return values	: If succeeds, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ============================================================================================================
Func _SeImpersonateProcessPath($sProcessPath, $sCommand = Default)
	Local $iResult, $pBuffer, $pPeb, $pLoader, $pLink, $pParams, $pImagePath, $pImageName, $pCommand

	$pBuffer = _SeHeapAlloc(24)

	$iResult = DllCall("Ntdll.dll", "long", "NtQueryInformationProcess", "handle", -1, _
			"int", 0, "ptr", $pBuffer, "dword", 24, "dword*", 0)

	If (@error) Then
		Return SetError(1, 0, 0)
	Else
		If ($iResult[0]) Then Return SetError(snts($iResult[0]), 0, 0)
	EndIf

	$pPeb = _SeReadBytes($pBuffer + 4, "ptr")
	$pLoader = _SeReadBytes($pPeb + 12, "ptr")
	$pLink = _SeReadBytes($pLoader + 12, "ptr")
	$pParams = _SeReadBytes($pPeb + 16, "ptr")

	$sProcessName = StringRegExpReplace($sProcessPath, ".+\\(.+)$", "\1")

	If IsKeyWord($sCommand) Then
		$sCommand = $sProcessPath & " " & $CmdLineRaw
	Else
		$sCommand = $sProcessPath & " " & $sCommand
	EndIf

	$pImagePath = _SeInitBufferW($sProcessPath)
	$pImageName = _SeInitBufferW($sProcessName)
	$pCommand = _SeInitBufferW($sCommand)

	_SeCopyMemory($pLink + 36, $pImagePath, 8)
	_SeCopyMemory($pLink + 44, $pImageName, 8)
	_SeCopyMemory($pParams + 56, $pImagePath, 8)
	_SeCopyMemory($pParams + 64, $pCommand, 8)

	Return _SeHeapFree($pBuffer)
EndFunc	;==>_SeImpersonateProcessPath

Func _SeEnumAccounts($sSystem = "")
	Local $hPolicy, $iResult, $aResult[1][2] = [[0]]

	$hPolicy = _SeOpenPolicy(BitOR($SE_POLICY_VIEW_LOCAL_INFORMATION, $SE_POLICY_LOOKUP_NAMES), $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, $aResult)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaEnumerateAccounts", "ptr", $hPolicy, _
			"int*", 0, "ptr*", 0, "dword", -1, "dword*", 0)

	If ($iResult[0]) Then Return SetError(snts($iResult[0]), _SeClosePolicy($hPolicy), $aResult)

	$aResult[0][0] = $iResult[5]
	Redim $aResult[$aResult[0][0] + 1][2]

	For $i = 1 To $aResult[0][0]
		$aResult[$i][0] = _SeReadBytes($iResult[3] + ($i - 1) * 4, "ptr")
		$aResult[$i][1] = _SeConvertSidToSSid($aResult[$i][0])
		$aResult[$i][0] = _SeLookupAccountSid($aResult[$i][0], $sSystem)
	Next
	Return SetError(_SeFreeMemory($iResult[3]), _SeClosePolicy($hPolicy), $aResult)
EndFunc	;==>_SeEnumAccounts

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeEnumPrivs
; Description	: This function lists the privileges available in specified system.
; Parameter(s)	: $sSystem	- System on which the function executes.
; Return values	: An array in the form:
;		:	$aArray[0][0]	- The number of returned privileges.
;		:	$aArray[1][0]	- Name of the 1st privilege.
;		:	$aArray[1][1]	- LUID of the 1st privilege.
;		:	$aArray[1][2]	- Description of the 1st privilege.
;		:	$aArray[n][0]	- Name of the Nth privilege.
;		:	... ...
;		: If fails, the function sets @error to a system error code, the value of $aArray[0][0] is set to zero.
; Author	: Pusofalse
; ============================================================================================================
Func _SeEnumPrivs($sSystem = "")
	Local $hPolicy, $iResult, $aResult[1][3] = [[0]]

	$hPolicy = _SeOpenPolicy($SE_POLICY_VIEW_LOCAL_INFORMATION, $sSystem)
	If ($hPolicy = 0) Then Return SetError(@error, 0, $aResult)

	$iResult = DllCall("AdvApi32.dll", "dword", "LsaEnumeratePrivileges", "ptr", $hPolicy, _
			"int*", 0, "ptr*", 0, "dword", -1, "dword*", 0)

	If ($iResult[0]) Then Return SetError(snts($iResult[0]), _SeClosePolicy($hPolicy), $aResult)

	$aResult[0][0] = $iResult[5]
	Redim $aResult[$aResult[0][0] + 1][3]

	For $i = 1 To $aResult[0][0]
		$aResult[$i][0] = _SeInitBufferW($iResult[3] + ($i - 1) * 16)
		$aResult[$i][1] = _SeReadBytes($iResult[3] + ($i - 1) * 16 + 8, "int64", 8)
		$aResult[$i][2] = _SeLookupPrivDescription($aResult[$i][0], $sSystem)
	Next
	Return SetError(_SeFreeMemory($iResult[3]), _SeClosePolicy($hPolicy), $aResult)
EndFunc	;==>_SeEnumPrivs

; #### FUNCTION ####
; ============================================================================================================
; Name	: _SeGetFileSignature
; Description	: Retrieves the digital signature information for a file.
; Parameter(s)	: $sFilePath	- File path.
;		: $iSigner	- Index of the signer, if more than one.
; Return values	: Array in the form:
;		:	$aSigner[0]	- Issued to.
;		:	$aSigner[1]	- E-mail.
;		: 	$aSigner[2]	- URL.
;		: 	$aSigner[3]	- Issued by.
;		: 	$aSigner[4]	- Issuer.
;		: 	$aSigner[5]	- Signing time.
;		: 	$aSigner[6]	- Serial number.
;		: 	$aSigner[7]	- Digest algorithm.
;		: 	$aSigner[8]	- Digest encryption algorithm.
;		: If fails, all elements of the array are set to NULL.
; Author	: Pusofalse
; ============================================================================================================
Func _SeGetFileSignature($sFilePath, $iSigner = 0)
	Local $aQuery, $hCryptMsg, $hCertStore, $pSigner, $sObjId
	Local $pContext, $pUnauthAttrs, $pAttribs, $aResult[9]

	$aQuery = __SeQueryObject($sFilePath, _
			$SE__CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED, _
			$SE__CERT_QUERY_FORMAT_BASE64_ENCODED)

	If ($aQuery[0] = 0) Then Return SetError(@error, 0, $aResult)

	$hCertStore = $aQuery[9]
	$hCryptMsg = $aQuery[10]

	__SeMsgGetParam($hCryptMsg, $SE__CMSG_SIGNER_INFO_PARAM, 0, 0, 0, $iSigner)
	If @Extended < 1 Then
		Return SetError(@error, __SeCertCloseStore($hCertStore) + __SeMsgClose($hCryptMsg), $aResult)
	EndIf

	$pSigner = _SeHeapAlloc(@Extended)
	__SeMsgGetParam($hCryptMsg, $SE__CMSG_SIGNER_INFO_PARAM, $pSigner, @Extended, 0, $iSigner)

	$pContext = __SeCertFindCertificateInStore($hCertStore, _
			BitOR($SE__X509_ASN_ENCODING, $SE__PKCS_7_ASN_ENCODING), _
			0, $SE__CERT_FIND_ISSUER_NAME, $pSigner + 4)

	If ($pContext = 0) Then
		Return SetError(@error, __SeCertCloseStore($hCertStore) + __SeMsgClose($hCryptMsg), $aResult)
	EndIf

	$aResult[0] = __SeCertGetNameText($pContext, $SE__CERT_NAME_SIMPLE_DISPLAY_TYPE, 0)
	$aResult[1] = __SeCertGetNameText($pContext, $SE__CERT_NAME_EMAIL_TYPE, 0)
	$aResult[2] = __SeCertGetNameText($pContext, $SE__CERT_NAME_URL_TYPE, 0)
	$aResult[3] = __SeCertGetNameText($pContext, $SE__CERT_NAME_SIMPLE_DISPLAY_TYPE, $SE__CERT_NAME_ISSUER_FLAG)
	$aResult[4] = __SeCertNameToText($pSigner + 4, $SE__CERT_NAME_TO_STR_DEFAULT)

	$aResult[6] = _SeBinaryToString(_SeReadBytes(_SeReadBytes($pSigner + 16), _
				"binary", _SeReadBytes($pSigner + 12)), 11)

	$aResult[7] = _SeReadBytes(_SeReadBytes($pSigner + 20), "str", 1024)
	$aResult[8] = _SeReadBytes(_SeReadBytes($pSigner + 32), "str", 1024)

	$pUnauthAttrs = _SeReadBytes($pSigner + 64, "ptr")

	For $i = 0 To _SeReadBytes($pSigner + 60) - 1
		$pDecode = __SeDecodeObject($SE__PKCS7_SIGNER_INFO, _SeReadBytes($pUnauthAttrs + ($i * 12 + 8)))

		$pAttribs = _SeReadBytes($pDecode + 4 * 13 + 4, "ptr")

		For $j = 0 To _SeReadBytes($pDecode + 4 * 13) - 1
			$sObjId = _SeReadBytes(_SeReadBytes($pAttribs + $j * 12), "str", 1024)
			If ($sObjId <> $SE__OID_RSA_signingTime) Then ContinueLoop

			$pDecodeTime = __SeDecodeObject($sObjId, _SeReadBytes($pAttribs + ($j * 12 + 8)))
			$aResult[5] = __SeFileTimeToSystemTime($pDecodeTime)

			ExitLoop
		Next
	Next

	__SeMsgClose($hCryptMsg)
	__SeCertCloseStore($hCertStore)
	Return SetError(0, _SeHeapFree($pSigner), $aResult)
EndFunc	;==>_SeGetFileSignature

Func __SeQueryObject($vObject, $iContentType, $iFormatType, $iFlags = 0)
	Local $iResult, $sBufferType = "wstr", $iObjType = 1

	If IsPtr($vObject) Then
		$iObjType += 1
		$sBufferType = "ptr"
	EndIf

	$iResult = DllCall("Crypt32.dll", "bool", "CryptQueryObject", "dword", $iObjType, _
			$sBufferType, $vObject, "dword", $iContentType, "dword", $iFormatType, _
			"dword", $iFlags, "ptr*", 0, "ptr*", 0, "ptr*", 0, "ptr*", 0, "ptr*", 0, _
			"ptr*", 0)
	Return SetError(_SeLastError(), 0, $iResult)
EndFunc	;==>__SeQueryObject

Func __SeMsgGetParam($hCryptMsg, $iParamType, $pBuffer = 0, $iBuffer = 4, $sBufferType = "dword*", $iIndex = 0)
	Local $iResult

	If ($sBufferType = 0) Then $sBufferType = "ptr"

	$iResult = DllCall("Crypt32.dll", "bool", "CryptMsgGetParam", "ptr", $hCryptMsg, _
			"dword", $iParamType, "dword", $iIndex, $sBufferType, $pBuffer, _
			"dword*", $iBuffer)

	If ($iResult[0] = 0) Then
		Return SetError(_SeLastError(), $iResult[5], 0)
	Else
		If ($sBufferType = "ptr") Then
			Return SetExtended($iResult[5], 1)
		Else
			Return SetExtended($iResult[5], $iResult[4])
		EndIf
	EndIf
EndFunc	;==>__SeMsgGetParam

Func __SeCertNameToText($pNameBlob, $iFlags = $SE__CERT_NAME_TO_STR_DEFAULT )
	Local $iResult

	$iResult = DllCall("Crypt32.dll", "dword", "CertNameToStr", "int", 1, "ptr", $pNameBlob, _
			"dword", $iFlags, "str", "", "dword", 2048)

	Return SetError(0, $iResult[0], $iResult[4])
Endfunc	;==>__SeCertNameToText

Func __SeCertFindCertificateInStore($hCertStore, $iCertEncoding, $iFlags, $iType, _
		$pFindData = 0, $pPrevCertContext = 0, $sParamType = "ptr")
	Local $iResult

	$iResult = DllCall("Crypt32.dll", "ptr", "CertFindCertificateInStore", "handle", $hCertStore, _
			"dword", $iCertEncoding, "dword", $iFlags, "dword", $iType, _
			$sParamType, $pFindData, "ptr", $pPrevCertContext)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>__SeCertFindCertificateInStore

Func __SeFileTimeToSystemTime($iTime64)
	Local $iResult, $sTime, $sParamType = "int64*", $pSysTime = _SeHeapAlloc(16)
	Local $aWeek[7] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

	If IsPtr($iTime64) Then $sParamType = "ptr"

	$iResult = DllCall("Kernel32.dll", "bool", "FileTimeToLocalFileTime", $sParamType, $iTime64, "int64*", 0)
	$iResult = DllCall("Kernel32.dll", "bool", "FileTimeToSystemTime", "int64*", $iResult[2], "ptr", $pSysTime)
	If ($iResult[0] = 0) Then Return SetError(_SeLastError(), _SeHeapFree($pSysTime), "")

	$sTime = StringFormat("%04d\%02d\%02d  %s  %02d:%02d:%02d", _
			_SeReadBytes($pSysTime + 0, "word", 2), _SeReadBytes($pSysTime + 2, "word", 2), _
			_SeReadBytes($pSysTime + 6, "word", 2), $aWeek[_SeReadBytes($pSysTime + 4, "word", 2)], _
			_SeReadBytes($pSysTime + 8, "word", 2), _SeReadBytes($pSysTime + 10, "word", 2), _
			_SeReadBytes($pSysTime + 12, "word", 2))

	Return SetError(0, _SeHeapFree($pSysTime), $sTime)
EndFunc	;==>__SeFileTimeToSystemTime

Func __SeDecodeObject($vStructType, $pEncodeBlob, $iFlags = 0, $iCertEncoding = 0x10001)
	Local $iResult, $pBuffer, $iData, $pData, $sParamType = "dword"

	$iData = _SeReadBytes($pEncodeBlob)
	$pData = _SeReadBytes($pEncodeBlob + 4, "ptr")

	If IsString($vStructType) Then $sParamType = "str"

	$iResult = DllCall("Crypt32.dll", "bool", "CryptDecodeObject", "dword", $iCertEncoding, _
			$sParamType, $vStructType, "ptr", $pData, "dword", $iData, _
			"dword", $iFlags, "ptr", 0, "dword*", 0)

	If ($iResult[7] = 0) Then
		Return SetError(_SeLastError(), 0, 0)
	EndIf
	$pBuffer = _SeHeapAlloc($iResult[7])

	$iResult = DllCall("Crypt32.dll", "bool", "CryptDecodeObject", "dword", $iCertEncoding, _
			$sParamType, $vStructType, "ptr", $pData, "dword", $iData, _
			"dword", $iFlags, "ptr", $pBuffer, "dword*", $iResult[7])

	If ($iResult[0]) Then
		Return $pBuffer
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pBuffer), 0)
	EndIf
EndFunc	;==>__SeDecodeObject

Func __SeCertGetNameText($pCertContext, $iType, $iFlags, $pTypePara = 0, $sParamType = "ptr")
	Local $iResult

	$iResult = DllCall("Crypt32.dll", "dword", "CertGetNameString", "ptr", $pCertContext, _
			"dword", $iType, "dword", $iFlags, $sParamType, $pTypePara, _
			"str", "", "dword", 4096)

	Return SetExtended($iResult[0], $iResult[5])
EndFunc	;==>__SeCertGetNameText

Func __SeCertCloseStore($hCertStore, $iFlags = $SE__CERT_CLOSE_STORE_FORCE_FLAG)
	Local $iResult

	$iResult = DllCall("Crypt32.dll", "bool", "CertCloseStore", "ptr", $hCertStore, "dword", $iFlags)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>__SeCertCloseStore

Func __SeMsgClose($hCryptMsg)
	Local $iResult = DllCall("Crypt32.dll", "bool", "CryptMsgClose", "ptr", $hCryptMsg)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>__SeMsgClose

; #### FUNCTION ####
; ===========================================================================================================
; Name	: _SeLongToDWORD
; Description	: Converts a LONG to a ULONG.
; Parameter(s)	: $iLONG	- A LONG value to be converted.
; Return values	: Returns an ULONG.
; Author	: Pusofalse
; ===========================================================================================================
Func _SeLongToDWORD($iLONG)
	Local $tDWORD = DllStructCreate("dword")
	DllStructSetData($tDWORD, 1, $iLONG)
	Return DllStructGetData($tDWORD, 1)
EndFunc	;==>_SeLongToDWORD

; #### FUNCTION ####
; ===========================================================================================================
; Name	: _SeRegisterExceptionHandler
; Description	: Registers a callback function to perform the exceptions occured during the execution.
; Parameter(s)	: $pSafeAddress	- A pointer to a funcion as a SAFE place, when exception occurs, this function repairs the exception and jumps into this SAFE place.
;		: $pSafeAddressParam	- An optional value will be passed to the Safe place.
;		: $pReturnAddress	- Specifies a return address for the function defined in SAFE place.
;		: $pReturnAddressParam	- A parameter of the function specified by $pReturnAddress, must have only and at least one parameter.
;		: $hThread	- Handle to the thread, for which the function registers exception actions. Default is current thread.
; Return values	: If succeeds, the function returns a pointer to SE_SEH_TIB structure. If fails, the function returns FALSE.
; Author	: Pusofalse
; Remarks	: Definition of the SAFE place:
;		: DllCallBackRegister("_SafeAddress", "none", "ptr")
;		: _SafeAddress($pSafeAddress)
;		; $pSafeAddress	- A pointer to a SE_SAFE_ADDRESS structure, containing the user defined parameter, and record and context captured when the exception occurs.
;		: The callback function does not return a value.
; ===========================================================================================================
Func _SeRegisterExceptionHandler($pSafeAddress, $pSafeAddressParam = 0, _
		$pReturnAddress = Default, $pReturnAddressParam = 0, $hThread = -2)

	If (0 = BitShift($pSafeAddress, 16)) Then Return SetError(127, 0, 0)

	Local Static $pBasicInfo, $pContext, $pSEH, $pPrevSEH, $tSEH, $iResult

	$pBasicInfo = _SeHeapAlloc(28)
	$iResult = DllCall("Ntdll.dll", "long", "NtQueryInformationThread", "handle", $hThread, _
			"long", 0, "ptr", $pBasicInfo, "ulong", 28, "ulong*", 0)

	If ($iResult[0]) Then Return SetError(snts($iResult[0]), _SeHeapFree($pBasicInfo), 0)

	$pContext = _SeHeapAlloc(204)
	_SeWriteBytes($pContext, 0x10007)
	$iResult = DllCall("Ntdll.dll", "long", "NtGetContextThread", "handle", $hThread, "ptr", $pContext)

	If ($iResult[0]) Then
		Return SetError(snts($iResult[0]), _SeHeapFree($pContext), _SeHeapFree($pBasicInfo) * 0)
	EndIf

	$pPrevSEH = _SeHeapAlloc(32)
	$pSEH = _SeReadBytes(_SeReadBytes($pBasicInfo + 4))
	$tSEH = DllStructCreate($tagSE_SEH_TIB, $pSEH)

	If IsKeyword($pReturnAddress) Then $pReturnAddress = __SeGetProcAddress("Kernel32.dll", "ExitProcess")

	_SeCopyMemory($pPrevSEH, $pSEH, 32)
	DllStructSetData($tSEH, "Handler", ___SeSEHDefaultHandler())
	DllStructSetData($tSEH, "SafeAddress", $pSafeAddress)
	DllStructSetData($tSEH, "SafeAddressParam", $pSafeAddressParam)
	DllStructSetData($tSEH, "ReturnAddress", $pReturnAddress)
	DllStructSetData($tSEH, "ReturnAddressParam", $pReturnAddressParam)
	DllStructSetData($tSEH, "Esp", _SeReadBytes($pContext + 196))
	DllStructSetData($tSEH, "Ebp", _SeReadBytes($pContext + 180))

	Return SetError(_SeHeapFree($pBasicInfo) * 0, _SeHeapFree($pContext), $pPrevSEH)
EndFunc	;==>_SeRegisterExceptionHandler

Func _SeRestoreExceptionHandler($pPrevSEH, $hThread = -2)
	Local $pBasicInfo, $pSEH, $iResult

	$pBasicInfo = _SeHeapAlloc(28)
	$iResult = DllCall("Ntdll.dll", "long", "NtQueryInformationThread", "handle", $hThread, _
			"long", 0, "ptr", $pBasicInfo, "ulong", 28, "ulong*", 0)

	If ($iResult[0]) Then Return SetError(snts($iResult[0]), _SeHeapFree($pBasicInfo), 0)

	$pSEH = _SeReadBytes(_SeReadBytes($pBasicInfo + 4), "ptr")
	_SeCopyMemory($pSEH, $pPrevSEH, 32)

	Return SetError(0, _SeHeapFree($pBasicInfo), $pSEH)
EndFunc	;==>_SeRestoreExceptionHandler

Func ___SeSEHDefaultHandler()
	Local Static $pStartAddr, $pProcedures, $bCode

	If $pStartAddr Then Return $pStartAddr

	$pStartAddr = __SeVirtualAlloc(1024)
	$pProcedures = $pStartAddr + 212

	$bCode = "0x" & _
		"55" & _						; push	ebp
		"8BEC" & _						; mov	ebp, esp
		"8B4508" & _						; mov	eax, dword ptr [ebp+8]
		"8138250000C0" & _					; cmp	dword ptr [eax], c0000025
		"0F84" & __SeLongPtrToBytes(164) & _			; jz	$+a4 (:continue_search)
		"83480400" & _						; or	dword ptr [eax+4], 0
		"0F85" & __SeLongPtrToBytes(154) & _			; jnz	$+9a (:continue_search)
		"83EC0C" & _						; sub	esp, c
		"56" & _						; push	esi
		"8BF0" & _						; mov	esi, eax
		"57" & _						; push	edi
		"8B7D10" & _						; mov	edi, dword ptr [ebp+10]
		"53" & _						; push	ebx
		"8B5D0C" & _						; mov	ebx, dword ptr [ebp+c]
		"6A50" & _						; push	50
		"FF15" & __SeLongPtrToBytes($pProcedures + 12) & _	; call	dword ptr [&allocate]
		"8945FC" & _						; mov	dword ptr [ebp-4], eax
		"68CC000000" & _					; push	cc
		"FF15" & __SeLongPtrToBytes($pProcedures + 12) & _	; call	dword ptr [&allocate]
		"8945F8" & _						; mov	dword ptr [ebp-8], eax
		"6A0C" & _						; push	c
		"FF15" & __SeLongPtrToBytes($pProcedures + 12) & _	; call	dword ptr [&allocate]
		"8945F4" & _						; mov	dword ptr [ebp-c], eax
		"8B4DFC" & _						; mov	ecx, dword ptr [ebp-4]
		"8908" & _						; mov	dword ptr [eax], ecx
		"8B4DF8" & _						; mov	ecx, dword ptr [ebp-8]
		"894804" & _						; mov	dword ptr [eax+4], ecx
		"8B4B0C" & _						; mov	ecx, dword ptr [ebx+c]
		"894808" & _						; mov	dword ptr [eax+8], ecx
		"6A50" & _						; push	50
		"56" & _						; push	esi
		"FF75FC" & _						; push	dword ptr [ebp-4]
		"FF15" & __SeLongPtrToBytes($pProcedures + 8) & _	; call	dword ptr [&RtlMoveMemory]
		"68CC000000" & _					; push	cc
		"57" & _						; push	edi
		"FF75F8" & _						; push	dword ptr [ebp-8]
		"FF15" & __SeLongPtrToBytes($pProcedures + 8) & _	; call	dword ptr [&RtlMoveMemory]
		"8B431C" & _						; mov	eax, dword ptr [ebx+1c]
		"8987B4000000" & _					; mov	dword ptr [edi+b4], eax
		"8B4318" & _						; mov	eax, dword ptr [ebx+18]
		"8987C4000000" & _					; mov	dword ptr [edi+c4], eax
		"8B4B10" & _						; mov	ecx, dword ptr [ebx+10]
		"8908" & _						; mov	dword ptr [eax], ecx
		"8B4DF4" & _						; mov	ecx, dword ptr [ebp-c]
		"894804" & _						; mov	dword ptr [eax+4], ecx
		"8B8FB8000000" & _					; mov	ecx, dword ptr [edi+b8]
		"894808" & _						; mov	dword ptr [eax+8], ecx
		"8B4B14" & _						; mov	ecx, dword ptr [ebx+14]
		"89480C" & _						; mov	dword ptr [eax+c], ecx
		"8B4B08" & _						; mov	ecx, dword ptr [ebx+8]
		"898FB8000000" & _					; mov	dword ptr [edi+b8], ecx
		"33C0" & _						; xor	eax, eax
		"5B" & _						; pop	ebx
		"5F" & _						; pop	edi
		"5E" & _						; pop	esi
		"C9" & _						; leave
		"C3" & _						; ret	(cdecl)
		"33C0" & _						; xor	eax, eax
		"40" & _						; inc	eax
		"EB" & Hex(-7, 2) & _					; jmp	$-7 (:ret)
		"FF742404" & _						; push	dword ptr [esp+4]
		"6A08" & _						; push	8
		"FF15" & __SeLongPtrToBytes($pProcedures) & _		; call	dword ptr [&GetProcessHeap]
		"50" & _						; push	eax
		"FF15" & __SeLongPtrToBytes($pProcedures + 4) & _	; call	dword ptr [&RtlAllocateHeap]
		"C20400" & _						; ret	4
		"909090" & _						; nop	(for 4 bytes alignment)
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "GetProcessHeap")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "HeapAlloc")) & _
		__SeLongPtrToBytes(__SeGetProcAddress("Kernel32.dll", "RtlMoveMemory")) & _
		__SeLongPtrToBytes($pStartAddr + 187)

	_SeWriteBytes($pStartAddr, $bCode, "binary", BinaryLen($bCode))
	Return $pStartAddr
EndFunc	;==>___SeSEHDefaultHandler

Func __SeSEHDefaultHandler($pExceptionRecord, $pSEH, $pContext, $pDispatch)
	Local $tRecord, $iExceptionCode, $iFlag, $pDupRecord, $pDupContext, $tRestore, $tSEH, $tContext, $tStack

	$tRecord = DllStructCreate($tagSE_EXCEPTION_RECORD, $pExceptionRecord)
	$iExceptionCode = DllStructGetData($tRecord, "ExceptionCode")
	$iExceptionFlag = DllStructGetData($tRecord, "ExceptionFlag")

	; EXCEPTION_NONCONTINUABLE_EXCEPTION
	If ($iExceptionCode = 0xC0000025) Then Return $SE_EXCEPTION_CONTINUE_SEARCH

	; Non-continuable, Unwinding, Exit-winding.
	If ($iExceptionFlag <> 0) Then Return $SE_EXCEPTION_CONTINUE_SEARCH

	; Success, Information, Warning, Error
	; If BitAnd(BitShift($iExceptionCode, 30), 3) <> 3 Then Return $SE_EXCEPTION_CONTINUE_SEARCH

	$pDupRecord = _SeHeapAlloc(128)
	$pDupContext = _SeHeapAlloc(204)
	_SeCopyMemory($pDupContext, $pContext, 204)
	_SeCopyMemory($pDupRecord, $pExceptionRecord, 80)

	$tSEH = DllStructCreate($tagSE_SEH_TIB, $pSEH)
	$tRestore = DllStructCreate($tagSE_SAFE_ADDRESS, _SeHeapAlloc(16))

	DllStructSetData($tRestore, "ExceptionRecord", $pDupRecord)
	DllStructSetData($tRestore, "Context", $pDupContext)
	DllStructSetData($tRestore, "Parameter", DllStructGetData($tSEH, "SafeAddressParam"))

	$tContext = DllStructCreate($tagSE_THREAD_CONTEXT, $pContext)
	DllStructSetData($tContext, "Esp", DllStructGetData($tSEH, "Esp"))
	DllStructSetData($tContext, "Ebp", DllStructGetData($tSEH, "Ebp"))

	$tStack = DllStructCreate($tagSE_STACK, DllStructGetData($tSEH, "Esp"))
	DllStructSetData($tStack, "ReturnAddress", DllStructGetData($tSEH, "ReturnAddress"))
	DllStructSetData($tStack, "CurrentAddressParam", DllStructGetPtr($tRestore))
	DllStructSetData($tStack, "CallAddress", DllStructGetData($tContext, "Eip"))
	DllStructSetData($tStack, "ReturnAddressParam", DllStructGetData($tSEH, "ReturnAddressParam"))

	DllStructSetData($tContext, "Eip", DllStructGetData($tSEH, "SafeAddress"))
	Return $SE_EXCEPTION_CONTINUE_EXECUTION
EndFunc	;==>__SeSEHDefaultHandler

; #### FUNCTION ####
; ===========================================================================================================
; Name	: _SeCreateSecurProcess
; Description	: This function creates a security process that with specified security level. It is useful for untrusted application.
; Parameter(s)	: $sCommandLine	- Specifies the path of the process, optional containing the command line.
;		: $iSecurLevel	- Specifies the security level for new process.
;		: $pProcessAttrib	- Optionally specifies a security descriptor and inheritance option for the new process.
;		: $pThreadAttrib	- Optionally specifies a security descriptor and inheritance option for the primary thread of new process.
;		: $fInherit	- If TRUE, the child process created by this process can inherit the handle.
;		: $iFlags	- Optional creation flags, typically indicates priority class.
;		: $pEnvironment	- A pointer to block of memory contains the environment values.
;		: $sCurrentDir	- IMPORTANT! specifies the working directory for the new process, default to current directory.
;		: $pStartupInfo	- A pointer to SE_STARTUP_INFO contains the startup information, if NULL is specified, then the function got default options.
; Return values	: If succeeds, the function returns a SE_PROCESS_INFO structure contains the Process and Thread Ids and Handles to the newly created process.
; Author	: Pusofalse
; ===========================================================================================================
Func _SeCreateSecurProcess($sCommandLine, $iSecurLevel = $SE_LEVEL_NORMAL_USER, _
		$pProcessAttrib = 0, $pThreadAttrib = 0, $fInherit = 0, $iFlags = Default, _
		$pEnvironment = 0, $sCurrentDir = @WorkingDir, $pStartupInfo = Default)

	Local $hAuthzToken, $hSaferLevel, $tProcessInfo

	$hSaferLevel = _SeSaferCreateLevel($iSecurLevel, $SE_SAFER_SCOPEID_USER)
	If ($hSaferLevel < 1) Then Return SetError(@error, 0, 0)

	$hAuthzToken = _SeSaferComputeTokenFromLevel($hSaferLevel)
	If ($hAuthzToken < 1) Then Return SetError(@error, _SeSaferCloseLevel($hSaferLevel), 0)

	_SeSaferCloseLevel($hSaferLevel)

	$tProcessInfo = _SeCreateUserProcess($hAuthzToken, "", $sCommandLine, $pProcessAttrib, _
				$pThreadAttrib, $fInherit, $iFlags, $pEnvironment, $sCurrentDir, _
				$pStartupInfo)

	Return SetError(@error, _SeCloseHandle($hAuthzToken), $tProcessInfo)
EndFunc	;==>_SeCreateSecurProcess

; #### FUNCTION ####
; ===========================================================================================================
; Name	: _SeIsAppRestricted
; Description	: This function determines an application is whether restricted by software restriction rules.
; Parameter(s)	: $sAppPath	- Full path of the application file.
; Return values	: If the specified is retricted, the function returns TRUE, otherwise, the function returns FALSE.
; Author	: Pusofalse
; ===========================================================================================================
Func _SeIsAppRestricted($sAppPath)
	Local $hFile, $iResult

	$iResult = DllCall("Kernel32.dll", "long", "CreateFile", "str", $sAppPath, "dword", 0x100A1, _
			"dword", 3, "dword", 0, "dword", 3, "dword", 0, "handle", 0)

	If ($iResult[0] < 1) Then Return SetError(_SeLastError(), 0, 1)

	$hFile = $iResult[0]

	$iResult = DllCall("Kernel32.dll", "long", "BasepCheckWinSaferRestrictions", "ptr", 0, _
			"str", $sAppPath, "handle", $hFile, "int64*", 0, "int64*", 0, "int64*", 0)

	Return SetError($iResult[0], _SeCloseHandle($hFile), $iResult[0] = -1)
EndFunc	;==>_SeIsAppRestricted

Func _SeSaferCloseLevel($hSaferLevel)
	Local $iResult = DllCall("AdvApi32.dll", "bool", "SaferCloseLevel", "ptr", $hSaferLevel)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSaferCloseLevel

Func _SeSaferCreateLevel($iLevelId = $SE_LEVEL_NORMAL_USER, $iScopeId = $SE_SAFER_SCOPEID_USER)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "SaferCreateLevel", "dword", $iScopeId, _
			"dword", $iLevelId, "dword", 1, "ptr*", 0, "ptr", 0)
	Return SetError(_SeLastError(), $iResult[0], $iResult[4])
EndFunc	;==>_SeSaferCreateLevel

Func _SeSaferGetLevelInfo($hSaferLevel, $iInfoClass, $sOutBuffer, $iOutBuffer)
	Local $iResult
	$iResult = DllCall("AdvApi32.dll", "bool", "SaferGetLevelInformation", "ptr", $hSaferLevel, _
			"dword", $iInfoClass, $sOutBuffer, 0, "dword", $iOutBuffer, "dword*", 0)
	If @error Then
		Return SetError(1, 0, 0)
	Else
		Return SetError(_SeLastError(), $iResult[5], $iResult[3])
	EndIf
EndFunc	;==>_SeSaferGetLevelInfo

Func _SeSaferSetLevelInfo($hSaferLevel, $iInfoClass, $vBuffer, $iBuffer, $sBufferType = "ptr")
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "SaferSetLevelInformation", "ptr", $hSaferLevel, _
			"dword", $iInfoClass, $sBufferType, $vBuffer, "dword", $iBuffer)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeSaferSetLevelInfo

Func _SeSaferComputeTokenFromLevel($hSaferLevel, $hToken = 0, $iFlags = 0)
	Local $iResult, $sParamType = "ptr"

	If BitAnd($iFlags, 2) Then $sParamType = "dword*"

	$iResult = DllCall("AdvApi32.dll", "bool", "SaferComputeTokenFromLevel", "ptr", $hSaferLevel, _
			"handle", $hToken, "handle*", 0, "dword", $iFlags, $sParamType, 0)
	Return SetError(_SeLastError(), $iResult[5], $iResult[3])
EndFunc	;==>_SeSaferComputeTokenFromLevel

Func _SeQuerySecurityObject($hObject, $iInfoClass = $SE_OBJ_BASIC_INFO)
	Local $pBuffer, $iResult

	Switch $iInfoClass
	Case $SE_OBJ_BASIC_INFO
		$pBuffer = _SeHeapAlloc(56)
	Case $SE_OBJ_NAME_INFO
		$pBuffer = _SeHeapAlloc(512)
	Case $SE_OBJ_TYPE_INFO
		$pBuffer = _SeHeapAlloc(256)
	Case $SE_OBJ_ALL_INFO
		$pBuffer = _SeHeapAlloc(4)
	Case $SE_OBJ_DATA_INFO
		$pBuffer = _SeHeapAlloc(4)
	Case Else
		Return SetError(87, 0, 0)
	EndSwitch

	$iResult = DllCall("Ntdll.dll", "long", "NtQueryObject", "handle", $hObject, _
			"long", $iInfoClass, "ptr", $pBuffer, "dword", _SeHeapSize($pBuffer), _
			"dword*", 0)

	Switch $iInfoClass
	Case 0, 2
		If $iResult[0] Then
			Return SetError(snts($iResult[0]), _SeHeapFree($pBuffer), 0)
		Else
			Return $pBuffer
		EndIf
	Case 1
		If $iResult[0] Then
			Return SetError(snts($iResult[0]), _SeHeapFree($pBuffer), "")
		Else
			Local $sObjName = _SeInitBufferW($pBuffer)
			Return SetError(0, _SeHeapFree($pBuffer), $sObjName)
		EndIf
	Case 4
		If $iResult[0] Then
			Return SetError(snts($iResult[0]), _SeHeapFree($pBuffer), 0)
		Else
			Local $iFlags = _SeReadBytes($pBuffer)
			Return SetError(0, _SeHeapFree($pBuffer), $iFlags)
		EndIf
	Case 3
		If ($iResult[0] = 0) Then
			Return SetError(0, 0, $pBuffer)
		Else
			If ($iResult[0] <> 0xC0000004) Or ($iResult[5] < 5) Then
				Return SetError(snts($iResult[0]), _SeHeapFree($pBuffer), 0)
			EndIf

			_SeHeapFree($pBuffer)
			$pBuffer = _SeHeapAlloc($iResult[5])

			$iResult = DllCall("Ntdll.dll", "long", "NtQueryObject", "handle", $hObject, _
				"long", $iInfoClass, "ptr", $pBuffer, "dword", $iResult[5], "dword*", 0)

			If $iResult[0] Then
				Return SetError(snts($iResult[0]), _SeHeapFree($pBuffer), 0)
			Else
				Return $pBuffer
			EndIf
		EndIf
	EndSwitch
EndFunc	;==>_SeQuerySecurityObject

; #### FUNCTION ####
; ===========================================================================================================
; Name	: _SeCreateCredential
; Description	: This function creates a new or modifies an existing credential in credential set.
; Parameter(s)	: $sCredName	- Specifies the name of the credential to create or modify. If the function does not match an existing credential, then a new credential is created. Else, the function updates the credential using the following specified parameters.
;		: $bCredBlob	- A binary string contains the secret credential data, for security, the caller can encrypt the data by calling _SeProtectData function with a secur entropy. Note that the length of this binary string must not exceed 512 bytes.
;		: $iType	- Specifies the type of the credential, the type and the name of the credential identify an unique credential.
;		: $iPersist	- Specifies the life of the credential.
;		: $sUserName	- Specfiies the user name for the credential.
;		: $iFlags	- Optional flag, see Flags for _SeCreateCredential.Flags.
;		: $sAlias	- Optional string indicates the alias of the credential.
;		: $sComment	- Optional string indicates the comment of the credential.
; Return values	: If succeeds, the function returns a pointer to a SE_CREDENTIAL structure. If fails, the function returns NULL and sets @error to the reason code of the failure.
; Author	: Pusofalse
; ===========================================================================================================
Func _SeCreateCredential($sCredName, $bCredBlob, $iType, $iPersist, $sUserName, _
		$iFlags = $SE_CRED_FLAGS_DEFAULT, $sAlias = "", $sComment = "")

	Local $pCredential, $tCredential, $iResult

	If VarGetType($bCredBlob) <> "binary" Then Return SetError(87, 0, 0)

	$pCredential = _SeHeapAlloc(4096)
	$tCredential = DllStructCreate($tagSE_CREDENTIAL_WRITE, $pCredential)

	DllStructSetData($tCredential, "Flags", $iFlags)
	DllStructSetData($tCredential, "Type", $iType)
	DllStructSetData($tCredential, "TargetName", DllStructGetPtr($tCredential, "wzTargetName"))
	DllStructSetData($tCredential, "CredentialBlobSize", BinaryLen($bCredBlob))
	DllStructSetData($tCredential, "CredentialBlob", DllStructGetPtr($tCredential, "bCredentialBlob"))
	DllStructSetData($tCredential, "Persist", $iPersist)
	DllStructSetData($tCredential, "UserName", DllStructGetPtr($tCredential, "wzUserName"))
	DllStructSetData($tCredential, "wzTargetName", $sCredName)
	DllStructSetData($tCredential, "wzComment", $sComment)
	DllStructSetData($tCredential, "wzTargetAlias", $sAlias)
	DllStructSetData($tCredential, "wzUserName", $sUserName)
	DllStructSetData($tCredential, "bCredentialBlob", $bCredBlob)

	If $sComment Then DllStructSetData($tCredential, "Comment", DllStructGetPtr($tCredential, "wzComment"))
	If $sAlias Then DllStructSetData($tCredential, "TargetAlias", DllStructGetPtr($tCredential, "wzTargetAlias"))

	$iResult = DllCall("Kernel32.dll", "none", "GetSystemTimeAsFileTime", "int64*", 0)
	DllStructSetData($tCredential, "LastWritten", $iResult[1])

	$iResult = DllCall("AdvApi32.dll", "bool", "CredWriteW", "ptr", $pCredential, "dword", 0)
	If $iResult[0] Then
		Return $pCredential
	Else
		Return SetError(_SeLastError(), _SeHeapFree($pCredential), 0)
	EndIf
EndFunc	;==>_SeCreateCredential

Func _SeWriteCredential($pCredential)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "CredWriteW", "ptr", $pCredential, "dword", 0)
	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeWriteCredential

Func _SeCreateCredential1($sCredName, $iCredType, $vCredBlob, _
		$iCredPersist = $SE_CRED_PERSIST_LOCAL_MACHINE, _
		$sCredAlias = "", $sCredComment = "", $sUserName = Default)

	Local $tCredBlob, $pCredBlob, $iCredBlob, $tCredential

	$tCredBlob = _SeCreateBuffer($vCredBlob, 1)
	$iCredBlob = DllStructGetSize($tCredBlob)

	If $sUserName = Default Then $sUserName = _SeGetUserName()

	$tCredential = DllStructCreate($tagSE_CREDENTIAL_WRITE)
	DllStructSetData($tCredential, "TargetName", DllStructGetPtr($tCredential, "wzTargetName"))
	DllStructSetData($tCredential, "wzTargetName", $sCredName)
	DllStructSetData($tCredential, "Type", $iCredType)
	DllStructSetData($tCredential, "Persist", $iCredPersist)
	DllStructSetData($tCredential, "CredentialBlobSize", $iCredBlob)
	DllStructSetData($tCredential, "CredentialBlob", DllStructGetPtr($tCredBlob))
	DllStructSetData($tCredential, "UserName", DllStructGetPtr($tCredential, "wzUserName"))
	DllStructSetData($tCredential, "wzUserName", $sUserName)

	If Not ($sCredAlias == "") Then
		DllStructSetData($tCredential, "wzTargetAlias", $sCredAlias)
		DllStructGetData($tCredential, "TargetAlias", DllStructGetPtr($tCredential, "wzTargetAlias"))
	EndIf

	If Not ($sCredComment == "") Then
		DllStructSetData($tCredential, "wzComment", $sCredComment)
		DllStructSetData($tCredential, "Comment", DllStructGetPtr($tCredential, "wzComment"))
	EndIf

	$iResult = DllCall("Kernel32.dll", "none", "GetSystemTimeAsFileTime", "int64*", 0)
	DllStructSetData($tCredential, "LastWritten", $iResult[1])

	$iResult = _SeWriteCredential(DllStructGetPtr($tCredential))
	If Not $iResult Then $tCredential = 0

	Return SetError(@error, 0, $tCredential)
EndFunc	;==>_SeCreateCredential

Func _SeReadCredential($sCredName, $iCredType)
	Local $iResult

	$iResult = DllCall("AdvApi32.dll", "bool", "CredRead", "str", $sCredName, _
			"dword", $iCredType, "dword", 0, "ptr*", 0)

	Return SetError(_SeLastError(), 0, $iResult[4])
EndFunc	;==>_SeReadCredential

Func _SeFreeCredential($pCredential, $iError = @error, $iExtended = @extended)
	DllCall("AdvApi32.dll", "none", "CredFree", "ptr", $pCredential)
	Return SetError($iError, $iExtended, 1)
EndFunc	;==>_SeFreeCredential

Func _SeEnumCredentials($sFilter = "", $iFlags = 0)
	Local $iResult, $sType = "ptr"
	If $sFilter Then $sType = "str"

	$iResult = DllCall("AdvApi32.dll", "bool", "CredEnumerate", $sType, $sFilter, _
			"dword", $iFlags, "dword*", 0, "ptr*", 0)
	Return SetError(_SeLastError(), $iResult[3], $iResult[4])
EndFunc	;==>_SeEnumCredentials

; #### FUNCTION ####
; ===========================================================================================================
; Name	: _SeRenameCredential
; Description	: This function renames or deletes a specified credential.
; Parameter(s)	: $sCredName	- Name of the credential to rename.
;		: $sNewName	- New name of the credential, if NULL, the function deletes the credential.
;		: $iCredType	- The type of the credential.
; Return values	: If succeeds, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; Remarks	: The $sCredName and $iCredType parameters identify an unique credential.
; ===========================================================================================================
Func _SeRenameCredential($sCredName, $sNewName, $iCredType)
	Local $iResult

	If ($sNewName = "") Then
		$iResult = DllCall("AdvApi32.dll", "bool", "CredDelete", "str", $sCredName, "long", $iCredType, "long", 0)
	Else
		$iResult = DllCall("AdvApi32.dll", "bool", "CredRename", "str", $sCredName, _
				"str", $sNewName, "long", $iCredType, "long", 0)
	EndIf

	Return SetError(_SeLastError(), 0, $iResult[0])
EndFunc	;==>_SeRenameCredential

Func _SeCallAuthenticationPkg($hLsaHandle, $iPkgAuthzId, $pProtoBuffer, $iProtoBuffer)
	Local $iResult, $iError

	If IsString($iPkgAuthzId) Then
		$iPkgAuthzId = _SeLookupAuthenticationPkg($hLsaHandle, $iPkgAuthzId)
		If ($iPkgAuthzId = -1) Then Return SetError(@error, 0, 0)
	EndIf

	$iResult = DllCall("Secur32.dll", "long", "LsaCallAuthenticationPackage", "handle", $hLsaHandle, _
			"ulong", $iPkgAuthzId, "ptr", $pProtoBuffer, "long", $iProtoBuffer, _
			"ptr*", 0, "long*", 0, "long*", 0)

	$iError = BitOR(BitShift(snts($iResult[0]), -16), snts($iResult[7]))
	Return SetError($iError, $iResult[6], $iResult[5])
EndFunc	;==>_SeCallAuthenticationPkg

Func _SeEnumSecurityPkgs()
	Local $iResult, $tBuffer, $aResult[1][5] = [[0]]

	$iResult = DllCall("Secur32.dll", "long", "EnumerateSecurityPackagesW", "ulong*", 0, "ptr*", 0)
	If ($iResult[0]) Then Return SetError($iResult[0], 0, $aResult)

	$aResult[0][0] = $iResult[1]
	Redim $aResult[$iResult[1] + 1][5]

	For $i = 1 To $aResult[0][0]
		$tBuffer = DllStructCreate($tagSE_SECURITY_PKG, $iResult[2] + ($i - 1) * 20)

		$aResult[$i][0] = _SeNetBuffer(DllStructGetData($tBuffer, "Name"))
		$aResult[$i][1] = _SeNetBuffer(DllStructGetData($tBuffer, "Comment"))
		$aResult[$i][2] = DllStructGetData($tBuffer, "Capabilities")
		$aResult[$i][3] = DllStructGetData($tBuffer, "VersionRpcId")
		$aResult[$i][4] = DllStructGetData($tBuffer, "MaxToken")

		$tBuffer = 0
	Next

	Return SetError(0, _SeFreeContextBuffer($iResult[2]), $aResult)
EndFunc	;==>_SeEnumSecurityPkgs

Func _SeFreeContextBuffer($pBuffer, $fContext = 1, $iError = @error, $iExtended = @extended)
	Local $iResult

	If $fContext Then
		$iResult = DllCall("Secur32.dll", "long", "FreeContextBuffer", "ptr", $pBuffer)
	Else
		$iResult = DllCall("Secur32.dll", "long", "LsaFreeReturnBuffer", "ptr", $pBuffer)
		If @error Then Return SetError($iError, $iExtended, 1)
	EndIf

	Return SetError($iError, $iExtended, $iResult[0])
EndFunc	;==>_SeFreeContextBuffer

Func _SeConnectUntrusted()
	Local $iResult = DllCall("Secur32.dll", "long", "LsaConnectUntrusted", "handle*", 0)
	Return SetError(snts($iResult[0]), 0, $iResult[1])
EndFunc	;==>_SeConnectUntrusted

Func _SeRegisterLogonProcess($sLogonProcess = "User32LogonProcess")

	Local $tBuffer, $pBuffer, $iLength, $iResult

	$iLength = StringLen($sLogonProcess)
	$tBuffer = DllStructCreate("ushort;ushort;ptr;char[" & $iLength + 1 & "]")
	$pBuffer = DllStructGetPtr($tBuffer)

	DllStructSetData($tBuffer, 1, $iLength)
	DllStructSetData($tBuffer, 2, $iLength + 1)
	DllStructSetData($tBuffer, 3, DllStructGetPtr($tBuffer, 4))
	DllStructSetData($tBuffer, 4, $sLogonProcess)

	$iResult = DllCall("Secur32.dll", "long", "LsaRegisterLogonProcess", _
			"ptr", $pBuffer, "handle*", 0, "long*", 0)

	Return SetError(snts($iResult[0]), $iResult[3], $iResult[2])
EndFunc	;==>_SeRegisterLogonProcess

Func _SeLookupAuthenticationPkg($hLsaHandle, $sPackage)
	Local $iResult, $iLength, $tBuffer, $pBuffer

	$iLength = StringLen($sPackage)
	$tBuffer = DllStructCreate("ushort;ushort;ptr;char[" & $iLength + 1 & "]")
	$pBuffer = DllStructGetPtr($tBuffer)

	DllStructSetData($tBuffer, 1, $iLength)
	DllStructSetData($tBuffer, 2, $iLength + 1)
	DllStructSetData($tBuffer, 3, DllStructGetPtr($tBuffer, 4))
	DllStructSetData($tBuffer, 4, $sPackage)

	$iResult = DllCall("Secur32.dll", "long", "LsaLookupAuthenticationPackage", _
			"handle", $hLsaHandle, "ptr", $pBuffer, "long*", 0)

	Return SetError(snts($iResult[0]), 0, $iResult[3])
EndFunc	;==>_SeLookupAuthenticationPkg

Func _SeQueryLogonSession($iLogonAuthzId)
	Local $iResult, $tBuffer, $aResult[10]

	$iResult = DllCall("Secur32.dll", "long", "LsaGetLogonSessionData", "int64*", $iLogonAuthzId, "ptr*", 0)
	If @error Then Return SetError(1, 0, $aResult)

	$tBuffer = DllStructCreate($tagSE_SECURITY_LOGON_SESSION, $iResult[2])

	$aResult[0] = _SeInitBufferW(DllStructGetPtr($tBuffer, "UserName"))
	$aResult[1] = _SeInitBufferW(DllStructGetPtr($tBuffer, "LogonDomain"))
	$aResult[2] = _SeInitBufferW(DllStructGetPtr($tBuffer, "AuthenticationPkg"))
	$aResult[3] = _SeInitBufferW(DllStructGetPtr($tBuffer, "LogonServer"))
	$aResult[4] = _SeInitBufferW(DllStructGetPtr($tBuffer, "DnsDomainName"))
	$aResult[5] = _SeInitBufferW(DllStructGetPtr($tBuffer, "Upn"))
	$aResult[6] = _SeConvertSidToSSid(DllStructGetData($tBuffer, "Sid"))
	$aResult[7] = DllStructGetData($tBuffer, "LogonType")
	$aResult[8] = DllStructGetData($tBuffer, "LogonId")
	$aResult[9] = __SeFileTimeToSystemTime(DllStructGetData($tBuffer, "LogonTime"))

	Return SetError(0, _SeFreeContextBuffer($iResult[2], 0), $aResult)
EndFunc	;==>_SeQueryLogonSession

Func _SeEnumLogonSessions()
	Local $iResult, $aSessionData, $aResult[1][10] = [[0]]

	$iResult = DllCall("Secur32.dll", "long", "LsaEnumerateLogonSessions", "ulong*", 0, "ptr*", 0)
	If @error Then Return SetError(1, 0, $aResult)
	If $iResult[0] Then Return SetError(snts($iResult[0]), 0, $aResult)

	$aResult[0][0] = $iResult[1]
	Redim $aResult[$aResult[0][0] + 1][10]

	For $i = 1 To $aResult[0][0]
		$aSession = _SeQueryLogonSession(_SeReadBytes($iResult[2] + ($i - 1) * 8, "int64", 8))

		For $j = 0 To 9
			$aResult[$i][$j] = $aSession[$j]
		Next
	Next

	Return SetError(0, _SeFreeContextBuffer($iResult[2], 0), $aResult)
EndFunc	;==>_SeEnumLogonSessions

; #### FUNCTION ####
; ===========================================================================================================
; Name	: _SeVerifySystemCall
; Description	: This function is used to verify the validity of the parameters when a specified system function is called.
; Parameter(s)	: $pProcedure	- Address of the system function.
;		: $pRedirect	- Address of the AutoIt callback function, the defination depends on the parameter format of the system function.
; Return values	: If succeeds, the function returns a pointer to SE_VERIFY_SYSTEM_CALL structure, the caller can use this pointer to complete verification of the system call. If fails, the function returns NULL.
; Author	: Pusofalse
; ==========================================================================================================
Func _SeVerifySystemCall($pProcedure, $pRedirect)
	Local $pVerify, $tVerify, $iResult, $bEntrypoint

	$iResult = DllCall("Kernel32.dll", "bool", "VirtualProtect", "ptr", $pProcedure, _
			"dword", 8, "dword", 0x40, "long*", 0)

	If $iResult[0] = 0 Then Return SetError(_SeLastError(), 1, 0)

	$bEntrypoint = _SeReadBytes($pProcedure, "binary", 8)
	If $bEntrypoint = "" Then Return SetError(@error, 2, 0)

	If Not _SeWriteBytes($pProcedure, "0xB8" & __SeLongPtrToBytes($pRedirect) & "FFE090", "binary", 8) Then
		Return SetError(@error, 3, 0)
	EndIf

	$pVerify = _SeHeapAlloc(12)
	$tVerify = DllStructCreate($tagSE_VERIFY_SYSTEM_CALL, $pVerify)

	DllStructSetData($tVerify, "Procedure", $pProcedure)
	DllStructSetData($tVerify, "Opcode", $bEntrypoint)

	Return $pVerify
EndFunc	;==>_SeVerifySystemCall

; #### FUNCTION ####
; ===========================================================================================================
; Name	: _SeCompleteVerifySystemCall
; Description	: This function completes the verification of a system call.
; Parameter(s)	: $pVerify	- The pointer to SE_VERIFY_SYSTEM_CALL structure, returned by _SeVerifySystemCall.
; Return values	: If succeeds, the function returns TRUE, otherwise returns FALSE.
; Author	: Pusofalse
; ===========================================================================================================
Func _SeCompleteVerifySystemCall($pVerify)
	Local $tVerify, $pProcedure, $bEntrypoint

	$tVerify = DllStructCreate($tagSE_VERIFY_SYSTEM_CALL, $pVerify)
	$pProcedure = DllStructGetData($tVerify, "Procedure")
	$bEntrypoint = DllStructGetData($tVerify, "Opcode")

	Return _SeWriteBytes($pProcedure, $bEntrypoint, "binary", 8)
EndFunc	;==>_SeCompleteVerifySystemCall

; #FUNCTION# ====================================================================================================================
; Name...........: _ArrayDisplay
; Description ...: Displays given 1D or 2D array array in a listview.
; Syntax.........: _ArrayDisplay(Const ByRef $avArray[, $sTitle = "Array: ListView Display"[, $iItemLimit = -1[, $iTranspose = 0[, $sSeparator = ""[, $sReplace = "|"[, $sHeader = ""]]]]]])
; Parameters ....: $avArray    - Array to display
;                  $sTitle     - [optional] Title to use for window
;                  $iItemLimit - [optional] Maximum number of listview items (rows) to show
;                  $iTranspose - [optional] If set differently than default, will transpose the array if 2D
;                  $sSeparator - [optional] Change Opt("GUIDataSeparatorChar") on-the-fly
;                  $sReplace   - [optional] String to replace any occurrence of $sSeparator with in each array element
;                  $sheader     - [optional] Header column names
; Return values .: Success - 1
;                  Failure - 0, sets @error:
;                  |1 - $avArray is not an array
;                  |2 - $avArray has too many dimensions (only up to 2D supported)
; Author ........: randallc, Ultima
; Modified.......: Gary Frost (gafrost), Ultima, Zedna, jpm
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func __SeArrayDisplay(Const $avArray, $sTitle = "Array: ListView Display", $iItemLimit = -1, $iTranspose = 0, $sSeparator = "", $sReplace = "|", $sHeader = "")
	If Not IsArray($avArray) Then Return SetError(1, 0, 0)
	; Dimension checking
	Local $iDimension = UBound($avArray, 0), $iUBound = UBound($avArray, 1) - 1, $iSubMax = UBound($avArray, 2) - 1
	If $iDimension > 2 Then Return SetError(2, 0, 0)

	; Separator handling
;~     If $sSeparator = "" Then $sSeparator = Chr(1)
	If $sSeparator = "" Then $sSeparator = Chr(124)

#cs
	;  Check the separator to make sure it's not used literally in the array
	If _ArraySearch($avArray, $sSeparator, 0, 0, 0, 1) <> -1 Then
		For $x = 1 To 255
			If $x >= 32 And $x <= 127 Then ContinueLoop
			Local $sFind = _ArraySearch($avArray, Chr($x), 0, 0, 0, 1)
			If $sFind = -1 Then
				$sSeparator = Chr($x)
				ExitLoop
			EndIf
		Next
	EndIf
	#ce

	; Declare variables
	Local $vTmp, $iBuffer = 64
	Local $iColLimit = 250
	Local $iOnEventMode = Opt("GUIOnEventMode", 0), $sDataSeparatorChar = Opt("GUIDataSeparatorChar", $sSeparator)

	; Swap dimensions if transposing
	If $iSubMax < 0 Then $iSubMax = 0
	If $iTranspose Then
		$vTmp = $iUBound
		$iUBound = $iSubMax
		$iSubMax = $vTmp
	EndIf

	; Set limits for dimensions
	If $iSubMax > $iColLimit Then $iSubMax = $iColLimit
	If $iItemLimit < 1 Then $iItemLimit = $iUBound
	If $iUBound > $iItemLimit Then $iUBound = $iItemLimit

	; Set header up
	If $sHeader = "" Then
		$sHeader = "Row  "	; blanks added to adjust column size for big number of rows
		For $i = 0 To $iSubMax
			$sHeader &= $sSeparator & "Col " & $i
		Next
	EndIf

	; Convert array into text for listview
	Local $avArrayText[$iUBound + 1]
	For $i = 0 To $iUBound
		$avArrayText[$i] = "[" & $i & "]"
		For $j = 0 To $iSubMax
			; Get current item
			If $iDimension = 1 Then
				If $iTranspose Then
					$vTmp = $avArray[$j]
				Else
					$vTmp = $avArray[$i]
				EndIf
			Else
				If $iTranspose Then
					$vTmp = $avArray[$j][$i]
				Else
					$vTmp = $avArray[$i][$j]
				EndIf
			EndIf

			; Add to text array
			$vTmp = StringReplace($vTmp, $sSeparator, $sReplace, 0, 1)
			$avArrayText[$i] &= $sSeparator & $vTmp

			; Set max buffer size
			$vTmp = StringLen($vTmp)
			If $vTmp > $iBuffer Then $iBuffer = $vTmp
		Next
	Next
	$iBuffer += 1

	; GUI Constants
	Local Const $_ARRAYCONSTANT_GUI_DOCKBORDERS = 0x66
	Local Const $_ARRAYCONSTANT_GUI_DOCKBOTTOM = 0x40
	Local Const $_ARRAYCONSTANT_GUI_DOCKHEIGHT = 0x0200
	Local Const $_ARRAYCONSTANT_GUI_DOCKLEFT = 0x2
	Local Const $_ARRAYCONSTANT_GUI_DOCKRIGHT = 0x4
	Local Const $_ARRAYCONSTANT_GUI_EVENT_CLOSE = -3
	Local Const $_ARRAYCONSTANT_LVIF_PARAM = 0x4
	Local Const $_ARRAYCONSTANT_LVIF_TEXT = 0x1
	Local Const $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH = (0x1000 + 29)
	Local Const $_ARRAYCONSTANT_LVM_GETITEMCOUNT = (0x1000 + 4)
	Local Const $_ARRAYCONSTANT_LVM_GETITEMSTATE = (0x1000 + 44)
	Local Const $_ARRAYCONSTANT_LVM_INSERTITEMW = (0x1000 + 77)
	Local Const $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE = (0x1000 + 54)
	Local Const $_ARRAYCONSTANT_LVM_SETITEMW = (0x1000 + 76)
	Local Const $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT = 0x20
	Local Const $_ARRAYCONSTANT_LVS_EX_GRIDLINES = 0x1
	Local Const $_ARRAYCONSTANT_LVS_SHOWSELALWAYS = 0x8
	Local Const $_ARRAYCONSTANT_WS_EX_CLIENTEDGE = 0x0200
	Local Const $_ARRAYCONSTANT_WS_MAXIMIZEBOX = 0x00010000
	Local Const $_ARRAYCONSTANT_WS_MINIMIZEBOX = 0x00020000
	Local Const $_ARRAYCONSTANT_WS_SIZEBOX = 0x00040000
	Local Const $_ARRAYCONSTANT_tagLVITEM = "int Mask;int Item;int SubItem;int State;int StateMask;ptr Text;int TextMax;int Image;int Param;int Indent;int GroupID;int Columns;ptr pColumns"

	Local $iAddMask = BitOR($_ARRAYCONSTANT_LVIF_TEXT, $_ARRAYCONSTANT_LVIF_PARAM)
	Local $tBuffer = DllStructCreate("wchar Text[" & $iBuffer & "]"), $pBuffer = DllStructGetPtr($tBuffer)
	Local $tItem = DllStructCreate($_ARRAYCONSTANT_tagLVITEM), $pItem = DllStructGetPtr($tItem)
	DllStructSetData($tItem, "Param", 0)
	DllStructSetData($tItem, "Text", $pBuffer)
	DllStructSetData($tItem, "TextMax", $iBuffer)

	; Set interface up
	Local $iWidth = 640, $iHeight = 480
	Local $hGUI = GUICreate($sTitle, $iWidth, $iHeight, Default, Default, BitOR($_ARRAYCONSTANT_WS_SIZEBOX, $_ARRAYCONSTANT_WS_MINIMIZEBOX, $_ARRAYCONSTANT_WS_MAXIMIZEBOX))
	Local $aiGUISize = WinGetClientSize($hGUI)
	Local $hListView = GUICtrlCreateListView($sHeader, 0, 0, $aiGUISize[0], $aiGUISize[1] - 26, $_ARRAYCONSTANT_LVS_SHOWSELALWAYS)
	Local $hCopy = GUICtrlCreateButton("Copy Selected", 3, $aiGUISize[1] - 23, $aiGUISize[0] - 6, 20)
	GUICtrlSetResizing($hListView, $_ARRAYCONSTANT_GUI_DOCKBORDERS)
	GUICtrlSetResizing($hCopy, $_ARRAYCONSTANT_GUI_DOCKLEFT + $_ARRAYCONSTANT_GUI_DOCKRIGHT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT)
	GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_LVS_EX_GRIDLINES, $_ARRAYCONSTANT_LVS_EX_GRIDLINES)
	GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT, $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT)
	GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_WS_EX_CLIENTEDGE, $_ARRAYCONSTANT_WS_EX_CLIENTEDGE)

	; Fill listview
	Local $aItem
	For $i = 0 To $iUBound
		If GUICtrlCreateListViewItem($avArrayText[$i], $hListView) = 0 Then
			; use GUICtrlSendMsg() to overcome AutoIt limitation
			$aItem = StringSplit($avArrayText[$i], $sSeparator)
			DllStructSetData($tBuffer, "Text", $aItem[1])

			; Add listview item
			DllStructSetData($tItem, "Item", $i)
			DllStructSetData($tItem, "SubItem", 0)
			DllStructSetData($tItem, "Mask", $iAddMask)
			GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_INSERTITEMW, 0, $pItem)

			; Set listview subitem text
			DllStructSetData($tItem, "Mask", $_ARRAYCONSTANT_LVIF_TEXT)
			For $j = 2 To $aItem[0]
				DllStructSetData($tBuffer, "Text", $aItem[$j])
				DllStructSetData($tItem, "SubItem", $j - 1)
				GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_SETITEMW, 0, $pItem)
			Next
		EndIf
	Next

	; adjust window width
	$iWidth = 0
	For $i = 0 To $iSubMax + 1
		$iWidth += GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH, $i, 0)
	Next
	If $iWidth < 250 Then $iWidth = 230
	$iWidth += 20

	If $iWidth > @DesktopWidth Then $iWidth = @DesktopWidth - 100

	WinMove($hGUI, "", (@DesktopWidth - $iWidth)/2, Default, $iWidth)

	; Show dialog
	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $_ARRAYCONSTANT_GUI_EVENT_CLOSE
				ExitLoop

			Case $hCopy
				Local $sClip = ""

				; Get selected indices [ _GUICtrlListView_GetSelectedIndices($hListView, True) ]
				Local $aiCurItems[1] = [0]
				For $i = 0 To GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_GETITEMCOUNT, 0, 0)
					If GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_GETITEMSTATE, $i, 0x2) Then
						$aiCurItems[0] += 1
						ReDim $aiCurItems[$aiCurItems[0] + 1]
						$aiCurItems[$aiCurItems[0]] = $i
					EndIf
				Next

				; Generate clipboard text
				If Not $aiCurItems[0] Then
					For $sItem In $avArrayText
						$sClip &= $sItem & @CRLF
					Next
				Else
					For $i = 1 To UBound($aiCurItems) - 1
						$sClip &= $avArrayText[$aiCurItems[$i]] & @CRLF
					Next
				EndIf
				ClipPut($sClip)
		EndSwitch
	WEnd
	GUIDelete($hGUI)

	Opt("GUIOnEventMode", $iOnEventMode)
	Opt("GUIDataSeparatorChar", $sDataSeparatorChar)

	Return 1
EndFunc   ;==>__SeArrayDisplay




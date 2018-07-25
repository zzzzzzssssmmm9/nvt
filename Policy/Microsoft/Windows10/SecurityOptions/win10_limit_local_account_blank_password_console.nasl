##############################################################################
# OpenVAS Vulnerability Test
# $Id: win10_limit_local_account_blank_password_console.nasl 9746 2018-05-07 12:15:27Z emoss $
#
# Check value for Accounts: Limit local account use of blank passwords to console logon only (WMI)
#
# Authors:
# Emanuel Moss <emanuel.moss@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.109154");
  script_version("$Revision: 9746 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-07 14:15:27 +0200 (Mon, 07 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-04 14:20:46 +0200 (Fri, 04 May 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows 10: Accounts: Limit local account use of blank passwords to console logon only');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name: "summary", value: "The Accounts: Limit local account use of 
blank passwords to console logon only policy setting determines whether remote 
interactive logons by network services such as Remote Desktop Services, Telnet, 
and File Transfer Protocol (FTP) are allowed for local accounts that have blank 
passwords. If this policy setting is enabled, a local account must have a 
nonblank password to be used to perform an interactive or network logon from a 
remote client.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

WindowsName = get_kb_item("SMB/WindowsName");
if('windows 10' >!< tolower(WindowsName)){
  policy_logging(text:'Host is not a Microsoft Windows 10 System.');
  exit(0); 
}

type = 'HKLM';
key = 'SYSTEM\\CurrentControlSet\\Control\\Lsa';
item = 'LimitBlankPasswordUse';
value = registry_get_dword(key:key, item:item, type:type);
if( value == ''){
  value = 'none';
}
policy_logging_registry(type:type,key:key,item:item,value:value);
policy_set_kb(val:value);

exit(0);
##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_il_message_users_attempt_logon.nasl 10146 2018-06-08 15:21:07Z emoss $
#
# Check value for Interactive logon: Message text for users attempting to log on
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
  script_oid("1.3.6.1.4.1.25623.1.0.109204");
  script_version("$Revision: 10146 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 17:21:07 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-08 14:26:00 +0200 (Fri, 08 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Interactive logon: Message text for users attempting to log on');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name: "summary", value: "This test checks the setting for policy 
'Message text for users attempting to log on' on Windows hosts (at 
least Windows 7).

The policy setting specifies a text message to display to users upon log on. Set 
the GP to a value that is consistent with the security and operational 
requirements of the organisation.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

if(get_kb_item("SMB/WindowsVersion") < "6.1"){
  policy_logging(text:'Host is not at least a Microsoft Windows 7 system. 
Older versions of Windows are not supported any more. Please update the 
Operating System.');
  exit(0);
}

title = 'Interactive logon: Message text for users attempting to log on';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Policies/Windows Settings/Security Settings/Local Policies/Security Options/Interactive logon/Message text for users attempting to log on';
type = 'HKLM';
key = 'SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System';
item = 'LegalNoticeText';
value = registry_get_sz(key:key, item:item, type:type);
if( value == ''){
  value = 'none';
}
policy_logging_registry(type:type,key:key,item:item,value:value);
policy_set_kb(val:value);
policy_fixtext(fixtext:fixtext);
policy_control_name(title:title);

exit(0);
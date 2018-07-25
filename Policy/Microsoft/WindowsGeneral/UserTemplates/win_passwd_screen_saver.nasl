##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_passwd_screen_saver.nasl 10370 2018-06-29 12:22:04Z emoss $
#
# Check value for Password protect the screen saver (users listed in HKU)
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
  script_oid("1.3.6.1.4.1.25623.1.0.109514");
  script_version("$Revision: 10370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-29 14:22:04 +0200 (Fri, 29 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-28 15:53:49 +0200 (Thu, 28 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Password protect the screen saver');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name: "summary", value: "This test checks the setting for policy 
'Password protect the screen saver' on Windows hosts (at least Windows 7).

The setting determines whether screen savers used on the computer are password 
protected.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");
include("wmi_user.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

if(get_kb_item("SMB/WindowsVersion") < "6.1"){
  policy_logging(text:'Host is not at least a Microsoft Windows 7 system.
Older versions of Microsoft Windows are not supported any more. 
Please update the system.');
  exit(0);
}

userlist = get_kb_item("WMI/UserAccount/Active");
if(userlist == 'Error'){
  policy_logging(text:"It was not able to connect to the Host.");
  exit(0);
}
if(!userlist){
  host    = get_host_ip();
  usrname = get_kb_item("SMB/login");
  domain  = get_kb_item("SMB/domain");
  if (domain){
    usrname = domain + '\\' + usrname;
  }
  passwd  = get_kb_item("SMB/password");
  handle = wmi_connect(host:host, username:usrname, password:passwd);
  if(!handle){
    policy_logging(text:"It was not able to connect to the Host.");
    exit(0);
  }
  userlist = wmi_useraccounts_active(handle);
  if(!userlist){
    policy_logging(text:"It was not able to connect to the Host.");
    exit(0);
  }
}

title = 'Password protect the screen saver';
fixtext = 'Set following UI path accordingly:
User Configuration/Administrative Templates/Control Panel/Personalization/' + title;
type = 'HKU';
item = 'ScreenSaverIsSecure';
result = '';

userlist_lines = split(userlist, keep:FALSE);
foreach user (userlist_lines){
  usersplit = split(user, sep:'|', keep:FALSE);
  domain = usersplit[0];
  name = usersplit[1];
  sid = usersplit[2];
  if("sid" >< tolower(sid)){
    continue;
  }
  # If not all SIDs are shown in registry
  if(!registry_key_exists(key:sid, type:type)){
    continue;
  }
  key = sid + '\\SOFTWARE\\Policies\\Microsoft\\Windows\\Control Panel\\Desktop';
  value = registry_get_sz(key:key, item:item, type:type);
  if(!value){
    value = 'none';
  }

  result += domain + '|' + name + '|' + sid + '|' + value + '\n';
}

if(result == ''){
  result = "Error";
}

text = 'Following values for "' + title + '" are set on the host:\n';
text += 'DOMAIN|NAME|SID|VALUE\n' + result;

policy_logging(text:text);
policy_set_kb(val:result);
policy_fixtext(fixtext:fixtext);
policy_control_name(title:title);

exit(0);
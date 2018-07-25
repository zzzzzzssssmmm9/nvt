##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_homegroup_provider.nasl 10179 2018-06-13 14:25:47Z emoss $
#
# Check value for HomeGroup Provider (HomeGroupProvider)
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
  script_oid("1.3.6.1.4.1.25623.1.0.109256");
  script_version("$Revision: 10179 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-13 16:25:47 +0200 (Wed, 13 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-13 11:35:18 +0200 (Wed, 13 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Service: HomeGroup Listener');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name: "summary", value: "This test checks the setting for policy 
'HomeGroup Provider (HomeGroupProvider)' on Windows hosts (at least Windows 7).

The service performs networking tasks associated with configuration and 
maintenance of homegroups. If stopped or disabled, the computer is unable to
detect other homegroups.");
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

title = 'HomeGroup Provider';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Policies/Windows Settings/Security Settings/System Services' + title;
type = 'HKLM';
key = 'SYSTEM\\CurrentControlSet\\Services\\HomeGroupProvider';
item = 'Start';
value = registry_get_dword(key:key, item:item, type:type);
if(!value){
  value = 'none';
}

policy_logging_registry(type:type,key:key,item:item,value:value);
policy_set_kb(val:value);
policy_fixtext(fixtext:fixtext);
policy_control_name(title:title);

exit(0);
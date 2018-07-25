##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_quality_updates.nasl 10356 2018-06-28 09:36:40Z emoss $
#
# Check value for Select when Quality Updates are received
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
  script_oid("1.3.6.1.4.1.25623.1.0.109508");
  script_version("$Revision: 10356 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-28 11:36:40 +0200 (Thu, 28 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-28 10:46:34 +0200 (Thu, 28 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");  
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Select when Quality Updates are received');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl", "os_detection.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name: "summary", value: "This test checks the setting for policy 
'Select when Quality Updates are received' on Windows hosts (at least Windows 10).

The setting specifies when to receive quality updates. It is possible to defer 
receiving quality updates for up to 30 days.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

HostDetails = get_kb_list("HostDetails");
if("cpe:/o:microsoft:windows_10" >!< HostDetails){
  policy_logging(text:'Host is not a Microsoft Windows 10 system. 
This setting applies to Windows 10 systems only.');
  exit(0);
}

title = 'Select when Quality Updates are received';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Administrative Templates/Windows Components/Windows 
Update/Defer Windows Updates/' + title;
type = 'HKLM';
key = 'Software\\Policies\\Microsoft\\Windows\\WindowsUpdate';

EnabledItem = 'DeferQualityUpdates';
Enabled = registry_get_dword(key:key, item:EnabledItem, type:type);
if(!Enabled){
  Enabled = 'none';
}
PeriodItem = 'DeferQualityUpdatesPeriodInDays';
Period = registry_get_dword(key:key, item:PeriodItem, type:type);
if(!Period){
  Period = 'none';
}

value = 'DeferQualityUpdates:' + Enabled;
value += '\nDeferQualityUpdatesPeriodInDays:' + Period;

policy_logging(text:value);
policy_set_kb(val:value);
policy_fixtext(fixtext:fixtext);
policy_control_name(title:title);

exit(0);
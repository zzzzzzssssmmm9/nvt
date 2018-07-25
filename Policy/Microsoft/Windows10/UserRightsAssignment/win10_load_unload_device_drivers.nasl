##############################################################################
# OpenVAS Vulnerability Test
# $Id: win10_load_unload_device_drivers.nasl 9679 2018-04-30 14:05:59Z emoss $
#
# Check value for Load and unload device drivers (WMI)
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
  script_oid("1.3.6.1.4.1.25623.1.0.109137");
  script_version("$Revision: 9679 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-30 16:05:59 +0200 (Mon, 30 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-04-30 14:35:47 +0200 (Mon, 30 Apr 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows 10: Load and unload device drivers');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("gb_wmi_access.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_require_keys("WMI/access_successful");
  script_tag(name: "summary", value: "This policy setting determines which users 
can dynamically load and unload device drivers. This user right is not required 
if a signed driver for the new hardware already exists in the driver.cab file on 
the device. Device drivers run as highly privileged code. Windows supports the 
Plug and Play specifications that define how a computer can detect and configure 
newly added hardware, and then automatically install the device driver. Prior to 
Plug and Play, users needed to manually configure devices before attaching them 
to the device. This model allows a user to plug in the hardware, then Windows 
searches for an appropriate device driver package and automatically configures 
it to work without interfering with other devices.");
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

type = 'Load and unload device drivers';
select = 'AccountList';
keyname = 'SeLoadDriverPrivilege';

value = rsop_userprivilegeright(select:select,keyname:keyname);
if( value == ''){
  policy_logging(text:'Unable to detect setting for: "' + type + '".');
  policy_set_kb(val:'error');
}else{
  policy_logging(text:'"' + type + '" is set to: ' + value);
  policy_set_kb(val:value);
}

exit(0);
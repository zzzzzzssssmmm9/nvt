##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_na_clients_allowed_remote_sam.nasl 11098 2018-08-23 14:32:47Z emoss $
#
# Check value for Network access: Restrict clients allowed to make
# remote calls to SAM
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
  script_oid("1.3.6.1.4.1.25623.1.0.109226");
  script_version("$Revision: 11098 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-23 16:32:47 +0200 (Thu, 23 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-06-11 14:40:40 +0200 (Mon, 11 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Network access: Restrict clients allowed to make remote calls to SAM');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_add_preference(name:"Value", type:"entry", value:"O:BAG:BAD:(A;;RC;;;BA)");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Network access: Restrict clients allowed to make remote calls to SAM' on Windows
hosts (at least Windows 7).

The policy setting controls which users can enumerate users and groups in the
local Security Accounts Manager (SAM) database and Active Directory.");
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

title = 'Network access: Restrict clients allowed to make remote calls to SAM';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Windows Settings/Security Settings/Local Policies/Security Options/' + title;
type = 'HKLM';
key = 'System\\CurrentControlSet\\Control\\Lsa';
item = 'RestrictRemoteSam';
default = script_get_preference('Value');
value = registry_get_sz(key:key, item:item, type:type);
if(!value){
  val = 'None';
}else{
  value = chomp(value);
}

if(value == default){
  compliant = 'yes';
}else{
  compliant = 'no';
}

policy_logging(text:'"' + title + '" is set to: ' + value);
policy_add_oid();
policy_set_dval(dval:default);
policy_fixtext(fixtext:fixtext);
policy_control_name(title:title);
policy_set_kb(val:value);
policy_set_compliance(compliant:compliant);

exit(0);
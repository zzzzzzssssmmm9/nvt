##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_domain_seal_secure_channel.nasl 10052 2018-06-01 13:46:54Z emoss $
#
# Check value for Domain member: Digitally encrypt secure channel data (when possible)
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
  script_oid("1.3.6.1.4.1.25623.1.0.109196");
  script_version("$Revision: 10052 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-01 15:46:54 +0200 (Fri, 01 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-01 13:31:19 +0200 (Fri, 01 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Digitally encrypt secure channel data (when possible)');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name: "summary", value: "This test checks the setting for policy 
'Domain member: Digitally encrypt secure channel data (when possible)' on 
Windows hosts (at least Windows 7).

The setting determines whether all secure channel traffic that is initiated by 
the domain member meets minimum security requirements. Specifically, it 
determines whether all secure channel traffic that is initiated by the domain 
member must be encrypted. Logon information that is transmitted over the secure 
channel is always encrypted regardless of whether the encryption of all other 
secure channel traffic is negotiated.");
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

type = 'HKLM';
key = 'SYSTEM\\CurrentControlSet\\Services\\Netlogon\\Parameters';
item = 'SealSecureChannel';
value = registry_get_dword(key:key, item:item, type:type);
if( value == ''){
  value = 'none';
}
policy_logging_registry(type:type,key:key,item:item,value:value);
policy_set_kb(val:value);

exit(0);
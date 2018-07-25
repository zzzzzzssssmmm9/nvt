###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_asp_dotnet_sec_bypass_vuln_july18.nasl 10502 2018-07-13 13:19:46Z santu $
#
# Microsoft ASP.NET Core Security Feature Bypass Vulnerability July18
#
# Authors:
# Rinu Kuriaksoe <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.813674");
  script_version("$Revision: 10502 $");
  script_cve_id("CVE-2018-8171");
  script_bugtraq_id(104659);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-07-13 15:19:46 +0200 (Fri, 13 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-13 15:50:36 +0530 (Fri, 13 Jul 2018)");
  script_name("Microsoft ASP.NET Core Security Feature Bypass Vulnerability July18");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft advisory (CVE-2018-8171).");

  script_tag(name:"vuldetect", value:"Get the installed version of affected package
  and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists because system does not properly 
  validate the number of incorrect login attempts.");

  script_tag(name:"impact" , value:"Successful exploitation will allow remote
  attackers to bypass security controls on the target system.

  Impact Level: Application.");

  script_tag(name:"affected", value:"Any ASP.NET Core based application that uses 
  'Microsoft.AspNetCore.Identity' with versions 1.0.0, 1.0.1, 1.0.2, 1.0.3, 1.0.4, 
  1.0.5. 1.1.0, 1.1.1, 1.1.2, 1.1.3, 1.1.4, 1.1.5, 2.0.0, 2.0.1, 2.0.2, 2.0.3,
  2.1.0, 2.1.1.");

  script_tag(name:"solution", value:"Upgrade 'Microsoft.AspNetCore.Identity' package
  versions to 1.0.6 or 1.1.6 or 2.0.4 or 2.1.2 or later.
  For updates refer to Reference links.");

  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2018-8171");
  script_xref(name:"URL", value:"https://github.com/aspnet/announcements/issues/310");
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Windows");
  script_dependencies("smb_reg_service_pack.nasl", "gb_wmi_access.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("WMI/access_successful", "SMB/WindowsVersion");
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

host    = get_host_ip();
usrname = get_kb_item( "SMB/login" );
passwd  = get_kb_item( "SMB/password" );
if( ! host || ! usrname || ! passwd ) exit( 0 );

domain  = get_kb_item( "SMB/domain" );
if( domain ) usrname = domain + '\\' + usrname;

handle = wmi_connect( host:host, username:usrname, password:passwd );
if( ! handle ) exit( 0 );

query1 = 'Select Version from CIM_DataFile Where FileName ='
        + raw_string(0x22) + 'Microsoft.AspNetCore.Identity' + raw_string(0x22) + ' AND Extension ='
        + raw_string(0x22) + 'dll' + raw_string(0x22);
fileVer1 = wmi_query( wmi_handle:handle, query:query1);

wmi_close( wmi_handle:handle );

if(!fileVer1) exit( 0 );

foreach ver(split( fileVer1 ))
{
  ver = eregmatch(pattern:"(.*)\microsoft.aspnetcore.identity.dll.?([0-9.]+)", string:ver );
  version = ver[2];
  file = ver[1] + "Microsoft.AspNetCore.Identity.dll";

  if(version_in_range(version:version, test_version:"1.0", test_version2:"1.0.5"))
  {
    fix = "1.0.6";
    break;
  }
  else if(version_in_range(version:version, test_version:"1.1", test_version2:"1.1.5"))
  {
    fix = "1.1.6";
    break;
  }
  else if(version_in_range(version:version, test_version:"2.0", test_version2:"2.0.3"))
  {
    fix = "2.0.4";
    break;
  }
  else if(version_in_range(version:version, test_version:"2.1", test_version2:"2.1.1"))
  {
    fix = "2.1.2";
    break;
  }

}

if(fix)
{
  report = report_fixed_ver( installed_version:version, fixed_version:fix, file_checked:file);
  security_message( data:report );
  exit(0);
}

exit(0);

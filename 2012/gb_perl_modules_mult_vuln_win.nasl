###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_perl_modules_mult_vuln_win.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# Strawberry Perl Modules Multiple Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Upgrade to Strawberry Perl 5.14.2 or later,
  Upgrade to Strawberry Perl PAR module version 1.003 or later
  Upgrade to Strawberry Perl Digest module version 1.17 or later
  Upgrade to Strawberry Perl Encode module version 2.44 or later
  Upgrade Strawberry Perl PAR::Packer module version 1.012 or later
  For updates refer to http://strawberryperl.com

  *****
  NOTE: Ignore this warning if above mentioned versions of modules are already installed.
  *****";

tag_impact = "Successful exploitation will allow attackers to cause an affected
  application to crash or execute arbitrary perl code.
  Impact Level: System/Application";
tag_affected = "Strawberry Perl PAR module before 1.003
  Strawberry Perl Digest module before 1.17
  Strawberry Perl Encode module before 2.44
  Strawberry Perl PAR::Packer module before 1.012 on winows";
tag_insight = "The flaws are due to
  - an error in par_mktmpdir function in the 'PAR::Packer' and 'PAR' modules
    creates temporary files in a directory with a predictable name without
    verifying ownership and permissions of this directory.
  - the 'Digest->new()' function not properly sanitising input before using it
    in an 'eval()' call, which can be exploited to inject and execute arbitrary
    perl code.
  - off-by-one error in the decode_xs function in Unicode/Unicode.xs in the
    'Encode' module.
  - An error within the 'File::Glob::bsd_glob()' function when handling the
    GLOB_ALTDIRFUNC flag can be exploited to cause an access violation and
    potentially execute arbitrary code.";
tag_summary = "The host is installed with Strawberry Perl and is prone to
  multiple vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802562");
  script_version("$Revision: 9352 $");
  script_cve_id("CVE-2011-5060", "CVE-2011-4114", "CVE-2011-3597", "CVE-2011-2939",
                "CVE-2011-2728");
  script_bugtraq_id(49911);
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-01-17 17:28:53 +0530 (Tue, 17 Jan 2012)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Strawberry Perl Modules Multiple Vulnerabilities (Windows)");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/46172");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/46279");
  script_xref(name : "URL" , value : "http://search.cpan.org/dist/Digest/Digest.pm");
  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=731246");
  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=753955");
  script_xref(name : "URL" , value : "https://rt.cpan.org/Public/Bug/Display.html?id=69560");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_perl_detect_win.nasl");
  script_mandatory_keys("Strawberry/Perl/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Perl Digest and Perl Encode modules are the default modules in perl
## Checking for the perl versions < 5.14.2, because all perl versions are
## having Digest and Encode modules < 1.17 and 2.44 respectively

spVer = get_kb_item("Strawberry/Perl/Ver");
if(spVer)
{
  if(version_is_less(version:spVer, test_version:"5.14.2")){
    security_message(0);
  }
}

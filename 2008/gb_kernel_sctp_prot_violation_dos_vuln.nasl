###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_kernel_sctp_prot_violation_dos_vuln.nasl 7277 2017-09-26 12:45:58Z cfischer $
#
# Linux Kernel Stream Control Transmission Protocol Violation Vulnerability
#
# Authors:
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_solution = "Upgrade to Linux kernel 2.6.27, or
  Apply the available patch from below link,
  http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.27.y.git;a=commit;h=ba0166708ef4da7eeb61dd92bbba4d5a749d6561

  *****
  NOTE : Ignore this warning if patch is already applied.
  *****";

tag_impact = "Successful attacks will result in denial of service via kernel related
  vectors.
  Impact Level: System";
tag_affected = "Linux kernel version before 2.6.27 on all Linux Platforms.";
tag_insight = "The issue is with the parameter 'sctp_paramhdr' in sctp_sf_violation_paramlen,
  sctp_sf_abort_violation, and sctp_make_abort_violation functions of sm.h,
  sm_make_chunk.c, and sm_statefunc.c files, which has invalid length and
  incorrect data types in function calls.";
tag_summary = "This host has Linux Kernel Stream Control Transmission Protocol
  (SCTP) implementation and is prone to Protocol Violation Vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800036");
  script_version("$Revision: 7277 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-26 14:45:58 +0200 (Tue, 26 Sep 2017) $");
  script_tag(name:"creation_date", value:"2008-10-22 15:17:54 +0200 (Wed, 22 Oct 2008)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_cve_id("CVE-2008-4618");
  script_bugtraq_id(31848);
  script_name("Linux Kernel Stream Control Transmission Protocol Violation Vulnerability");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2008/10/06/1");
  script_xref(name : "URL" , value : "http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.27");

  script_tag(name:"qod_type", value:"executable_version_unreliable");
  script_tag(name: "solution_type", value: "VendorFix");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_mandatory_keys("login/SSH/success");
  script_dependencies("ssh_authorization.nasl");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  exit(0);
}


include("ssh_func.inc");
include("version_func.inc");

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

kernelVer = get_bin_version(full_prog_name:"uname", version_argv:"-r",
                            ver_pattern:"[0-9.]+", sock:sock);
if(kernelVer)
{
  if(version_is_less(version:kernelVer[0], test_version:"2.6.27")){
    security_message(port:0);
  }
}
ssh_close_connection();

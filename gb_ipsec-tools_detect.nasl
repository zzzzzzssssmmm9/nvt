###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ipsec-tools_detect.nasl 8528 2018-01-25 07:57:36Z teissa $
#
# IPSec Tools Version Detection
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "The script detects the version of IPSec Tools for Linux on
  remote host and sets the result into KB.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800707");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 8528 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-25 08:57:36 +0100 (Thu, 25 Jan 2018) $");
  script_tag(name:"creation_date", value:"2009-05-13 10:01:19 +0200 (Wed, 13 May 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("IPSec Tools Version Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("login/SSH/success");
  script_exclude_keys("ssh/no_linux_shell");

  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("ssh_func.inc");
include("version_func.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.800707";
SCRIPT_DESC = "IPSec Tools Version Detection";

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

ipsecPaths = find_file(file_name:"setkey", file_path:"/", useregex:TRUE,
                       regexpar:"$", sock:sock);
foreach ipsecBin (ipsecPaths)
{
  ipsecVer = get_bin_version(full_prog_name:chomp(ipsecBin), sock:sock,
                             version_argv:"-V",
                             ver_pattern:"ipsec-tools ([0-9.]+)");
  if(ipsecVer[1] != NULL)
  {
    set_kb_item(name:"IPSec/Tools/Ver", value:ipsecVer[1]);
    log_message(data:" IPSec Tools version " + ipsecVer[1] + " was detected on the host");
    ssh_close_connection();
    
    ## build cpe and store it as host_detail
    cpe = build_cpe(value:ipsecVer[1], exp:"^([0-9.]+)", base:"cpe:/a:ipsec-tools:ipsec-tools:");
    if(!isnull(cpe))
       register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

    exit(0);
  }
}
ssh_close_connection();

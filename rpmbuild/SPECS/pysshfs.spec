# Don't try fancy stuff like debuginfo, which is useless on binary-only
# packages. Don't strip binary too
# Be sure buildpolicy set to do nothing
%define        __spec_install_post %{nil}
%define          debug_package %{nil}
%define        __os_install_post %{_dbpath}/brp-compress

Summary: pysshfs
Name: pysshfs
Version: 0.1
Release: 1
License: GPL
Group: misc
SOURCE0 : %{name}-%{version}.tar.gz
URL: https://github.com/dprevite/pysshfs
Requires: pexpect pygtk2 fuse-sshfs

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
%{summary}

%prep
%setup -q

%build
# Empty section.

%install
rm -rf %{buildroot}
mkdir -p  %{buildroot}

# in builddir
cp -a * %{buildroot}


%clean
rm -rf %{buildroot}


%files
%defattr(-,root,root,-)
# %config(noreplace) %{_sysconfdir}/%{name}/%{name}.conf
#%{_bindir}/*
/opt/*
/etc/*
/usr/*

%changelog
* Fri Oct 26 2012 Initial version.
- Initial version.

* Fri Oct 26 2012 Menu fix.
- Fixed paths for menu files.


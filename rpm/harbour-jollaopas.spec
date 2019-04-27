# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.27
# 

Name:       harbour-jollaopas

# >> macros
%define __provides_exclude_from ^%{_datadir}/.*$
#
%define __requires_exclude ^libqtmqtt.*$
# << macros

%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{?qtc_builddir:%define _builddir %qtc_builddir}
Summary:    Journey planner for Helsinki, Tampere and Turku area
Version:    0.8.2
Release:    1
Group:      Qt/Qt
License:    GPLv3
URL:        http://hsarkanen.github.io/JollaOpas/
Source0:    %{name}-%{version}.tar.bz2
Source100:  harbour-jollaopas.yaml
Requires:   sailfishsilica-qt5 >= 0.10.9
Requires:   qt5-qtdeclarative-import-location >= 5.1.0
Requires:   qt5-qtdeclarative-import-positioning >= 5.2.0
Requires:   qt5-qtdeclarative-import-qtquick2plugin >= 5.1.0
Requires:   qt5-qtdeclarative-import-xmllistmodel >= 5.1.0
Requires:   qt5-plugin-geoservices-here
BuildRequires:  pkgconfig(sailfishapp) >= 0.0.10
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  desktop-file-utils

%description
Journey planner for Helsinki, Tampere & Turku area - based on Meegopas.

%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qtc_qmake5  \
    VERSION=%{version}

%qtc_make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake5_install

# >> install post
# << install post

desktop-file-install --delete-original       \
  --dir %{buildroot}%{_datadir}/applications             \
   %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_bindir}/%{name}
%{_datadir}/%{name}/qml
%{_datadir}/%{name}/localization
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/
# >> files
# << files

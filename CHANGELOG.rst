=========
Changelog
=========

Version 2017.2
=============================

commit 5bc9e9f5542381e91bee899c98e5d3291b33dbbd (HEAD -> master, origin/master, origin/HEAD)
Author: Filip Pytloun <filip@pytloun.cz>

    Unify Makefile, .gitignore and update readme

commit 1607342be73886ae6a1b5ed7c5ad3cdf181ff893
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    fixed memcached parameter

commit b20bef085bf945b2af0e2aad1f95b3f74d3955c7 (origin/ceph-libvirt-cache)
Author: Petr Michalec <epcim@apealive.net>

    ceph, disk_cachemodes

commit 2a9b1c2b4c49c31cc000a00f5d5e1f9070075437
Merge: 4db36fd 36bd0eb
Author: Ales Komarek <akomarek@mirantis.com>

    Merge "Provide grains for building the main dashboard"

commit 4db36fd72d2eea55b4424851c06d461cceb9b2b0
Author: Filip Pytloun <filip@pytloun.cz>

    Remove .gitreview

commit 36bd0eb5753522b3eb582ec9efc662db9d409985
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Provide grains for building the main dashboard

commit b462a5d5f7f4858b831c790d6763915292689d1d
Author: Ales Komarek <ales.komarek@newt.cz>

    MOS fix

commit 873de55f85f0726e88885f10cd08e4af4f1aec7c
Merge: 270e105 dff30bf
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add aggregates memory tables in Nova dashboard"

commit 270e105c38cdba8140dee1937f884cd7a2e4e7fa
Author: Olivier Bourdon <obourdon@mirantis.com>

    Add alarms for Nova aggregates

commit dff30bf0818a5d4d2eb8f8e8e9e97b73a8e41b59
Author: Olivier Bourdon <obourdon@mirantis.com>

    Add aggregates memory tables in Nova dashboard

commit ef81d50cfc1f207733be5a78569f185c9062c281
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    Libvirtd deamon does not start after compute reboot

commit add8ae2c6ce1b39a69036b27dce17bec8272c71b
Merge: bb46d59 6a3c8f7
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Fix typo in README.rst"

commit bb46d594bd7d9c33b8ff158e0bb88913c3b756d7
Author: Ales Komarek <ales.komarek@newt.cz>

    Added default notification value

commit 3519b04b9717be92ae4a410576d32987d1b4f1ff
Merge: b827228 74b092d
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Support configuration of notify_on without Ceilometer"

commit b8272283d0910fc19232e93e197a9aaab7b0e2c9
Merge: 8e67e9e 2ee8c65
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Support dict values for controller.notification"

commit 8e67e9e2e47956af3bbd1579f2202d42afb09038
Merge: 2b68f17 7a8b3bc
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Enable notifications for the controller role"

commit 2b68f176ecdb169caf995530b3a3a5468e405432
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Remove the usage of down and disabled together

commit 6a3c8f71f990516271f9a1385718eb3c50b42923
Author: Simon Pasquier <spasquier@mirantis.com>

    Fix typo in README.rst

commit 74b092d3a763b8ae5c99ff5c1bd190549c1fc383
Author: Simon Pasquier <spasquier@mirantis.com>

    Support configuration of notify_on without Ceilometer

commit 2ee8c65d196f87ef67dab2df1615728fd3956942
Author: Simon Pasquier <spasquier@mirantis.com>

    Support dict values for controller.notification

commit 7a8b3bc4e21b050f0dd8b30d284340793b023721
Author: Simon Pasquier <spasquier@mirantis.com>

    Enable notifications for the controller role

commit 9a4f6334c0fdfc6e0bf83f85e120a8bdb3f0593f
Author: Simon Pasquier <spasquier@mirantis.com>

    Enable alarms on libivrt

commit fea94eacea02b8489d8503ce1be8a6c147522502
Author: Éric Lemoine <elemoine@mirantis.com>

    Handle "disabled" in nova_compute alarms

commit 32b5251e1d4ce21e55b83e8357cbb2ef176df66d
Author: Éric Lemoine <elemoine@mirantis.com>

    Improve alarm descriptions

commit a0624d247b343b6afa7fb35e22054b779a18195c
Author: Éric Lemoine <elemoine@mirantis.com>

    Change alarm names for free_memory/vcpu

commit 52d4f329d59b8d716746883397cf54e818522573 (tag: mk22-sl, tag: mk22, tag: 2016.12.1, tag: 2016.12)
Author: Patrick Petit <ppetit@mirantis.com>

    Use new policies for nova_logs alarm clusters

commit 74ee08104de5ce86b08434233d33428e773c50be
Merge: e7e57ce cf1d39f
Author: Jenkins <jenkins@review.openstack.org>

    Merge "extend temporary exeption for libvirtname in mirantis repo; reason: keystone formula goes against nova formula for legacy deployments"

commit e7e57ced1de133fe67f6480d276f7b3448bc7ecf
Merge: 69574d0 e8f3833
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Documentation update, audit cadf support"

commit 69574d053ea04a6f03c7a95457bef5185fafe376
Merge: 3a3a154 aa23dc0
Author: Jenkins <jenkins@review.openstack.org>

    Merge "enable cadf auditing support"

commit e8f383379ded56015fa93c105d926d124333eca4
Author: Petr Michalec <epcim@apealive.net>

    Documentation update, audit cadf support

commit cf1d39fb530ac402d62e471d2fd9f55002a20fd1
Author: Petr Michalec <epcim@apealive.net>

    extend temporary exeption for libvirtname in mirantis repo; reason: keystone formula goes against nova formula for legacy deployments

commit aa23dc09c7c075efd28660313d1f8a1e82889f80
Author: Petr Michalec <epcim@apealive.net>

    enable cadf auditing support

commit 3a3a1545c8d95786a75899c63a5c34e224d33890
Author: Patrick Petit <ppetit@mirantis.com>

    Fix bugs and improve accuracy of alarms and clusters

commit a03e2e13469f29cf9a8f436305d104a35961f5b2
Merge: d1d4b2d beb0ad3
Author: Jenkins <jenkins@review.openstack.org>

    Merge "added compute cluster metadata"

commit d1d4b2d156959b6f0058fef83e7aad05c06a6ff3
Author: Ales Komarek <ales.komarek@newt.cz>

    Documentation fix

commit beb0ad356a355a1d30e6a30c3a6c7eac0c2a3d62
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    added compute cluster metadata

commit 96a8ed3c846e3f15ced12fce6412cf058318c0ff
Merge: 6d39fc0 63ef2d5
Author: Simon Pasquier <spasquier@mirantis.com>

    Merge remote-tracking branch 'upstream/stacklight' into merge-branch

commit 63ef2d583c733ac59e7598696c9ff076f64c9c06 (origin/stacklight)
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Put Grafana dashboards into their own directory

commit ca319b31e226a599ddcc760d9dcf81008eddcce0
Author: Éric Lemoine <elemoine@mirantis.com>

    Fix annotations in Grafana dashboard

commit cc59477410af3bcd9089e4dd737c3e0c115f2058
Author: Éric Lemoine <elemoine@mirantis.com>

    Remove the nova_fs alarms

commit e5cc97875994e47eb29472504cb8706c82c720fc
Author: Swann Croiset <scroiset@mirantis.com>

    Add alerting property for alarm_cluster

commit 38c834cc5d048f13b66f104503323936679d540b
Merge: 13ffb55 bb998dc
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add nagios_host dimension" into stacklight

commit 13ffb55b8a80fd375a2f1cdba8f14aa0f3171ef0
Author: Éric Lemoine <elemoine@mirantis.com>

    Use "nova_api" as the backend name

commit 12017cdbbfdc79384f6f4f766843bc93e0954d45
Author: Éric Lemoine <elemoine@mirantis.com>

    Use percent metrics for majority-down

commit bb998dc52d9bf165f2747ae70b829e4340105a56
Author: Swann Croiset <scroiset@mirantis.com>

    Add nagios_host dimension

commit a7ad2070ff7cccbe9e9793332bf12aeeb7eb38b9
Merge: 43fa6d1 e7b37cf
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add the dashboard for hypervisor metrics" into stacklight

commit 43fa6d1f0d9244a65995ed66885a9a46a615b21b
Author: Swann Croiset <scroiset@mirantis.com>

    Fix the alarm_cluster for nova services

commit e7b37cf4dc87917f5dbd35b096841f1edc545584
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Add the dashboard for hypervisor metrics

commit dd15b131be348d9f2db6be5870060097b90cb6bf
Author: Éric Lemoine <elemoine@mirantis.com>

    Add alarms and alarm clusters

commit f158af4047eba1c407e24f8580704a4057d16666
Merge: c1239cf 46dda8f
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Merge remote-tracking branch 'upstream/master' into merge-branch" into stacklight

commit 46dda8f973a9771896d4ab3a322fa78e24b5e0f1
Merge: 2b2e9c2 6d39fc0
Author: Simon Pasquier <spasquier@mirantis.com>

    Merge remote-tracking branch 'upstream/master' into merge-branch

commit c1239cfbc92b1ad2d974d924c2aef3ebd85e4b7e
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Add missing JSON format for dashboard

commit 2b2e9c23266d738dd92d254ffe79fa641f4271a3
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Add support for Grafana

commit 6d39fc0c19a81161147de250434d5689c6ea559f
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fixes in nova-compute libvirt for mitaka

commit 570ebc5d68f8308e6d173a19941522acde56f2c2
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    Fix for proper UNIX group

commit f4527523061efca2b1cac7c99c78dfa5a2a46788
Merge: dd076e4 47a6b91
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Fix collectd meta when the service is disabled" into stacklight

commit dd076e48725dac1f542861bae06e28aa7b93fa43
Merge: 8d07b80 969c1f8
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add local endpoint check in collectd" into stacklight

commit 8d07b80654399b7d81881068559ddf40a3e019ac
Merge: 46a5033 fac69ee
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add timezone to openstack log decoder config" into stacklight

commit 47a6b9188d6662e9ec93e31363b376bd2aae9a76
Author: Simon Pasquier <spasquier@mirantis.com>

    Fix collectd meta when the service is disabled

commit 969c1f83f9d6a517cc5e8f0288bbd5c4ba802a60
Author: Simon Pasquier <spasquier@mirantis.com>

    Add local endpoint check in collectd

commit fac69eeea95173b5caf2d1a1105313a14f86388d
Author: Simon Pasquier <spasquier@mirantis.com>

    Add timezone to openstack log decoder config

commit 46a503381d0b3cae42fb1dc2dd8d480a06db8457
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Use more robust logstreamer file match

commit 22533b1476e756e06cec741e3be377176dba430c
Author: Éric Lemoine <elemoine@mirantis.com>

    Use more robust logstreamer file match

commit 424592a33aa080e4bc01d89c10013e438704e34d
Merge: 193ed9c 9a9ba47
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Integrate with StackLight" into stacklight

commit 9a9ba47b51647a9cbfa09648f2f4b16e2950d2cc
Author: Ales Komarek <ales.komarek@tcpcloud.eu>

    Integrate with StackLight

commit 193ed9c827d6c8d958e797927d6c368fe12ff40f
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    change libvirt service to libvirtd

commit 12b5c0904ef05974a183f783cce9178b72c39043
Author: vmikes <vlastimil.mikes@tcpcloud.eu>

    added new check - nova compute disk space

commit 7b1ede35d2d4e2372059d390395d35c65238e101
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    change libvirt service to libvirtd

commit 329f55b59e9c1647c00eb18ddba20941bb0bbdfc
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    add compute node for containers

commit e99895c3a12618f89ed3c7eb187c49d6ca74cb57
Merge: 7ef44b6 e2b8a86
Author: Jenkins <jenkins@review.openstack.org>

    Merge "add region to nova_instance check"

commit 7ef44b6b9eddb4a1381e3d047ab35b83b69ede26
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    mos packages compatability

commit e2b8a86a43806de285b06c8f385d5713b6f2febb
Author: vmikes <vlastimil.mikes@tcpcloud.eu>

    add region to nova_instance check

commit 3b20421522065b90ebca4ecb2fd4c178dc9f3451
Author: vmikes <vlastimil.mikes@tcpcloud.eu>

    add region to checks

commit d484260256f14394fda14421cd87e771675a0e6a
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    change number of processes in nova-compute check

commit 52188189d0f0569277d5a775baae0c886420c861
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    default metadata for container configmap

commit dda003ac980a78d7bfa13f6f6c35b4e90a5abaee
Merge: 20d7423 08a23ee
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add support for config generation"

commit 08a23ee032975f9fcec61ce73f9289336ae7b7aa
Author: Filip Pytloun <filip@pytloun.cz>

    Add support for config generation

commit 20d74233b2b0fbd4ebc6e9a7ebfa1b8751bf4676
Author: vmikes <vlastimil.mikes@tcpcloud.eu>

    update check procs count

commit 617a8969d522b940d875b9303c1082027fb9c9fc
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    nova compute operation improvements

commit ce5d5993766ca7251b46b2cb9cd7bd490ebd601d
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    remove old unused package for nova-ajax

commit 1cd9e09579ce41f38e2e39f2898b678b34dbb525
Author: Andreas Jaeger <aj@suse.com>

    Move other-requirements.txt to bindep.txt

commit 7cf1549b40aebb85dbf8fb71625737fbc36fcded
Merge: bc3871e 8c787fc
Author: Jenkins <jenkins@review.openstack.org>

    Merge "New parameter with default value cinder for ceph storage in secret.xml"

commit bc3871e6c9a74cf44d35c4f1b473a167f962fd53
Merge: bedde64 533e119
Author: Jenkins <jenkins@review.openstack.org>

    Merge "SPM packaging metadata"

commit bedde6403841afa95a9f2811891fe92abfd0f232
Merge: 87340f8 36213e8
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Disable logging to file during tests"

commit 87340f84e38fca3dcb3b1b9f34e4d7178efb49e0
Author: Simak, Jan <simak.jan@gmail.com>

    Disable logging to file during tests

commit 36213e859067a9e60570dab23d0dbe51cf2b9ab6
Author: Lukas Zmrzlik <lukas.zmrzlik@firma.seznam.cz>

    Disable logging to file during tests

commit 533e1198f25685835cb30ebb9b4436b4d9dfa794
Author: Adam Tengler <adam.tengler@tcpcloud.eu>

    SPM packaging metadata

commit 864bd925e8bcd7fba2bc206f04f96a0f27fbafb4
Author: Adam Tengler <adam.tengler@tcpcloud.eu>

    Orchestration metadata

commit 340acf4055676dc611cdd600cb42937d01a4966c
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    docker support

commit c236776db5117b3a24217689a1b83e3d188c5834
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fix for ceph ephemeral condition

commit 39e6acaab43b2da867b65901d6d3c235525b5cc6
Author: maxstack <max@100percentit.com>

    Added the option to use Ceph for Nova ephemeral.

commit fcf34f8f0c04d7e9dc707d168e9e714d2a3ea9e6
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    Add documentation and bug links

commit e73d3f23d8b1127273341c80b804e87dcbb50bdb
Author: Filip Pytloun <filip@pytloun.cz>

    Fix heka.toml

commit 3fb42cd5dbc5042a5f052e5436c2dbc383ccdfdd
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    Fix for neutron auth in Mitaka

commit 8c787fcac85281c06e6d3452477ac24259e76d8a
Author: smolaon <ondrej.smola@tcpcloud.eu>

    New parameter with default value cinder for ceph storage in secret.xml

commit a1013066a6c7a535a1ab186303af8b1a5b584914
Merge: 5142fbf ae1ffe1
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Disable minion_id_caching"

commit ae1ffe1c09978d6833697e972f66cb9bcaec6038
Author: Ondřej Nový <ondrej.novy@firma.seznam.cz>

    Disable minion_id_caching

Version 2016.4.2
=============================

commit 5142fbfc24e7f9cbf00bf0a3a38e4768064fffc5 (tag: 2016.4.2)
Merge: a82b820 4405176
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Compatibility with Debian and Ubuntu 16.04"

commit 4405176427f83feaf452f8113223f42fc7dae508
Author: Filip Pytloun <filip@pytloun.cz>

    Compatibility with Debian and Ubuntu 16.04

commit a82b8205776b54739e2973e19dff091d4965d645
Author: Jiri Konecny <jiri.konecny@tcpcloud.eu>

    [RabbitMQ] Removed deprecated ha_queue option.

Version 2016.4.1
=============================


Version 2016.12.1
=============================


Version 2016.12
=============================

commit 52d4f329d59b8d716746883397cf54e818522573 (tag: mk22-sl, tag: mk22, tag: 2016.12.1, tag: 2016.12)
Author: Patrick Petit <ppetit@mirantis.com>

    Use new policies for nova_logs alarm clusters

commit 74ee08104de5ce86b08434233d33428e773c50be
Merge: e7e57ce cf1d39f
Author: Jenkins <jenkins@review.openstack.org>

    Merge "extend temporary exeption for libvirtname in mirantis repo; reason: keystone formula goes against nova formula for legacy deployments"

commit e7e57ced1de133fe67f6480d276f7b3448bc7ecf
Merge: 69574d0 e8f3833
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Documentation update, audit cadf support"

commit 69574d053ea04a6f03c7a95457bef5185fafe376
Merge: 3a3a154 aa23dc0
Author: Jenkins <jenkins@review.openstack.org>

    Merge "enable cadf auditing support"

commit e8f383379ded56015fa93c105d926d124333eca4
Author: Petr Michalec <epcim@apealive.net>

    Documentation update, audit cadf support

commit cf1d39fb530ac402d62e471d2fd9f55002a20fd1
Author: Petr Michalec <epcim@apealive.net>

    extend temporary exeption for libvirtname in mirantis repo; reason: keystone formula goes against nova formula for legacy deployments

commit aa23dc09c7c075efd28660313d1f8a1e82889f80
Author: Petr Michalec <epcim@apealive.net>

    enable cadf auditing support

commit 3a3a1545c8d95786a75899c63a5c34e224d33890
Author: Patrick Petit <ppetit@mirantis.com>

    Fix bugs and improve accuracy of alarms and clusters

commit a03e2e13469f29cf9a8f436305d104a35961f5b2
Merge: d1d4b2d beb0ad3
Author: Jenkins <jenkins@review.openstack.org>

    Merge "added compute cluster metadata"

commit d1d4b2d156959b6f0058fef83e7aad05c06a6ff3
Author: Ales Komarek <ales.komarek@newt.cz>

    Documentation fix

commit beb0ad356a355a1d30e6a30c3a6c7eac0c2a3d62
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    added compute cluster metadata

commit 96a8ed3c846e3f15ced12fce6412cf058318c0ff
Merge: 6d39fc0 63ef2d5
Author: Simon Pasquier <spasquier@mirantis.com>

    Merge remote-tracking branch 'upstream/stacklight' into merge-branch

commit 63ef2d583c733ac59e7598696c9ff076f64c9c06 (origin/stacklight)
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Put Grafana dashboards into their own directory

commit ca319b31e226a599ddcc760d9dcf81008eddcce0
Author: Éric Lemoine <elemoine@mirantis.com>

    Fix annotations in Grafana dashboard

commit cc59477410af3bcd9089e4dd737c3e0c115f2058
Author: Éric Lemoine <elemoine@mirantis.com>

    Remove the nova_fs alarms

commit e5cc97875994e47eb29472504cb8706c82c720fc
Author: Swann Croiset <scroiset@mirantis.com>

    Add alerting property for alarm_cluster

commit 38c834cc5d048f13b66f104503323936679d540b
Merge: 13ffb55 bb998dc
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add nagios_host dimension" into stacklight

commit 13ffb55b8a80fd375a2f1cdba8f14aa0f3171ef0
Author: Éric Lemoine <elemoine@mirantis.com>

    Use "nova_api" as the backend name

commit 12017cdbbfdc79384f6f4f766843bc93e0954d45
Author: Éric Lemoine <elemoine@mirantis.com>

    Use percent metrics for majority-down

commit bb998dc52d9bf165f2747ae70b829e4340105a56
Author: Swann Croiset <scroiset@mirantis.com>

    Add nagios_host dimension

commit a7ad2070ff7cccbe9e9793332bf12aeeb7eb38b9
Merge: 43fa6d1 e7b37cf
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add the dashboard for hypervisor metrics" into stacklight

commit 43fa6d1f0d9244a65995ed66885a9a46a615b21b
Author: Swann Croiset <scroiset@mirantis.com>

    Fix the alarm_cluster for nova services

commit e7b37cf4dc87917f5dbd35b096841f1edc545584
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Add the dashboard for hypervisor metrics

commit dd15b131be348d9f2db6be5870060097b90cb6bf
Author: Éric Lemoine <elemoine@mirantis.com>

    Add alarms and alarm clusters

commit f158af4047eba1c407e24f8580704a4057d16666
Merge: c1239cf 46dda8f
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Merge remote-tracking branch 'upstream/master' into merge-branch" into stacklight

commit 46dda8f973a9771896d4ab3a322fa78e24b5e0f1
Merge: 2b2e9c2 6d39fc0
Author: Simon Pasquier <spasquier@mirantis.com>

    Merge remote-tracking branch 'upstream/master' into merge-branch

commit c1239cfbc92b1ad2d974d924c2aef3ebd85e4b7e
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Add missing JSON format for dashboard

commit 2b2e9c23266d738dd92d254ffe79fa641f4271a3
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Add support for Grafana

commit 6d39fc0c19a81161147de250434d5689c6ea559f
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fixes in nova-compute libvirt for mitaka

commit 570ebc5d68f8308e6d173a19941522acde56f2c2
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    Fix for proper UNIX group

commit f4527523061efca2b1cac7c99c78dfa5a2a46788
Merge: dd076e4 47a6b91
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Fix collectd meta when the service is disabled" into stacklight

commit dd076e48725dac1f542861bae06e28aa7b93fa43
Merge: 8d07b80 969c1f8
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add local endpoint check in collectd" into stacklight

commit 8d07b80654399b7d81881068559ddf40a3e019ac
Merge: 46a5033 fac69ee
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add timezone to openstack log decoder config" into stacklight

commit 47a6b9188d6662e9ec93e31363b376bd2aae9a76
Author: Simon Pasquier <spasquier@mirantis.com>

    Fix collectd meta when the service is disabled

commit 969c1f83f9d6a517cc5e8f0288bbd5c4ba802a60
Author: Simon Pasquier <spasquier@mirantis.com>

    Add local endpoint check in collectd

commit fac69eeea95173b5caf2d1a1105313a14f86388d
Author: Simon Pasquier <spasquier@mirantis.com>

    Add timezone to openstack log decoder config

commit 46a503381d0b3cae42fb1dc2dd8d480a06db8457
Author: Guillaume Thouvenin <gthouvenin@mirantis.com>

    Use more robust logstreamer file match

commit 22533b1476e756e06cec741e3be377176dba430c
Author: Éric Lemoine <elemoine@mirantis.com>

    Use more robust logstreamer file match

commit 424592a33aa080e4bc01d89c10013e438704e34d
Merge: 193ed9c 9a9ba47
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Integrate with StackLight" into stacklight

commit 9a9ba47b51647a9cbfa09648f2f4b16e2950d2cc
Author: Ales Komarek <ales.komarek@tcpcloud.eu>

    Integrate with StackLight

commit 193ed9c827d6c8d958e797927d6c368fe12ff40f
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    change libvirt service to libvirtd

commit 12b5c0904ef05974a183f783cce9178b72c39043
Author: vmikes <vlastimil.mikes@tcpcloud.eu>

    added new check - nova compute disk space

commit 7b1ede35d2d4e2372059d390395d35c65238e101
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    change libvirt service to libvirtd

commit 329f55b59e9c1647c00eb18ddba20941bb0bbdfc
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    add compute node for containers

commit e99895c3a12618f89ed3c7eb187c49d6ca74cb57
Merge: 7ef44b6 e2b8a86
Author: Jenkins <jenkins@review.openstack.org>

    Merge "add region to nova_instance check"

commit 7ef44b6b9eddb4a1381e3d047ab35b83b69ede26
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    mos packages compatability

commit e2b8a86a43806de285b06c8f385d5713b6f2febb
Author: vmikes <vlastimil.mikes@tcpcloud.eu>

    add region to nova_instance check

commit 3b20421522065b90ebca4ecb2fd4c178dc9f3451
Author: vmikes <vlastimil.mikes@tcpcloud.eu>

    add region to checks

commit d484260256f14394fda14421cd87e771675a0e6a
Author: Ondrej Smola <ondrej.smola@tcpcloud.eu>

    change number of processes in nova-compute check

commit 52188189d0f0569277d5a775baae0c886420c861
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    default metadata for container configmap

commit dda003ac980a78d7bfa13f6f6c35b4e90a5abaee
Merge: 20d7423 08a23ee
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add support for config generation"

commit 08a23ee032975f9fcec61ce73f9289336ae7b7aa
Author: Filip Pytloun <filip@pytloun.cz>

    Add support for config generation

commit 20d74233b2b0fbd4ebc6e9a7ebfa1b8751bf4676
Author: vmikes <vlastimil.mikes@tcpcloud.eu>

    update check procs count

commit 617a8969d522b940d875b9303c1082027fb9c9fc
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    nova compute operation improvements

commit ce5d5993766ca7251b46b2cb9cd7bd490ebd601d
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    remove old unused package for nova-ajax

commit 1cd9e09579ce41f38e2e39f2898b678b34dbb525
Author: Andreas Jaeger <aj@suse.com>

    Move other-requirements.txt to bindep.txt

commit 7cf1549b40aebb85dbf8fb71625737fbc36fcded
Merge: bc3871e 8c787fc
Author: Jenkins <jenkins@review.openstack.org>

    Merge "New parameter with default value cinder for ceph storage in secret.xml"

commit bc3871e6c9a74cf44d35c4f1b473a167f962fd53
Merge: bedde64 533e119
Author: Jenkins <jenkins@review.openstack.org>

    Merge "SPM packaging metadata"

commit bedde6403841afa95a9f2811891fe92abfd0f232
Merge: 87340f8 36213e8
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Disable logging to file during tests"

commit 87340f84e38fca3dcb3b1b9f34e4d7178efb49e0
Author: Simak, Jan <simak.jan@gmail.com>

    Disable logging to file during tests

commit 36213e859067a9e60570dab23d0dbe51cf2b9ab6
Author: Lukas Zmrzlik <lukas.zmrzlik@firma.seznam.cz>

    Disable logging to file during tests

commit 533e1198f25685835cb30ebb9b4436b4d9dfa794
Author: Adam Tengler <adam.tengler@tcpcloud.eu>

    SPM packaging metadata

commit 864bd925e8bcd7fba2bc206f04f96a0f27fbafb4
Author: Adam Tengler <adam.tengler@tcpcloud.eu>

    Orchestration metadata

commit 340acf4055676dc611cdd600cb42937d01a4966c
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    docker support

commit c236776db5117b3a24217689a1b83e3d188c5834
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fix for ceph ephemeral condition

commit 39e6acaab43b2da867b65901d6d3c235525b5cc6
Author: maxstack <max@100percentit.com>

    Added the option to use Ceph for Nova ephemeral.

commit fcf34f8f0c04d7e9dc707d168e9e714d2a3ea9e6
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    Add documentation and bug links

commit e73d3f23d8b1127273341c80b804e87dcbb50bdb
Author: Filip Pytloun <filip@pytloun.cz>

    Fix heka.toml

commit 3fb42cd5dbc5042a5f052e5436c2dbc383ccdfdd
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    Fix for neutron auth in Mitaka

commit 8c787fcac85281c06e6d3452477ac24259e76d8a
Author: smolaon <ondrej.smola@tcpcloud.eu>

    New parameter with default value cinder for ceph storage in secret.xml

commit a1013066a6c7a535a1ab186303af8b1a5b584914
Merge: 5142fbf ae1ffe1
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Disable minion_id_caching"

commit 5142fbfc24e7f9cbf00bf0a3a38e4768064fffc5 (tag: 2016.4.2)
Merge: a82b820 4405176
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Compatibility with Debian and Ubuntu 16.04"

commit ae1ffe1c09978d6833697e972f66cb9bcaec6038
Author: Ondřej Nový <ondrej.novy@firma.seznam.cz>

    Disable minion_id_caching

commit 4405176427f83feaf452f8113223f42fc7dae508
Author: Filip Pytloun <filip@pytloun.cz>

    Compatibility with Debian and Ubuntu 16.04

commit a82b8205776b54739e2973e19dff091d4965d645
Author: Jiri Konecny <jiri.konecny@tcpcloud.eu>

    [RabbitMQ] Removed deprecated ha_queue option.

commit dce07bf3b6e31ad6f1e95196f390253434736910 (tag: 2016.4.1)
Merge: e31f2c5 3656054
Author: Jenkins <jenkins@review.openstack.org>

    Merge "New release, debian packaging moved"

commit 365605400cc234d4c73652f9d8841b28effa8d95
Author: Filip Pytloun <filip@pytloun.cz>

    New release, debian packaging moved

commit e31f2c5ed0c86c7e5cad583be216c08f6f8863b0
Author: Jiri Konecny <jiri.konecny@tcpcloud.eu>

    [RabbitMQ] Parametrized message queue hosts to enable client-side HA.

commit 3ef8a315cca067fd402f14cd9a93f03a616a24b6
Author: Filip Pytloun <filip@pytloun.cz>

    Add makefile, run tests during package build

commit 34db6e47fd0e4ec10a22c128277c8dbfc71c8e2b
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    Mitaka release configuration files support

commit 27a5ae737d9f740df7f626913d8e606169045df6
Merge: b5a80e4 7fdb877
Author: Jenkins <jenkins@review.openstack.org>

    Merge "fix service differentiator"

commit b5a80e4658a248c98137da83a7a6300e80c76ecc
Author: Jiri Konecny <jiri.konecny@tcpcloud.eu>

    [Workers] Added parametrization of osapi_compute_worker and workers.

commit 9344a370c0498d35c2c8ac995efed205bd6f1a40
Author: Jiri Konecny <jiri.konecny@tcpcloud.eu>

    [Disk] Added parametrization of disk_allocation_ratio.

commit 7fdb877cd5402ddb678655b892f3155c223739fb
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    fix service differentiator

commit 7902126021d922109398356ed5e1076c2ef80ec1
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    add Keystone region configuration

commit ad16f61b90d675a5ed2a01b7f5407f537fac07d2
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    refactor heka config

commit dbd281bce8a0d17521d9116f274a09d55e9146f9
Merge: e0f72b4 3958108
Author: Jenkins <jenkins@review.openstack.org>

    Merge "Add gitreview to project"

commit 395810852f79c2d7eee64e6bd7458e9b71108a8c
Author: Arif Ali <mail@arif-ali.co.uk>

    Add gitreview to project

commit e0f72b4cccdefa366dfe636897511be69b34770e
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    RedHat Compatability

commit 29b8945f5da2a93e1f89473c62e40f1ad778853b
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    License and links fixes

commit 91737a223a3ddf57fdcf1a4354475364e13b8ca0
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fix in nova sphinx syntax

commit 4ba00c7f34c561c50dfbe8c6a85e9ac62a7f9e7c
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    http in documentation

commit 3b5a42706d701cff4fed70d7d0cf06ddc8758e45
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    bad space

commit 0eb1923642f3556686d67795e13840bd2ada642a
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    endpoints for nova

commit d1caae224e978e93256841f4ddfe86c98da573f8
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fixes in documenation

commit 6a7748781e99ee3c526e7d70eea019b26f54cd75
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    sphinx for rabbit vhost

commit 11424de7ef0a1934f9a8dccde110c6642a418647
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    missing vhost for rabbit

commit 2ee6aea654a2087cf52c20c89fc3751bac208040
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fixes in nova sphinx docs

commit 3ac52980880a194def221e684f6fd1d5c6a9824c
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    final nova sphinx

commit 7e8471eef4678e732481a02a85d7908cf6b64143
Author: Adam Tengler <a.tengler@tcpcloud.eu>

    Fixed list rendering in sphinx doc

commit 1e87450cf470807fe6a20c098cf5f0f053a34baa
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fix for generationg

commit 995b7ce3c8f5a568a488336d01f26868e3f81bb8
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    sphinx generate list of packages with versions

commit a0f801a31f991c840f17073a8b5375b89f38a834
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    sphinx documenation for nova formula

commit 6d51029e9599d08b7a6ed5e596e140b901e1413a
Author: Ales Komarek <ales.komarek@tcpcloud.eu>

    fix project name

commit 3f4444f99fe133db853879acec9b11649c991576
Author: Ales Komarek <ales.komarek@tcpcloud.eu>

    Sphinx docs

commit 6afb4697f4552e4b0b6f3e0a85011c652dbd5656
Author: Ales Komarek <ales.komarek@tcpcloud.eu>

    gitignore

commit a2dd9ff3b7ea6170ca696f8093a8da91073659e1
Author: Filip Pytloun <filip@pytloun.cz>

    No dependencies for nova formula

commit 235949e3147d84d82add1734250f462f6930fb52
Author: Filip Pytloun <filip@pytloun.cz>

    Script to run tests

commit c9c41d394c4843f437a47097ab3d2fd98f363842
Author: Filip Pytloun <filip@pytloun.cz>

    Makefile for tests

commit e863a3f2af2e2e145714f9062ce95022f86d31b1
Author: Filip Pytloun <filip@pytloun.cz>

    Support for identity version 3

commit cb7d797df7c6323f06a8ee98b7b6f62d4a8ad4cd
Author: Ales Komarek <ales.komarek@tcpcloud.eu>

    top files

commit 880f02f90485d417437a0a63258b102c1714f1f0
Author: Ales Komarek <ales.komarek@tcpcloud.eu>

    testing scenarios

commit 263ca503f9c6592902ab2b5c9c26be703099ef48
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    removed extra conditional blocks

commit b72de501de9b3695af9b0b2af2b6dc91f305eec4
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    update README, enable scheduler filters and moved default values to metadata to clean up if blocks

commit 67b8e0677a4d2a0a121085cf98ec2e15ca10eb5b
Merge: b285eae c1395c9
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    Merge branch 'master' of github.com:tcpcloud/salt-formula-nova into feature-add-ram-cpu-allocation-ratio

commit b285eae4f3e44b82a41da96f1424be2a756623a6
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    add ram and cpu allocation ration

commit e1fb007500cd634d4b80874fcaac91449423b236
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    add vm swappiness

commit 8df5e459c84a7b73b64932499eed41a0c62ac974
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    fix pkg typo

commit 61312820a80566d2f09e5ae6d513724e35832023
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    add ability to set directory perms

commit a6d59425dd8cadeea5abe1c43ced12edcc6e3184
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    add reserved memory option to nova.conf

commit be6ce8843bf03df26a5fe36fffce53661f2dc549
Author: Lachlan Evenson <lachlan.evenson@lithium.com>

    add support for reserved memory

commit bc450b9fb531a9eb4b01738a3448e9432363c86b
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    nova user must be in libvirt user group

commit 9d109ae7ce6b05fab32035bc3a01d6d813862fdc
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    remove host keys into known_hosts for computes. It is replaced but generally disabled host checking for nova user

commit 13904916751ecd60eb85aa9ccc820d4f8f58d913
Author: Ales Komarek <mail@newt.cz>

    no collectd for controller

commit a7b4cb6d179575e2eaf19b6d8c28b18e2d435471
Author: Ales Komarek <mail@newt.cz>

    fix

commit 6e762216b034627dc22e0e82de9b8e4c84e4e011
Author: Ales Komarek <mail@newt.cz>

    service metadata fix

commit 5c00be7526c1755e9fa862f9af37ceb7a3bb9fa9
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    defautl heal_instance_info_cache_interval 60 for backward compatability with older deployments

commit 3e40046a1902462d6e3bce43d1792316bf56c3b8
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    all nova computes regularly poll neutron server to get network info of the instances running on the compute node. Default is 10 seconds. With thousands of VMs it is recommended to increase interval at 600seconds

commit f9e0f6e7d7dcfd62ecd7c4735812850502133b45
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    disable stricthostkeychecking for nova user

commit 105db6361f5fa305dafa2b2d673425dde78ea219
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    pernamently enable bash for nova user. It is requirement for offline migrations and instance resize.

commit 25abc45beac84d5713933bb23d0f97e730d4a323
Author: Jakub Pavlik <pavlk.jakub@gmail.com>

    fix nova user enabled bash shell to enable offline migration and instance resize

commit aa33f96f4856fafb37ffd1bf4f11e42c7734431d
Author: Ales Komarek <mail@newt.cz>

    fix to support services and docs

commit 121a9d5c6a4d9b7be386107f3160f0d104ab8023
Author: Ales Komarek <mail@newt.cz>

    nova setup

commit 9553f40d8f27bb45e389bdaaa3e19a1db625e8ef
Author: Ales Komarek <mail@newt.cz>

    support services

commit 855f7038f842242f2d9e05d6a6ead8d777131f48
Author: Ales Komarek <mail@newt.cz>

    sphinx docs

commit 3024ff4c3047b2c9eea17ca0715485717bd4fe90
Author: Ales Komarek <mail@newt.cz>

    support fix

commit 6cf60320d78867ba297d1ccbac5325a0a6f910e1
Author: Ales Komarek <mail@newt.cz>

    Support services definition

commit e543f3106dba5f66e8a2ddbccb36d134a232b805
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    harvest only 7days old logs by default

commit c89453c79c4bd9f0ece7e57803e26e8e77a1f1aa
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    add heka config for controller services

commit 78c56ce2e74c4ebd7462b674fb0fb1b3559ff449
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    add shared dir for libraries

commit 8f74c96fc370c56560237e0b3a1731f06a75b061
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    config syntax fixes

commit 1660a53d38413058143b000ca4051b313fe1464f
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    typofix

commit 65f22b203d64def46806a2169aafb9b2679227d4
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    heka config rename

commit f56ce07f76342338796d0334b921897e9082056b
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    typofix

commit cda0f289d8b64a455c3274dce7cb395b209adc4b
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    heka logging setup

commit 9d085e6eaf9727931598c67a28e32a3fee6e54d2
Author: jan kaufman <jan.kaufman@tcpcloud.eu>

    heka logging config

commit 049e56bd7c166211071dcf285ef50b09446e09d5
Author: Ales Komarek <mail@newt.cz>

    Heka configuration fixes

commit 75ba1002a951618464d2db714f15801f4bb2b4f3
Author: Filip Pytloun <filip@pytloun.cz>

    Temporary fix on exchanging host keys for compute nodes

commit ecedd170d4141e0afa1d33a355c73839f6d8712e
Author: Filip Pytloun <filip@pytloun.cz>

    Set known_hosts of other nova.compute hosts

commit 7c874e6128f9c6a63a2433bab6c6b54c01cb4199
Author: Filip Pytloun <filip@pytloun.cz>

    Set dhcp_domain option

commit ed79447c4af8acbf2e6d4467aa4df90543403a64
Merge: f91d595 0d835a9
Author: Filip Pytloun <filip.pytloun@tcpcloud.eu>

    Merge branch 'feature/liberty' into 'master'

commit 0d835a979d5dae2e445a08e19c03d1738af8bec3
Author: Jakub Pavlik <j.pavlik@tcpcloud.eu>

    openstack nova configuration for liberty

commit f91d595a138275081ec0b3b282f82c7ce2ae0da9
Merge: 4a72d79 b5ee35f
Author: Aleš Komárek <mail@newt.cz>

    Merge branch 'feature/monitoring' into 'master'

commit b5ee35f9e4deb94491310fc21c20debedfe52eed
Author: vmikes <v.mikes@tcpcloud.eu>

    Remove log check

Version 0.2
=============================


